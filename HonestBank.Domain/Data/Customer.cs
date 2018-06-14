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
    
    public partial class Customer
    {
        public Customer()
        {
            this.Accounts = new HashSet<Account>();
            this.Officers = new HashSet<Officer>();
        }
    
        public int CustomerID { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string CustomerTypeCode { get; set; }
        public string FederationID { get; set; }
        public string PostalCode { get; set; }
        public string State { get; set; }
    
        public virtual ICollection<Account> Accounts { get; set; }
        public virtual Business Business { get; set; }
        public virtual Individual Individual { get; set; }
        public virtual ICollection<Officer> Officers { get; set; }
    }
}
