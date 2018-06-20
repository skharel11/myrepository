using SageFrame.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modules_Category_CategoryEdit : BaseUserControl
{
    public int portalID, userModuleID;
    public string cultureCode, username;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            portalID = GetPortalID;
            userModuleID = int.Parse(SageUserModuleID);
            cultureCode = GetCurrentCulture();
            username = GetUsername;

            IncludeCss("adminCss", "/Administrator/Templates/Default/css/admin.css");

        }
    }
}
