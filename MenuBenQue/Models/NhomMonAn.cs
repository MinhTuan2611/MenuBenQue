using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using ThuMuaHangWeb.Data.Enum;

namespace ThuMuaHangWeb.Models
{
    public class NhomMonAn
    {
        [Key]
        public int NhomId { get; set; }

        [Display(Name = "Tên nhóm món ăn", Prompt = "Nhập tên nhóm món ăn", Description = "Đơn vị")]
        [Required(ErrorMessage = "Tên nhóm món ăn không được bỏ trống")]
        public string TenNhom { get; set; }

        [Display(Name = "Tên nhóm mật mã", Prompt = "Nhập tên nhóm mật mã")]
        public string? TenNhomMatMa { get; set; }

        [Display(Name = "Ghi chú", Prompt = "Nhập ghi chú")]
        public string? GhiChu { get; set; }

        [Display(Name = "Thứ tự")]
        public int? Order { get; set; }

        [Display(Name = "Trạng thái")]
        public bool? Active { get; set; }

        [Display(Name = "Nhóm lớn")]
        public NhomMonAn? NhomCha { get; set; }
        public int? NhomChaId { get; set; }

        public DateTime CreateDate { get; set; } = DateTime.Now;
        public DateTime UpdateDate { get; set; } = DateTime.Now;
    }

    public class INhomMonAn
    {
        public int NhomId { get; set; } = 0;

        public string TenNhom { get; set; }

        public string? TenNhomMatMa { get; set; }

        public string? GhiChu { get; set; }

        public int? Order { get; set; }

        public bool? Active { get; set; }

        public int? NhomCha { get; set; }
    }
}
