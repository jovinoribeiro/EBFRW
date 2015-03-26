using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AjaxControlToolkit;

namespace EBFRW_Web.admin
{
    public partial class EventEditor : System.Web.UI.Page
    {
        Controller controller = new Controller();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated || !User.Identity.Name.Equals("admin"))
            {
                Response.Redirect("~/Account/Login.aspx?ReturnUrl=~/admin/EventEditor.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    //EventEditorFormView.Visible = true;
                    rebind();
                    rebindForm(-1);
                    EventEditorFormView.Height = 50;
                }
            }
        }

        private void rebindForm(int i)
        {
            DataSet ds = controller.getEventById(i); 
            EventEditorFormView.DataSource = ds;
            EventEditorFormView.DataBind();
            if ((TextBox)EventEditorFormView.FindControl("eventDateTextBox") != null)
            {
                string s = ((TextBox)EventEditorFormView.FindControl("eventDateTextBox")).Text;
                if (s != null)
                {
                    int pos = s.IndexOf(" ");
                    ((TextBox)EventEditorFormView.FindControl("eventDateTextBox")).Text = s.Substring(0, pos);
                }
            }            
        }

        private void rebind()
        {
            DataSet ds = controller.getAllEventList("RUN", DateTime.Now);
            EVGridView.DataSource = ds;
            EVGridView.DataBind();
        }
        
        /**
         * This method is trigggered when we do the following:
         * we are in default mode, and we press the "edit" button
         * we select the "new" button
         * we are in "edit" mode, and we press the "update" button
         * NOT REALLY NEEDED...
         * */
        protected void EventEditorFormView_ItemCommand(Object sender, FormViewCommandEventArgs e)
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
        protected void EventEditorFormView_ModeChanging(Object sender, FormViewModeEventArgs e)
        {
            Int32 ind = -1;
            if (Session["index"] != null)
                ind = (Int32)Session["index"];
            
            if (e.NewMode == FormViewMode.Edit)
            {
                EventEditorFormView.ChangeMode(e.NewMode);
                rebindForm(ind); //need this to rebound things
            }
            else if (e.NewMode == FormViewMode.Insert)
            {
                EventEditorFormView.ChangeMode(e.NewMode);
                //no need to rebound cause we want it to be blank
            }
            if (e.CancelingEdit)
            {
                EventEditorFormView.ChangeMode(FormViewMode.ReadOnly);
                rebindForm(-1); //rebind to nothing cause we want the form to be hidden
            }
        }

        /**
         * We are in "edit" mode, and the "Update" button was pressed
         * */
        protected void EventEditorFormView_ItemUpdating(Object sender, FormViewUpdateEventArgs e)
        {
            String id = ((TextBox)EventEditorFormView.FindControl("idTextBox")).Text;
            String eventName = ((TextBox)EventEditorFormView.FindControl("eventNameTextBox")).Text;
            eventName = eventName.Replace("'", "''");
            String distance = ((TextBox)EventEditorFormView.FindControl("distanceTextBox")).Text;
            String city = ((TextBox)EventEditorFormView.FindControl("cityTextBox")).Text;
            String state = ((TextBox)EventEditorFormView.FindControl("stateTextBox")).Text;
            String website = ((TextBox)EventEditorFormView.FindControl("websiteTextBox")).Text;
            //DateTime cal = (DateTime)((CalendarExtender)EventEditorFormView.FindControl("calendartest")).SelectedDate;
            String date = ((TextBox)EventEditorFormView.FindControl("eventDateTextBox")).Text;
            String[] splitDate = date.Split('/');
            DateTime cal = new DateTime(Int32.Parse(splitDate[2]), Int32.Parse(splitDate[0]), Int32.Parse(splitDate[1])); 
 
            //Response.Write("Updating...<br>");
            //Response.Write(eventName + "," + distance + "," + city + "," + state + "," + website + "," + cal.ToShortDateString());

            controller.updateEvent(Int32.Parse(id), cal, eventName, distance, city, state, website);

            //update the grid
            rebind(); //rebind the grid

            //Change the form view mode
            EventEditorFormView.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1);
            //Response.Write("Updating");
        }

        /**
         * We are in "default mode" mode, and the "delete" button was pressed
         * */
        protected void EventEditorFormView_ItemDeleting(Object sender, FormViewDeleteEventArgs e)
        {
            String id = ((TextBox)EventEditorFormView.FindControl("idTextBox")).Text;
            controller.removeEVent(Int32.Parse(id));
            
            //update the grid
            rebind(); //rebind the grid

            //Change the form view mode
            EventEditorFormView.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1); rebindForm(-1);
            //Response.Write("Deleting");
        }

        /**
         * We are in "insert" mode, and the "insert" button was pressed
         * */
        protected void EventEditorFormView_ItemInserting(Object sender, FormViewInsertEventArgs e)
        {
            String eventName = ((TextBox)EventEditorFormView.FindControl("eventNameTextBox")).Text;
            eventName = eventName.Replace("'", "''");
            String distance = ((TextBox)EventEditorFormView.FindControl("distanceTextBox")).Text;
            String city = ((TextBox)EventEditorFormView.FindControl("cityTextBox")).Text;
            String state = ((TextBox)EventEditorFormView.FindControl("stateTextBox")).Text;
            String website = ((TextBox)EventEditorFormView.FindControl("websiteTextBox")).Text;
            //DateTime cal = (DateTime)((CalendarExtender)EventEditorFormView.FindControl("calendartest")).SelectedDate;
            String date = ((TextBox)EventEditorFormView.FindControl("eventDateTextBox")).Text;
            String[] splitDate = date.Split('/');
            DateTime cal = new DateTime(Int32.Parse(splitDate[2]), Int32.Parse(splitDate[0]), Int32.Parse(splitDate[1])); 
            //Response.Write("Inserting...<br>");
            //Response.Write(eventName + "," + distance + "," + city + "," + state + "," + website + "," + cal.ToShortDateString());

            controller.createNewEvent(cal, eventName, distance, city, state, website);
            rebind(); //rebind the grid
            //now, find the id to select it on the Grid
            
            EventEditorFormView.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1);
            //Response.Write("Inserting");
        }

        /**
         * When we select "update" in the grid view, we then update the FormView
         * save value in session for when we want to switch view
         * note: this can be improved - just look at the form view before swapping mode
         * */
        protected void localEventsGrid_OnSelectedIndexChanged(Object sender, EventArgs e)
        {
            String i = EVGridView.SelectedValue.ToString();
            //Response.Write("Event Grid SElected INdex Changed");
            
            int index = Int32.Parse(i);
            EventEditorFormView.Visible = true;
            rebindForm(index);
            Session["index"] = index;
        }
    }
}