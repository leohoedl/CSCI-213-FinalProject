using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject.Doctor
{
    public partial class doctorAppointments : System.Web.UI.Page
    {
        HA3_DataBaseV1Entities3 myDbcon1 = new HA3_DataBaseV1Entities3();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Load name in page
            myDbcon1.DoctorsTables.Load();

            var currentDoctor = (from x in myDbcon1.DoctorsTables.Local
                                 where x.UserLoginName.Trim() == User.Identity.Name.Trim()
                                 select x).First();

            Label1.Text = currentDoctor.FirstName + " " + currentDoctor.LastName;


            // Load appointments specific to Doctor
            myDbcon1.AppointmentsTables.Load();

            var appointments = from x in myDbcon1.AppointmentsTables.Local
                               where x.DoctorID == currentDoctor.DoctorID
                               select x;

            GridView1.DataSource = appointments.ToList();
            GridView1.DataBind();
        }
    }
}