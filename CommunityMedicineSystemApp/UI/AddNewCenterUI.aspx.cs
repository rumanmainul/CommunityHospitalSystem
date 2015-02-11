using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommunityMedicineSystemApp.BLL;
using CommunityMedicineSystemApp.DAL.DAO;

namespace CommunityMedicineSystemApp.UI
{
    public partial class AddNewCenterUI : System.Web.UI.Page
    {
        AreaManager areaManager = new AreaManager();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                districtDropdownList.DataSource = areaManager.GetAllDistrict();
                districtDropdownList.DataTextField = "DistrictName";
                districtDropdownList.DataValueField = "DistrictId";
                districtDropdownList.DataBind();
                districtDropdownList.Items.Insert(0, "Select");
            }
           
        }

        protected void districtDropdownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int districtId = Convert.ToInt32(districtDropdownList.SelectedValue);
            thanaDropDownList.DataSource = areaManager.GetTheThana(districtId);
            thanaDropDownList.DataValueField = "ThanaId";
            thanaDropDownList.DataTextField = "ThanaName";
            thanaDropDownList.DataBind();
        }
        CenterManager aCenterManager = new CenterManager();
        protected void createCentertBuntton_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            string userID = random.Next(10, 1000).ToString();
            string path = Path.GetRandomFileName();
            path = path.Replace(".", "");
            string password = path;
            Center aCenter = new Center();
            aCenter.CenterName = centerNameTextBox.Text;
            aCenter.DistrictId = Convert.ToInt32(districtDropdownList.SelectedValue);
            aCenter.ThanaId = Convert.ToInt32(thanaDropDownList.SelectedValue);
            aCenter.CenterUserId = userID;
            aCenter.CenterPassword = password;
            string alertCreate = aCenterManager.CreateNewCenter(aCenter);
            Response.Redirect("CenterCreateSuccessUI.aspx?q="+alertCreate);
        }
    }
}