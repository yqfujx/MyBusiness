//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyBusiness.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PurchaseDelivery
    {
        public int Id { get; set; }
        public float Quantity { get; set; }
        public int PurchaseContractId { get; set; }
        public int DeliveryId { get; set; }
        public Nullable<float> ReceiveQuantity { get; set; }
    
        public virtual PurchaseContract Contract { get; set; }
        public virtual Delivery Delivery { get; set; }
    }
}