using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GrosHub.Models;

namespace GrosHub.Controllers
{
    public class ProductController : Controller
    {
        GrosHUbDBContext db = new GrosHUbDBContext();
        // GET: Product
        public ActionResult ProductList()
        {
            var _product = db.Products;
            return View(_product);
        }
    }
}