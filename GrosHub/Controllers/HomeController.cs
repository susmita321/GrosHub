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
            if (Session["UserId"] != null)
            {
                string UserId = Convert.ToString(Session["UserId"]);
                var user = db.Users.Where(x => x.UserId.Equals(UserId)).FirstOrDefault();
                return View(user);
            }
            else
            {
                return View();
            }
            
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