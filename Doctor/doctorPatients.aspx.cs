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

            myDbcon1.PatientsTables.Load();

            var patients = from x in myDbcon1.PatientsTables.Local
                               where x.DoctorID == currentDoctor.DoctorID
                               select x;

            GridView1.DataSource = patients.ToList();
            GridView1.DataBind();

            Label2.Text = "";
            Label3.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(GridView1.SelectedDataKey[0]);

            myDbcon1.PatientsTables.Load();

            var patient = (from x in myDbcon1.PatientsTables.Local
                           where x.PatientsID == patientID
                           select x).First();

            Label2.Text = patient.FirstName + " " + patient.LastName;

            Label3.Text = patient.Email;

            myDbcon1.TestTables.Load();

            var tests = from x in myDbcon1.TestTables.Local
                        where x.PatientID == patient.PatientsID
                        select x;

            GridView2.DataSource = tests.ToList();
            GridView2.DataBind();

            myDbcon1.MedicationListTables.Load();

            var medications = from x in myDbcon1.MedicationListTables.Local
                              where x.PatientID == patient.PatientsID
                              select x;

            GridView3.DataSource = medications.ToList();
            GridView3.DataBind();

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            // Get doctor
            myDbcon1.DoctorsTables.Load();

            var currentDoctor = (from x in myDbcon1.DoctorsTables.Local
                                 where x.UserLoginName.Trim() == User.Identity.Name.Trim()
                                 select x).First();



            var text = TextBox1.Text.Trim();

            myDbcon1.PatientsTables.Load();

            int parseInt;
            if(int.TryParse(TextBox1.Text, out parseInt))
            {
                var patients = from x in myDbcon1.PatientsTables.Local
                               where x.PatientsID == parseInt
                               where x.DoctorID == currentDoctor.DoctorID
                               select x;

                GridView1.DataSource = patients.ToList();
                GridView1.DataBind();
            }
            else
            {
                var patients = from x in myDbcon1.PatientsTables.Local
                               where x.FirstName.StartsWith(text) || x.LastName.StartsWith(text)
                               where x.DoctorID == currentDoctor.DoctorID
                               select x;

                GridView1.DataSource = patients.ToList();
                GridView1.DataBind();
            }

        }
    }
}