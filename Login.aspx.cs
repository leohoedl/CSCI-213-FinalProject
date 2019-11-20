using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace FinalProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }
        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            using (HA3_DataBaseV1Entities2 dbcon = new HA3_DataBaseV1Entities2())
            {
                string username = Login1.UserName;
                string password = (from x in dbcon.UsersTables
                                   where x.UserLoginName == username
                                   select x.UserLoginPass).First();

                if (Login1.UserName == username && Login1.Password == password)
                {
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
                }

            }
        }

    }
}