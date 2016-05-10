using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication4
{
    public partial class Room : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idSeans;

            if (Session["val"] == null)
            {
                Session["val"] = Request.QueryString["val"];
            }

            idSeans = (string)(Session["val"]);

            RoomGen(Int32.Parse(idSeans));

            if (!IsPostBack)
            {
                if (Session["field1"] == null)
                {
                List<string> lista = new List<string>();

                Session["field1"] = lista;
                }

                NumOfRes();
            }
     
        }

        protected void RoomGen(int idSeans)
        {
            using (var db = new CinemaEntities())
            {
                var query = (from f in db.film
                             join s in db.seans
                                 on f.id_film equals s.id_film
                             where s.id_seans == idSeans
                             select new { f.tytul, s.id_sala, s.data, s.godzina }).ToList();

                labTytul.Text = query[0].tytul;
                labHour.Text = query[0].godzina.ToString().Substring(0, 5);
                labDate.Text = query[0].data.ToString().Substring(0, 10);
                labSala.Text = query[0].id_sala.ToString();

                int idSali = query[0].id_sala;

                var querySeats = (from m in db.miejsce
                                  where m.id_sala == idSali
                                  orderby m.sektor
                                  select new { m.sektor }).Distinct().ToList();

                foreach (var qs in querySeats)
                {
                    int sectorNum = Int32.Parse(qs.sektor.ToString());

                    HtmlGenericControl div = new HtmlGenericControl("div");
                    div.ID = sectorNum.ToString();
                    myDiv.Controls.Add(div);

                    Label lab = new Label();
                    lab.Text = sectorNum.ToString();
                    lab.CssClass = "numOfSector";

                    div.Controls.Add(lab);

                    var querySeatId = (from m in db.miejsce
                                       where m.id_sala == idSali && m.sektor == sectorNum
                                       select new { m.id_miejsce }).ToList();

                    foreach (var qsi in querySeatId)
                    {
                        ImageButton ib = new ImageButton();
                        ib.ID = "myBut" + qsi.id_miejsce.ToString();
                        ib.ImageUrl = "~/Images/Free.png";
                        ib.CommandArgument = qsi.id_miejsce.ToString();
                        ib.CssClass = "buttRes";
                        ib.Click += Click;

                        div.Controls.Add(ib);
                    }
                }

                var queryOccSeat = (from b in db.bilet
                                    where b.id_seans == idSeans
                                    select new { b.id_miejsce });

                foreach (var qs in queryOccSeat)
                {
                    var ib = myDiv.FindControl("myBut" + qs.id_miejsce.ToString());
                    ImageButton imb = (ImageButton)ib;

                    imb.ImageUrl = "~/Images/Occ.png";                    
                }

                if (Session["field1"] != null)
                {
                    List<string> seatsList = (List<string>)(Session["field1"]);

                    foreach (var sl in seatsList)
                    {
                        var ib = myDiv.FindControl("myBut" + sl);
                        ImageButton imb = (ImageButton)ib;

                        imb.ImageUrl = "~/Images/Res.png";                    
                    }
                }
            }
        }

        protected void Click(object sender, EventArgs e)
        {
            ImageButton b = sender as ImageButton;
            List<string> lista = (List<string>)Session["field1"];

            if (b.ImageUrl.Equals("~/Images/Free.png") && Int32.Parse(labIloscMiejsc.Text) + 1 < 11)
            {
                b.ImageUrl = "~/Images/Res.png";               

                lista.Add(b.CommandArgument);

                Session["field1"] = lista;

                NumOfRes();
            }
            else if (b.ImageUrl.Equals("~/Images/Res.png"))
            {
                b.ImageUrl = "~/Images/Free.png";                

                lista.Remove(b.CommandArgument);

                Session["field1"] = lista;

                NumOfRes();
            }
            else if (b.ImageUrl.Equals("~/Images/Free.png") && lista.Count() > 10)
            {

            }
        }

        protected void ClickWstecz(Object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Repertoire.aspx");
        }

        protected void ClickDalej(Object sender, EventArgs e)
        {
            if(labIloscMiejsc.Text.Equals("0"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Aby przejść dalej wybierz co najmniej jedno miejsce." + "');", true);
            }
            else
                Response.Redirect("~/Confirm.aspx");
        }

        private void NumOfRes()
        {
            List<string> lista = (List<string>)Session["field1"];

            labIloscMiejsc.Text = lista.Count().ToString();
        }
    }
}