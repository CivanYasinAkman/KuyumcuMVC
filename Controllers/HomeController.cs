using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using KuyumcuMVC.Models;

namespace KuyumcuMVC.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly KuyumcuContext _context;

    public HomeController(ILogger<HomeController> logger, KuyumcuContext context)
    {
        _logger = logger;
        _context = context;
    }

    public IActionResult Index() => View();

    public IActionResult Urunler()
    {
        var urunler = _context.Urunler.Include(u => u.Kategori).ToList();
        return View(urunler);
    }

    public IActionResult Detay(int id)
    {
        var urun = _context.Urunler
                           .Include(u => u.Kategori)
                           .FirstOrDefault(u => u.UrunID == id);

        if (urun == null) return NotFound("Böyle bir ürün bulunamadı!");
        return View(urun);
    }

    public IActionResult Fiyatlar() => View();

    public IActionResult Iletisim() => View();

   [HttpPost]
    public IActionResult IletisimGonder(string adSoyad, string eposta, string telefon, string konu, string mesaj)
    {
        var yeniMesaj = new MusteriMesaj 
        {
            AdSoyad = adSoyad,
            Eposta = eposta,
            Telefon = telefon,
            Konu = konu,
            MesajIcerik = mesaj,
            OkunduMu = 0,
            GonderimTarihi = DateTime.Now
        };

        if (yeniMesaj != null)
        {
            _context.MusteriMesajlari.Add(yeniMesaj);
            _context.SaveChanges();
            
            // Başarılı olduğunu sayfaya bildirmek için ViewBag kullanıyoruz
            ViewBag.Basarili = true;
        }
        
        // İşlem bitince tekrar İletişim sayfasını (bu kez mesajla) aç
        return View("Iletisim"); 
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}