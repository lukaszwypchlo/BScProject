using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int idFilm = Int32.Parse(Request.QueryString["val"]);

            using (var db = new CinemaEntities())
            {
                var query = (from f in db.film
                            where f.id_film == idFilm
                            select new { f.tytul, f.opis, f.rezyser, f.gatunek, f.czas_trwania }).ToList();


                foreach (var f in query)
                {
                    string[] str = f.tytul.Split(null);
                    movieImage.ImageUrl = "~\\Images\\" + str[0] +".jpg";

                    movieTitle.Text = f.tytul;
                    movieDirector.Text = f.rezyser;
                    movieGenre.Text = f.gatunek;
                    movieTime.Text = f.czas_trwania.ToString();
                    movieDesc.Text = f.opis;
                }
            }
        }
    }
}