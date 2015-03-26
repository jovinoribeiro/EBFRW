using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;

public partial class MembersOnly : System.Web.UI.Page
{
    private Controller controller = new Controller();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //This is awesome..prints the name of user :)
        //Responsse.Write(User.Identity.Name.ToString());
        if (User.Identity.Name.Equals("admin"))
        {
            //LinkButton adminToolLinkButton = (LinkButton)Master.FindControl("adminToolLinkButton");

            //adminToolLinkButton.Visible = true;            
        } 


        //ReturnUrl=<%=Request.Url.AbsolutePath%>"
        if (!Request.IsAuthenticated)
        {            
            Response.Redirect("~/Account/Login.aspx");
        }
        else
        {
            if (!Page.IsPostBack)
            {
                //put this back
                //DataSet ds = controller.getMemberList1();
                DataSet ds = controller.getMemberLlist(); //using members table
                Session["ds"] = ds;
                this.membersGrid.DataSource = ds;
                this.membersGrid.DataBind();                

                //process the table
                //controller.getAllEBFRWEventEntries();



            }
            //processFiles();
        }

        //createNewMembership();
    }

    public void processFiles()
    {
        OdbcDataReader dr = controller.getDocuments("NEWS_LETTER");
        int newrowindex = 0;
        string curYear = "";
        TableRow row = new TableRow();
        TableCell cell;
        while (dr.Read())
        {

            string year = dr.GetString(2);
            string season = dr.GetString(3).Substring(1);
            
            string filename = @"'http://www.eastbayfrontrunners.org/uploads/" + dr.GetString(4) + "'";

            //if (newrowindex%5 == 0)
            if (!curYear.Equals("") && !curYear.Equals(year))
            {
                newrowindex = 0;
                this.newsLetterTable.Rows.Add(row);
                row = new TableRow();
            }

            curYear = year;

            //"<a href=" + "\"http://" + temp + "\"" + "target=\"_blank\"" + ">" + temp + "</a>";
            string url = "<a href=" + filename + "\"" + " target=\"_blank\"" + ">" + year + " " + season + "</a>";

            cell = new TableCell();
            cell.BorderStyle = BorderStyle.Solid;
            cell.HorizontalAlign = HorizontalAlign.Center;
            cell.VerticalAlign = VerticalAlign.Middle;
            //cell.BorderWidth = 1;
            cell.Text = url;
            cell.Width = 100;
            row.Cells.Add(cell);
            newrowindex++;
            //Response.Write(year + " " + season + " " + filename + "</br>");
        }

        if (newrowindex <= 5 && newrowindex >= 1)
            this.newsLetterTable.Rows.Add(row);
    }


    protected void membersGrid_Page(Object sender, DataGridPageChangedEventArgs e)
    {
        this.membersGrid.DataSource = (DataSet)Session["ds"];
        membersGrid.CurrentPageIndex = e.NewPageIndex;
        this.membersGrid.DataBind();

    }

    protected void searchForMemberAndUpdateGrid(String firstName, String lastName)
    {
        //DataSet ds = controller.getAMember1(firstName, lastName);
        DataSet ds = controller.getAMember(firstName, lastName);

        if (ds.Tables[0].Rows.Count == 0)
        {
            this.searchResultLbl.Text = "No entry found for " + firstName + " " + lastName;
        }
                this.membersGrid.CurrentPageIndex = 0;
            this.membersGrid.DataSource = ds;
            this.membersGrid.DataBind();
    }

    protected void membersGrid_Edit(Object sender, DataGridCommandEventArgs e)
    {
        membersGrid.EditItemIndex = e.Item.ItemIndex;


    }

    // ResetPageIndex resets invalid page index to last page
    // ASSERT grid and view NOT NULL
    protected void ResetPageIndex(DataGrid grid, DataView view)
    {
        // check for invalid page index
        if ((grid.CurrentPageIndex != 0) && (((grid.CurrentPageIndex) * grid.PageSize) >= view.Count))
        {
            // invalid so leave at last page
            if ((view.Count % grid.PageSize) == 0)
            { // ends on page border
                grid.CurrentPageIndex = (view.Count / grid.PageSize) - 1;
            }
            else // partial page
            {
                grid.CurrentPageIndex = (view.Count / grid.PageSize);
            }
        }
    }

    protected void searchButton_Click(object sender, EventArgs e)
    {
        //put this back
        this.searchResultLbl.Text = "";
        this.searchForMemberAndUpdateGrid(this.searchFNBox.Text, this.searchLNBox.Text);
    }

    protected void onAlphabetSelected(object sender, CommandEventArgs e)
    {
        //put this back
        this.searchForAlphabetMembersAndUpdateGrid(e.CommandArgument.ToString());
    }

    protected void searchForAlphabetMembersAndUpdateGrid(String firstName)
    {
        //DataSet ds = controller.getAlphabetMembers1(firstName);
        DataSet ds = controller.getAlphabetMembers(firstName);

        this.searchResultLbl.Text = "";

        if (ds.Tables[0].Rows.Count == 0)
        {
            this.searchResultLbl.Text = "No result(s) found for search criteria: " + firstName;
        }
        this.membersGrid.CurrentPageIndex = 0;
        this.membersGrid.DataSource = ds;
        this.membersGrid.DataBind();
    }

}