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
    
    public partial class Business
    {
        public Nullable<System.DateTime> IncorporatedDate { get; set; }
        public string Name { get; set; }
        public string StateID { get; set; }
        public int CustomerID { get; set; }
    
        public virtual Customer Customer { get; set; }
    }
}
