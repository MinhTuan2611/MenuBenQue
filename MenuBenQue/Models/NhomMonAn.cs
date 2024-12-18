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
        [Display(Name = "Trạng thái")]
        public bool? Active { get; set; }
        public DateTime CreateDate { get; set; } = DateTime.Now;
        public DateTime UpdateDate { get; set; } = DateTime.Now;
    }
}
