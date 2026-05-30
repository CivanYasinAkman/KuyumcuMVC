using System.ComponentModel.DataAnnotations;

namespace KuyumcuMVC.Models
{
    public class Kategori
    {
        [Key]
        public int KategoriID { get; set; }
        
        [Required]
        public string KategoriAdi { get; set; }
        
        public string? Aciklama { get; set; }

        // Bire-Çok İlişki: Bir kategorinin birden fazla ürünü olabilir
        public ICollection<Urun> Urunler { get; set; } = new List<Urun>();
    }
}