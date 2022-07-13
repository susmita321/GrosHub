using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GrosHub.Models;
using System.IO;

namespace GrosHub.Areas.Admin.Controllers
{
    public class ProductsController : Controller
    {
        private GrosHUbDBContext db = new GrosHUbDBContext();

        // GET: Admin/Products
        public ActionResult Index()
        {
            ViewBag.HomeActive = "";
            ViewBag.CategoryActive = "";
            ViewBag.ProductActive = "class=active";
            ViewBag.StockActive = "";
            ViewBag.OrderActive = "";
            ViewBag.UserActive = "";
            return View(db.Products.ToList());
        }

        // GET: Admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductId,ProductName,CategoryId,Description")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(product);
        }

        // GET: Admin/Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductId,ProductName,CategoryId,Description")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(product);
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UploadProductImage()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UploadProductImage(HttpPostedFileBase file, string id,ProductGallery obj)
        {
            try
            {
                if (file.ContentLength > 0)
                {
                    string ProductImageId = db.ProductGalleries.Max(x=>x.ProductImageId).ToString();
                    ProductImageId = ProductImageId + 1;
                    string FileName = Path.GetFileName(file.FileName);
                    string ext = System.IO.Path.GetExtension(FileName).ToLower();
                    if (ext == ".jpg" || ext == ".png" || ext == ".git")
                    {
                        string _path = Path.Combine(Server.MapPath("~/Content/Product"), id + ProductImageId.ToString()+ ext);
                        file.SaveAs(_path);


                        //ProductGallery obj = new ProductGallery();
                        obj.ImagePath = "Product/" + id + ProductImageId.ToString() + ext;
                        obj.ProductId =Convert.ToInt32(id);
                        db.ProductGalleries.Add(obj);
                        db.SaveChanges();
                        ViewBag.Message = "File Uploaded Successfully!!";
                       // @Session["Product"] = "/Content/" + _user.ProfilePicture;
                    }
                    else
                    {
                        ViewBag.Message = "Invalid file!!";
                    }

                }


                return View();
            }
            catch
            {
                ViewBag.Message = "File upload failed!!";
                return View();
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
