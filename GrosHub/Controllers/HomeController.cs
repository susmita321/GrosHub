using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GrosHub.Models;

namespace GrosHub.Controllers
{
    public class HomeController : Controller
    {
        GrosHUbDBContext db = new GrosHUbDBContext();
        public ActionResult Index()
        {

            var product = db.Products;
            if(Session["CategoryId"]!=null)
            {
                Guid CategoryId =(Guid)Session["CategoryId"];
                //product = db.Products.Where(x => x.CategoryId==CategoryId).FirstOrDefault();

            }
            if (Session["UserId"] != null)
            {
                string UserId = Convert.ToString(Session["UserId"]);
                //var user = db.Users.Where(x => x.UserId.Equals(UserId)).FirstOrDefault();
               
              
            }
            return View(product);

        }
        [HttpPost]
        public ActionResult Index(Product obj)
        {
            Session["CategoryId"] = "89408cb9-4a37-44c1-8b7f-7da17416dcda";
            return RedirectToAction("Index");
        }
            public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}