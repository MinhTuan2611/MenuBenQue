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
            return View();
        }

        // POST: NhomMonAns/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("NhomId,TenNhom,Active,CreateDate,UpdateDate")] NhomMonAn nhomMonAn)
        {
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
        public async Task<IActionResult> Edit(int id, [Bind("NhomId,TenNhom,Active,CreateDate,UpdateDate")] NhomMonAn nhomMonAn)
        {
            if (id != nhomMonAn.NhomId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(nhomMonAn);
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
