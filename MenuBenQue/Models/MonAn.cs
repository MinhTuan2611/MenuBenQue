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
        [Display(Name = "Tên Món Ăn", Prompt = "Nhập tên món ăn", Description = "Tên món")]
        [Required(ErrorMessage = "Tên món ăn không được bỏ trống")]
        public string TenMon { get; set; }
        [Display(Name = "Giá món ăn", Prompt = "Nhập giá món ăn", Description = "Giá món")]
        [Required(ErrorMessage = "Giá món ăn không được bỏ trống")]
        [Precision(18, 3)]
        public decimal GiaMon { get; set;}
        [Display(Name = "Đơn vị tính", Prompt = "Nhập đơn vị tính", Description = "Đơn vị")]
        [Required(ErrorMessage = "Đơn vị tính không được bỏ trống")]
        public string DonVi { get; set;}
        [Precision(18, 3)]
        [Display(Name = "Giá món khuyến mãi", Prompt = "Nhập giá món khuyến mãi", Description = "Giá món khuyến mãi")]
        public decimal? GiaMonKhuyenMai { get; set; }
        [Display(Name = "Nhóm món ăn", Prompt = "Nhập Nhóm món ăn", Description = "Nhóm món ăn")]
        public NhomMonAn NhomMonAn { get; set; }
        [Display(Name = "Trạng thái")]
        public bool? Active { get; set;}
        public DateTime CreateDate { get; set; } = DateTime.Now;
        public DateTime UpdateDate { get; set; } = DateTime.Now;
    }
    public class IMonAn
    {
        public int? MonId { get; set; }
      
        public string TenMon { get; set; }
        
        public decimal GiaMon { get; set; }
        
        public string DonVi { get; set; }
        
        public decimal? GiaMonKhuyenMai { get; set; }
        
        public int NhomMonAn { get; set; }
        public bool? Active { get; set; }
    }

    public class IDisplay
    {
        public NhomMonAn Key { get; set; }
        public List<MonAn> MonAns { get; set; }
    }
}
