using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Data;

namespace FinalProject.Patient
{
    public partial class patientMedications : System.Web.UI.Page
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

            myDbcon3.MedicationListTables.Load();
            MedicationListTable medicine = (from x in myDbcon3.MedicationListTables.Local
                           where x.PatientID == patID
                           select x).First();

            ListBox1.Items.Add(medicine.Description);

        }
    }
}