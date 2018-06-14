//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HonestBank.Domain.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public Product()
        {
            this.Accounts = new HashSet<Account>();
        }
    
        public string ProductCode { get; set; }
        public Nullable<System.DateTime> CreationDate { get; set; }
        public Nullable<System.DateTime> ExpiryDate { get; set; }
        public string Name { get; set; }
        public string ProductTypeCode { get; set; }
    
        public virtual ICollection<Account> Accounts { get; set; }
        public virtual ProductType ProductType { get; set; }
    }
}
