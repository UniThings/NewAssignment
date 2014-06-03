using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace GunDogs
{
    public partial class RegisterMember : System.Web.UI.Page
    {
        Label LUserMsg
        {
            get { return this.Master.FindControl("MainContent").FindControl("LPageMsg") as Label; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FVRegisterUser_Inserted(object sender, FormViewInsertedEventArgs e)
        {
            // if the new user record is successfully added to the web database, 
            // add them to the ASP.NET user database
            if (e.Exception == null)
            {
                try
                {
                    FormView fv = sender as FormView;
                    // get TBUsername and Password from the formview
                    TextBox TBUsername = fv.FindControl("TBUsername") as TextBox;
                    TextBox TBPassword = fv.FindControl("TBPassword") as TextBox;
                    DropDownList DDLRoles = fv.FindControl("DDLRoles") as DropDownList;

                    // if DDLRoles is not present, assign the default role of member
                    string role = DDLRoles != null ? DDLRoles.SelectedValue : "member";

                    // create the user in the ASP.NET user DB
                    Membership.CreateUser(TBUsername.Text, TBPassword.Text);

                    // assign new ASP.NET user the selected role
                    Roles.AddUserToRole(TBUsername.Text, role);

                    // log the new user into the website by creating an authentication cookie
                    FormsAuthentication.SetAuthCookie(TBUsername.Text, false);

                    // redirect the user to the home page
                    Response.Redirect("~/Default.aspx");
                }
                catch (Exception ex)
                {
                    if (LUserMsg != null) LUserMsg.Text = "Error: " + ex.Message;
                }
            }
            else
            {
                if (LUserMsg != null) LUserMsg.Text = "Error: " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
        }

        protected void FVRegisterUser_Inserting(object sender, FormViewInsertEventArgs e)
        {
            FormView fv = sender as FormView;
            TextBox TBUsername = fv.FindControl("TBUsername") as TextBox;
            TextBox TBPassword = fv.FindControl("TBPassword") as TextBox;

            string errors = "Error: ";
            if (TBUsername == null) errors += " Could not find TBUsername <br />";
            if (TBPassword == null) errors += " Could not find TBPassword";
            if (TBUsername == null || TBPassword == null) e.Cancel = true;
            if (LUserMsg != null && e.Cancel) LUserMsg.Text = errors;
        }

        protected void FVRegisterUser_PreRender(object sender, EventArgs e)
        {
            if (this.Master.FindControl("MainContent").FindControl("FVRegisterUser") as FormView != null)
            {
                try
                {
                    DropDownList DDLRoles = this.Master.FindControl("MainContent").FindControl("FVRegisterUser").FindControl("DDLRoles") as DropDownList;
                    if (DDLRoles != null)
                    {
                        DDLRoles.DataSource = Roles.GetAllRoles();
                        DDLRoles.DataBind();
                    }
                }
                catch (Exception)
                {
                    if (LUserMsg != null) LUserMsg.Text = "Error: Could not find DDLRoles (member role will be applied by default)";
                }
            }
            else
            {
                if (LUserMsg != null) LUserMsg.Text = "Error: Could not find FVRegisterUser FormView (no login detail can be saved)";
            }
        }
    }
}