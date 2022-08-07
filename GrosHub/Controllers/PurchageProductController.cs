using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GrosHub.Models;

namespace GrosHub.Controllers
{
    public class PurchageProductController : Controller
    {
        GrosHUbDBContext db = new GrosHUbDBContext();
        // GET: PurchageProduct
        public ActionResult BuyNow(string ProductId)
        {
            var _ShippingAddress = db.ShippingAddresses;
            return View(_ShippingAddress);
        }


        public ActionResult ChangeShippingAddress(ShippingAddress _obj)
        {
            
            return View();
        }
        public ActionResult Payment()
        {
           
            return View();
        }
        public ActionResult ConfirmOrder()
        {
            return View();
        }
    }
}