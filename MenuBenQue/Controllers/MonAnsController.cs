using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ThuMuaHangWeb.Data;
using ThuMuaHangWeb.Models;

namespace MenuBenQue.Controllers
{
    [Authorize]
    public class MonAnsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public MonAnsController(ApplicationDbContext context)
        {
            _context = context;
        }
        [AllowAnonymous]
        public async Task<IActionResult> Display()
        {
            return _context.MonAns != null ?
                        View(await _context.MonAns.Include(m => m.NhomMonAn).Where(m => m.Active == true).ToListAsync()) :
                        Problem("Entity set 'ApplicationDbContext.MonAns'  is null.");
        }

        // GET: MonAns
        public async Task<IActionResult> Index()
        {
              return _context.MonAns != null ? 
                          View(await _context.MonAns.Include(m => m.NhomMonAn)
                          .OrderBy(m =>m.NhomMonAn.Order)
                          .ThenBy(m =>m.Order)
                          .ToListAsync()) :
                          Problem("Entity set 'ApplicationDbContext.MonAns'  is null.");
        }

        // GET: MonAns/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.MonAns == null)
            {
                return NotFound();
            }

            var monAn = await _context.MonAns
                .FirstOrDefaultAsync(m => m.MonId == id);
            if (monAn == null)
            {
                return NotFound();
            }

            return View(monAn);
        }

        // GET: MonAns/Create
        public IActionResult Create()
        {
            ViewBag.NhomMonAn = _context.NhomMonAn.Where(n => n.Active == true).ToList();
            return View();
        }

        // POST: MonAns/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(IMonAn IMonAn)
        {

            MonAn monAn = new MonAn
            {
                TenMon = IMonAn.TenMon,
                GiaMon = (decimal)IMonAn.GiaMon,
                DonVi = IMonAn.DonVi,
                NhomMonAn = _context.NhomMonAn.FirstOrDefault(n => n.NhomId == IMonAn.NhomMonAn),
                GiaMonKhuyenMai = IMonAn.GiaMonKhuyenMai,
                MatMa = IMonAn.MatMa,
                Order = IMonAn.Order,
                GhiChu = IMonAn.GhiChu,
                Active = IMonAn.Active
            };

            ViewBag.NhomMonAn = _context.NhomMonAn.Where(n => n.Active == true).ToList();
            if (ModelState.IsValid)
            {
                _context.Add(monAn);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(monAn);
        }

        // GET: MonAns/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.MonAns == null)
            {
                return NotFound();
            }

            var monAn = await _context.MonAns.Include(m => m.NhomMonAn).FirstAsync(m => m.MonId == id);
            if (monAn == null)
            {
                return NotFound();
            }
            ViewBag.NhomMonAn = _context.NhomMonAn.Where(n => n.Active == true).ToList();
            return View(monAn);
        }

        // POST: MonAns/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, IMonAn IMonAn)
        {
            MonAn monAn = new MonAn
            {
                MonId = (int)IMonAn.MonId,
                TenMon = IMonAn.TenMon,
                MatMa = IMonAn.MatMa,
                Order = IMonAn.Order,
                GhiChu = IMonAn.GhiChu,
                GiaMon = (decimal)IMonAn.GiaMon,
                DonVi = IMonAn.DonVi,
                NhomMonAn = _context.NhomMonAn.FirstOrDefault(n => n.NhomId == IMonAn.NhomMonAn),
                GiaMonKhuyenMai = IMonAn.GiaMonKhuyenMai,
                Active = IMonAn.Active,
                UpdateDate = DateTime.Now
            };
            if (id != monAn.MonId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(monAn);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MonAnExists(monAn.MonId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(monAn);
        }

        // GET: MonAns/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.MonAns == null)
            {
                return NotFound();
            }

            var monAn = await _context.MonAns
                .FirstOrDefaultAsync(m => m.MonId == id);
            if (monAn == null)
            {
                return NotFound();
            }

            return View(monAn);
        }

        // POST: MonAns/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id, [Bind("MonId")] int monId)
        {
            if (_context.MonAns == null)
            {
                return Problem("Entity set 'ApplicationDbContext.MonAns'  is null.");
            }
            var monAn = await _context.MonAns.FindAsync(monId);
            if (monAn != null)
            {
                _context.MonAns.Remove(monAn);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MonAnExists(int id)
        {
          return (_context.MonAns?.Any(e => e.MonId == id)).GetValueOrDefault();
        }
    }
}
