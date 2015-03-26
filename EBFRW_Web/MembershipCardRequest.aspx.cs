using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MembershipCardRequest : System.Web.UI.Page
{
    Controller controller = new Controller();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Request.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
    }

    protected void submitButton_Click(object sender, EventArgs e)
    {
        //Send the email from here
        sendMembershipCardRequest();
    }

    private void sendMembershipCardRequest()
    {
        //have name and email

        //No need to setup from - this is always a predefined value

        //Get proper "cc" address 
        String ccMail = "runnerinoakjr@sbcglobal.net"; //should be customer support
        String ccName = "EBFRW-Member Support";

        //Get "to" address
        String toEmail = this.emailTextBox.Text;
        String toName = nameTextBox.Text;

        //Create the message (body and subject)
        //String bodyText = "Member Name: " + toName;
        //bodyText += "\nEmail: " + toEmail;
        String bodyText = "The member, " + toName + " has requested a new membership card";
        String subjectText = "MEMBERSHIP CARD REQUEST: " + toName;

        bool result = controller.sendEmail(ccMail, ccName, toEmail, toName, "N/A", subjectText, bodyText);

        if (result)
        {
            this.msg.Text = "<b><font color=\"red\">Your request was successfully sent. For your records, a copy of the request was sent to you. <br>" +
                "Once your request is approved, your new card will be mailed to you.</font></b>";
            this.resetAllFields();
        }
        else
        {
            this.msg.Text = "<b><font color=\"red\">Ops. There seems to be a problem. Please, try again later.</font></b><br>" +
                "Error message: " + controller.getException();
        }
    }

    private void resetAllFields()
    {
        this.nameTextBox.Text = "";
        this.emailTextBox.Text = "";
    }
}