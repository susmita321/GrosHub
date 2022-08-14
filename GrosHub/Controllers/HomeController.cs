using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GrosHub.Models;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace GrosHub.Controllers
{
    public class HomeController : Controller
    {
        GrosHUbDBContext db = new GrosHUbDBContext();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GrosHUb"].ToString());
        public ActionResult Index()
        {

            SqlCommand cmd = new SqlCommand("[dbo].[usp_GetCategoryDetails]", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
           
            
            ViewData.Add("Category", db.ProductCategories);
            
            if (Session["CategoryId"]!=null)
            {
                Guid CategoryId =(Guid)Session["CategoryId"];
            }
            if (Session["UserId"] != null)
            {
                string UserId = Convert.ToString(Session["UserId"]);
                //var user = db.Users.Where(x => x.UserId.Equals(UserId)).FirstOrDefault();
               
              
            }
            ViewData["dt"] = dt;
            Product p = new Product();
            // return View(db.Products.ToList());
            return View(p);

        }
        [HttpPost]
        public ActionResult Index(String SearchText)
        {
            Session["CategoryId"] = "89408cb9-4a37-44c1-8b7f-7da17416dcda";
            return RedirectToAction("Index");
        }
        
        public ActionResult SearchByCategoryId(string id)
        {
            SqlCommand cmd = new SqlCommand("[dbo].[usp_GetCategoryDetails]", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@CategoryId", SqlDbType.Int).Value = id;
           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ViewData["dt"] = dt;
            Product p = new Product();
            return View("Index",p);
        }

        [HttpPost]
        public ActionResult SearchByText(Product SearchKey)
        {
            SqlCommand cmd = new SqlCommand("[dbo].[usp_GetCategoryDetails]", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@ProductId", SqlDbType.Int).Value = null;
            cmd.Parameters.Add("@CategoryId", SqlDbType.Int).Value = null;
            cmd.Parameters.Add("@SearchText", SqlDbType.NVarChar).Value = SearchKey.ProductName;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ViewData["dt"] = dt;
            Product p = new Product();
            return View("Index", p);
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