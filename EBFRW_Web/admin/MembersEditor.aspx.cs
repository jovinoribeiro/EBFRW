using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EBFRW_Web.admin
{
    public partial class MembersEditor : System.Web.UI.Page
    {
        Controller controller = new Controller();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userAuthenticated = (String)Session["userAuthenticated"];
            
            //Boolean userAuthenticated = (Boolean)Session["userAuthenticated"];
            /**if (userAuthenticated == null || !Boolean.Parse(userAuthenticated))
            {
                Session["goto"] = "members";
                Response.Redirect("~/admin/AdminLogin.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    rebind();
                }
            }         **/


            //This is awesome..prints the name of user :)
            //Response.Write(User.Identity.Name.ToString());

            //ReturnUrl=<%=Request.Url.AbsolutePath%>"
            if (!Request.IsAuthenticated || !User.Identity.Name.Equals("admin"))
            {
                Response.Redirect("~/Account/Login.aspx?ReturnUrl=~/admin/MembersEditor.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    //EventEditorFormView.Visible = true;
                    rebind();
                    rebindForm(-1);
                    MembersEditorFormView.Height = 50;
                }
            }
        }

        private void rebindForm(int i)
        {
            DataSet ds = controller.getAMemberWithIdById(i.ToString());
            MembersEditorFormView.DataSource = ds;
            MembersEditorFormView.DataBind();
         }

        private void rebind()
        {
            DataSet ds = controller.getMemberListAndId();
            membersGridView.DataSource = ds;
            membersGridView.DataBind();
        }

        /**
         * This method is trigggered when we do the following:
         * we are in default mode, and we press the "edit" button
         * we select the "new" button
         * we are in "edit" mode, and we press the "update" button
         * NOT REALLY NEEDED...
         * */
        protected void MembersEditorFormView_ItemCommand(Object sender, FormViewCommandEventArgs e)
        {
            /**if (e.CommandName == "Edit")
            {
                Response.Write("Editing");
            }
            else if (e.CommandName == "New")
            {
                Response.Write("Pressed New");
            }
            else if (e.CommandName == "Update")
            {
                Response.Write("Updating");
            }
            else if (e.CommandName == "Delete")
            {
                Response.Write("Deleting");
            }
            else if (e.CommandName == "Cancel")
            {
                Response.Write("Cancelling");
            }
            else if (e.CommandName == "Insert")
            {
                Response.Write("Insert 1");
            }      **/

        }

        /**
         * This method is triggered when the mode changes. all it does is swap the view of the forms
         * i.e. if we press "edit", we need to switch to "edit mode"
         * if we press "new", we need to switch to "insert mode"
         * if we cancel anytime, we need to switch to nothing
         * */
        protected void MembersEditorFormView_ModeChanging(Object sender, FormViewModeEventArgs e)
        {
            Int32 ind = -1;
            if (Session["memberIndex"] != null)
                ind = (Int32)Session["memberIndex"];

            if (e.NewMode == FormViewMode.Edit)
            {
                MembersEditorFormView.ChangeMode(e.NewMode);
                rebindForm(ind); //need this to rebound things
            }
            else if (e.NewMode == FormViewMode.Insert)
            {
                MembersEditorFormView.ChangeMode(e.NewMode);
                //no need to rebound cause we want it to be blank
            }
            if (e.CancelingEdit)
            {
                MembersEditorFormView.ChangeMode(FormViewMode.ReadOnly);
                rebindForm(-1); //rebind to nothing cause we want the form to be hidden
            }
        }

        /**
         * We are in "edit" mode, and the "Update" button was pressed
         * */
        protected void MembersEditorFormView_ItemUpdating(Object sender, FormViewUpdateEventArgs e)
        {
            String id = ((TextBox)MembersEditorFormView.FindControl("idTextBox")).Text;
            String firstName = ((TextBox)MembersEditorFormView.FindControl("firstNameTextBox")).Text;
            String lastName = ((TextBox)MembersEditorFormView.FindControl("lastNameTextBox")).Text;
            string email = ((TextBox)MembersEditorFormView.FindControl("emailTextBox")).Text;

            controller.updateAMember(id, firstName, lastName, email);

            //update the grid
            rebind(); //rebind the grid
            membersGridView.SelectedIndex = Int32.Parse(id);

            //Change the form view mode
            MembersEditorFormView.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1);
            //Response.Write("Updating");**/
        }

        /**
         * We are in "default mode" mode, and the "delete" button was pressed
         * */
        protected void MembersEditorFormView_ItemDeleting(Object sender, FormViewDeleteEventArgs e)
        {
            String id = ((TextBox)MembersEditorFormView.FindControl("idTextBox")).Text;
            controller.deleteAMember(Int32.Parse(id));

            //update the grid
            rebind(); //rebind the grid
            
            //Change the form view mode
            MembersEditorFormView.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1); rebindForm(-1);
            //Response.Write("Deleting");**/
        }

        /**
         * We are in "insert" mode, and the "insert" button was pressed
         * */
        protected void MembersEditorFormView_ItemInserting(Object sender, FormViewInsertEventArgs e)
        {
            String firstName = ((TextBox)MembersEditorFormView.FindControl("firstNameTextBox")).Text;
            String lastName = ((TextBox)MembersEditorFormView.FindControl("lastNameTextBox")).Text;
            String email = ((TextBox)MembersEditorFormView.FindControl("emailTextBox")).Text;
            
            //Response.Write("Inserting...<br>");
            //Response.Write(eventName + "," + distance + "," + city + "," + state + "," + website + "," + cal.ToShortDateString());

            controller.insertAMember(firstName, lastName, email);
            rebind(); //rebind the grid
            
            MembersEditorFormView.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1);
        }

        /**
         * When we select "update" in the grid view, we then update the FormView
         * save value in session for when we want to switch view
         * note: this can be improved - just look at the form view before swapping mode
         * */
        protected void membersGridView_OnSelectedIndexChanged(Object sender, EventArgs e)
                {
                    String i = membersGridView.SelectedValue.ToString();
                    //Response.Write("Event Grid SElected INdex Changed");

                    int index = Int32.Parse(i);
                    membersGridView.Visible = true;
                    rebindForm(index);
                    Session["memberIndex"] = index;
                }


        protected void membersGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            rebind();
            membersGridView.PageIndex = e.NewPageIndex;
            membersGridView.DataBind();
        }


    }   
}