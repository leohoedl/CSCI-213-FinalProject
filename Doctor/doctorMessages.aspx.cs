﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject.Doctor
{
    public partial class doctorMessages : System.Web.UI.Page
    {
        HA3_DataBaseV1Entities3 myDbcon1 = new HA3_DataBaseV1Entities3();

        protected void Page_Load(object sender, EventArgs e)
        {
            myDbcon1.DoctorsTables.Load();

            var currentDoctor = (from x in myDbcon1.DoctorsTables.Local
                                 where x.UserLoginName.Trim() == User.Identity.Name.Trim()
                                 select x).First();

            Label1.Text = currentDoctor.FirstName + " " + currentDoctor.LastName;

            myDbcon1.MessagesTables.Load();

            var inboxMessages = from x in myDbcon1.MessagesTables.Local
                                where x.MessageTO.Trim() == currentDoctor.UserLoginName.Trim()
                                select x;

            var outboxMessages = from x in myDbcon1.MessagesTables.Local
                                 where x.MessageFROM.Trim() == currentDoctor.UserLoginName.Trim()
                                 select x;

            GridView1.DataSource = inboxMessages.ToList();
            GridView2.DataSource = outboxMessages.ToList();

            GridView1.DataBind();
            GridView2.DataBind();

            Label2.Text = "";
            Label3.Text = "";

            myDbcon1.PatientsTables.Load();

            var patientUserNames = myDbcon1.PatientsTables.Local.ToList().Select(x => x.UserLoginName);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int messageID = Convert.ToInt32(GridView1.SelectedDataKey[0]);

            myDbcon1.MessagesTables.Load();

            var message = (from x in myDbcon1.MessagesTables.Local
                           where x.MessageID == messageID
                           select x).First();

            Label2.Text = message.Message;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int messageID = Convert.ToInt32(GridView2.SelectedDataKey[0]);

            myDbcon1.MessagesTables.Load();

            var message = (from x in myDbcon1.MessagesTables.Local
                           where x.MessageID == messageID
                           select x).First();

            Label3.Text = message.Message;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            myDbcon1.DoctorsTables.Load();

            var currentDoctor = (from x in myDbcon1.DoctorsTables.Local
                                 where x.UserLoginName.Trim() == User.Identity.Name.Trim()
                                 select x).First();

            MessagesTable myMessage = new MessagesTable();
            myMessage.MessageFROM = currentDoctor.UserLoginName.Trim();
            myMessage.MessageTO = DropDownList1.SelectedValue.Trim();
            myMessage.Date = DateTime.Now;
            myMessage.Message = TextBox1.Text.Trim();

            myDbcon1.MessagesTables.Add(myMessage);
            myDbcon1.SaveChanges();
        }
    }
}