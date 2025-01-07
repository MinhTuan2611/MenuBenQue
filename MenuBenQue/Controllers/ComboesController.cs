using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MenuBenQue.Models;
using ThuMuaHangWeb.Data;
using Microsoft.AspNetCore.Authorization;

namespace MenuBenQue.Controllers
{
    [Authorize]
    public class ComboesController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ComboesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Comboes
        public async Task<IActionResult> Index()
        {
              return _context.Combos != null ? 
                          View(await _context.Combos.Include(c => c.NhomMon).ToListAsync()) :
                          Problem("Entity set 'ApplicationDbContext.Combos'  is null.");
        }

        // GET: Comboes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Combos == null)
            {
                return NotFound();
            }

            var combo = await _context.Combos
                .FirstOrDefaultAsync(m => m.ComboId == id);
            if (combo == null)
            {
                return NotFound();
            }

            return View(combo);
        }

        // GET: Comboes/Create
        public IActionResult Create()
        {
            ViewBag.NhomMonAn = _context.NhomMonAn.Where(n => n.Active == true).ToList();
            return View();
        }

        // POST: Comboes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ComboId,TenCombo,GhiChu,DanhSachMon,Tang,NhomId")] Combo combo)
        {
            if (ModelState.IsValid)
            {
                combo.NhomMon = _context.NhomMonAn.FirstOrDefault(n => n.NhomId == combo.NhomId);
                _context.Add(combo);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewBag.NhomMonAn = _context.NhomMonAn.Where(n => n.Active == true).ToList();
            return View(combo);
        }

        // GET: Comboes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Combos == null)
            {
                return NotFound();
            }

            var combo = await _context.Combos.FindAsync(id);
            if (combo == null)
            {
                return NotFound();
            }
            ViewBag.NhomMonAn = _context.NhomMonAn.Where(n => n.Active == true).ToList();
            return View(combo);
        }

        // POST: Comboes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ComboId,TenCombo,GhiChu,DanhSachMon,Tang,NhomId")] Combo combo)
        {
            if (id != combo.ComboId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    combo.NhomMon = _context.NhomMonAn.FirstOrDefault(n => n.NhomId == combo.NhomId);
                    _context.Update(combo);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ComboExists(combo.ComboId))
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
            ViewBag.NhomMonAn = _context.NhomMonAn.Where(n => n.Active == true).ToList();
            return View(combo);
        }

        // GET: Comboes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Combos == null)
            {
                return NotFound();
            }

            var combo = await _context.Combos
                .FirstOrDefaultAsync(m => m.ComboId == id);
            if (combo == null)
            {
                return NotFound();
            }

            return View(combo);
        }

        // POST: Comboes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Combos == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Combos'  is null.");
            }
            var combo = await _context.Combos.FindAsync(id);
            if (combo != null)
            {
                _context.Combos.Remove(combo);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ComboExists(int id)
        {
          return (_context.Combos?.Any(e => e.ComboId == id)).GetValueOrDefault();
        }
    }
}
