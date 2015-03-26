using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Web.Mail;
using System.Net.Mail;

public partial class test : System.Web.UI.Page
{
    private Controller controller = new Controller();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //initialize the plan list
        initMembershipPlanList();

        //checkList.Items[0].Selected
    }

    private void initMembershipPlanList()
    {
        //remove 4, 5, 6, 7
        DateTime now = DateTime.Now;

        //Early Bird
        DateTime earlyBirdEnd = new DateTime(2014, 1, 18, 23, 59, 59);
        DateTime earlyBirdStart = new DateTime(2013, 12, 23);

        int thisyear = now.Year;
        DateTime fullPriceStartDate = new DateTime(thisyear, 12, 1);
        //endofyear = endofyear.AddDays(-1);
        
        //Set when end of year is
        //endofyear = endofyear.AddDays(-1);

        //early Bird is in play - comment this out if early bird has not been set up yet
        //endofyear = earlyBirdStart;

        DateTime halfPriceStartDate = new DateTime(thisyear, 7, 1);

        RadioButtonList membershiptypeBList = new RadioButtonList();
        membershiptypeBList.Style.Add("class", "pj");

        //check if we are in the period where half year is to be offered
        if (now >= halfPriceStartDate && now < fullPriceStartDate)
        {
            ListItem halfIndividual = new ListItem("Half-Year Individual: $12.00", "5");
            halfIndividual.Selected = true;
            membershiptypeBList.Items.Add(halfIndividual);
            membershiptypeBList.Items.Add(new ListItem("Half-Year Household: $18.00", "6"));
            membershiptypeBList.Items.Add(new ListItem("Half-Year Senior/Student Individual: $10.00", "7"));
            membershiptypeBList.Items.Add(new ListItem("Half-Year Senior/Student Household: $15.00", "8"));
        }
        else if (now <= earlyBirdEnd)
        {
            ListItem earlyBirdIndividual = new ListItem("Individual (Early Bird): $20.00", "9");
            earlyBirdIndividual.Selected = true;
            membershiptypeBList.Items.Add(earlyBirdIndividual);
            membershiptypeBList.Items.Add(new ListItem("Household (Early Bird): $30.00", "10"));
            membershiptypeBList.Items.Add(new ListItem("Senior/Student Individual (Early Bird): $15.00", "11"));
            membershiptypeBList.Items.Add(new ListItem("Senior/Student Household (Early Bird): $15.00", "12"));
        }
        //only offer full membership
        else
        {
            ListItem individual = new ListItem("Individual: $24.00", "1");
            individual.Selected = true;
            membershiptypeBList.Items.Add(individual);
            membershiptypeBList.Items.Add(new ListItem("Household: $36.00", "2"));
            membershiptypeBList.Items.Add(new ListItem("Senior/Student Individual: $20.00", "3"));
            membershiptypeBList.Items.Add(new ListItem("Senior/Student Household: $30.00", "4"));
        }
        memtypeblistst = membershiptypeBList;
        this.membershipTypeBlistHolder.Controls.Add(memtypeblistst);

    }


    protected void ProcessMembership_ActiveStepChanged(object sender, EventArgs e)
    {
        
        
        if (ProcessMembership.ActiveStep.Equals(summaryStep))
        {
            this.memTypeLabel.Text = memtypeblistst.SelectedItem.Text;
            
            this.name1Label.Text = member1FirstNameTBox.Text + " " + member1LastNameTBox.Text;
            this.email1Label.Text = member1EmailTBox.Text;
            this.hpn1Label.Text = member1HomePhoneTBox.Text;
            this.cpn1Label.Text = member1CellPhoneTBox.Text;
            this.wpn1Label.Text = member1WorkPhoneTBox.Text;
            this.bday1Label.Text = member1BirthdayTBox.Text;
            
            this.name2Label.Text = member2FirstNameTBox.Text + " " + member2LastNameTBox.Text;
            this.email2Label.Text = member2EmailTBox.Text;
            this.hpn2Label.Text = member2HomePhoneTBox.Text;
            this.cpn2Label.Text = member2CellPhoneTBox.Text;
            this.wpn2Label.Text = member2WorkPhoneTBox.Text;
            this.bday2Label.Text = member2BirthdayTBox.Text;

            this.addressLabel.Text = this.address1TBox.Text + " " + this.address2TBox.Text + ", " +
                this.cityTBox.Text + ", " + this.stateTBox.Text + ", " + this.zipTBox.Text;

            this.emContact.Text = this.emContactFirstNameTBox.Text + " " + emContactLastNameTBox.Text + " - " +
                emContactPhoneTBox.Text;

            this.Photo_L.Text = this.getValue(checkList.Items[0].Selected);
            this.potluckL.Text = this.getValue(checkList.Items[1].Selected);
            this.pn_L.Text = this.getValue(phoneNumber.Checked);
            this.em_L.Text = this.getValue(emails.Checked);
            this.HA_l.Text = this.getValue(homeaddress.Checked);
            
        }
        
        if (ProcessMembership.ActiveStep.Equals(Member2Step))
        {
            //individual plans, which means, 2nd member is not required, so go to address
            if (this.memtypeblistst.SelectedItem.Value.Equals("1") || this.memtypeblistst.SelectedItem.Value.Equals("3") ||
                this.memtypeblistst.SelectedItem.Value.Equals("5") || this.memtypeblistst.SelectedItem.Value.Equals("7") ||
                this.memtypeblistst.SelectedItem.Value.Equals("9") || this.memtypeblistst.SelectedItem.Value.Equals("11"))
            {
                ProcessMembership.ActiveStepIndex = ProcessMembership.WizardSteps.IndexOf(AddressStep);
            } //else stay here as 2nd member is needed
        }
        
        if (ProcessMembership.ActiveStep.Equals(MembershipTypeStep))
        {
            if (this.registerOptionBL.SelectedItem.Value.Equals("Online"))
            {
                ProcessMembership.ActiveStepIndex = ProcessMembership.WizardSteps.IndexOf(MembershipTypeStep);
            }
            else //Manual
            {
                ProcessMembership.ActiveStepIndex = ProcessMembership.WizardSteps.IndexOf(ManualStep);
            }
        }


        if (ProcessMembership.ActiveStep.Equals(summaryStep))
        {
            if (this.registerOptionBL.SelectedItem.Value.Equals("Online"))
            {
                ProcessMembership.ActiveStepIndex = ProcessMembership.WizardSteps.IndexOf(summaryStep);
            }
            else //Manual
            {
                ProcessMembership.ActiveStepIndex = ProcessMembership.WizardSteps.IndexOf(ManualStep);
            }
        }

        if (ProcessMembership.ActiveStep.Equals(ManualStep))
        {
            //in this case, we need to go on to next step (pay or whatever i decided)
            if (this.registerOptionBL.SelectedItem.Value.Equals("Online"))
            {
                //ProcessMembership.ActiveStepIndex = ProcessMembership.WizardSteps.IndexOf(PayOptionStep);
            }
            //otherwise, remain in this step
        }


    }




    public void goodCode()
    {
        SmtpClient smtpClient = new SmtpClient();
        MailMessage message = new MailMessage();

        try
        {
            MailAddress fromAddress = new MailAddress("runnerinoakjr@sbcglobal.net", "Jovino");

            smtpClient.Host = "smtpout.secureserver.net";
            smtpClient.Credentials = new System.Net.NetworkCredential("jovino@jovinorun.com", "tim052982");

            Response.Write("host " + smtpClient.Host);

            smtpClient.Port = 25;
            smtpClient.EnableSsl = false;
            message.From = fromAddress;

            message.To.Add("runnerinoakjr@sbcglobal.net");
            message.Subject = "Feedback";

            message.IsBodyHtml = false;

            message.Body = "Testing 123";

            smtpClient.Send(message);

            Response.Write("message sent right now!");


        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }

    private void newMember()
    {
        controller.insertNewOrder(registerOptionBL.SelectedItem.Value, memtypeblistst.SelectedItem.Text,
            member1FirstNameTBox.Text, member1LastNameTBox.Text, member1BirthdayTBox.Text, member1EmailTBox.Text,
            member1HomePhoneTBox.Text, member1CellPhoneTBox.Text, member1WorkPhoneTBox.Text, member2FirstNameTBox.Text,
            member2LastNameTBox.Text, member2BirthdayTBox.Text, member2EmailTBox.Text, member2HomePhoneTBox.Text,
            member2CellPhoneTBox.Text, member2WorkPhoneTBox.Text, address1TBox.Text, address2TBox.Text, cityTBox.Text,
             stateTBox.Text, zipTBox.Text, emContactFirstNameTBox.Text, emContactLastNameTBox.Text, emContactPhoneTBox.Text,
             "NA", "NA", getValue(mdir.Checked),
             getValue(phoneNumber.Checked), getValue(emails.Checked), getValue(homeaddress.Checked), getValue(checkList.Items[0].Selected),
             getValue(checkList.Items[1].Selected), waiverTBox.Text);        
    }

    protected void ProcessMembership_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        //Save stuff into DB
        newMember();
        
        //Save stuff into session
        Session["membership_type"] = memtypeblistst.SelectedItem.Text;
        Session["member1FirstName"] = member1FirstNameTBox.Text;
        Session["member1LastName"] = member1LastNameTBox.Text;
        Session["member1Birthday"] = member1BirthdayTBox.Text;
        Session["member1Email"] = member1EmailTBox.Text;
        Session["member1HomePhone"] = member1HomePhoneTBox.Text;
        if (member1HomePhoneTBox.Text.Length == 12)
        {
            Session["night_phone_a"] = member1HomePhoneTBox.Text.Substring(0, 3);
            Session["night_phone_b"] = member1HomePhoneTBox.Text.Substring(4, 3);
            Session["night_phone_c"] = member1HomePhoneTBox.Text.Substring(8, 4);
        }
        else
        {
            Session["night_phone_a"] = "000";
            Session["night_phone_b"] = "000";
            Session["night_phone_c"] = "0000";
        }

        Session["member1CellPhone"] = member1CellPhoneTBox.Text;
        Session["memberWorkPhone"] = member1WorkPhoneTBox.Text;
        Session["member2FirstName"] = member2FirstNameTBox.Text;
        Session["member2LastName"] = member2LastNameTBox.Text;
        Session["member2Birthday"] = member2BirthdayTBox.Text;
        Session["member2Email"] = member2EmailTBox.Text;
        Session["member2HomePhone"] = member2HomePhoneTBox.Text;
        Session["member2CellPhone"] = member2CellPhoneTBox.Text;
        Session["member2WorkPhone"] = member2WorkPhoneTBox.Text;
        Session["address1"] = address1TBox.Text;
        Session["address2"] = address2TBox.Text;
        Session["city"] = cityTBox.Text;
        Session["state"] = stateTBox.Text;
        Session["zip"] = zipTBox.Text;
        Session["emContactFirstName"] = emContactFirstNameTBox.Text;
        Session["emContactLastName"] = emContactLastNameTBox.Text;
        Session["emContactPhone"] = emContactPhoneTBox.Text;
        Session["NL_PDF"] = "NA";
        Session["NL_MAIL"] = "NA";
        Session["PHOTO"] = this.getValue(checkList.Items[0].Selected);
        Session["POTLUCK"] = this.getValue(checkList.Items[1].Selected); 
        Session["M_DIR"] = this.getValue(mdir.Checked);
        Session["PN"] = this.getValue(phoneNumber.Checked);
        Session["EM"] = this.getValue(emails.Checked);
        Session["HA"] = this.getValue(homeaddress.Checked);
        Session["amount"] = getSubscriptionPrice();
        
        //Server.Transfer("MembershipPayment.aspx");
    }

    private string getValue(bool input)
    {
        if (input)
            return "Y";
        else
            return "N";
    }
    private string getSubscriptionPrice()
    {
        String value = this.memtypeblistst.SelectedItem.Value;

        switch (value)
        {
            case "1": return "24.00";
            case "2": return "36.00";
            case "3": return "20.00";
            case "4": return "30.00";
            case "5": return "12.00";
            case "6": return "18.00";
            case "7": return "10.00";
            case "8": return "15.00";
            case "9": return "20.00";
            case "10": return "30.00";
            case "11": return "15.00";
            case "12": return "15.00";
            default: return "24.00";
        }
    }


}