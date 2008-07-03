using System;

namespace Web.Member.Order
{
    public partial class AdEvaluation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Request.QueryString["OrderId"] != null)
            {
                HOT.BLL.Order oBLL = new HOT.BLL.Order();
                HOT.Model.Order oModel = new HOT.Model.Order();
                oModel = oBLL.GetModel(new Guid(this.Request.QueryString["OrderId"]));

                HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
                HOT.Model.Zone zModel = new HOT.Model.Zone();
                zModel = zBLL.GetModel(oModel.ZoneId);

                Guid userId=HOT.BLL.User.GetLoginUser();
                if (userId != oModel.UserId || userId != zModel.UserId)
                {
                    Response.Write("<script>alert('请不要对和自己不相关的订单进行评价');history.go(-2);</script>");
                }

            }
            else
            {
                HOT.Common.MessageBox.Show(this,"参数错误");
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            HOT.BLL.Evaluation eBLL = new HOT.BLL.Evaluation();
            HOT.Model.Evaluation eModel = new HOT.Model.Evaluation();
            eModel.OrderId = new Guid(this.Request.QueryString["OrderId"]);
            eModel.Descriptiont = this.txtDescription.Text;
            eModel.Score = int.Parse(this.rblEvaluation.SelectedValue);

            HOT.BLL.Order oBLL=new HOT.BLL.Order();
            HOT.Model.Order oModel=new HOT.Model.Order();
            oModel=oBLL.GetModel(eModel.OrderId);
            if (HOT.BLL.User.GetLoginUser() == oModel.UserId)
            {
                eModel.Type = 1;
            }
            else
            {
                eModel.Type = 0;
            }
            eBLL.Add(eModel);
            Response.Write("<script>alert('评价成功');history.go(-2);</script>");
        }
    }
}
