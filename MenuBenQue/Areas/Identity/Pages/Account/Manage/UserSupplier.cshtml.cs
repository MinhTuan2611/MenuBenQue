using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using ThuMuaHangWeb.Data;
using ThuMuaHangWeb.Models;

namespace ThuMuaHangWeb.Areas.Identity.Pages.Account.Manage.Users
{
    public class UserSupplierModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly ApplicationDbContext _context;

        public UserSupplierModel(
            UserManager<ApplicationUser> userManager,
            RoleManager<IdentityRole> roleManager,
            ApplicationDbContext context)
        {
            _roleManager = roleManager;
            _userManager = userManager;
            _context = context;
        }

        public List<SelectListItem> lstSupplier { get; set; }
        public ApplicationUser user { get; set; }
        [TempData]
        public string StatusMessage { get; set; }
        [BindProperty]
        public int userSupplierId { get; set; }

        public string updateUserId { get; set; }

        public async Task OnGetAsync(string userId)
        {
            user = await _userManager.FindByIdAsync(userId);
            updateUserId = userId;
            //var userSupplier = _context.UserSuppliers.Where(ub => ub.UserId.Equals(updateUserId)).FirstOrDefault();
            //if (userSupplier != null)
            //{
            //    userSupplierId = userSupplier.SupplierId;
            //}
            //lstSupplier = new SelectList(_context.Suppliers.Where(s => s.Status == "A"), "SupplierId", "DisplayName").ToList();
        }

        public async Task<IActionResult> OnPostAsync(string updateUserId)
        {
            //if (userSupplierId == -1)
            //{
            //    var userSupplier = _context.UserSuppliers.Where(ub => ub.UserId.Equals(updateUserId)).FirstOrDefault();
            //    if (userSupplier != null)
            //    {
            //        _context.UserSuppliers.Remove(userSupplier);
            //        _context.SaveChanges();
            //    }
            //}
            //else if(userSupplierId > 0)
            //{
            //    var isBranchAssigned = _context.UserSuppliers.Any(ub => ub.UserId.Equals(updateUserId));
            //    if (!isBranchAssigned)
            //    {
            //        var updateUser = await _userManager.FindByIdAsync(updateUserId);
            //        var updateSupplier = _context.Suppliers.Where(b => b.SupplierId.Equals(userSupplierId) && b.Status == "A").FirstOrDefault();
            //        if (updateSupplier != null)
            //        {
            //            UserSupplier userSupplier = new UserSupplier();
            //            userSupplier.User = updateUser;
            //            userSupplier.Supplier = updateSupplier;
            //            userSupplier.CreateDate = DateTime.Now;
            //            userSupplier.UpdateDate = DateTime.Now;
            //            await _context.UserSuppliers.AddAsync(userSupplier);
            //            _context.SaveChanges();
            //        }
            //    }
            //    else
            //    {
            //        var updateSupplier = _context.Suppliers.Where(b => b.SupplierId.Equals(userSupplierId) && b.Status == "A").FirstOrDefault();
            //        var userSupplier = _context.UserSuppliers.Where(ub => ub.UserId.Equals(updateUserId)).FirstOrDefault();
            //        if (userSupplier != null && updateSupplier != null)
            //        {
            //            userSupplier.Supplier = updateSupplier;
            //            userSupplier.UpdateDate = DateTime.Now;

            //            _context.UserSuppliers.Update(userSupplier);
            //            _context.SaveChanges();
            //        }
            //    }
            //    }
            //    else
            //    {
            //        StatusMessage = "Chưa chọn chi nhánh! Mời bạn chọn lại chi nhánh cho tài khoản";
            //        return RedirectToPage("UserSupplier", new { userId = updateUserId });
            //    }
            return RedirectToPage("ManageUserAuthority");
        }
    }
}
