//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GrosHub.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ShippingAddress
    {
        public int AddressId { get; set; }
        public string UserId { get; set; }
        public string Address { get; set; }
        public string TownCity { get; set; }
        public string Country { get; set; }
        public string State { get; set; }
        public string Pin { get; set; }
        public Nullable<bool> IsCurrent { get; set; }
    }
}
