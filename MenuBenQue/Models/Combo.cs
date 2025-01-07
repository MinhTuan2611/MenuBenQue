
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using ThuMuaHangWeb.Models;

namespace MenuBenQue.Models;


public class Combo {
    [Key]
    public int ComboId { get; set; }
    [Required]
    [Display(Name = "Tên Combo", Prompt = "Nhập tên combo")]
    public string TenCombo { get; set; }
    [Display(Name = "Ghi chú", Prompt = "Nhập ghi chú")]
    public string GhiChu { get; set; }
    [Display(Name = "Danh sách món", Prompt = "Nhập danh sách món")]
    public string DanhSachMon { get; set; }
    [Display(Name = "Phần tặng", Prompt = "Nhập phần tặng kèm")]
    public string? Tang { get; set; }
    [Required]
    [Display(Name = "Nhóm món ăn")]
    public int NhomId { get; set; }
    public NhomMonAn? NhomMon { get; set; }
}
