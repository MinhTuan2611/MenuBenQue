using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using ThuMuaHangWeb;
using ThuMuaHangWeb.Data;
using ThuMuaHangWeb.Models;

var builder = WebApplication.CreateBuilder(new WebApplicationOptions
{
    EnvironmentName = Environments.Development
});

// Add services to the container.
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<ApplicationDbContext>(options => 
    options.UseSqlServer(connectionString));
builder.Services.AddDatabaseDeveloperPageExceptionFilter();

builder.Services.AddDefaultIdentity<ApplicationUser>(options => options.SignIn.RequireConfirmedAccount = true).AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>();
builder.Services.AddAuthentication();
builder.Services.AddRazorPages();
builder.Services.AddControllersWithViews();
builder.Services.AddAuthorization(builder => builder.AddPolicy("RequireAuthenticatedUserPolicy",
                        builder => builder.RequireAuthenticatedUser()));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseMigrationsEndPoint();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Requests}/{action=Index}/{id?}");
app.MapRazorPages();
app.MapDefaultControllerRoute().RequireAuthorization("RequireAuthenticatedUserPolicy");

using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var _usermanager = services.GetRequiredService<UserManager<ApplicationUser>>();
    var _roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();
    var _userStore = services.GetRequiredService<IUserStore<ApplicationUser>>();
    await PrepareData.InitData(_usermanager, _roleManager, _userStore);
}

app.Run();
