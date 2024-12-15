namespace ThuMuaHangWeb.Models
{
    public class PagingModel
    {
        public int currentPage { get; set; }
        public int totalPages { get; set; }
        public Func<int?, string> generateUrl { get;set; }
    }

    public class Token
    {
        public string access_token { get; set; }
        public string token_type { get; set; }
        public string refresh_token { get; set;}
    }

    public class ApiResult
    {
        public string status_code { get; set; }
        public string error_code { get; set; }
        public string message { get; set; }
        public string data { get; set; }
    }
}
