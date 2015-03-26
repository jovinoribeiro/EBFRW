using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EBFRW_Web.admin
{
    public partial class RegistrationOrderEditor : System.Web.UI.Page
    {
        Controller controller = new Controller();

        protected void Page_Load(object sender, EventArgs e)
        {
             String userAuthenticated = (String)Session["userAuthenticated"];
             userAuthenticated = "true";


             if (!Request.IsAuthenticated || !User.Identity.Name.Equals("admin"))
             {
                 Response.Redirect("~/Account/Login.aspx?ReturnUrl=~/admin/RegistrationOrderEditor.aspx");
             }
            else
            {
                if (!Page.IsPostBack)
                {
                    rebind();
                    rebindForm(-1);
                    RegistrationOrderFormView.Height = 5;
                }
            }
        }

        private void rebindForm(int id)
        {
            DataSet ds = controller.getOrderById(id);
            RegistrationOrderFormView.DataSource = ds;
            RegistrationOrderFormView.DataBind();
        }

        private void rebind()
        {
            DataSet ds = controller.getAllOrders();
            registrationOrderEditorGDView.DataSource = ds;
            registrationOrderEditorGDView.DataBind();
        }


        private void loadAllOrders()
        {
            this.registrationOrderEditorGDView.DataSource = controller.getAllOrders(); //flipDataSet(controller.getAllOrders());
            this.registrationOrderEditorGDView.DataBind();
        }

        /**
         * When we select "update" in the grid view, we then update the FormView
         * save value in session for when we want to switch view
         * note: this can be improved - just look at the form view before swapping mode
         * */
        protected void registrationOrderEditorGDView_SelectedIndexChanged(object sender, EventArgs e)
        {
            String i =  registrationOrderEditorGDView.SelectedValue.ToString();
            //Response.Write("Event Grid SElected INdex Changed");

            int index = Int32.Parse(i);
            registrationOrderEditorGDView.Visible = true;
            rebindForm(index);
            Session["registrationIndex"] = index;
        }

        /**
        * We are in "default mode" mode, and the "delete" button was pressed
        * */
        protected void RegistrationOrderFormView_ItemDeleting(Object sender, FormViewDeleteEventArgs e)
        {
            Response.Write("Deleting");
        }

        /**
        * We are in "edit" mode, and the "Update" button was pressed
        * */
        protected void RegistrationOrderFormView_ItemInserting(Object sender, FormViewInsertEventArgs e)
        {
            Response.Write("Inserting");
        }

         /**
         * We are in "edit" mode, and the "Update" button was pressed
         * */
        protected void RegistrationOrderFormView_ItemUpdating(Object sender, FormViewUpdateEventArgs e)
        {
            String orderStatus = ((DropDownList)RegistrationOrderFormView.FindControl("orderStatusDD")).SelectedItem.Value;
            String paymentMethod = ((DropDownList)RegistrationOrderFormView.FindControl("paymentTypeDD")).SelectedItem.Value;
            String id = ((TextBox)RegistrationOrderFormView.FindControl("orderIdTextBox")).Text;

            String date = ((TextBox)RegistrationOrderFormView.FindControl("paymentDateTextBox")).Text;
            String cal = "";
            if (date != null && date != "")
            {
                String[] splitDate = date.Split('/');
                cal = splitDate[2] + "-" + splitDate[0]  + "-" + splitDate[1];                
            }

            controller.updateRegistrationOrder(Int32.Parse(id), orderStatus, paymentMethod, cal);

            //update the grid
            rebind(); //rebind the grid
             this.registrationOrderEditorGDView.SelectedIndex = Int32.Parse(id);

            //Change the form view mode
            RegistrationOrderFormView.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1);
            //Response.Write("Updating");**/

        }

        /**
         * This method is trigggered when we do the following:
         * we are in default mode, and we press the "edit" button
         * we select the "new" button
         * we are in "edit" mode, and we press the "update" button
         * NOT REALLY NEEDED...
         * */
        protected void RegistrationOrderFormView_ItemCommand(Object sender, FormViewCommandEventArgs e)
        {
            //nothing needed here at this point
        }

        /**
         * This method is triggered when the mode changes. all it does is swap the view of the forms
         * i.e. if we press "edit", we need to switch to "edit mode"
         * if we press "new", we need to switch to "insert mode"
         * if we cancel anytime, we need to switch to nothing
         * */
        protected void RegistrationOrderFormView_ModeChanging(Object sender, FormViewModeEventArgs e)
        {
            Int32 ind = -1;
            if (Session["registrationIndex"] != null)
                ind = (Int32)Session["registrationIndex"];

            if (e.NewMode == FormViewMode.Edit)
            {
                 RegistrationOrderFormView.ChangeMode(e.NewMode);
                rebindForm(ind); //need this to rebound things
            }
            else if (e.NewMode == FormViewMode.Insert)
            {
                RegistrationOrderFormView.ChangeMode(e.NewMode);
                //no need to rebound cause we want it to be blank
            }
            if (e.CancelingEdit)
            {
                RegistrationOrderFormView.ChangeMode(FormViewMode.ReadOnly);
                rebindForm(-1); //rebind to nothing cause we want the form to be hidden
            }
        }

        protected void onStatusSelected(object sender, CommandEventArgs e)
        {
            String status = e.CommandArgument.ToString();

            if (status.Equals("All"))
            {
                rebind(); //this method will reload everything
            }
            else //either Pending, Cancel, or Complete
            {
                this.registrationOrderEditorGDView.DataSource = controller.getOrderByStatus(status);
                this.registrationOrderEditorGDView.DataBind();
            }
        }

    }
}