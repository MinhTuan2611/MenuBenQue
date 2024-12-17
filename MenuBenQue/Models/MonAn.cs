using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using ThuMuaHangWeb.Data.Enum;

namespace ThuMuaHangWeb.Models
{
    public class MonAn
    {
        [Key]
        public int MonId { get; set; }
        public string TenMon { get; set; }
        [Precision(18, 3)]
        public decimal GiaMon { get; set;}
        public string DonVi { get; set;}
        public decimal GiaMonKhuyenMai { get; set; }
        public NhomMonAn NhomMonAn { get; set; }
        public bool? Active { get; set;}
        public DateTime CreateDate { get; set;}
        public DateTime UpdateDate { get; set;}
    }
}
