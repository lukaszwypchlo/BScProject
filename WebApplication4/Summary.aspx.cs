using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class Summary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void ClickRes(object sender, EventArgs e)
        {
            string klientId;
            string rezId;

            using (var db = new CinemaEntities())
            {

                klient kli = db.klient.Create();

                kli.imie = tbName.Text;
                kli.nazwisko = tbSurname.Text;
                kli.numer_telefonu = tbPhone.Text;
                kli.e_mail = tbMail.Text;
                db.klient.Add(kli);
                db.SaveChanges();
                var idKlient = kli.id_klient;
                klientId = idKlient.ToString();

                rezerwacja rez = db.rezerwacja.Create();

                rez.id_klient = idKlient;
                db.rezerwacja.Add(rez);
                db.SaveChanges();
                var idRez = rez.id_rezerwacja;
                rezId = idRez.ToString();

                List<string> seatsList = (List<string>)(Session["field1"]);
                int idSeans = Int32.Parse((string)(Session["val"]));

                foreach (var sl in seatsList)
                {
                    int ret = 0;
                    try { 

                    ret = db.insertReservation(idRez, idSeans, Int32.Parse(sl));

                    }
                    catch (EntityDataSourceValidationException edsve)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Błąd połączenie z bazą danych. Prosimy spróbować ponownie." + "');", true);
                        Response.Redirect("~/Default.aspx");
                    }

                    if(ret == 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Operacja nie powiodła się." + "');", true);
                        Response.Redirect("~/Default.aspx");
                    }
                }

            }


            Response.Redirect("~/Final.aspx?kli=" + klientId + "&rez=" + rezId);
        }

        public void ClickBack(object sender, EventArgs e)
        {
            Response.Redirect("~/Confirm.aspx");
        }

    }
}