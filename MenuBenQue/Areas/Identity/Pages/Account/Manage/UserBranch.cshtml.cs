using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using ThuMuaHangWeb.Data;
using ThuMuaHangWeb.Models;

namespace ThuMuaHangWeb.Areas.Identity.Pages.Account.Manage.Users
{
    public class UserBranchModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly ApplicationDbContext _context;

        public UserBranchModel(
            UserManager<ApplicationUser> userManager,
            RoleManager<IdentityRole> roleManager,
            ApplicationDbContext context)
        {
            _roleManager = roleManager;
            _userManager = userManager;
            _context = context;
        }

        public List<SelectListItem> lstBranchs { get; set; }
        public ApplicationUser user { get; set; }
        [TempData]
        public string StatusMessage { get; set; }
        [BindProperty]
        public int updateBranchId { get; set; }

        public string updateUserId { get; set; }

        
    }
}
