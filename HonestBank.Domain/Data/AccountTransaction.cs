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
    
    public partial class AccountTransaction
    {
        public decimal TransactionID { get; set; }
        public double Amount { get; set; }
        public System.DateTime FundsAvailableDate { get; set; }
        public System.DateTime TransactionDate { get; set; }
        public string TransactionTypeCode { get; set; }
        public Nullable<int> AccountID { get; set; }
        public Nullable<int> ExecutionBranchID { get; set; }
        public Nullable<int> TellerEmployeeID { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual Branch Branch { get; set; }
        public virtual Employee Employee { get; set; }
    }
}
