using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.Odbc;

namespace EBFRW_Web.admin
{
    public partial class UploadDocuments : System.Web.UI.Page
    {
        Controller controller = new Controller();

        protected void Page_Load(object sender, EventArgs e)
        {
            //deleteFile("2010 Xmas.xlsx");
            //processDirectory();

            processFiles();
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
                string season = dr.GetString(3);
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

        public void processDirectory()
        {
           var dirs =  Directory.EnumerateFiles(Server.MapPath("~/uploads"));

           foreach (var dir in dirs)
           {
               Response.Write(dir.Substring(dir.LastIndexOf("\\") + 1) + "</br>");
               controller.addDocument("", "", "", dir.Substring(dir.LastIndexOf("\\") + 1));
           }


        }

        protected void uploadButton_Click(Object sender, EventArgs e)
        {
            if (this.fileUploadControl.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(fileUploadControl.FileName);
                    fileUploadControl.SaveAs(Server.MapPath("~/docs/") + filename);
                    StatusLabel.Text = "Upload Status: File uploaded";
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload Status: File could not be uploaded. The following error occurred: " + ex.Message;
                }
            }
        }

        public void deleteFile(String filename)
        {
            if (System.IO.File.Exists(Server.MapPath("~/docs/") + filename))
            {
                System.IO.File.Delete(Server.MapPath("~/docs/") + filename);
                //Response.Write("file deleted");
            }
            //else
            //{
                //Response.Write("file not found");
            //}
        }
    }
}