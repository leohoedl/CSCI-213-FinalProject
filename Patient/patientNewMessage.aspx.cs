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
    public partial class patientNewMessage : System.Web.UI.Page
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

            myDbcon2.DoctorsTables.Load();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == null)
            {
                MessageBox.Show("Need to select a doctor.");
            }
            else
            {
                MessagesTable myMessage = new MessagesTable();
                string ourUser = User.Identity.Name;
                myDbcon1.PatientsTables.Load();
                myDbcon2.DoctorsTables.Load();

                PatientsTable myPatient = (from x in myDbcon1.PatientsTables.Local
                                           where x.UserLoginName.Trim().Equals(ourUser)
                                           select x).First();

                myMessage.MessageFROM = myPatient.UserLoginName.Trim();
                myMessage.MessageTO = DropDownList1.SelectedValue.Trim();
                myMessage.Date = DateTime.Now;
                myMessage.Message = TextBox1.Text.Trim();

                //Add data to the table
                myDbcon1.MessagesTables.Add(myMessage);
                myDbcon1.SaveChanges();
            }
        }
    }
}