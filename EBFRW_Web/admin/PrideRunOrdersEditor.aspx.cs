using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EBFRW_Web.admin
{
    public partial class PrideRunOrdersEditor : System.Web.UI.Page
    {
        Controller controller = new Controller();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated || !User.Identity.Name.Equals("admin"))
            {
                Response.Redirect("~/Account/Login.aspx?ReturnUrl=~/admin/PrideRunOrdersEditor.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    //EventEditorFormView.Visible = true;
                    rebind();
                    //rebindForm(-1);
                    //EventEditorFormView.Height = 50;
                    
                }
            }
        }

        //GRID VIEW SECTION - START

        /**
         * Rebind the "Grid View"
         * */
        private void rebind()
        {
            this.overalGridView.DataSource = controller.getPrideRunOrderSummary();
            this.overalGridView.DataBind();

            this.totalNumberOfOrders.Text += controller.getTotalNumberOfRegistered();

            this.prideRunOrdersGridView.DataSource = controller.getAllPrideRunOrders();
            this.prideRunOrdersGridView.DataBind();
        }

        /**
        * When we select "update" in the grid view, we then update the FormView
        * save value in session for when we want to switch view
        * note: this can be improved - just look at the form view before swapping mode
        * */
        protected void prideRunOrdersGridView_OnSelectedIndexChanged(Object sender, EventArgs e)
        {
            String i = prideRunOrdersGridView.SelectedValue.ToString();
            //Response.Write("Event Grid SElected INdex Changed");

            int index = Int32.Parse(i);
            prideRunOrdersGridView.Visible = true;
            rebindForm(index);
            Session["memberIndex"] = index;
        }

        /**
         * Triggered whenever the page index is changed
         * */
        protected void prideRunOrdersGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            rebind();
            prideRunOrdersGridView.PageIndex = e.NewPageIndex;
            prideRunOrdersGridView.DataBind();
        }

        /**
         * Refreshes Grid view base on "status=All,Pending,Cancelled,Complete"...
         * */
        protected void onStatusSelected(object sender, CommandEventArgs e)
        {


            String status = e.CommandArgument.ToString();
            if (status.Equals("All"))
            {
                this.rebind(); //this method will load everything
            }
            else if (status.Equals("Summary"))
            {
                //hide the grid


                //display the stats
            }
            else
            {
                this.prideRunOrdersGridView.DataSource = controller.getPrideRunOrdersByStatus(status);
                this.prideRunOrdersGridView.DataBind();
            }
        }

        /**
         * Triggered whenever we are in "edit" mode...It refreshes the "grid"...
         * */
        protected void PrideRunOrdersGridView_RowEditing(Object sender, GridViewEditEventArgs e)
        {
            this.prideRunOrdersGridView.EditIndex = e.NewEditIndex;
            rebind();
        }

        /**
         * Triggered whenever the user "cancel" the edit process...
         * */
        protected void PrideRunOrdersGridView_RowCancelingEdit(Object sender, GridViewCancelEditEventArgs e)
        {
            this.prideRunOrdersGridView.EditIndex = -1;
            this.rebind();
        }

        protected void PrideRunOrdersGridView_RowUpdating(Object sender, GridViewUpdateEventArgs e)
        {
            String orderId = ((TextBox)prideRunOrdersGridView.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            String status = ((DropDownList)prideRunOrdersGridView.Rows[e.RowIndex].Cells[2].Controls[1]).SelectedItem.Value; // order_status
            String paymentDate = ((TextBox)prideRunOrdersGridView.Rows[e.RowIndex].Cells[3].Controls[0]).Text; //payment_date
            String paymentType = ((TextBox)prideRunOrdersGridView.Rows[e.RowIndex].Cells[4].Controls[0]).Text; //payment type

            controller.updateOrder(Int16.Parse(orderId), status, paymentDate, paymentType);
            prideRunOrdersGridView.EditIndex = -1;

            this.rebind();

        }




        //GRID VIEW SECTION - END

        //FORM STUFF - START
        //I AM CURRENTLY NOT USING IT...

        private void rebindForm(int i)
        {
        }



        /**
         * This method is triggered when the mode changes. all it does is swap the view of the forms
         * i.e. if we press "edit", we need to switch to "edit mode"
         * if we press "new", we need to switch to "insert mode"
         * if we cancel anytime, we need to switch to nothing
         * */
        protected void PrideRunOrdersEditorFormView_ModeChanging(Object sender, FormViewModeEventArgs e)
        {
            Int32 ind = -1;
            if (Session["memberIndex"] != null)
                ind = (Int32)Session["memberIndex"];

            if (e.NewMode == FormViewMode.Edit)
            {
                PrideRunOrdersEditorFormView.ChangeMode(e.NewMode);
                rebindForm(ind); //need this to rebound things
            }
            else if (e.NewMode == FormViewMode.Insert)
            {
                PrideRunOrdersEditorFormView.ChangeMode(e.NewMode);
                //no need to rebound cause we want it to be blank
            }
            if (e.CancelingEdit)
            {
                PrideRunOrdersEditorFormView.ChangeMode(FormViewMode.ReadOnly);
                rebindForm(-1); //rebind to nothing cause we want the form to be hidden
            }
        }

                /**
         * We are in "edit" mode, and the "Update" button was pressed
         * */
        protected void PrideRunOrdersEditorFormView_ItemUpdating(Object sender, FormViewUpdateEventArgs e)
        {
            String id = ((TextBox)PrideRunOrdersEditorFormView.FindControl("idTextBox")).Text;
            String firstName = ((TextBox)PrideRunOrdersEditorFormView.FindControl("firstNameTextBox")).Text;
            String lastName = ((TextBox)PrideRunOrdersEditorFormView.FindControl("lastNameTextBox")).Text;
            string email = ((TextBox)PrideRunOrdersEditorFormView.FindControl("emailTextBox")).Text;

            controller.updateAMember(id, firstName, lastName, email);

            //update the grid
            rebind(); //rebind the grid
            prideRunOrdersGridView.SelectedIndex = Int32.Parse(id);

            //Change the form view mode
            PrideRunOrdersEditorFormView.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1);
            //Response.Write("Updating");**/
        }

        /**
         * We are in "default mode" mode, and the "delete" button was pressed
         * */
        protected void PrideRunOrdersEditorFormView_ItemDeleting(Object sender, FormViewDeleteEventArgs e)
        {
            String id = ((TextBox)PrideRunOrdersEditorFormView.FindControl("idTextBox")).Text;
            controller.deleteAMember(Int32.Parse(id));

            //update the grid
            rebind(); //rebind the grid
            
            //Change the form view mode
            PrideRunOrdersEditorFormView.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1); rebindForm(-1);
            //Response.Write("Deleting");**/
        }

        /**
        * Currently NOT used
        * We are in "insert" mode, and the "insert" button was pressed
        * */
        protected void PrideRunOrdersEditorFormView_ItemInserting(Object sender, FormViewInsertEventArgs e)
        {
            String firstName = ((TextBox)PrideRunOrdersEditorFormView.FindControl("firstNameTextBox")).Text;
            String lastName = ((TextBox)PrideRunOrdersEditorFormView.FindControl("lastNameTextBox")).Text;
            String email = ((TextBox)PrideRunOrdersEditorFormView.FindControl("emailTextBox")).Text;

            //Response.Write("Inserting...<br>");
            //Response.Write(eventName + "," + distance + "," + city + "," + state + "," + website + "," + cal.ToShortDateString());

            controller.insertAMember(firstName, lastName, email);
            rebind(); //rebind the grid

            PrideRunOrdersEditorFormView.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1);
        }



        
    }


}
