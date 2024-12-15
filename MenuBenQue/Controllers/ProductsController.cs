using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ThuMuaHangWeb.Data;
using ThuMuaHangWeb.Models;
using Newtonsoft.Json;
using System.Net.Http.Headers;
using System.Text;
using System.Drawing.Printing;

namespace ThuMuaHangWeb.Controllers
{
    [Authorize]
    public class ProductsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ProductsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Products


        // GET: Products/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Products/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductId,ProductCode,DisplayName,Unit,LowestEntryPrice,SalePrice,Status,CreateDate,UpdateDate")] Product product)
        {

            bool isExistProducts = _context.Products.Any(s => s.ProductCode == product.ProductCode && s.Status != "I");

            if (isExistProducts)
            {
                TempData["Message"] = "Mã sản phẩm đã tồn tại";
                TempData["MessageType"] = "danger";
                return View(product);
            }

            if (ModelState.IsValid)
            {
                product.Tax = product.Tax / 100;
                product.Status = "A";
                product.CreateDate = DateTime.Now;
                product.UpdateDate= DateTime.Now;
                _context.Add(product);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(product);
        }

        // GET: Products/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products.FindAsync(id);
            product.Tax = product?.Tax * 100;
            if (product == null)
            {
                return NotFound();
            }
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductId,ProductCode,DisplayName,Unit,Tax,LowestEntryPrice,SalePrice,Status,CreateDate,UpdateDate")] Product product)
        {
            if (id != product.ProductId)
            {
                return NotFound();
            }
            bool isExistProducts = _context.Products.Any(s => s.ProductCode == product.ProductCode && s.ProductId != product.ProductId && s.Status != "I");

            if (isExistProducts)
            {
                TempData["Message"] = "Mã sản phẩm đã tồn tại";
                TempData["MessageType"] = "danger";
                return View(product);
            }

            product.Tax = product.Tax / 100;

            if (ModelState.IsValid)
            {
                try
                {
                    product.UpdateDate= DateTime.Now;
                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ProductId))
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
            return View(product);
        }

        // GET: Products/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id, [Bind("ProductId")] int ProductId)
        {
            if (_context.Products == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Objects'  is null.");
            }
            var product = await _context.Products.FindAsync(ProductId);
            product.Status = "I";
            if (product != null)
            {
                _context.Products.Update(product);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public IActionResult AutocompleteById(string term)
        {
            var results = _context.Products.Where(p => p.Status == "A");
            var filteredResults = results.Where(r => r.ProductCode.Contains(term.Trim())).ToList();
            return Ok(filteredResults);
        }

        [HttpGet]
        public IActionResult AutocompleteByName(string term)
        {
            var results = _context.Products.Where(p => p.Status == "A");
            var filteredResults = results.Where(r => r.DisplayName.Contains(term.Trim())).ToList();
            return Ok(filteredResults);
        }


   
        private bool ProductExists(int id)
        {
          return _context.Products.Any(e => e.ProductId == id);
        }

        private bool ProductCodeExists(string code)
        {
            return _context.Products.Any(e => e.ProductCode == code);
        }
    }
}
