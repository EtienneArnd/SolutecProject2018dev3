using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web
{
    public static class Globale
    {
        public static String GetFormateursAsString(int idSessionFormation)
        {
            return dto.DtoSessionFormation.Get(idSessionFormation).GetFormateursAsString();
        }
        public static String GetFormateursAsString(this session_formation sessionFormation)
        {
            if (sessionFormation.formateur_session_formation.Count == 0) return "";
            String str = sessionFormation.formateur_session_formation.First().formateur.GetNomPrenom();
            foreach (formateur_session_formation fsf in sessionFormation.formateur_session_formation.Skip(1))
            {
                str += " & " + fsf.formateur.GetNomPrenom();
            }
            return str;
        }
        public static String GetSocieteAsString(int idSessionFormation)
        {
            return dto.DtoSessionFormation.Get(idSessionFormation).GetSocieteAsString();
        }
        public static String GetSocieteAsString(this session_formation sessionFormation)
        {
            if (sessionFormation == null || sessionFormation.formateur_session_formation ==null || sessionFormation.formateur_session_formation.Count == 0) return "";
            String str = sessionFormation.stagiaire_session_formation.First().stagiaire.societe.GetNomComplementDeNom();
            foreach (stagiaire_session_formation ssf in sessionFormation.stagiaire_session_formation.Skip(1))
            {
                str += " & " + ssf.stagiaire.societe.GetNomComplementDeNom();
            }
            return str;
        }

        public static string GetNomComplementDeNom(this societe societe)
        {
            return societe.nom + " " + societe.complement_nom;
        }

        public static String GetNomPrenom(this formateur formateur)
        {
            return formateur.nom + " " + formateur.prenom;
        }
        public static String GetNomPrenom(this stagiaire stagiaire)
        {
            return stagiaire.nom + " " + stagiaire.prenom;
        }

        public static DateTime GetDateFin(int idSessionFormation)
        {
            session_formation sessionFormation = dto.DtoSessionFormation.Get(idSessionFormation);
            if (sessionFormation != null)
            {
                return sessionFormation.GetDateFin();
            }
            else
            {
                return DateTime.Today;
            }

        }

        public static DateTime GetDateFin(this session_formation sessionFormation)
        {
            if (sessionFormation.date_fin != null)
            {
                return (DateTime)sessionFormation.date_fin;
            }
            return Globale.AddDuree2Date((DateTime)sessionFormation.date_debut, (int)sessionFormation.formation.duree);
        }

        public static DateTime GetDateFinCursus(int idSessionCursus)
        {
            return dto.DtoSessionCursus.Get(idSessionCursus).GetDateFinCursus();
        }
        public static DateTime GetDateFinCursus(this session_cursus sessionCursus)
        {
            Nullable<DateTime> output = sessionCursus.session_formation.First().date_fin;
            output = output != null ? output : DateTime.MinValue;
            foreach(session_formation sf in sessionCursus.session_formation.Skip(1))
            {
                if (sf.date_fin !=null && sf.date_fin > output)
                {
                    output = sf.date_fin;
                }
            }
            return (DateTime)output;
        }

        public static String GetNomAvecComplement(this societe societe)
        {
            return societe.nom + " " + societe.complement_nom;
        }
        public static DateTime AddDuree2Date(DateTime date, int duree)
        {
            //           DateTime[] dates = (duree == 1) ? GetPlageDates(date, 2) : GetPlageDates(date, duree);
            DateTime[] dates = GetPlageDates(date, duree);
            return dates.Last();
        }
        public static DateTime NextDate(DateTime date, int duree = 1)
        {
            DateTime[] dates = (duree == 1) ? GetPlageDates(date, 2) : GetPlageDates(date, duree);
            return dates.Last();
        }
        public static DateTime[] GetPlageDates(DateTime date, int duree)
        {
            DateTime[] dates = new DateTime[duree];
            int j = 0;
            for (int i = 0; i < dates.Length; i++)
            {
                do
                {
                    dates[i] = date.AddDays(j);
                    j++;
                }
                while (dates[i].DayOfWeek == DayOfWeek.Saturday || dates[i].DayOfWeek == DayOfWeek.Sunday);
            }
            return dates;
        }

        public static String ToShortDateString(DateTime? date)
        {
            return (date == null) ? "" : ((DateTime)date).ToShortDateString();
        }
    }
}