using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class PrideRunResults : System.Web.UI.Page
{
    private Controller controller = new Controller();

    private string setFormating(DataColumn bc)
    { 
        

        string dataType = null; 
        switch (bc.DataType.ToString()) 
        { case "System.Int32":             dataType = "{0:#,###}"; 
            break; 
            case "System.Decimal":                      
                dataType = "{0:c}"; break; 
            case "System.DateTime":         dataType = "{0:dd-mm-yyyy}"; break; 
            case "System.String":          dataType = ""; break; 
            default:              dataType = ""; break; 
        } 
        return dataType; 
    }

    protected BoundColumn CreateBoundColumn(DataColumn c, string[] col, int index)
    {
        BoundColumn column = new BoundColumn(); 
        column.DataField = c.ColumnName;
        column.HeaderText = col[index].ToString(); 
        column.DataFormatString = setFormating(c); 
        
        return column;
    }

    protected string parseEventSelected(String evSt)
    {
        if (evSt.Equals("10 K Run"))
        {
            return "10KR";
        }
        else if (evSt.Equals("5 K Run"))
        {
            return "5KR";
        }
        else if (evSt.Equals("5 K Walk"))
        {
            return "5KW";
        }
        else
        {
            return "";
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        this.loadPrideInfo();
    }

    private void setUpHeaderStyle(DataGrid dg)
    {
        DataGridColumnCollection dgcc = dg.Columns;

        foreach (DataGridColumn dc in dgcc)
        {
            dc.HeaderStyle.CssClass = "htable";
        }
        
    }


    private void loadPrideInfo()
    {
        this.yearLabel.Text = this.yearList.SelectedValue;
        this.eventLabel.Text = this.yearList.SelectedValue + " " + this.OverAllDropList.SelectedValue;

      //  if(Int16.Parse(this.yearList.SelectedValue) >= 2012)
        //    return;

        //_10KRGrid_Male.Style.Add("background-color", "red");
        
        //this.yearList.Items[1].Selected = true;
        //this.yearList.SelectedIndex = 0;
        String yearSelected = this.yearList.SelectedValue;
        if (yearSelected == null)
        {
            yearSelected = "2009"; //DateTime.Now.Year;
        }

        String eventSelected = this.OverAllDropList.SelectedValue;
        if (eventSelected == null)
        {
            eventSelected = "10 K Run";
        }

        eventSelected = parseEventSelected(eventSelected);

        int counter = 0;
        string[] input = { "Place", "Bib #", "First Name", "Last Name", "Finish Time" };

        DataSet ds = controller.getTop3Finishers(yearSelected, "10KR", "M");
       foreach(DataColumn c in ds.Tables[0].Columns)       
       {
           _10KRGrid_Male.Columns.Add(CreateBoundColumn(c,input,counter));
           counter++;
       }
        _10KRGrid_Male.DataSource = ds;
        _10KRGrid_Male.DataBind();
        _10KRGrid_Male.Caption = "<b>"+  _10KRGrid_Male.Caption + "</b>";
        //_10KRGrid_Male.HeaderStyle.BackColor = System.Drawing.Color.Yellow;


        //_10KRGrid_Male.Columns[0].HeaderStyle.CssClass = "header";
      
        ds = controller.getTop3Finishers(yearSelected, "5KR", "M");
        counter = 0;
        foreach (DataColumn c in ds.Tables[0].Columns)
        {
            _5KRGrid_Male.Columns.Add(CreateBoundColumn(c, input, counter));
            counter++;
        }
        _5KRGrid_Male.DataSource = ds;
        _5KRGrid_Male.DataBind();

        ds = controller.getTop3Finishers(yearSelected, "5KW", "M");
        counter = 0;
        foreach (DataColumn c in ds.Tables[0].Columns)
        {
            _5KWGrid_Male.Columns.Add(CreateBoundColumn(c, input, counter));
            counter++;
        }
        _5KWGrid_Male.DataSource = ds;
        _5KWGrid_Male.DataBind();

        ds = controller.getTop3Finishers(yearSelected, "10KR", "F");
        counter = 0;
        foreach (DataColumn c in ds.Tables[0].Columns)
        {
            _10KRGrid_Female.Columns.Add(CreateBoundColumn(c, input, counter));
            counter++;
        }

        _10KRGrid_Female.DataSource = ds;
        _10KRGrid_Female.DataBind();

        ds = controller.getTop3Finishers(yearSelected, "5KR", "F");
        counter = 0;
        foreach (DataColumn c in ds.Tables[0].Columns)
        {
            _5KRGrid_Female.Columns.Add(CreateBoundColumn(c, input, counter));
            counter++;
        }
        _5KRGrid_Female.DataSource = ds;
        _5KRGrid_Female.DataBind();

        ds = controller.getTop3Finishers(yearSelected, "5KW", "F");
        counter = 0;
        foreach (DataColumn c in ds.Tables[0].Columns)
        {
            _5KWGrid_Female.Columns.Add(CreateBoundColumn(c, input, counter));
            counter++;
        }
        _5KWGrid_Female.DataSource = ds;
        _5KWGrid_Female.DataBind();

       //////////////////
        for (int i = 0; i < 3; i++)
        {
            if (_10KRGrid_Female.Items.Count > 0)
            {
                _10KRGrid_Female.Items[i].Cells[0].Text = (i + 1).ToString();
            }

            if (_5KRGrid_Female.Items.Count > 0)
            {
                _5KRGrid_Female.Items[i].Cells[0].Text = (i + 1).ToString();
            }

            if (_5KWGrid_Female.Items.Count > 0)
            {
                _5KWGrid_Female.Items[i].Cells[0].Text = (i + 1).ToString();
            }

            if (_10KRGrid_Male.Items.Count > 0)
            {
                _10KRGrid_Male.Items[i].Cells[0].Text = (i + 1).ToString();
            }

            if (_5KRGrid_Male.Items.Count > 0)
            {
                _5KRGrid_Male.Items[i].Cells[0].Text = (i + 1).ToString();
            }

            if (_5KWGrid_Male.Items.Count > 0)
            {
                _5KWGrid_Male.Items[i].Cells[0].Text = (i + 1).ToString();
            }
        }

        //process the overall finishers
        DataSet ds1 = new DataSet();
        String[] input1 = { "Place", "Bib #", "First Name", "Last Name", "Finish Time", "Gender" };

        if (Int16.Parse(yearSelected) >= 2011)
        {
            ds = controller.getAllFinishers(yearSelected, eventSelected, "M");
            
            ds1 = controller.getAllFinishers(yearSelected, eventSelected, "F");
            counter = 0;
            foreach (DataColumn c in ds1.Tables[0].Columns)
            {
                AllResults2nd.Columns.Add(CreateBoundColumn(c, input1, counter));
                counter++;
            }

            AllResults2nd.DataSource = ds1;
            AllResults2nd.DataBind();
        } 
        else 
        {
            ds = controller.getAllFinishers(yearSelected, eventSelected, "both");
        }
        
        counter = 0;
        foreach (DataColumn c in ds.Tables[0].Columns)
        {
            AllResults.Columns.Add(CreateBoundColumn(c, input1, counter));
            counter++;
        }       

        AllResults.DataSource = ds;
        AllResults.DataBind();

        this.setUpHeaderStyle(_10KRGrid_Male);
        this.setUpHeaderStyle(_10KRGrid_Female);
        this.setUpHeaderStyle(_5KRGrid_Male);
        this.setUpHeaderStyle(_5KRGrid_Female);
        this.setUpHeaderStyle(_5KWGrid_Male);
        this.setUpHeaderStyle(_5KWGrid_Female);
    }

    protected void formatGrid(DataGrid grid)
    {
        
    }
    protected void OverAllDropList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}