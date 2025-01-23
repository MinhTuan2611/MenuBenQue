using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel;
using ThuMuaHangWeb.Data.Enum;
using ThuMuaHangWeb.Models;

namespace ThuMuaHangWeb.Areas.Identity.Pages.Account.Manage.Users
{
    public class UserRoleModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IUserStore<ApplicationUser> _userStore;

        public UserRoleModel(
            UserManager<ApplicationUser> userManager,
            RoleManager<IdentityRole> roleManager,
            IUserStore<ApplicationUser> userStore)
        {
            _roleManager = roleManager;
            _userManager = userManager;
            _userStore = userStore;
        }

        public List<SelectListItem> lstRoles { get; set; }
        public ApplicationUser user { get; set; }
        [TempData]
        public string StatusMessage { get; set; }
        [BindProperty]
        public string updateRoleId { get; set; }

        public string updateUserId { get; set; }

        public string previousRole { get; set; }

        public async Task OnGetAsync(string userId)
        {
            user = await _userManager.FindByIdAsync(userId);
            updateUserId = userId;
            var lstRoleOfUser = await _userManager.GetRolesAsync(user);
            previousRole = lstRoleOfUser.FirstOrDefault() ?? "";
            if (lstRoleOfUser != null && lstRoleOfUser.Count > 0)
            {
                updateRoleId = _roleManager.FindByNameAsync(lstRoleOfUser.FirstOrDefault()).Result.Id;
            }
            lstRoles = new SelectList(_roleManager.Roles.Where(r => r.Name != PhanQuyen.Default.ToString()), "Id", "Name").ToList();
        }

        public async Task<IActionResult> OnPostAsync(string updateUserId, string previousRole)
        {
            if (string.IsNullOrEmpty(updateRoleId))
            {
                var updateUser = await _userManager.FindByIdAsync(updateUserId);
                await _userManager.RemoveFromRoleAsync(updateUser, previousRole);
            }
            else if(Guid.Parse(updateRoleId) != Guid.Empty)
            {
                var updateRole = await _roleManager.FindByIdAsync(updateRoleId);
                if (updateRole.Name != previousRole)
                {
                    var updateUser = await _userManager.FindByIdAsync(updateUserId);
                    if (previousRole != null)
                    {
                        await _userManager.RemoveFromRoleAsync(updateUser, previousRole);
                    }
                    if (updateRole != null && updateUser != null)
                    {
                        await _userManager.AddToRoleAsync(updateUser, updateRole.Name);
                    }
                }
            }
            else
            {
                StatusMessage = "Chọn quyền truy cập cho tài khoản! Mời bạn chọn lại quyền truy cập.";
                return RedirectToPage("UserRole", new { userId = updateUserId});
            }
            var role = _roleManager.Roles.FirstOrDefault(r => r.Id == updateRoleId);
            return RedirectToPage("ManageUserAuthority");
        }
    }
}
