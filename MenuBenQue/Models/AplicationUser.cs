using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using ThuMuaHangWeb.Data.Enum;

namespace ThuMuaHangWeb.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string  FirstName { get; set; }

        public string LastName { get; set; }
        public string? Status { get; set; } = "A";
    }

    public class UserManagement
    {
        public string Id { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }

        public string LastName { get; set; }
        public PhanQuyen? Role { get; set; }
        public string? BaseName { get; set; }
    }
}
