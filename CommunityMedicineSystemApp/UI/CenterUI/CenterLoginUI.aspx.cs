using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommunityMedicineSystemApp.BLL;
using CommunityMedicineSystemApp.DAL.DAO;

namespace CommunityMedicineSystemApp.UI.CenterUI
{
    public partial class CenterLoginUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            string msg = "";
            Center aCenterLogin = new Center();
            aCenterLogin.CenterUserId = codeTextBox.Text;
            aCenterLogin.CenterPassword = passwrdTextBox.Text;
            CenterManager aCenterManager = new CenterManager();
            aCenterLogin = aCenterManager.FindCodePswrd(aCenterLogin);
            if (aCenterLogin == null)
            {
                msg = "Code & Password does not exist!!";
            }
            else
            {
                Session["CenterId"] = aCenterLogin.CenterId;
                Response.Redirect("CenterIndexPageUI.aspx");
            }
        }
    }
}