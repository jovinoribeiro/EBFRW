using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EBFRW_Web
{
    public partial class Donation : System.Web.UI.Page
    {
        private Controller controller = new Controller();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Donation_ActiveStepChanged(object sender, EventArgs e)
        {
            if (DonationWizard.ActiveStep.Equals(summaryStep))
            {
                //Donation
                String donation = "0.00";
                if (this._5.Checked)
                    donation = this._5.Text;
                else if (this._10.Checked)
                    donation = this._10.Text;
                else if (this._15.Checked)
                    donation = this._15.Text;
                else if (this._20.Checked)
                    donation = this._20.Text;
                else if (this._25.Checked)
                    donation = this._25.Text;
                else if (this.other.Checked)
                    donation = this.donationAmountTxb.Text;

                donationAmountLabel2.Text = donation;
                
                this.nameLabel.Text = this.firstNameTBox.Text + " " + this.lastNameTBox.Text;

                this.email1Label.Text = this.emailTBox.Text;
            }
        }

        protected void Donation_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            //insert stuff into session
            Session["donor_first_name"] = this.firstNameTBox.Text;
            Session["donor_last_name"] = this.lastNameTBox.Text;
            Session["donor_email"] = this.emailTBox.Text;

                //Donation
                String donation = "0.00";
                if (this._5.Checked)
                    donation = this._5.Text;
                else if (this._10.Checked)
                    donation = this._10.Text;
                else if (this._15.Checked)
                    donation = this._15.Text;
                else if (this._20.Checked)
                    donation = this._20.Text;
                else if (this._25.Checked)
                    donation = this._25.Text;
                else if (this.other.Checked)
                    donation = this.donationAmountTxb.Text;

                Session["donation_amount"] = donation;

            //insert stuff into DB
                controller.insertDonation(this.firstNameTBox.Text, this.lastNameTBox.Text, 
                    this.emailTBox.Text, double.Parse(donation));

        }
    }
}