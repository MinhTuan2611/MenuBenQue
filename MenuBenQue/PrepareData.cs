using Microsoft.AspNetCore.Identity;
using ThuMuaHangWeb.Data.Enum;
using ThuMuaHangWeb.Models;

namespace ThuMuaHangWeb
{
    public static class PrepareData
    {
        public static async Task InitData(UserManager<ApplicationUser> _userManager,
                                            RoleManager<IdentityRole> _roleManager,
                                            IUserStore<ApplicationUser> _userStore)
        {
            //Add user admin
            var user = Activator.CreateInstance<ApplicationUser>();
            string email = "super_manager@gmail.com";
            string password = "Password@123456!";
            IUserEmailStore<ApplicationUser> _emailStore = (IUserEmailStore<ApplicationUser>)_userStore;
            await _userStore.SetUserNameAsync(user, email, CancellationToken.None);
            await _emailStore.SetEmailAsync(user, email, CancellationToken.None);
            await _emailStore.SetEmailConfirmedAsync(user, true, CancellationToken.None);
            user.FirstName = "manager";
            user.LastName = "super";

            //Check exist
            if ((await _userManager.FindByNameAsync(email)) == null)
            {
                await _userManager.CreateAsync(user, password);

                //Add Roles
                foreach (var roleName in Enum.GetNames(typeof(PhanQuyen)))
                {
                    await _roleManager.CreateAsync(new IdentityRole(roleName));
                }

                //Assign User Role
                await _userManager.AddToRoleAsync(user, PhanQuyen.Admin.ToString());
            }
        }
    }
}
