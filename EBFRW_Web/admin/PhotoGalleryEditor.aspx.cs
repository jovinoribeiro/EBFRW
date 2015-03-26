using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EBFRW_Web.admin
{
    public partial class PhotoGalleryEditor : System.Web.UI.Page
    {
        Controller controller = new Controller();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rebind();
                rebindForm(-1);
                PGFV.Height = 50;
            }

           

            //Load all the albums
            this.rebind();

        }

        private void rebind()
        {
            this.loadAllAlbums();
        }

        private void loadAllAlbums()
        {
            this.AlbumsGV.DataSource = controller.getAllAlbums();
            this.AlbumsGV.DataBind();
        }

        private void rebindForm(int i)
        {
            DataSet ds = controller.getAlbumById(i);
            PGFV.DataSource = ds;
            PGFV.DataBind();
        }

        protected void albumsGV_OnSelectedIndexChanged(Object sender, EventArgs e)
        {
            //Get grid selected value
            String i = AlbumsGV.SelectedValue.ToString();
            
            int index = Int32.Parse(i);
            this.PGFV.Visible = true;
            rebindForm(index);
            Session["index"] = index;
        }

        /**
 * This method is triggered when the mode changes. all it does is swap the view of the forms
 * i.e. if we press "edit", we need to switch to "edit mode"
 * if we press "new", we need to switch to "insert mode"
 * if we cancel anytime, we need to switch to nothing
 * */
        protected void PGFV_ModeChanging(Object sender, FormViewModeEventArgs e)
        {
            Int32 ind = -1;
            if (Session["index"] != null)
                ind = (Int32)Session["index"];

            if (e.NewMode == FormViewMode.Edit)
            {
                this.PGFV.ChangeMode(e.NewMode);
                rebindForm(ind); //need this to rebound things
            }
            else if (e.NewMode == FormViewMode.Insert)
            {
                this.PGFV.ChangeMode(e.NewMode);
                //no need to rebound cause we want it to be blank
            }
            if (e.CancelingEdit)
            {
                this.PGFV.ChangeMode(FormViewMode.ReadOnly);
                rebindForm(-1); //rebind to nothing cause we want the form to be hidden
            }
        }

        /**
         * We are in "edit" mode, and the "Update" button was pressed
         * */
        protected void PGFV_ItemUpdating(Object sender, FormViewUpdateEventArgs e)
        {
            String id = ((TextBox)this.PGFV.FindControl("albumIdTextBox")).Text;
            String albumName = ((TextBox)this.PGFV.FindControl("albumNameTextBox")).Text;
            String albumDescription = ((TextBox)this.PGFV.FindControl("albumDescTextBox")).Text;

            //Update table
            controller.updateAlbum(Int32.Parse(id), albumName, albumDescription); 

            //update the grid
            rebind(); //rebind the grid

            //Change the form view mode
            this.PGFV.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1);
        }

        /**
         * We are in "default mode" mode, and the "delete" button was pressed
         * */
        protected void PGFV_ItemDeleting(Object sender, FormViewDeleteEventArgs e)
        {
            String id = ((TextBox)this.PGFV.FindControl("albumIdTextBox")).Text;
            controller.removeAlbum(Int32.Parse(id));

            //update the grid
            rebind(); //rebind the grid

            //Change the form view mode
            this.PGFV.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1); rebindForm(-1);
            //Response.Write("Deleting");
        }

        /**
         * We are in "insert" mode, and the "insert" button was pressed
         * */
        protected void PGFV_ItemInserting(Object sender, FormViewInsertEventArgs e)
        {
            String albumName = ((TextBox)this.PGFV.FindControl("albumNameTextBox")).Text;
            String albumDescription = ((TextBox)this.PGFV.FindControl("albumDescTextBox")).Text;
            
            //Create new entry
            controller.createNewAlbum(albumName, albumDescription);
            rebind(); //rebind the grid
            //now, find the id to select it on the Grid
            this.PGFV.ChangeMode(FormViewMode.ReadOnly);
            rebindForm(-1);
        }

    }


}