using System.ComponentModel;

namespace ThuMuaHangWeb.Data.Enum
{
    public enum PhanQuyen
    {
        [Description("")]
        Default,
        [Description("Nhân viên")]
        NguoiDung,
        [Description("Quản lý")]
        QuanLy,
        [Description("Phòng cung ứng")]
        CungUng,
        [Description("Nhà cung cấp")]
        NhaCungCap,
        [Description("Kế toán")]
        KeToan,
        [Description("Admin")]
        Admin
    }

    public enum RequestStatus
    {
        [Description("Tạo phiếu")]
        Default,
        [Description("Chưa phê duyệt")]
        ChuaPheDuyet,
        [Description("Quản lý đã duyệt")]
        QuanLyDaPheDuyet,
        [Description("Cung ứng đã duyệt")]
        CungUngDaPheDuyet,
        [Description("Đã đặt hàng")]
        DaDatHang,
        [Description("Từ chối")]
        TuChoi,
        [Description("Kho tổng đặt hàng")]
        KhoTong,
        [Description("Kho tổng chuyển hàng")]
        KhoTongChuyen
    }

    public enum RequestLogStatus
    {
        [Description("Tạo phiếu")]
        Default,
        [Description("Cập nhật phiếu")]
        CapNhat,
        [Description("Quản lý đã duyệt")]
        QuanLyDaPheDuyet,
        [Description("Cung ứng đã duyệt")]
        CungUngDaPheDuyet,
        [Description("Đã đặt hàng")]
        DaDatHang,
        [Description("Từ chối")]
        TuChoi,
        [Description("Kho tổng đặt hàng")]
        KhoTong,
        [Description("Kho tổng chuyễn hàng")]
        KhoTongChuyen
    }

    public enum ReceiptStatus
    {
        [Description("Chờ duyệt")]
        ChoDuyet,
        [Description("Chờ xử lý")]
        ChoXuLy,
        [Description("Đã duyệt")]
        DaDuyet,
        [Description("Từ Chối")]
        TuChoi
    }

    public enum ReceiptLogStatus
    {
        [Description("Tạo phiếu")]
        TaoPhieu,
        [Description("Duyệt phiếu")]
        DaDuyet,
        [Description("Từ Chối")]
        TuChoi,
        [Description("Cập nhật phiếu")]
        CapNhat
    }

    public enum OrderStatus
    {
        [Description("Tạo phiếu")]
        TaoPhieu,
        [Description("Cung ứng đã duyệt")]
        CUPheDuyet,
        [Description("Nhà cung cấp phản hồi thông tin")]
        NCCPhanHoi,
        [Description("Chờ giao hàng")]
        ChoGiao,
        [Description("Nhận hàng")]
        DaNhan,
        [Description("Không theo quy trình")]
        InActive,
        [Description("Từ chối")]
        Reject
    }

    public enum OrderLogStatus
    {
        [Description("Tạo phiếu")]
        TaoPhieu,
        [Description("Cập nhật phiếu")]
        CapNhat,
        [Description("Gửi phiếu đặt hàng")]
        CUPheDuyet,
        [Description("Nhà cung cấp phản hồi thông tin")]
        NCCPhanHoi,
        [Description("Chờ giao hàng")]
        ChoGiao,
        [Description("Nhận hàng")]
        DaNhan,
        [Description("Từ chối")]
        Reject
    }

    public enum PaymentsStatus
    {
        [Description("Tiền mặt")]
        Cash,
        [Description("Chuyển khoản")]
        Transfer,
        [Description("Công nợ/ Chưa thanh toán")]
        Debts
    }

    public enum QuotesStatus
    {
        [Description("Chưa có hiệu lực")]
        PreActive,
        [Description("Có hiệu lực")]
        Active,
        [Description("Hết hiệu lực")]
        Inactive,
    }

    public enum TransferStatus
    {
        [Description("Tạo phiếu")]
        TaoPhieu,
        [Description("Đang vận chuyển")]
        VanChuyen,
        [Description("Nhận Hàng")]
        NhanHang,
    }

    public enum TransferLogStatus
    {
        [Description("Tạo phiếu")]
        TaoPhieu,
        [Description("Xác nhận vận chuyển")]
        VanChuyen,
        [Description("Nhận Hàng")]
        NhanHang
    }
}
