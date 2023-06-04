using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using Wekala.DAL.Entities;

namespace Wekala.DAL.Contexts
{
    public class WekalaDBContext : IdentityDbContext<ApplicationUser>
    {
        public WekalaDBContext(DbContextOptions<WekalaDBContext> options):base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Review>(R =>
            {
                R.HasKey(R => new { R.Rev_Id, R.Pro_Id });
                R.Property(i => i.Rev_Id).ValueGeneratedOnAdd();
            });
            modelBuilder.Entity<Image>()
                        .HasKey(I => new { I.Pro_Id, I.Pro_Img });
        }

        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<Image> Images { get; set; }
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderItem> OrderItems { get; set; }
        public virtual DbSet<DeliveryMethod> DeliveryMethods { get; set; }
        public virtual DbSet<Store> Stores { get; set; }
        public virtual DbSet<Promotion> Promotions { get; set; }

    }
}
