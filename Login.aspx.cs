using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Data.Entity;
namespace FinalProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }
        

        protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
        {
            using (HA3_DataBaseV1Entities3 dbcon = new HA3_DataBaseV1Entities3())
            {
                dbcon.UsersTables.Load();

                string username = Login1.UserName.Trim();
                string pass =Login1.Password.Trim();

                UsersTable objUser= (from x in dbcon.UsersTables.Local
                                   where x.UserLoginName.Trim().StartsWith(username) && x.UserLoginPass.Trim().StartsWith(pass)
                                   select x).First();

                if (objUser !=null && objUser.UserLoginType.Trim().Equals("Doctor"))
                {
                    
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
                    Response.Redirect("~/Doctor/doctorHomepage.aspx");
                }
                if (objUser != null && objUser.UserLoginType.Trim().Equals("Patient"))
                {
                   
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
                    Response.Redirect("~/Patient/patientHomepage.aspx");
                }


            }
        }
    }
}