using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EBFRW_Web
{
    /*
     * Representation of a weekly run
     * @name name of the location
     * @city city of the location - used for creating the forecast
     */
    public class WeeklyRun
    {
        public static WeeklyRun ALAMEDA = new WeeklyRun("Bay Farm Island<br />Alameda", "alameda", "#tabr3");
        public static WeeklyRun LAKE_MERRIT = new WeeklyRun("Lake Merritt<br />Oakland", "oakland", "#tabr2");
        public static WeeklyRun EMERYVILLE = new WeeklyRun("Emeryville Marina", "emeryville", "#tabr4");
        public static WeeklyRun SAN_LEANDRO = new WeeklyRun("San Leandro Marina", "san+leandro", "#tabr6");
        public static WeeklyRun STRAWBERRY_CANYON = new WeeklyRun("Strawberry Canyon</br>Berkeley", "berkeley", "#tabr5");
        public static WeeklyRun LAKE_CHABOT = new WeeklyRun("Lake Chabot Marina<br />Castro Valley", "castro+valley", "#tabr1");
        public static WeeklyRun LAFAYETE = new WeeklyRun("Lafayette", "Lafayette", "#");
        public static WeeklyRun NOT_DETERMINED = new WeeklyRun("Location Not determined", "oakland", "#");

        private string runName;
        private string runCity;
        private String runTab;

        public WeeklyRun(string runName, string runCity, string runTab)
        {
            this.runName = runName;
            this.runCity = runCity;
            this.runTab = runTab;
        }

        public string RunTab
        {
            get { return this.runTab; }
        }

        public string RunName
        {
            get { return this.runName; }
        }
        public string RunCity
        {
            get { return this.runCity; }
        }
    }
}