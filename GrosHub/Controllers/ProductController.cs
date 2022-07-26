﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GrosHub.Models;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace GrosHub.Controllers
{
    public class ProductController : Controller
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GrosHUb"].ToString());
        GrosHUbDBContext db = new GrosHUbDBContext();
        // GET: Product
        public ActionResult ProductList()
        {
            
           
            var _product = db.Products;
            return View(_product);
        }
        public ActionResult ProductDetails(string id)
        {
            int ProductId = Convert.ToInt32(id);
            SqlCommand cmd = new SqlCommand("[dbo].[usp_GetCategoryDetails]", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@ProductId",SqlDbType.Int).Value= ProductId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ViewData.Add("Category", db.ProductCategories);
            // var _product = db.Products.Where(product => product.ProductId == ProductId).FirstOrDefault();
            return View(dt);
        }
    }
}