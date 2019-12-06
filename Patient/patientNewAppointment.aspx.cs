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
    public partial class patientNewAppointment : System.Web.UI.Page
    {

        HA3_DataBaseV1Entities2 myDbcon1 = new HA3_DataBaseV1Entities2();
        HA3_DataBaseV1Entities2 myDbcon2 = new HA3_DataBaseV1Entities2();
        HA3_DataBaseV1Entities2 myDbcon3 = new HA3_DataBaseV1Entities2();

        protected void Page_Load(object sender, EventArgs e)
        {
            string ourUser = User.Identity.Name;
            myDbcon1.PatientsTables.Load();
            myDbcon2.DoctorsTables.Load();

            PatientsTable myPatient = (from x in myDbcon1.PatientsTables.Local
                                       where x.UserLoginName.Trim().Equals(ourUser)
                                       select x).First();

            int patID = myPatient.PatientID;
            int docID = myPatient.DoctorID;

            DoctorsTable myDoctor = (from x in myDbcon2.DoctorsTables.Local
                                     where x.DoctorID == docID
                                     select x).First();

            Label1.Text = "Name: " + myPatient.FirstName + "   " + myPatient.LastName;
            Label2.Text = "Doctor: " + myDoctor.FirstName + "   " + myDoctor.LastName;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
     
            if (Calendar1.SelectedDate <= DateTime.Now)
                {
                    MessageBox.Show("Date has to be after current day!");
                }
            else
            {
                AppointmentsTable myAppointment = new AppointmentsTable();
                string ourUser = User.Identity.Name;
                myDbcon1.PatientsTables.Load();
                myDbcon2.DoctorsTables.Load();

                PatientsTable myPatient = (from x in myDbcon1.PatientsTables.Local
                                           where x.UserLoginName.Trim().Equals(ourUser)
                                           select x).First();

                int patID = myPatient.PatientID;

                /* myDbcon2.DoctorsTables.Load();

                 var myApp = from x in myDbcon2.DoctorsTables.Local
                             where x.Department == DropDownList2.SelectedValue
                             select x;

                 DropDownList3.DataSource = myApp.ToList();
                 DropDownList3.DataBind(); */

                /*myDbcon3.DoctorsTables.Load();
                DoctorsTable myDoc = (from x in myDbcon3.DoctorsTables.Local
                                           where (x.FirstName + x.LastName) == DropDownList3.SelectedValue 
                                           select x).First();*/

                myAppointment.PatientID = patID;
                myAppointment.Purpose = TextBox1.Text;
                myAppointment.DoctorID = myPatient.DoctorID;
                myAppointment.VisitSummary = TextBox2.Text;
                myAppointment.Date = Calendar1.SelectedDate;
                int hours = Convert.ToInt32(TextBox3.Text);
                int mins = Convert.ToInt32(DropDownList1.SelectedValue);
                myAppointment.Time = new TimeSpan(hours, mins, 0);

                //Add data to the table
                myDbcon1.AppointmentsTables.Add(myAppointment);
                myDbcon1.SaveChanges();
            }
  
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            myDbcon2.DoctorsTables.Load();

            var myApp = from x in myDbcon2.DoctorsTables.Local
                        where x.Department == DropDownList2.Text
                        select x;

            DropDownList3.DataSource = myApp;
            DropDownList3.DataBind();
        }
    }
}