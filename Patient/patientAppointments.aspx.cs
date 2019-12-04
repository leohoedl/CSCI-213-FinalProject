﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject.MyWork
{
    public partial class Appointments : System.Web.UI.Page
    {
        HA3_DataBaseV1Entities2 myDbcon1 = new HA3_DataBaseV1Entities2();
        HA3_DataBaseV1Entities2 myDbcon2 = new HA3_DataBaseV1Entities2();
        HA3_DataBaseV1Entities2 myDbcon3 = new HA3_DataBaseV1Entities2();
    

        protected void Page_Load(object sender, EventArgs e)
        {
           string ourUser = User.Identity.Name;
           myDbcon1.PatientsTables.Load();
            myDbcon3.DoctorsTables.Load();
  
            PatientsTable myPatient = (from x in myDbcon1.PatientsTables.Local
                                       where x.UserLoginName.Trim().Equals(ourUser)
                                       select x).First();

            int patID = myPatient.PatientID;
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
    }
}