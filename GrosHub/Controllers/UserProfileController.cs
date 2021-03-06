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

namespace GrosHub.Controllers
{
    public class UserProfileController : Controller
    {
        private GrosHUbDBContext db = new GrosHUbDBContext();

        // GET: UserProfile
        public ActionResult Index()
        {
            return View(db.Users.ToList());
        }

        // GET: UserProfile/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: UserProfile/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserProfile/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserId,UserName,Password,Gender,PhoneNo,Email,Address,TownCity,Country,State,Pin")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(user);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(user);
        }

        // GET: UserProfile/Edit/5
        public ActionResult Edit()
        {
            string UserId = Convert.ToString(Session["UserId"]);
            User user = db.Users.Find(UserId);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: UserProfile/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserId,UserName,Password,Gender,PhoneNo,Email,Address,TownCity,Country,State,Pin")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(user);
        }

        // GET: UserProfile/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: UserProfile/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            User user = db.Users.Find(id);
            db.Users.Remove(user);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: userProfile
        public ActionResult userLogin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult userLogin(User obj)
        {
            var CheckUserLogin = db.Users.Where(x => x.UserId.Equals(obj.UserId) && x.Password.Equals(obj.Password)).FirstOrDefault();
            if (CheckUserLogin != null)
            {
                Session["UserId"] = obj.UserId.ToString();
                string ProfilePicture = "";
                if (CheckUserLogin.ProfilePicture == null)
                {
                    ProfilePicture ="/Content/img/MyProfile.png";
                }
                else
                {
                    ProfilePicture = "/Content/"+CheckUserLogin.ProfilePicture.ToString();
                }
                Session["ProfilePicture"] = ProfilePicture;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.Message = "Wrong User ID/Password";
            }
            return View();

        }

        public ActionResult Home()
        {
            return View();
        }
        public ActionResult SignOut()
        {
            Session.Clear();
            Session.Abandon();
            return RedirectToAction("Index");
        }
        public ActionResult ProfilePicture()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ProfilePicture(HttpPostedFileBase file)
        {
            try
            {
                if (file.ContentLength > 0)
                {
                    string UserId = Convert.ToString(Session["UserId"]);
                    string FileName = Path.GetFileName(file.FileName);
                    string ext = System.IO.Path.GetExtension(FileName).ToLower();
                    if (ext == ".jpg" || ext == ".png" || ext == ".git")
                    {
                        string _path = Path.Combine(Server.MapPath("~/Content/profilePicture"), UserId+ext);
                        file.SaveAs(_path);

                        
                        var _user = db.Users.Where(x=>x.UserId.Equals(UserId)).FirstOrDefault();

                        _user.ProfilePicture = "profilePicture/" + UserId + ext;
                        db.Entry(_user).State = EntityState.Modified;
                        db.SaveChanges();
                        ViewBag.Message = "File Uploaded Successfully!!";
                        @Session["ProfilePicture"] = "/Content/"+_user.ProfilePicture;
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
        public ActionResult ChangePassword()
        {
            string UserId = Convert.ToString(Session["UserId"]);
            User user = db.Users.Find(UserId);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }
        [HttpPost]
        public ActionResult ChangePassword(User _user)
        {
            if (ModelState.IsValid)
            {
                var PasswordCheck = db.Users.Where(x => x.Password.Equals(_user.Password) && x.UserId.Equals(_user.UserId)).FirstOrDefault();
                if(PasswordCheck!=null)
                {
                    PasswordCheck.Password = _user.NewPassword;
                    db.Entry(PasswordCheck).State = EntityState.Modified;
                    db.SaveChanges();
                    ViewBag.Message = "Password has been changed successfully!";
                }
                else
                {
                    ViewBag.Message = "Old Password does not matched!";
                }
               
                return View();
            }
            return View(_user);
        }
        public ActionResult Settings()
        {
            return View();
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
