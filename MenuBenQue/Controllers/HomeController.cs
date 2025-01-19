using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using ThuMuaHangWeb.Data;
using ThuMuaHangWeb.Models;

namespace ThuMuaHangWeb.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            IIndex result = new IIndex()
            {
                MonAns = await _context.MonAns
                .Include(m => m.NhomMonAn)
                .Include(m => m.NhomMonAn.NhomCha)
                .Include(m => m.NhomMonAn2)
                .Where(m => m.Active == true)
                .OrderBy(m => m.Order)
                .ToListAsync(),
                Comboes = await _context.Combos
                .Include(m => m.NhomMon)
                .Include(m => m.NhomMon.NhomCha)
                .ToListAsync()
            };

            ViewBag.Comboes = _context.Combos
                .Include(m => m.NhomMon)
                .Include(m => m.NhomMon.NhomCha)
                .ToList();
            return result.MonAns != null ? View(result) : Problem("Entity set 'ApplicationDbContext.MonAns'  is null.");
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}