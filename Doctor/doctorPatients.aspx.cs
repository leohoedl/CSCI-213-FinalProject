using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject.Doctor
{
    public partial class doctorPatients : System.Web.UI.Page
    {
        HA3_DataBaseV1Entities3 myDbcon1 = new HA3_DataBaseV1Entities3();

        protected void Page_Load(object sender, EventArgs e)
        {
            myDbcon1.DoctorsTables.Load();

            var currentDoctor = (from x in myDbcon1.DoctorsTables.Local
                                 where x.UserLoginName.Trim() == User.Identity.Name.Trim()
                                 select x).First();

            Label1.Text = currentDoctor.FirstName + " " + currentDoctor.LastName;
        }
    }
}