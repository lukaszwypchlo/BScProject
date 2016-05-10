using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class Confirm : System.Web.UI.Page
    {
        public void ClickDalej(object sender, EventArgs e)
        {
            Response.Redirect("~/Summary.aspx");
        }

        public void ClickWstecz(object sender, EventArgs e)
        {
            Response.Redirect("~/Room.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> seatsList = (List<string>)(Session["field1"]);
            int idSeans = Int32.Parse((string)(Session["val"]));

            using (var db = new CinemaEntities())
            {

                var querySeance = (from f in db.film
                                   join s in db.seans
                                       on f.id_film equals s.id_film
                                       where s.id_seans == idSeans
                                   select new { f.tytul, s.id_sala, s.godzina, s.data }).ToList();

                movieTitle.Text = querySeance[0].tytul;
                movieDate.Text = querySeance[0].data.ToString().Substring(0, 10);
                movieHour.Text = querySeance[0].godzina.ToString().Substring(0, 5);
                movieRoom.Text = querySeance[0].id_sala.ToString();

                foreach (var sl in seatsList)
                {
                    int idSeat = Int32.Parse(sl);

                        var query = (from m in db.miejsce
                                     where m.id_miejsce == idSeat
                                     select new { m.id_sala, m.sektor, m.rzad }).ToList();

                        Label lab = new Label();
                        lab.Text = "miejsce: ";
                        Label lab1 = new Label();
                        lab1.Text = query[0].rzad.ToString();
                        lab1.CssClass = "seatLab";
                        Label lab2 = new Label();
                        lab2.Text = "rząd: ";
                        Label lab3 = new Label();
                        lab3.Text = query[0].sektor.ToString();
                        lab3.CssClass = "seatLab";

                        seatsData.Controls.Add(lab);
                        seatsData.Controls.Add(lab1);
                        seatsData1.Controls.Add(lab2);
                        seatsData1.Controls.Add(lab3);
                        seatsData.Controls.Add(new LiteralControl("<br /><br />"));
                        seatsData1.Controls.Add(new LiteralControl("<br /><br />"));
                    
                }
            }
        }
    }
}