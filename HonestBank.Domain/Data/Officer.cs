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
    
    public partial class Officer
    {
        public int OfficerID { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public System.DateTime StartDate { get; set; }
        public Nullable<int> DesignationID { get; set; }
        public Nullable<int> CustomerID { get; set; }
    
        public virtual Customer Customer { get; set; }
    }
}