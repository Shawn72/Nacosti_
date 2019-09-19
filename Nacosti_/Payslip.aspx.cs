using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Payslip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var nav  = WsConfig.ReturnNavObj();
                var mypayperiods = nav.payperiods;
                payperiod.DataSource = mypayperiods;

                //var peri = mypayperiods.ToList().Select(d => Convert.ToDateTime(d.Starting_Date).ToString("MM/dd/yyyy")).ToString();

                payperiod.DataTextField = "Starting_Date";
                payperiod.DataValueField = "Starting_Date";
                payperiod.DataBind();
                generatePdf(payperiod.SelectedValue);
            }
           
        }
        protected void payperiod_SelectedIndexChanged(object sender, EventArgs e)
        {
            generatePdf(payperiod.SelectedValue);
        }

        protected void generatePdf(string ipayperiod)
        {
            try
            {
                DateTime mypayperiod = Convert.ToDateTime(ipayperiod);
                var director = (string)Session["directorNo"];
                var status = WsConfig.ObjNav.GenerateDirectorPayslip(director, mypayperiod);
                var splitstatus = status.Split('*');
                
                switch (splitstatus[0])
                {
                    case "success":
                        display.Attributes.Add("src", ResolveUrl("~/Downloads/" + string.Format("{0}.pdf", director)));
                        payslipfeedback.InnerHtml = "<div class ='alert alert-success'>Payslip generated successfully!</div>";
                        break;
                    default:
                        payslipfeedback.InnerHtml = "<div class ='alert alert-danger'>"+ splitstatus[1] + "</div>";
                        break;
                        
                }                
            }
            catch (Exception exp)
            {  
                ///Handle exception
                payslipfeedback.InnerHtml = exp.Message;
            }
        }
    }
}