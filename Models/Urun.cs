using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace KuyumcuMVC.Models
{
    public class Urun
    {
        [Key]
        public int UrunID { get; set; }
        
        [Required]
        public int KategoriID { get; set; }
        
        [Required]
        public string UrunAdi { get; set; }
        
        public string? KisaAciklama { get; set; }
        
        public string? DetayliAciklama { get; set; }
        
        [Required]
        public int Ayar { get; set; }
        
        public double? Gramaj { get; set; }
        
        public double IscilikUcreti { get; set; } = 0;
        
        public int StokDurumu { get; set; } = 1;
        
        public DateTime OlusturulmaTarihi { get; set; } = DateTime.Now;

        // Çoktan-Bire İlişki: Bir ürün bir kategoriye aittir
        [ForeignKey("KategoriID")]
        public Kategori? Kategori { get; set; }
    }
}