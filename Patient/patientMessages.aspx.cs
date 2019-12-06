using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Windows.Forms;

namespace FinalProject.Patient
{
    public partial class patientMessages : System.Web.UI.Page
    {
        HA3_DataBaseV1Entities3 myDbcon1 = new HA3_DataBaseV1Entities3();
        HA3_DataBaseV1Entities3 myDbcon2 = new HA3_DataBaseV1Entities3();
        HA3_DataBaseV1Entities3 myDbcon3 = new HA3_DataBaseV1Entities3();

        protected void Page_Load(object sender, EventArgs e)
        {
            string ourUser = User.Identity.Name;
            myDbcon1.PatientsTables.Load();
            myDbcon2.DoctorsTables.Load();

            PatientsTable myPatient = (from x in myDbcon1.PatientsTables.Local
                                       where x.UserLoginName.Trim().Equals(ourUser)
                                       select x).First();

            int patID = myPatient.PatientsID;
            int docID = myPatient.DoctorID;

            DoctorsTable myDoctor = (from x in myDbcon2.DoctorsTables.Local
                                     where x.DoctorID == docID
                                     select x).First();

            Label1.Text = "Name: " + myPatient.FirstName + "   " + myPatient.LastName;
            Label2.Text = "Doctor: " + myDoctor.FirstName + "   " + myDoctor.LastName;

            myDbcon3.MessagesTables.Load();

            var myMessages = from x in myDbcon3.MessagesTables.Local
                             where x.MessageTO.Trim() == myPatient.UserLoginName.Trim()
                             select x;

            GridView1.DataSource = myMessages.ToList();
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ourUser = User.Identity.Name;
            myDbcon1.PatientsTables.Load();
            myDbcon2.DoctorsTables.Load();

            PatientsTable myPatient = (from x in myDbcon1.PatientsTables.Local
                                       where x.UserLoginName.Trim().Equals(ourUser)
                                       select x).First();

            int patID = myPatient.PatientsID;
            int docID = myPatient.DoctorID;

            myDbcon3.MessagesTables.Load();

            var myMessages = from x in myDbcon3.MessagesTables.Local
                             where x.MessageTO.Trim() == myPatient.UserLoginName.Trim()
                             select x;

            GridView1.DataSource = myMessages.ToList();
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string ourUser = User.Identity.Name;
            myDbcon1.PatientsTables.Load();
            myDbcon2.DoctorsTables.Load();

            PatientsTable myPatient = (from x in myDbcon1.PatientsTables.Local
                                       where x.UserLoginName.Trim().Equals(ourUser)
                                       select x).First();

            int patID = myPatient.PatientsID;
            int docID = myPatient.DoctorID;

            myDbcon3.MessagesTables.Load();

            var myMessages = from x in myDbcon3.MessagesTables.Local
                             where x.MessageFROM.Trim() == myPatient.UserLoginName.Trim()
                             select x;

            GridView1.DataSource = myMessages.ToList();
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            HA3_DataBaseV1Entities3 myDbcon4 = new HA3_DataBaseV1Entities3();
            myDbcon4.MessagesTables.Load();
            MessagesTable delMessage = (from x in myDbcon4.MessagesTables.Local
                                        where x.MessageID == Convert.ToInt32(Label3.Text)
                                        select x).First();
            myDbcon4.MessagesTables.Remove(delMessage);
            myDbcon4.SaveChanges();
            GridView1.DataBind();
            MessageBox.Show("Message successfully deleted.");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int tempMessID = Convert.ToInt32(GridView1.SelectedDataKey[0]);
            Label3.Text = tempMessID.ToString();
        }
    }
}