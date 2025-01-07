using MenuBenQue.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using ThuMuaHangWeb.Models;

namespace ThuMuaHangWeb.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
            this.Database.SetCommandTimeout(TimeSpan.FromSeconds(240));
        }

        public DbSet<MonAn> MonAns { get; set; }
        public DbSet<NhomMonAn> NhomMonAn { get; set; }
        public DbSet<Combo> Combos { get; set; }

    }
}
