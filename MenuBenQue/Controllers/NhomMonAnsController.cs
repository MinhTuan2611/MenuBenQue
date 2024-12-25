using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ThuMuaHangWeb.Data;
using ThuMuaHangWeb.Models;

namespace MenuBenQue.Controllers
{
    public class NhomMonAnsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public NhomMonAnsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: NhomMonAns
        public async Task<IActionResult> Index()
        {
              return _context.NhomMonAn != null ? 
                          View(await _context.NhomMonAn.ToListAsync()) :
                          Problem("Entity set 'ApplicationDbContext.NhomMonAn'  is null.");
        }

        // GET: NhomMonAns/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.NhomMonAn == null)
            {
                return NotFound();
            }

            var nhomMonAn = await _context.NhomMonAn
                .FirstOrDefaultAsync(m => m.NhomId == id);
            if (nhomMonAn == null)
            {
                return NotFound();
            }

            return View(nhomMonAn);
        }

        // GET: NhomMonAns/Create
        public IActionResult Create()
        {
            ViewBag.NhomMonAn = _context.NhomMonAn.Where(n => n.Active == true).ToList();
            return View();
        }

        // POST: NhomMonAns/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(INhomMonAn INhomMonAn)
        {
            ViewBag.NhomMonAn = _context.NhomMonAn.Where(n => n.Active == true).ToList();
            NhomMonAn nhomMonAn = new NhomMonAn()
            {
                NhomId = INhomMonAn.NhomId,
                Active = INhomMonAn.Active,
                CreateDate = DateTime.Now,
                GhiChu = INhomMonAn.GhiChu,
                NhomCha = _context.NhomMonAn.FirstOrDefault(n => n.NhomId == (INhomMonAn.NhomCha ?? 0)),
                Order = INhomMonAn.Order,
                TenNhom = INhomMonAn.TenNhom,
                TenNhomMatMa = INhomMonAn.TenNhomMatMa,
                UpdateDate = DateTime.Now
            };
            if (ModelState.IsValid)
            {
                _context.Add(nhomMonAn);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(nhomMonAn);
        }

        // GET: NhomMonAns/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.NhomMonAn == null)
            {
                return NotFound();
            }
            ViewBag.NhomMonAn = _context.NhomMonAn.Where(n => n.Active == true).ToList();
            var nhomMonAn = await _context.NhomMonAn.FindAsync(id);
            if (nhomMonAn == null)
            {
                return NotFound();
            }
            return View(nhomMonAn);
        }

        // POST: NhomMonAns/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, INhomMonAn INhomMonAn)
        {
            ViewBag.NhomMonAn = _context.NhomMonAn.Where(n => n.Active == true).ToList();
            
            if (id != INhomMonAn.NhomId)
            {
                return NotFound();
            }
            NhomMonAn nhomMonAn = await _context.NhomMonAn.FindAsync(id);
            if (nhomMonAn == null)
            {
                return NotFound();
            }

            // Cập nhật các thuộc tính từ `INhomMonAn`
            nhomMonAn.Active = INhomMonAn.Active;
            nhomMonAn.GhiChu = INhomMonAn.GhiChu;
            nhomMonAn.NhomChaId = INhomMonAn.NhomCha;
            nhomMonAn.Order = INhomMonAn.Order;
            nhomMonAn.TenNhom = INhomMonAn.TenNhom;
            nhomMonAn.TenNhomMatMa = INhomMonAn.TenNhomMatMa;
            nhomMonAn.UpdateDate = DateTime.Now;

            if (ModelState.IsValid)
            {
                try
                {
                    _context.NhomMonAn.Update(nhomMonAn);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!NhomMonAnExists(nhomMonAn.NhomId))
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
            return View(nhomMonAn);
        }

        // GET: NhomMonAns/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.NhomMonAn == null)
            {
                return NotFound();
            }

            var nhomMonAn = await _context.NhomMonAn
                .FirstOrDefaultAsync(m => m.NhomId == id);
            if (nhomMonAn == null)
            {
                return NotFound();
            }

            return View(nhomMonAn);
        }

        // POST: NhomMonAns/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.NhomMonAn == null)
            {
                return Problem("Entity set 'ApplicationDbContext.NhomMonAn'  is null.");
            }
            var nhomMonAn = await _context.NhomMonAn.FindAsync(id);
            if (nhomMonAn != null)
            {
                _context.NhomMonAn.Remove(nhomMonAn);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool NhomMonAnExists(int id)
        {
          return (_context.NhomMonAn?.Any(e => e.NhomId == id)).GetValueOrDefault();
        }
    }
}
