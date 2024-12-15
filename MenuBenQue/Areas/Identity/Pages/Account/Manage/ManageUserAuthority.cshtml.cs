using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using static Microsoft.AspNetCore.Mvc.Razor.RazorPageBase;
using Newtonsoft.Json;
using System.Security.Claims;
using System.Text;
using ThuMuaHangWeb.Data;
using ThuMuaHangWeb.Data.Enum;
using ThuMuaHangWeb.Models;
using Microsoft.EntityFrameworkCore;
using DocumentFormat.OpenXml.InkML;
using ThuMuaHangWeb.Areas.Identity.Pages.Account.Manage.Users;
using System.ComponentModel;
using System.Reflection;
using DocumentFormat.OpenXml.Wordprocessing;

namespace ThuMuaHangWeb.Areas.Identity.Pages.Account.Manage
{
    [Authorize]
    public class ManageUserAuthorityModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ApplicationDbContext _context;

        [TempData]
        public string StatusMessage { get; set; }
        public List<ApplicationUser> lstUsers { get; set; } = new List<ApplicationUser>();

        public List<UserManagement> lstUserPayload { get; set; } = new List<UserManagement>();
        public List<UserManagement> lstUserOrigin { get; set; } = new List<UserManagement>();
        public ApplicationUser user { get; set; }
        public IdentityRole role { get; set; }

        [BindProperty]
        public string roleId { get; set; }

        public string? SearchValue { get; set; }
        public PhanQuyen? PhanQuyenSearch { get; set; }
        public SelectList lstPhanQuyenSelect { get; set; }

        public ManageUserAuthorityModel(IHttpContextAccessor httpContext,
                                        ApplicationDbContext context,
                                        UserManager<ApplicationUser> userManager)
        {
            var User = httpContext.HttpContext.User;
            _userManager = userManager;
            _context = context;
            var role = Enum.Parse<PhanQuyen>(User.FindFirstValue(ClaimTypes.Role));
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            //if (role.Equals(PhanQuyen.QuanLy))
            //{
            //    var userQuanLyBranch = context.UserBranches.Where(ub => ub.UserId.Equals(userId)).FirstOrDefault();
            //    if(userQuanLyBranch != null)
            //    {
            //        var userInBranchs = context.UserBranches.Where(ub => ub.BranchId.Equals(userQuanLyBranch.BranchId) 
            //                                                            && !ub.UserId.Equals(userQuanLyBranch.UserId)).Select(ub=>ub.UserId.ToString()).ToList();
            //        lstUsers = _userManager.Users.Where(u => userInBranchs.Any(ub => ub == u.Id) && u.Status != "I").ToList();
            //    }
            //}
            //else if(role.Equals(PhanQuyen.Admin))
            //{
            //    var adminUsers = _userManager.Users.FirstOrDefault(u => u.Email.Equals("super_manager@gmail.com"));
            //    var allUsers = _userManager.Users.Where(u =>u.Email != "super_manager@gmail.com" && u.Id != userId && u.Status != "I").ToList();
            //    lstUsers = allUsers;
            //}
            //List<UserBranch>  branches = context.UserBranches.Include(uB => uB.Branch).ToList();
            //List<UserSupplier>  suppliers = context.UserSuppliers.Include(uS => uS.Supplier).ToList();

            //foreach (ApplicationUser item in lstUsers)
            //{
            //    PhanQuyen roleUser = PhanQuyen.Default;
            //    var userRole = context.UserRoles.FirstOrDefault(ur => ur.UserId.Equals(item.Id));
            //    if (userRole != null)
            //    {
            //        var roleSelected = context.Roles.FirstOrDefault(r => r.Id.Equals(userRole.RoleId));
            //        roleUser = Enum.Parse<PhanQuyen>(roleSelected.Name);
            //    }

            //    string baseName = string.Empty;
            //    if (roleUser.Equals(PhanQuyen.NguoiDung) || roleUser.Equals(PhanQuyen.QuanLy))
            //    {
            //        UserBranch userBranch = branches.FirstOrDefault(uB => uB.UserId == item.Id, new UserBranch());
            //        baseName = userBranch.Branch?.BranchName ?? "";
            //    }
            //    else if (roleUser.Equals(PhanQuyen.NhaCungCap))
            //    {
            //        UserSupplier userSupplier = suppliers.FirstOrDefault(uS => uS.UserId == item.Id, new UserSupplier());
            //        baseName = userSupplier.Supplier?.DisplayName ?? "";
            //    }
            //    UserManagement userManagement = new UserManagement
            //    {
            //        Id = item.Id,
            //        UserName = item.UserName,
            //        Email = item.Email,
            //        FirstName = item.FirstName,
            //        LastName = item.LastName,
            //        Role = roleUser,
            //        BaseName = baseName
            //    };
            //    lstUserPayload.Add(userManagement);
            //}
            //lstUserOrigin = lstUserPayload;
            //var lstPhanQuyen = Enum.GetValues(typeof(PhanQuyen))
            //                            .Cast<PhanQuyen>()
            //                            .Where(p => p != PhanQuyen.Default)
            //                            .Select(e => new
            //                            {
            //                                Value = e,
            //                                Name = e.GetType()
            //                                    .GetMember(e.ToString())
            //                                    .FirstOrDefault()
            //                                    ?.GetCustomAttribute<DescriptionAttribute>()
            //                                    ?.Description ?? e.ToString()
            //                            });
            //lstPhanQuyenSelect = new SelectList(lstPhanQuyen, "Value", "Name");
        }

        public void OnGet()
        {           
            StatusMessage = String.Empty;
            lstUserPayload = lstUserOrigin;
        }

        public void OnPostAsync(string? searchValue, PhanQuyen? phanQuyenSearch)
        {
            string inputSearch = searchValue != null ? searchValue.Trim().ToLower() : null;
            lstUserPayload = lstUserOrigin.Where(u => (
            searchValue == null 
            || (u.LastName + " " + u.FirstName).ToLower().Contains(inputSearch) 
            || u.UserName.ToLower().Contains(inputSearch)
            || (u.Email != null && u.Email.ToLower().Contains(inputSearch))
            || (u.BaseName.ToLower().Contains(inputSearch))
            )
            && (phanQuyenSearch == null || u.Role == phanQuyenSearch)).ToList();
        }

        public async Task<IActionResult> OnGetDeleteUser(string userId)
        {
            StatusMessage = String.Empty;
            var user = _userManager.Users.FirstOrDefault(u => u.Id.Equals(userId));
            if (user != null)
            {
                StatusMessage = String.Format("User {0} is deleted", user.UserName);
                user.UserName = userId;
                user.NormalizedUserName = userId;
                user.Status = "I";
                var userRole = _context.UserRoles.FirstOrDefault(ur => ur.UserId.Equals(user.Id));
                //var userBranch = _context.UserBranches.FirstOrDefault(ur => ur.UserId.Equals(user.Id));
                //var userSupplier = _context.UserSuppliers.FirstOrDefault(ur => ur.UserId.Equals(user.Id));
                //if(userSupplier != null)
                //{
                //  _context.UserSuppliers.Remove(userSupplier);
                //}
                //if (userRole != null)
                //{
                //    _context.UserRoles.Remove(userRole);
                //}
                //if (userBranch != null)
                //{
                //    _context.UserBranches.Remove(userBranch);
                //}
                
                await _context.SaveChangesAsync();
                await _userManager.UpdateAsync(user);                
            }
            return RedirectToPage("ManageUserAuthority");
        }
    }
}
