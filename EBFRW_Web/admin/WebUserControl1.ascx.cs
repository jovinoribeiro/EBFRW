using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace EBFRW_Web.admin
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
        Controller controller = new Controller();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rebindMembers();
            }
        }

        private void rebindMembers()
        {
            //put this back
            //DataSet ds = controller.getMemberList1();
            DataSet ds = controller.getMemberListWithId(); //using members table
            Session["ds"] = ds;
            this.membersGrid.DataSource = ds;
            this.membersGrid.DataBind();
        }

        private void searchClick(object sender, EventArgs e)
        {
            //put this back
            this.searchResultLbl.Text = "";
            this.searchForMemberAndUpdateGrid(this.searchFNBox.Text, this.searchLNBox.Text);
        }

        private void membersGrid_Page(Object sender, GridViewPageEventArgs e)
        {
            this.membersGrid.DataSource = (DataSet)Session["ds"];
            membersGrid.PageIndex =   e.NewPageIndex;
            this.membersGrid.DataBind();

        }

        protected void searchForMemberAndUpdateGrid(String firstName, String lastName)
        {
            //DataSet ds = controller.getAMember1(firstName, lastName);
            DataSet ds = controller.getAMemberWithId(firstName, lastName);

            if (ds.Tables[0].Rows.Count == 0)
            {
                this.searchResultLbl.Text = "No entry found for " + firstName + " " + lastName;
            }
            this.membersGrid.PageIndex = 0;
            this.membersGrid.DataSource = ds;
            this.membersGrid.DataBind();
        }

        protected void getMemberById(String id)
        {
            DataSet ds = controller.getAMemberWithIdById(id);
            if (ds.Tables[0].Rows.Count == 0)
            {
                this.searchResultLbl.Text = "No entry found for ";
            }
            //this.membersGrid.PageIndex = 0;
            this.membersGrid.DataSource = ds;
            this.membersGrid.DataBind();

        }

        protected void membersGrid_Edit(Object sender, DataGridCommandEventArgs e)
        {
            //membersGrid.EditItemIndex = e.Item.ItemIndex;


        }

        // ResetPageIndex resets invalid page index to last page
        // ASSERT grid and view NOT NULL
        protected void ResetPageIndex(GridView grid, DataView view)
        {
            // check for invalid page index
            if ((grid.PageIndex != 0) && (((grid.PageIndex) * grid.PageSize) >= view.Count))
            {
                // invalid so leave at last page
                if ((view.Count % grid.PageSize) == 0)
                { // ends on page border
                    grid.PageIndex = (view.Count / grid.PageSize) - 1;
                }
                else // partial page
                {
                    grid.PageIndex = (view.Count / grid.PageSize);
                }
            }
        }


        protected void onAlphabetSelected(object sender, CommandEventArgs e)
        {
            //put this back
            this.searchForAlphabetMembersAndUpdateGrid(e.CommandArgument.ToString());
        }

        protected void searchForAlphabetMembersAndUpdateGrid(String firstName)
        {
            //DataSet ds = controller.getAlphabetMembers1(firstName);
            DataSet ds = controller.getAlphabetMembersWithId(firstName);

            this.searchResultLbl.Text = "";

            if (ds.Tables[0].Rows.Count == 0)
            {
                this.searchResultLbl.Text = "No result(s) found for search criteria: " + firstName;
            }
            this.membersGrid.PageIndex = 0;
            this.membersGrid.DataSource = ds;
            this.membersGrid.DataBind();
        }

        //Manipulating data grid/grid view
        protected void membersGrid_RowEditing(object sender, GridViewEditEventArgs e) 
        {
            membersGrid.EditIndex = e.NewEditIndex; // turn to edit mode
            String id = membersGrid.Rows[membersGrid.EditIndex].Cells[1].Text; //ID
            //String temp = (membersGrid.EditIndex).ToString();
            //getMemberById(id);
            //membersGrid.EditIndex = 0;//e.NewEditIndex; // turn to edit mode
            //getMemberById(id);

            //TextBox tb = (TextBox)membersGrid.Rows[0].Cells[0].Controls[0];
            //tb.Enabled = false;

            this.rebindMembers(); // Rebind GridView to show the data in edit mode
        }

        protected void membersGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            //while ((membersGrid.Rows[e.RowIndex].Controls.GetEnumerator()).MoveNext())
            {
              //  LiteralControl childControl = (LiteralControl)membersGrid.Rows[e.RowIndex].Controls.GetEnumerator().Current;
                //Response.Write("<b><br /> This is the  text of the child Control  </b>: " +
                //               childControl.Text);

            }

            TextBox tb = (TextBox)membersGrid.Rows[e.RowIndex].FindControl("TextBox1");

            
            //Response.Write(c.GetEnumerator().ToString());
            
            //String id1 = ((TextBox)membersGrid.Rows[e.RowIndex].FindControl("TextBox1")).Text;

            String id = ((TextBox)membersGrid.Rows[e.RowIndex].Cells[1].Controls[0]).Text; //ID

            String firstName = ((TextBox)membersGrid.Rows[e.RowIndex].Cells[2].Controls[0]).Text; //Company
            controller.updateAMember(id, firstName);
            membersGrid.EditIndex = -1;

            this.rebindMembers();

        }


        protected void membersGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            membersGrid.EditIndex = -1; //swicth back to default mode
           
            //this.membersGrid.PageIndex = 0;

            this.rebindMembers(); // Rebind GridView to show the data in default mode
        }




    }
}