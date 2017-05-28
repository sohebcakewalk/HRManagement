using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRManagementApp
{
    public abstract partial class BaseAdminPage : System.Web.UI.MasterPage
    {
        protected override void OnInit(EventArgs e)
        {
            //if (!IsSecure) return;
            //if (PageMaster == null)
            //    return;
            //if (!PageMaster.IsUserLoggedIn)
            //{
            if (Session["adminuser"] != null)
                HttpContext.Current.Response.Redirect("~/Admin/Login.aspx");
            //}

            base.OnInit(e);
        }
    }

    public abstract partial class BaseCandidatePage : System.Web.UI.MasterPage
    {
        protected override void OnInit(EventArgs e)
        {
            //if (!IsSecure) return;
            //if (PageMaster == null)
            //    return;
            //if (!PageMaster.IsUserLoggedIn)
            //{
            if (Session["candidateuser"] != null)
                HttpContext.Current.Response.Redirect("~/User/Signin.aspx");
            //}

            base.OnInit(e);
        }
    }
}