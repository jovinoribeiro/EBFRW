using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.Odbc;

namespace EBFRW_Web.admin
{
    public partial class PrideRunOrders : System.Web.UI.Page
    {
        private Controller controller = new Controller();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userAuthenticated = (String)Session["userAuthenticated"];
            //Boolean userAuthenticated = (Boolean)Session["userAuthenticated"];
            if (userAuthenticated == null || !Boolean.Parse(userAuthenticated))
            {
                Session["goto"] = "prideorders";
                Response.Redirect("~/admin/AdminLogin.aspx");
            } 
            else
            {
                if (!Page.IsPostBack)
                {
                    rebind();
                }
            }
        }

        private void rebind()
        {   
            PrideRunOrderGV.DataSource = controller.getAllPrideRunOrders();
            this.PrideRunOrderGV.DataBind();
        }

        protected void PrideRunorderGV_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //int index = e.NewEditIndex; //turn to edit mode
            //String id = this.PrideRunOrderGV.Rows[this.PrideRunOrderGV.EditIndex].Cells[0].Text;
           
           this.PrideRunOrderGV.EditIndex = e.NewEditIndex; //turn to edit mode
            //String id = this.PrideRunOrderGV.Rows[this.PrideRunOrderGV.EditIndex].Cells[0].Controls[1]).SelectedItem.Value; 

            rebind();

            



        }

        protected void PrideRunorderGV_RowCancelingEdit(Object sender, GridViewCancelEditEventArgs e)
        {
            PrideRunOrderGV.EditIndex = -1;
            this.rebind();
        }

        protected void PrideRunorderGV_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //String orderId = ((TextBox)PrideRunOrderGV.Rows[e.RowIndex].Cells[1].Controls[0]).Text; //order_id
            //String status = ((DropDownList)PrideRunOrderGV.Rows[e.RowIndex].Cells[2].Controls[1]).SelectedItem.Value; // order_status
            //String paymentDate = ((TextBox)PrideRunOrderGV.Rows[e.RowIndex].Cells[3].Controls[0]).Text; //payment_date
            //String paymentType = ((TextBox)PrideRunOrderGV.Rows[e.RowIndex].Cells[4].Controls[0]).Text; //payment type

            String orderId = ((TextBox)PrideRunOrderGV.Rows[e.RowIndex].Cells[1].Controls[0]).Text; //order_id
            String status = ((DropDownList)PrideRunOrderGV.Rows[e.RowIndex].Cells[2].Controls[1]).SelectedItem.Value; // order_status
            String paymentDate = ((TextBox)PrideRunOrderGV.Rows[e.RowIndex].Cells[3].Controls[0]).Text; //payment_date
            String paymentType = ((TextBox)PrideRunOrderGV.Rows[e.RowIndex].Cells[4].Controls[0]).Text; //payment type
            
            //this line above does not work....i can't get hte value

            //String temp = PrideRunOrderGV.Rows[e.RowIndex].Cells[2].FindControl("statusListJovino").ToString();

            //Session["statusSelected"] = (((DropDownList)sender).SelectedValue);

            //status = (String)Session["statusSelected"];


            //controller.updateOrderStatus(Int16.Parse(orderId), status);

            controller.updateOrder(Int16.Parse(orderId), status, paymentDate, paymentType);
            PrideRunOrderGV.EditIndex = -1;

            this.rebind();
 
        }

        private void saveInfo(object sender, EventArgs e)
        {
            //Response.Write("Testing" + "<BR");
            //Response.Write(((DropDownList)sender).SelectedValue);
            //Session["statusSelected"] = (((DropDownList)sender).SelectedValue);
            //rebind();
        }

        protected void statusListJovino_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Write("Testing" + "<BR");
            //Response.Write(((DropDownList)sender).SelectedValue);
            //Session["statusSelected"] = (((DropDownList)sender).SelectedValue);
            //rebind();
        }

        protected void statusListIndexChanged(object sender, EventArgs e)
        {
            //Response.Write("Testing" + "<BR");
            //Response.Write(((DropDownList)sender).SelectedValue);
            //Session["statusSelected"] = (((DropDownList)sender).SelectedValue);

            

            //rebind();
        }

        protected void statusListJovino_OnLoad(object sender, EventArgs e)
        {
            //((DropDownList)sender).SelectedValue = "Cancelled";
           // ((DropDownList)sender).SelectedItem.Text = ((DropDownList)sender).DataValueField;   

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
                this.PrideRunOrderGV.DataSource = controller.getPrideRunOrdersByStatus(status);
                this.PrideRunOrderGV.DataBind();
            }
        }

        
    }
}