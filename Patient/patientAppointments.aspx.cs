﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace FinalProject.MyWork
{
    public partial class Appointments : System.Web.UI.Page
    {
        HA3_DataBaseV1Entities3 myDbcon1 = new HA3_DataBaseV1Entities3();
        HA3_DataBaseV1Entities3 myDbcon2 = new HA3_DataBaseV1Entities3();
        HA3_DataBaseV1Entities3 myDbcon3 = new HA3_DataBaseV1Entities3();
        

        protected void Page_Load(object sender, EventArgs e)
        {
           string ourUser = User.Identity.Name;
           myDbcon1.PatientsTables.Load();
            myDbcon3.DoctorsTables.Load();
  
            PatientsTable myPatient = (from x in myDbcon1.PatientsTables.Local
                                       where x.UserLoginName.Trim().Equals(ourUser)
                                       select x).First();

            int patID = myPatient.PatientsID;
            int docID = myPatient.DoctorID;

            DoctorsTable myDoctor = (from x in myDbcon3.DoctorsTables.Local
                                     where x.DoctorID == docID
                                     select x).First();

            Label1.Text = "Name: " + myPatient.FirstName + "   " + myPatient.LastName;
            Label2.Text = "Doctor: " + myDoctor.FirstName + "   " + myDoctor.LastName;



            myDbcon2.AppointmentsTables.Load();

            var myApp = from x in myDbcon2.AppointmentsTables.Local
                        where x.PatientID == patID && x.Date >= DateTime.Now
                        select x;

            GridView1.DataSource = myApp.ToList();
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int tempAppID = Convert.ToInt32(GridView1.SelectedDataKey[0]);
            Label3.Text = tempAppID.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HA3_DataBaseV1Entities3 myDbcon4 = new HA3_DataBaseV1Entities3();
            myDbcon4.AppointmentsTables.Load();
            AppointmentsTable delApp = (from x in myDbcon4.AppointmentsTables.Local
                                        where x.AppointmentID == Convert.ToInt32(Label3.Text)
                                        select x).First();
            myDbcon4.AppointmentsTables.Remove(delApp);
            myDbcon4.SaveChanges();
            GridView1.DataBind();
            MessageBox.Show("Appointment successfully deleted.");
        }
    }
}