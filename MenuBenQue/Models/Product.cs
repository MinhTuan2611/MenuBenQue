using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using ThuMuaHangWeb.Data.Enum;

namespace ThuMuaHangWeb.Models
{
      public class Product
      {
        [Key]
        public int ProductId { get; set; }
        public string ProductCode { get; set; }
        public string DisplayName { get; set;}
        public string Unit { get; set;}
        public decimal LowestEntryPrice { get; set; }
        [Precision(18, 3)]
        public decimal? SalePrice { get; set; } = 0;
        public double? Tax { get; set; }
        public string? Status { get; set;}
        public int? RefId { get; set; }
        public int? ProductTypeId { get; set; }
        public DateTime CreateDate { get; set;}
        public DateTime UpdateDate { get; set;}
      }

    public class SearchOptionProduct
    {
        public string? SearchValue { get; set; }
    }
    public class ViewModelProduct
    {
        public List<Product> Products { get; set; }
        public SearchOptionProduct? SearchOption { get; set; }
    }

    public class DataAPI
    {
        public List<ProducApiData> list { get; set; }
        public int total { get; set; }
    }
    public class ProducApiData
    {

        public string? maHangHoa { get; set; }
        public string? tenHangHoa { get; set; }
        public string? donViTinh { get; set; }
        public string? maNhomHangHoa { get; set; }
        public decimal? giaMua { get; set; }
        public decimal? giaBanLe { get; set; }
        public string? maNhaCungCap { get; set; }
        public float? tinhTrang { get; set; }
        public string? loaiHangHoa { get; set; }
        public string? maVachID { get; set; }
        public string? kieuTheoDoi { get; set; }
        public float? dongGoi { get; set; }
        public string? dongGoi2 { get; set; }
        public string? dongGoi3 { get; set; }
        public string? dongGoi4 { get; set; }
        public string? donViTinh2 { get; set; }
        public string? donViTinh3 { get; set; }
        public string? donViTinh4 { get; set; }
        public float? baoHanh { get; set; }
        public float? soNgayBH { get; set; }
        public double? thueSuat { get; set; }
        public string? maThongKeHangHoa { get; set; }
        public float? trongLuong { get; set; }
        public string? maVo { get; set; }
        public string? maThuongHieu { get; set; }
        public string? tenThuongHieu { get; set; }
        public decimal? giaBanDLT { get; set; }
        public decimal? giaBanDLTP { get; set; }
        public float? total { get; set; }
    }

    public class CreateProductApi
    {
        public string maHangHoa { get; set; }
        public string tenHangHoa { get; set; }
        public string donViTinh { get; set; }
        public string maNhomHangHoa { get; set; }
        public string tenNhomHangHoa { get; set; }
        public int giaMua { get; set; }
        public int giaBanLe { get; set; }
        public string maNhaCungCap { get; set; }
        public string tenNhaCungCap { get; set; }
        public int tinhTrang { get; set; }
        public string loaiHangHoa { get; set; }
        public string maVachID { get; set; }
        public string kieuTheoDoi { get; set; }
        public int dongGoi { get; set; }
        public string dongGoi2 { get; set; }
        public string dongGoi3 { get; set; }
        public string dongGoi4 { get; set; }
        public string donViTinh2 { get; set; }
        public string donViTinh3 { get; set; }
        public string donViTinh4 { get; set; }
        public int baoHanh { get; set; }
        public string soNgayBH { get; set; }
        public double thueSuat { get; set; }
        public string maThongKeHangHoa { get; set; }
        public string trongLuong { get; set; }
        public string maVo { get; set; }
        public string maThuongHieu { get; set; }
        public string tenThuongHieu { get; set; }
        public int giaBanDLT { get; set; }
        public int giaBanDLTP { get; set; }
        public object total { get; set; }
        public string tenHangHoaInHoaDon { get; set; }
        public string loaiThue { get; set; }
        public string tenThueSuat { get; set; }
        public string giaMuaDonViTinh2 { get; set; }
        public string giaMuaDonViTinh3 { get; set; }
        public int giaC21 { get; set; }
        public int giaC22 { get; set; }
        public int giaC23 { get; set; }
        public int giaC31 { get; set; }
        public int giaC32 { get; set; }
        public int giaC33 { get; set; }
        public string size1 { get; set; }
        public string size2 { get; set; }
        public string mauSac { get; set; }
        public string taiKhoanVatTu { get; set; }
        public string taiKhoanGiaVon { get; set; }
        public string taiKhoanDoanhThu { get; set; }
        public string taiKhoanHangBanTraLai { get; set; }
        public string taiKhoanChietKhauHangBan { get; set; }
        public string nhaSanXuat { get; set; }
        public string nuocSanXuat { get; set; }
        public string soLuongToiThieu { get; set; }
        public string soLuongToiDa { get; set; }
        public string viTriHang { get; set; }
        public string dienGiai { get; set; }

        public CreateProductApi (Product product)
        {
            maHangHoa = product.ProductCode;
            tenHangHoa = product.DisplayName;
            donViTinh = product.Unit;
        }
    }
}
