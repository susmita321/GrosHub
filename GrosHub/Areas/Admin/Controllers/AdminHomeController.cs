using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GrosHub.Models;
using System.ComponentModel.DataAnnotations;

namespace GrosHub.Areas.Admin.Controllers
{
    public class AdminHomeController : Controller
    {
        // GET: Admin/Home
        private GrosHUbDBContext db = new GrosHUbDBContext();
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(tblAdmin obj)
        {
            var CheckLogIn = db.tblAdmins.Where(x => x.AdminId.Equals(obj.AdminId) && x.Password.Equals(obj.Password)).FirstOrDefault();
            if (CheckLogIn != null)
            {
                Session["AdminId"] = obj.AdminId.ToString();
               // Session["AdminName"] = db.tblAdmins.
                return RedirectToAction("Home");
            }
            else
            {
                ViewBag.Message = "Wrong Admin ID/Password";
            }
            return View();
        }
        public ActionResult Home()
        {
            ViewBag.HomeActive = "class=active";
            ViewBag.CategoryActive = "";
            ViewBag.ProductActive = "";
            ViewBag.StockActive = "";
            ViewBag.OrderActive = "";
            ViewBag.UserActive = "";
            return View();
        }

        public ActionResult LogOut()
        {
            Session.Clear();
            Session.Abandon();
            return RedirectToAction("Index");
        }
    }
}