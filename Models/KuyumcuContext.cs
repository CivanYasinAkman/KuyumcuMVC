using Microsoft.EntityFrameworkCore;

namespace KuyumcuMVC.Models
{
    public class KuyumcuContext : DbContext
    {
        public KuyumcuContext(DbContextOptions<KuyumcuContext> options) : base(options)
        {
        }

        public DbSet<Kategori> Kategoriler { get; set; }
        public DbSet<Urun> Urunler { get; set; }
        public DbSet<MusteriMesaj> MusteriMesajlari { get; set; }
    }
}