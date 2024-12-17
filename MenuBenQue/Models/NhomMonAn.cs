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
        public string TenNhom { get; set; }
        public bool? Active { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime UpdateDate { get; set; }
    }
}
