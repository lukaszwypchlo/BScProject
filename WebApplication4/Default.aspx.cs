using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            if (!IsPostBack)
            {
                
            }

            Dictionary<int, DateTime> days = new Dictionary<int,DateTime>();

            days = DaysGen();

            DayGen(days);

            RepGen(days[0]);

            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            
        }

        private Dictionary<int, DateTime> DaysGen()
        {
            Dictionary<int, DateTime> days = new Dictionary<int, DateTime>();

            for (var i = 0; i < 7; i++)
            {
                days.Add(i, new DateTime(2015, 6, 1).AddDays((double)i));
            }

            return days;
        }

        private void DayGen(Dictionary<int, DateTime> days)
        {
            for (var i = 0; i < 7; i++)
            {
                Button btn = new Button();
                string[] str = (days[i].ToString("dddd dd MMMM", CultureInfo.CreateSpecificCulture("pl-PL"))).Split();
                btn.Text = str[0] + "           " + str[1] + " " + str[2];
                btn.Click += new EventHandler(BtnDayClick);
                btn.ID = "dayBut" + i;
                btn.CssClass = "dayButt";

                day.Controls.Add(btn);
            }
        }

        private void BtnDayClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            LabelChange(btn.Text);

            String[] str = btn.Text.Split(null);
                 
            DateTime date = new DateTime(2015, 6, Int32.Parse(str[11]));

            RepGen(date);
        }

        private void LabelChange(string text)
        {
            String[] str = text.Split(null);

            text = str[0].First().ToString().ToUpper() + str[0].Substring(1) + ", " + str[11] + " " + str[12];

            RepData.Text = text;
        }

        private class SeansItem {
            public int ID{get;set; }
            public string Godzina{get;set; }
        }

        private class FilmItem {

            public FilmItem(int idfilm, string tytul)
            {
                this.IdFilm = idfilm;
                this.Tytul = tytul;
                this.Seanse = new List<SeansItem>();
            }

            public int IdFilm { get; set; }
            public String Tytul {get;set; }
            public List<SeansItem> Seanse{get;set; }
        }

        private void RepGen(DateTime day)
        {

            using (var db = new CinemaEntities())
            {
                
                
                List<FilmItem> filmy = new List<FilmItem>();
                

                var query_film = (from f in db.film
                             join s in db.seans
                             on f.id_film equals s.id_film
                             where s.data == day
                             orderby f.id_film
                             select new { f.id_film, f.tytul }
                            ).Distinct();

                var querySeans = (from s in db.seans
                                   where s.data == day
                                   orderby s.id_film, s.godzina
                                   select new { s.id_film, s.id_seans, s.godzina }).ToList();

                foreach(var qf in query_film)
                {
                    filmy.Add(new FilmItem(qf.id_film, qf.tytul));

                    foreach(var qs in querySeans)
                    {
                        if( qs.id_film.Equals(qf.id_film))
                        {
                            filmy.Last().Seanse.Add(new SeansItem() { ID = qs.id_seans, Godzina = ((TimeSpan)qs.godzina).ToString().Remove(5) });
                        }

                    }
                }

                this.lista.DataSource = filmy;
                this.lista.DataBind();
            }
        }

        protected void ListaItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var s = e.Item.FindControl("seanse") as Repeater;
            if (s != null)
            {
                s.DataSource = (e.Item.DataItem as FilmItem).Seanse;
                s.DataBind();
            }
        }

    }
}