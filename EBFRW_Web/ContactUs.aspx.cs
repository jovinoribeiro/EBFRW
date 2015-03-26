using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace EBFRW_Web
{
    public partial class ContactUs : System.Web.UI.Page
    {
        private Controller controller = new Controller();

        protected void Page_Load(object sender, EventArgs e)
        {
            //parses the parameter from request to determine to whom the email is
            this.selectToBox(Request.Params["to"]);
            
        }        

        /*
         *Process the request parameter passed in order to determine to whom the email is 
         */
        private void selectToBox(String param)
        {
            switch (param)
            {
                /*case "president": toDropDownList.SelectedIndex = 2; break;
                case "vice-president": toDropDownList.SelectedIndex = 3; break;
                case "treasuer": toDropDownList.SelectedIndex = 5; break;
                case "secretary": toDropDownList.SelectedIndex = 6; break;
                case "officeatlarge": toDropDownList.SelectedIndex = 7; break;
                case "womenoutreach": toDropDownList.SelectedIndex = 11; break;
                case "runsponsor": toDropDownList.SelectedIndex = 13; break;*/
                default: break;
            }
        }

        private void sendEmail()
        {
            //No need to setup from - this is always a predefined value
            
            //Get proper "cc" address 
            String selectedValue = "NEW MESSAGE";//this.toDropDownList.SelectedItem.Value;
            String ccMail = "ebfrw@yahoo.com"; //this.getToAddressEmail(selectedValue);
            ccMail = "runnerinoakjr@sbcglobal.net";
            //ccMail = "vp@eastbayfrontrunners.org";
            String ccName = "EBFRW-Member Support";

            //Get "to" address
            String toEmail = this.emailTextBox.Text;
            String toName = nameTextBox.Text;

            //Create the message (body and subject)
            String bodyText = this.messageTextBox.Text;
            Console.Write(bodyText);

            bodyText = bodyText.Replace(Environment.NewLine, "<br>");

            String toPhone = phoneTextBox.Text;

            String subjectText = this.getEmailSubject(selectedValue) + " - " + toEmail;

            bool result = controller.sendEmail(ccMail, ccName, toEmail, toName, toPhone, subjectText, bodyText);

            if (result)
            {
                this.messageResult.Text = "<b><font color=\"red\">Your message was sent.<br>" + 
                    "Someone will contact you as soon as possible. Thank you.</font></b>";
                this.resetAllFields();
            }
            else
            {
                this.messageResult.Text = "ccMail:" + ccMail + " ccName:" + ccName + "<BR>" + 
                "<b><font color=\"red\">Ops. There seems to be a problem. Please, try again later.</font></b><br>" +
                    "Error message: " + controller.getException();
             }
        }

        private void resetAllFields()
        {
           /* this.nameTextBox.Text = "";
            this.emailTextBox.Text = "";
            this.phoneTextBox.Text = "";
            this.messageTextBox.Text = "";*/
        }

        private String getEmailSubject(String selectedValue)
        {
            if (selectedValue.Equals("president"))
            {
                return "PRESIDENT";
            }
            else if (selectedValue.Equals("vice-president"))
            {
                return "VICE-PRESIDENT";
            }
            else if (selectedValue.Equals("treasuer"))
            {
                return "TREASURER";
            }
            else if (selectedValue.Equals("secretary"))
            {
                return "SECRETARY";
            }
            else if (selectedValue.Equals("officeatlarge"))
            {
                return "OFFICE AT LARGE";
            }
            else if (selectedValue.Equals("womenoutreach"))
            {
                return "WOMEN OUTREACH";
            }
            else if (selectedValue.Equals("runsponsor"))
            {
                return "PRIDE RUN SPONSORSHIP";
            }
            else //member support
            {
                return "FROM WEBSITE";
            }
        }


        /*
         * Takes an input string (value of what's selected in comboBox)
         * and return the corresponding email address
         * Note: for now, all officers use the same email address. Expand this in the future :)
         */ 
        private String getToAddressEmail(String selectedValue)
        {
            if (selectedValue.Equals("president"))
            {
                return "ebfrw@yahoo.com";
            }
            else if (selectedValue.Equals("vice-president"))
            {
                return "ebfrw@yahoo.com";
            }
            else if (selectedValue.Equals("treasuer"))
            {
                return "ebfrw@yahoo.com";
            }
            else if (selectedValue.Equals("secretary"))
            {
                return "ebfrw@yahoo.com";
            }
            else if (selectedValue.Equals("officeatlarge"))
            {
                return "ebfrw@yahoo.com";
            }
            else if (selectedValue.Equals("womenoutreach"))
            {
                return "ebfrw@yahoo.com";
            }
            else if (selectedValue.Equals("runsponsor"))
            {
                return "ebfrw@yahoo.com";
            }
            else //member support
            {
                return "jovinoribeiro@pacbell.net";
            }
        }

        /*
         * Triggered when user clicks submit
         */
        protected void submitButton_Click1(object sender, EventArgs e)
        {
            this.messageResult.Text = "";
            this.sendEmail();
        } 
    }
}