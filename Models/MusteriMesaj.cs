using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema; // Bunu ekle

namespace KuyumcuMVC.Models;

public class MusteriMesaj 
{
    [Key]
    public int MesajID { get; set; }

    [Column("AdSoyad")] // Formdaki 'name="adSoyad"' ile burayı eşler
    public string AdSoyad { get; set; }

    [Column("Eposta")] // Formdaki 'name="eposta"' ile burayı eşler
    public string Eposta { get; set; }

    [Column("Telefon")] // Formdaki 'name="telefon"' ile burayı eşler
    public string? Telefon { get; set; }

    [Column("Konu")] // Formdaki 'name="konu"' ile burayı eşler
    public string Konu { get; set; }

    [Column("MesajIcerik")] // Formdaki 'name="mesaj"' ile burayı eşler
    public string MesajIcerik { get; set; }

    public int OkunduMu { get; set; } = 0;
    public DateTime GonderimTarihi { get; set; } = DateTime.Now;
}