using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Net.Mail;
using System.Data.Odbc;

/// <summary>
/// Summary description for Controller
/// </summary>
public class Controller
{
    private DBManager dbManager;
    private const string  _10KR = "10KR";
    private const string _5KR = "5KR";
    private const string _5KW = "5KW";
    private string exceptionValue = "";
    private Boolean membersShortList = true;

    private static DataSet ds;

    public void loadDataSet()
    {
        ds = getAllEventList("RUN", DateTime.Now);
    }

    public static DataSet getDataSet()
    {
        return ds;
    }
        

	public Controller()
	{
        dbManager = new DBManager();
    }

    public DBManager getDBManager()
    {
        return dbManager;
    }

    public void removeOrder(String orderId)
    {
        String sqlStr = "delete from orders where order_id = '" + orderId + "'";
        dbManager.executeODBCCommandSQL(sqlStr);
    }


    public DataSet getAllOrders()
    {
        String sqlStr = "select * from orders order by 1 desc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getOrderById(int id)
    {
        String sqlStr = "select * from orders where order_id = " + id;
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getOrderByStatus(String status)
    {
        String sqlStr = "select * from orders where order_status = '" + status + "'" + " order by 1 desc";
        return dbManager.getDataSetODBC(sqlStr);
    }

    public void updateRegistrationOrder(int id, string order_status, string paymentMethod, String paymentDate)
    {
        //now, check to see what's empty or not...
        String sqlStr = "update orders set";

        if (order_status.Equals(""))
        {
            order_status = "DEFAULT";
            sqlStr += " order_status = " + order_status + ",";
        }
        else
        {
            sqlStr += " order_status = '" + order_status + "',";
        }

        if (paymentMethod.Equals(""))
        {
            paymentMethod = "DEFAULT";
            sqlStr += " payment_type = " + paymentMethod + ",";
        }
        else
        {
            sqlStr += " payment_type = '" + paymentMethod + "',";
        }

        if (paymentDate.Equals(""))
        {
            paymentDate = "DEFAULT";
            sqlStr += " payment_date = " + paymentDate + ",";
        }
        else
        {
            sqlStr += " payment_date = '" + paymentDate + "',";
        }
        
        sqlStr = sqlStr.Remove(sqlStr.Length - 1);

        sqlStr += " where order_id = " + id;
        dbManager.executeODBCCommandSQL(sqlStr);
    }

    public void insertNewOrderOld(String registerOption, String membeshipType, String fcFirstName, String fcLastName,
    String fcBday, String fcEmail, String fcHomePhone, String fcCellPhone, String fcWorkPhone, String scFirstName,
    String scLastName, String scBday, String scEmail, String scHomePhone, String scCellPhone, String scWorkPhone,
    String street1, String street2, String city, String state, String zip, String emCtFirstName, String emCtLastName,
    String emCtPhone, String newsLetterPd, String newsLetterEmail, String includeMDir, String includePhone,
    String includeEmail, String includeHomeAddress, String usePHotoConsent, String hostPotluck, String waterInit)
    {
        String columns = "REGISTER_OPTION, MEMBERSHIP_TYPE, FC_FIRST_NAME, FC_LAST_NAME, FC_BDAY, FC_EMAIL, " +
        "FC_HOME_PHONE, FC_CELL_PHONE, FC_WORK_PHONE, SC_FIRST_NAME, SC_LAST_NAME, SC_BDAY, " +
        "SC_EMAIL, SC_HOME_PHONE, SC_CELL_PHONE, SC_WORK_PHONE, STREET1, STREET2, CITY, STATE, " +
        "ZIP, EM_CT_FIRST_NAME, EM_CT_LAST_NAME, EM_CT_PHONE, NEWS_LETTER_PD, NEWS_LETTER_EMAIL, " +
        "INCLUDE_M_DIR, INCLUDE_PHONE, INCLUDE_EMAIL, INCLUDE_HOME_ADDRESS, USE_PHOTO_CONSENT, " +
        "HOST_POTLUCK, WAIVER_INIT";


        String sqlStr = "insert into orders (" + columns + ") VALUES(" +
            "'" + registerOption + "', '" +
            membeshipType + "', '" +
            fcFirstName + "', '" +
            fcLastName + "', '" +
            fcBday + "', '" +
            fcEmail + "', '" +
            fcHomePhone + "', '" +
            fcCellPhone + "', '" +
            fcWorkPhone + "', '" +
            scFirstName + "', '" +
            scLastName + "', '" +
            scBday + "', '" +
            scEmail + "', '" +
            scHomePhone + "', '" +
            scCellPhone + "', '" +
            scWorkPhone + "', '" +
            street1 + "', '" +
            street2 + "', '" +
            city + "', '" +
            state + "', '" +
            zip + "', '" +
            emCtFirstName + "', '" +
            emCtLastName + "', '" +
            emCtPhone + "', '" +
            newsLetterPd + "', '" +
            newsLetterEmail + "', '" +
            includeMDir + "', '" +
            includePhone + "', '" +
            includeEmail + "', '" +
            includeHomeAddress + "', '" +
            usePHotoConsent + "', '" +
            hostPotluck + "', '" +
            waterInit + "')";

        //remove this
        dbManager.executeODBCCommandSQL(sqlStr);



        //String sqlStr = "insert into events (EVENT_DATE, EVENT_NAME, DISTANCE, CITY, STATE, EVENT_URL, EVENT_TYPE)" + 
        //"VALUES(" + "'" + date + "' , '" + name + "' , '" + distance + "' , '" + city + "' , '" + state + 
        //"' , '" + website + "' , '" + "RUN" + "')";
        //dbManager.executeCommandSQL(sqlStr);
    }

    public void insertNewOrder(String registerOption, String membeshipType, String fcFirstName, String fcLastName,
        String fcBday, String fcEmail, String fcHomePhone, String fcCellPhone, String fcWorkPhone, String scFirstName,
        String scLastName, String scBday, String scEmail, String scHomePhone, String scCellPhone, String scWorkPhone,
        String street1, String street2, String city, String state, String zip, String emCtFirstName, String emCtLastName,
        String emCtPhone, String newsLetterPd, String newsLetterEmail, String includeMDir, String includePhone,
        String includeEmail, String includeHomeAddress, String usePHotoConsent, String hostPotluck, String waterInit)
    {
        String columns = "REGISTER_OPTION, ORDER_DATE, ORDER_STATUS, MEMBERSHIP_TYPE, FC_FIRST_NAME, FC_LAST_NAME, FC_BDAY, FC_EMAIL, " +
        "FC_HOME_PHONE, FC_CELL_PHONE, FC_WORK_PHONE, SC_FIRST_NAME, SC_LAST_NAME, SC_BDAY, " +
        "SC_EMAIL, SC_HOME_PHONE, SC_CELL_PHONE, SC_WORK_PHONE, STREET1, STREET2, CITY, STATE, " +
        "ZIP, EM_CT_FIRST_NAME, EM_CT_LAST_NAME, EM_CT_PHONE, NEWS_LETTER_PD, NEWS_LETTER_EMAIL, " +
        "INCLUDE_M_DIR, INCLUDE_PHONE, INCLUDE_EMAIL, INCLUDE_HOME_ADDRESS, USE_PHOTO_CONSENT, " +
        "HOST_POTLUCK, WAIVER_INIT";

        String date = DateTime.Now.Year + "-" + DateTime.Now.Month + "-" + DateTime.Now.Day;

        String sqlStr = "insert into orders (" + columns + ") VALUES(" +
            "'" + registerOption + "', '" +
            date + "', '" +
            "Pending" + "', '" +
            membeshipType + "', '" +
            fcFirstName + "', '" + 
            fcLastName + "', '" +  
            fcBday + "', '" + 
            fcEmail + "', '" + 
            fcHomePhone + "', '" + 
            fcCellPhone + "', '" + 
            fcWorkPhone + "', '" + 
            scFirstName + "', '" + 
            scLastName + "', '" + 
            scBday + "', '" + 
            scEmail + "', '" + 
            scHomePhone + "', '" + 
            scCellPhone + "', '" + 
            scWorkPhone + "', '" + 
            street1 + "', '" + 
            street2 + "', '" + 
            city + "', '" + 
            state + "', '" + 
            zip + "', '" + 
            emCtFirstName + "', '" + 
            emCtLastName + "', '" + 
            emCtPhone + "', '" + 
            newsLetterPd + "', '" + 
            newsLetterEmail + "', '" + 
            includeMDir + "', '" + 
            includePhone + "', '" + 
            includeEmail + "', '" + 
            includeHomeAddress + "', '" + 
            usePHotoConsent + "', '" + 
            hostPotluck + "', '" +
            waterInit + "')";

        //remove this
        dbManager.executeODBCCommandSQL(sqlStr);


        
        //String sqlStr = "insert into events (EVENT_DATE, EVENT_NAME, DISTANCE, CITY, STATE, EVENT_URL, EVENT_TYPE)" + 
        //"VALUES(" + "'" + date + "' , '" + name + "' , '" + distance + "' , '" + city + "' , '" + state + 
        //"' , '" + website + "' , '" + "RUN" + "')";
        //dbManager.executeCommandSQL(sqlStr);
    }


    /*
 * Returns the corresponding day of the week of a given date 
 */
    public int getDayOfWeekInt(DateTime myDate)
    {
        String myDay = myDate.DayOfWeek.ToString();
        switch (myDay)
        {
            case "Sunday": return 1;
            case "Monday": return 2;
            case "Tuesday": return 3;
            case "Wednesday": return 4;
            case "Thursday": return 5;
            case "Friday": return 6;
            case "Saturday": return 7;
            default: return 7;
        }
    }

    //TOP 3 FINISHERS START-------------------------------------------------------
    public DataSet getTop3Finishers(string year, string category, string gender)
    {
        String sqlStr = "select position, bib, first_name, last_Name, finish_time from priderun where race_year = '" + year + "' and event = '" +
            category + "' and gender = '" + gender + "' order by position asc LIMIT 0,3";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

     //TOP 3 FINISHERS END-------------------------------------------------------

    //ALL FINISHERS START-------------------------------------------------------
    public DataSet getAllFinishers(string year, string category, string gender)
    {
        string str2ndpiece;
        if (!gender.Equals("M") && !gender.Equals("F"))
        {
            str2ndpiece = "' order by position asc";
        } 
        else 
        {
            str2ndpiece = "' and gender = '" + gender + "' order by position asc";
        }           

        String sqlStr = "select position, bib, first_name, last_Name, finish_time, gender from priderun where race_year = '" + year + "' and event = '" +
            category + str2ndpiece;
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }
    //ALL FINISHERS END-------------------------------------------------------

    //EVENT LIST START-------------------------------------------------------
    public DataSet getEventList(string eventType)
    {
        String sqlStr = "select event_date, event_time, event_desc, city, event_url from events where event_type = '" + eventType + "' order by event_date asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getEventList(string eventType, DateTime now, DateTime endOfMonth)
    {
        String sqlStr = "select id, event_date, event_time, event_desc, city, event_url from events where event_type = '" + 
            eventType + "' and event_date >= '" + now.Year + "-" + now.Month + "-" + now.Day + "' and event_date <= '" + 
            endOfMonth.Year + "-" + endOfMonth.Month + "-" + endOfMonth.Day + "' order by event_date asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getAllEventList(string eventType, DateTime now)
    {
        String sqlStr = "select id, event_date, event_name, distance, city, state, event_url from events where event_type = '" +
            eventType + "' and event_date >= '" + now.Year + "-" + now.Month + "-" + now.Day + "' order by event_date asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getEventById(int id)
    {
        String sqlStr = "select id, event_date, event_name, distance, city, state, event_url from events where id = " +
            id + " order by event_date asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    public void createNewEvent(DateTime datein, string name, string distance, string city, string state, string website)
    {
        String date = datein.Year + "-" + datein.Month + "-" + datein.Day;

        String sqlStr = "insert into events (EVENT_DATE, EVENT_NAME, DISTANCE, CITY, STATE, EVENT_URL, EVENT_TYPE)" +
        "VALUES(" + "'" + date + "' , '" + name + "' , '" + distance + "' , '" + city + "' , '" + state +
        "' , '" + website + "' , '" + "RUN" + "')";
        dbManager.executeODBCCommandSQL(sqlStr);
    }

    public void updateEvent(int id, DateTime datein, string name, string distance, string city, string state, string website)
    {
        String date = datein.Year + "-" + datein.Month + "-" + datein.Day;

        String sqlStr = "update events set event_date ='" + date + "', " +
            "event_name = '" + name + "', " +
            "distance = '" + distance + "', " +
            "city = '" + city + "', " +
            "state = '" + state + "', " +
            "event_url = '" + website + "' " +
            " where id ='" + id + "'";
        dbManager.executeODBCCommandSQL(sqlStr);
    }


    public void removeEVent(int id)
    {
        String sqlStr = "delete from events where id = '" + id + "'";
        dbManager.executeODBCCommandSQL(sqlStr);
    }

    //EVENT LIST END-------------------------------------------------------

    //MEMBER LIST START-------------------------------------------------------
    public DataSet getMemberLlist()
    {
        String sqlStr;
        if (membersShortList)
            sqlStr = "select FirstName, LastName, EMail from members order by FirstName asc";
        else sqlStr = "select FirstName, LastName, Address, Apt, City, ST, ZIP, EMail, " +
            "Home, Cel from members order by FirstName asc";
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getMemberListAndId()
    {
        String sqlStr;
        if (membersShortList)
            sqlStr = "select Idx, FirstName, LastName, EMail from members order by FirstName asc";
        else sqlStr = "select Idx, FirstName, LastName, Address, Apt, City, ST, ZIP, EMail, " +
            "Home, Cel from members order by FirstName asc";
        return dbManager.getDataSetODBC(sqlStr);
    }


    public DataSet getMemberListWithId()
    {
        String sqlStr = "select idx, FirstName, LastName, Address, Apt, City, ST, ZIP, EMail, " +
            "Home, Cel from members order by FirstName asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    //Currently not used
    public DataSet getMemberList1()
    {
        String sqlStr = "select members1.First_Name, members1.Last_Name, address.Street1, address.Street2, address.City, address.State, address.Zip," +
            " members1.Email, members1.home_phone, members1.cell_phone" +
            " from members1, address" +
            " where members1.address_id = address.address_id";

        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    //MEMBER LIST END-------------------------------------------------------

    //MEMBER SEARCH START-------------------------------------------------------
    public DataSet getAMember(String st1, String st2)
    {
        String sqlStr;
        if (membersShortList)
            sqlStr ="select FirstName, LastName, EMail from members where FirstName like '%" + st1 + "%' and LastName like '%" + st2 + "%' order by FirstName asc";
        else
            sqlStr = "select FirstName, LastName, Address, Apt, City, ST, ZIP, EMail, " +
            "Home, Cel from members where FirstName like '%" + st1 + "%' and LastName like '%" + st2 + "%' order by FirstName asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getAMemberWithId(String st1, String st2)
    {
        String sqlStr = "select Idx, FirstName, LastName, Address, Apt, City, ST, ZIP, EMail, " +
            "Home, Cel from members where FirstName like '%" + st1 + "%' and LastName like '%" + st2 + "%' order by FirstName asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getAMemberWithIdById(string id)
    {
        String sqlStr;
        if (membersShortList)
            sqlStr = "select Idx, FirstName, LastName, Email from members where Idx = " + id;
        else
            sqlStr = "select Idx, FirstName, LastName, Address, Apt, City, ST, ZIP, EMail, " +
        "Home, Cel from members where idx = '" + id + "' order by FirstName asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    public void updateAMember(String id, String firstName)
    {
        String sqlStr = "update members set FirstName='" + firstName + "' where idx ='" + id + "'";
        dbManager.executeODBCCommandSQL(sqlStr);
    }

    public void updateAMember(String id, String firstName, String lastName, String email)
    {
        String sqlStr = "update members set firstName='" + firstName + "',  lastName='" + lastName + "', email='" + email + "' where idx = " + id;
        dbManager.executeODBCCommandSQL(sqlStr);
    }

    public void insertAMember(String firstName, String lastName, String email)
    {
        String sqlStr = "insert into members (FirstName, LastName, Email) values ('" + firstName + "','" + lastName + "','" + email + "')";
        dbManager.executeODBCCommandSQL(sqlStr);
    }

    public void deleteAMember(int idx)
    {
        String sqlStr = "delete from members where Idx = " + idx;
        dbManager.executeODBCCommandSQL(sqlStr);
    }

    public int getMemberId(String firstName, String lastName, String email)
    {
        String sqlStr = "select Idx from membes where firstName='" + firstName + "' and lastsName='" + lastName + "' and EMail='" + email + "'";
        OdbcDataReader dr = dbManager.executeODBCSQL(sqlStr);
        int ret = -1;
        if (dr.Read())
        {
            ret = dr.GetInt16(0);
        }
        return ret;
    }

    //Currently not used
    public DataSet getAMember1(String st1, String st2)
    {
        String sqlStr = "select members1.First_Name, members1.Last_Name, address.Street1, address.Street2, address.City, address.State, address.Zip," +
            " members1.Email, members1.home_phone, members1.cell_phone" +
            " from members1, address" +
            " where members1.address_id = address.address_id" +
            " and members1.First_Name like '%" + st1 + "%' and members1.Last_Name like '%" + st2 + "%' order by members1.First_Name asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    //MEMBER SEARCH END-------------------------------------------------------

    //ALPHABET MEMBER SEARCH START-------------------------------------------------------
    public DataSet getAlphabetMembers(String st1)
    {
        String sqlStr;
        if (this.membersShortList)
            sqlStr = "select FirstName, LastName, EMail from members where FirstName like '" + st1 + "%' order by FirstName asc";
        else
            sqlStr = "select FirstName, LastName, Address, Apt, City, ST, ZIP, EMail, " +
            "Home, Cel from members where FirstName like '" + st1 + "%' order by FirstName asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getAlphabetMembersWithId(String st1)
    {
        String sqlStr = "select Idx, FirstName, LastName, Address, Apt, City, ST, ZIP, EMail, " +
            "Home, Cel from members where FirstName like '" + st1 + "%' order by FirstName asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    //Currently not used
    public DataSet getAlphabetMembers1(string st1)
    {
        String sqlStr = "select members1.First_Name, members1.Last_Name, address.Street1, address.Street2, address.City, address.State, address.Zip," +
            " members1.Email, members1.home_phone, members1.cell_phone" +
            " from members1, address" +
            " where members1.address_id = address.address_id" +
            " and members1.First_Name like '" + st1 + "%' order by members1.First_Name asc";
        //return dbManager.getDataSet(sqlStr);
        return dbManager.getDataSetODBC(sqlStr);
    }

    //ALPHABET MEMBER SEARCH START-------------------------------------------------------

    public bool sendEmailPrideRegistration(String toMail, String toName, String registrationNumber)
    {
        //String toMail, String toName -> runner's information
        try
        {
            string SERVER = "relay-hosting.secureserver.net";
            MailMessage oMail = new MailMessage();
            oMail.From = new MailAddress("vp@eastbayfrontrunners.org");
            oMail.To.Add(new MailAddress(@toMail));
            oMail.Subject = "EBFRW 2012 Pride Run Registration Confirmation"; // "Test email subject";
            oMail.IsBodyHtml = true; // enumeration
            oMail.Priority = MailPriority.High; // enumeration
            
            oMail.Body = "<html><body>" +
                "Hi " + toName + ", <br><br>" +
                "Thank you for registering for the 2012 8th Annual East Bay Pride Run! <br><br>" +
                "Your registration number is:<b>" + registrationNumber + "</b><br><br>" +
                "Race day is Saturday, October 13, 2012, 9AM. <br><br>" +
                "Bib numbers will <b>NOT</b> be mailed to runners.  You can pick up your bib number and running socks on " +
                "race morning prior to the start.<br><br>" +
                "We look forward to seeing you at beautiful Lake Merritt in Oakland in October! <br><br>" +
                "Thanks again for participating and supporting our four charities: East Bay Gay Men's chorus, Running for a better Oakland," +
                "The Pacific Center in Berkeley, and the Midway and Shelter in Alameda. <br><br>" +
                "For more information please visit our website at:  www.eastbayfrontrunners.org." +
            "</body></html>";

            SmtpClient sC = new SmtpClient(SERVER);
            sC.EnableSsl = false;
            sC.Send(oMail);
            oMail = null; // free up resources
            return true;
        }
        catch (Exception ex)
        {
            this.exceptionValue = ex.ToString();
            return false;
        }
    }

    public bool sendEmailPridePayment(String toMail, String toName)
    {
        //String toMail, String toName -> runner's information
        try
        {
            string SERVER = "relay-hosting.secureserver.net";
            MailMessage oMail = new MailMessage();
            oMail.From = new MailAddress("vp@eastbayfrontrunners.org");
            oMail.To.Add(new MailAddress(@toMail));
            oMail.Subject = "EBFRW 2012 Pride Run Payment Confirmation"; // "Test email subject";
            oMail.IsBodyHtml = true; // enumeration
            oMail.Priority = MailPriority.High; // enumeration

            oMail.Body = "<html><body>" +
                "Hi " + toName + ", <br><br>" +
                "We have received your payment information for your EBFRW 2012 Pride Run registration <br><br>" +
                "Race day is Saturday, October 13, 2012, 9AM. <br><br>" +
                "Bib numbers will <b>NOT</b> be mailed to runners.  You can pick up your bib number and goodie bag on " +
                "race morning prior to the start.<br><br>" +
                "We look forward to seeing you at beautiful Lake Merritt in Oakland in October! <br><br>" +
                "Thanks again for participating and supporting our four charities: East Bay Gay Men's Chorurs, Running for a better Oakland," +
                "The Pacific Center in Berkeley, and the Midway Shelter in Alameda. <br><br>" +
                "For more information please visit our website at:  www.eastbayfrontrunners.org." +
            "</body></html>";

            SmtpClient sC = new SmtpClient(SERVER);
            sC.EnableSsl = false;
            sC.Send(oMail);
            oMail = null; // free up resources
            return true;
        }
        catch (Exception ex)
        {
            this.exceptionValue = ex.ToString();
            return false;
        }
    }

    public bool sendEmail(String ccMail, String ccName, String toMail, String toName, String toPhone, String subjectText, String bodyText)
    {
        try
        {
            string SERVER = "relay-hosting.secureserver.net";
            MailMessage oMail = new MailMessage();
            oMail.From = new MailAddress("vp@eastbayfrontrunners.org");
            oMail.To.Add(new MailAddress(@"ebfrw@yahoo.com"));
            oMail.Subject = subjectText; // "Test email subject";
            oMail.IsBodyHtml = true; // enumeration
            oMail.Priority = MailPriority.High; // enumeration
            oMail.Body = bodyText; //"Sent at: " + DateTime.Now + "rn " + "hello world!";

            oMail.Body = "<html><body>" +
                "<font size=\"3\" face=\"verdana\" color=\"#AA0078\">NAME:</font>" + toName + "<br>" +
                "<font size=\"3\" face=\"verdana\" color=\"#AA0078\">EMAIL:</font>" + toMail + "<br>" +
                "<font size=\"3\" face=\"verdana\" color=\"#AA0078\">PHONE:</font>" + toPhone + "<br>" +
                "<font size=\"3\" face=\"verdana\" color=\"#AA0078\">MESSAGE:</font>" + "<br>" +
                bodyText + 
            "</body></html>";

          /*oMail.Body  = "<html><body>" +
            "<Table border=\"1\">" +
            "<tr>" +
                "<td bgcolor=\"#F1F0FF\">" + "<font size=\"5\" face=\"verdana\" color=\"#AA0078\">NAME</font>" + "</td>" + 
                "<TD>" + toName + "</TD>" +
            "</tr>" +
            "<tr>" +
                "<td bgcolor=\"#AA0078\">" + "<font size=\"5\" face=\"verdana\" color=\"#AA0078\">EMAIL</font>" + "</td>" +
                "<TD>" + toMail + "</TD>" +
            "</tr>" +
            "<tr>" +
                "<td bgcolor=\"#F1F0FF\">" + "<font size=\"5\" face=\"verdana\" color=\"#AA0078\">PHONE</font>" + "</td>" +
                "<TD>" + toPhone + "</TD>" +
            "</tr>" +
            "<tr>" +
                "<td bgcolor=\"#F1F0FF\">" + "<font size=\"5\" face=\"verdana\" color=\"#AA0078\">MESSAGE</font>" + "</td>" +
                "<TD>" + bodyText + "</TD>" +
            "</tr>" + 
            
            "</table></body></html>" ;*/

            
            SmtpClient sC = new SmtpClient(SERVER);
            // sC.Port = 25;
            // NetworkCredential nc = new NetworkCredential(“doesn not need this”, “password”);
            // sC.Credentials = nc;
            sC.EnableSsl = false;
            // Attachment att = new Attachment(“Hello World!”);
            //ContentType contentType = new ContentType();
            
            //contentType.MediaType = MediaTypeNames.Application.Octet;
            //contentType.Name = “xml.xml”;
        //oMail.Attachments.Add(Attachment.CreateAttachmentFromString(“test”,contentType));
            // oMail.Attachments.Add(new Attachment( “Test”) );
            // sC.Port = 587;
            // sC.Credentials = new NetworkCredential(“YahooId”, “Yahoo Password”);
            //sC.EnableSsl = true;

            // SmtpMail.SmtpServer = SERVER;
            // SmtpMail.Send(oMail);

            sC.Send(oMail);

            oMail = null; // free up resources
            return true;
        }
        catch (Exception ex)
        {
            this.exceptionValue = ex.ToString();
            return false;
        }
    }

    public bool sendEmailWorkedjustnow(String ccMail, String ccName, String toMail, String toName, String subjectText, String bodyText)
    {
     

        string SERVER = "relay-hosting.secureserver.net";
        MailMessage oMail = new MailMessage();
        oMail.From = new MailAddress("vp@eastbayfrontrunners.org");
        oMail.To.Add(new MailAddress(@"jovinoribeiro@pacbell.net"));
        oMail.Subject = subjectText; // "Test email subject";
        oMail.IsBodyHtml = true; // enumeration
        oMail.Priority = MailPriority.High; // enumeration
        oMail.Body = bodyText; //"Sent at: " + DateTime.Now + "rn " + "hello world!";

        SmtpClient sC = new SmtpClient(SERVER);
        // sC.Port = 25;
        // NetworkCredential nc = new NetworkCredential(“doesn not need this”, “password”);
        // sC.Credentials = nc;
        sC.EnableSsl = false;
        // Attachment att = new Attachment(“Hello World!”);
        //ContentType contentType = new ContentType();
        //contentType.MediaType = MediaTypeNames.Application.Octet;
        //contentType.Name = “xml.xml”;

//oMail.Attachments.Add(Attachment.CreateAttachmentFromString(“test”,contentType));
// oMail.Attachments.Add(new Attachment( “Test”) );
// sC.Port = 587;
// sC.Credentials = new NetworkCredential(“YahooId”, “Yahoo Password”);
//sC.EnableSsl = true;

// SmtpMail.SmtpServer = SERVER;
// SmtpMail.Send(oMail);

    sC.Send(oMail);

    oMail = null; // free up resources

//lblerr.Text = “Sent!”;
        
        return true;
    }

    /*
     * Email section
     * cc: email of officer or member support 
     * ccName: name of officer to display on email
     * toMail: email of customer/member submitting email
     * toName: name of customer/member submitting email
     */
    public bool sendEmailFunctioning(String ccMail, String ccName, String toMail, String toName, String subjectText, String bodyText)
    {
        //Get proper "cc" address 
        //String selectedValue = this.toDropDownList.SelectedItem.Value;
        //String cc = this.getToAddressEmail(selectedValue);
        //cc = "runnerinoakjr@sbcglobal.net";

        //Default sender
        String fromEmail = "runnerinoakjr@sbcglobal.net";
        fromEmail = "vp@eastbayfrontrunners.org";
        String fromName = "EBFRW-Message Center";

        SmtpClient smtpClient = new SmtpClient();
        MailMessage message = new MailMessage();

        try
        {
            //Eventually update this to EBFRW information :)
            smtpClient.Host = "smtpout.secureserver.net";
            //smtpClient.Credentials = new System.Net.NetworkCredential("jovino@jovinorun.com", "tim052982");
            smtpClient.Credentials = new System.Net.NetworkCredential("vp@eastbayfrontrunners.org", "hello1");
            smtpClient.Port = 3535;
            smtpClient.EnableSsl = false;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            //Set up the FROM information - use the same for now
            MailAddress fromAddress = new MailAddress(fromEmail, fromName);
            message.From = fromAddress;

            //Set up the TO information - note: ccMail = ebfrw@yahoo.com
            MailAddress toAddress = new MailAddress("vp@eastbayfrontrunners.org", toName);
            message.To.Add(toAddress);

            //set up the CC information - send to myself, so a EBFRW user can reply to member
            MailAddress ccAddress = new MailAddress("vp@eastbayfrontrunners.org", ccName);
            //message.CC.Add(ccAddress);

            //Set up the SUBJECT
            message.Subject = subjectText;

            //Set up the BODY
            message.Body = bodyText;
            message.IsBodyHtml = false;

            //Send message
            smtpClient.Send(message);

            //it was succesful,
            return true;
        }
        catch (Exception ex)
        {
            this.exceptionValue = ex.ToString();
            return false;
        }
    }



    public string getException()
    {
        return exceptionValue;
    }

    public void createNewRunnerActive(String firstName, string LastName, String dob, string email, string phone, String address1,
        String address2, String city, String state, String zip)
    {
        //int nextMemberIndex = getNextMemberIndex();

        //(" + columns + ") VALUES

        //"insert into orders (" + columns + ") VALUES(" +

        String columns = "FIRST_NAME, LAST_NAME, DOB, EMAIL, PHONE, ADDRESS1, ADDRESS2, CITY, STATE, ZIP";

        String sqlStr = "insert into active_runners ( " + columns + ") values ('" + firstName + "' , '" + LastName + "' , '" +
            dob + "' , '" + email + "' , '" + phone + "' , '" + address1 + "' , '" + address2 + "' , '" + city + "' , '" + state +
            "' , '" + zip + "')";
        dbManager.executeODBCCommandSQL(sqlStr);

        dbManager.closeOdbcConnection();
    }


    //Processing of Pride Run
    public void createNewRunner(String firstName, string LastName, String dob, string email, string phone, String address1, 
        String address2, String city, String state, String zip)
    {
        //int nextMemberIndex = getNextMemberIndex();

        //(" + columns + ") VALUES

        //"insert into orders (" + columns + ") VALUES(" +

        String columns = "FIRST_NAME, LAST_NAME, DOB, EMAIL, PHONE, ADDRESS1, ADDRESS2, CITY, STATE, ZIP";

        String sqlStr = "insert into runners ( " + columns + ") values ('" + firstName + "' , '" + LastName + "' , '" + 
            dob + "' , '" + email + "' , '" + phone + "' , '" + address1 + "' , '" + address2 + "' , '" + city + "' , '" + state +
            "' , '" + zip + "')";

        dbManager.executeODBCCommandSQL(sqlStr);

//        int retId = dbManager.getLastInsertId();

        dbManager.closeOdbcConnection();

        //return retId;
    }

    public int getRunnerIdActive(String firstName, String lastName, String birthday)
    {
        String sqlStr = "select runner_id from active_runners where FIRST_NAME = '" + firstName + "' and LAST_NAME = '" + lastName + "' and " +
            "DOB = '" + birthday + "'";
        OdbcDataReader dr = dbManager.executeODBCSQL(sqlStr);
        int ret;

        if (dr.Read())
        {
            ret = dr.GetInt16(0);
        }
        else
            ret = 0;

        dbManager.closeOdbcConnection();
        return ret;
    }

    public int getRunnerId(String firstName, String lastName, String birthday)
    {
        String sqlStr = "select runner_id from runners where FIRST_NAME = '" + firstName + "' and LAST_NAME = '" + lastName + "' and " +
            "DOB = '" + birthday + "' order by runner_id desc";
        OdbcDataReader dr = dbManager.executeODBCSQL(sqlStr);
        int ret;
        if (dr.Read())
        {
            ret = dr.GetInt16(0);
        }
        else
            ret = 0;
        dbManager.closeOdbcConnection();
        return ret;
    }

    public Boolean isRunnerInActivePrideRunOrder(String runnerId)
    {
        String sqlStr = "select order_id from active_pride_run_order where runner_id = " + runnerId;
        OdbcDataReader dr = dbManager.executeODBCSQL(sqlStr);
        Boolean hasRow = dr.HasRows;
        dbManager.closeOdbcConnection();
        return hasRow;
    }

    public void createNewEventOrderActive(String order_id, String raceId, String runnerId, String gen_id)
    {
        String columns = "ORDER_ID, RC_ID, RUNNER_ID, GEN_ID";

        String sqlStr = "insert into active_pride_run_order ( " + columns + ") values ('" + order_id + "' , '" + raceId + "' , '" + runnerId + "' , '" +  gen_id + "')";

        dbManager.executeODBCCommandSQL(sqlStr);

        dbManager.closeOdbcConnection();

    }

    public String getTotalDonation()
    {
        string sqlStr = "SELECT sum(donation_amount) FROM pride_donation";

        OdbcDataReader dr = dbManager.executeODBCSQL(sqlStr);

        if (dr.Read()) {
            return dr.GetString(0);
        } else  {
            return "0";
        }
    }

    public void insertDonation(string firstName, string lastName, string email, double donation_amount)
    {
        string columns = "FIRST_NAME, LAST_NAME, EMAIL, DONATION_AMOUNT";

        string sqlStr = "insert into pride_donation ( " + columns  + ") values ('" + firstName + "' , '" + lastName + "' , '" +
            email + "' , '" + donation_amount + "')";

        dbManager.executeODBCCommandSQL(sqlStr);

        dbManager.closeOdbcConnection();        
    }

    public void createNewEventOrder(int raceId, int runnerId, int gen_id, String waiver, String howHeard, double donation_amount)
    {
        String columns = "RC_ID, RUNNER_ID, GEN_ID, WAIVER, ORDER_DATE, ORDER_STATUS, HOW_HEARD, DONATION_AMOUNT";

        String sqlStr = "insert into pride_run_order ( " + columns + ") values (" + raceId + " , " + runnerId + " , " +
            gen_id + " , '" + waiver + "' , '" + DateTime.Now.ToShortDateString() + "' , '" + "Pending" + "' , '" + 
            howHeard + "' , '" + donation_amount + "')";

        dbManager.executeODBCCommandSQL(sqlStr);
        //int orderId = dbManager.getLastInsertId();
        dbManager.closeOdbcConnection();
        //return orderId;
    }

    public int getRegistrationId(int runnerId)
    {
        String sqlStr = "select order_id from pride_run_order where runner_id =" + runnerId;
        OdbcDataReader dr = dbManager.executeODBCSQL(sqlStr);
        int ret;
        if (dr.Read())
        {
            ret = dr.GetInt16(0);
        }
        else
            ret = 0;

        dbManager.closeOdbcConnection();
        return ret;
    }


    //ALBUM STUFF RELATED
    public OdbcDataReader getPhotosForAlbum(int albumId)
    {
        String sqlStr = "select file_name, description from photo where photo_id in";
        sqlStr += "(select photo_id from photo_gallery where album_id = " + albumId.ToString() + ")";
        OdbcDataReader dr = dbManager.executeODBCSQL(sqlStr);
        return dr;
    }
    public DataSet getAllPhotos(int albumId)
    {
        String sqlStr = "select * from photo where photo_id in";
        sqlStr += "(select photo_id from photo_gallery where album_id = " + albumId.ToString() + ")";
        return dbManager.getDataSetODBC(sqlStr);
    }

    //Returns a list of all albums
    //Caller must process this result
    public OdbcDataReader getAlbums()
    {
        String sqlStr = "select * from album";
        return dbManager.executeODBCSQL(sqlStr);
    }
    public DataSet getAllAlbums()
    {
        string sqlStr = "select * from album";
        return dbManager.getDataSetODBC(sqlStr);
    }
    public DataSet getAlbumById(int id)
    {
        string sqlStr = "select * from album where album_id = " + id.ToString();
        return dbManager.getDataSetODBC(sqlStr);
    }

    public void createNewAlbum(string albumName, string albumDescription)
    {
        string sqlStr = "insert into album (ALBUM_NAME, DESCRIPTION) values ('" + albumName + "' , '" + albumDescription + "')";
        dbManager.executeODBCCommandSQL(sqlStr);
    }

    public void removeAlbum(int id)
    {
        String sqlStr = "delete from album where album_id = '" + id + "'";
        dbManager.executeODBCCommandSQL(sqlStr);
    }

    public void updateAlbum(int albumId, string name, string description)
    {
        string sqlStr = "update album set album_name = '" + name + "', description = '" + description + "' where album_id = " + albumId;
        dbManager.executeODBCCommandSQL(sqlStr);
    }

    //END OF ALBUM RELATED STUFF

    public void truncateEventEntry()
    {
        String sqlStr = "TRUNCATE TABLE event_entry";
        dbManager.executeODBCSQL(sqlStr);
        dbManager.closeOdbcConnection();
    }

    public OdbcDataReader getAllActivePrideRunOrdersODBC()
    {
        //String sqlStr = "select race_category.rc_id, active_runners.runner_id, gender.gen_id from active_pride_run_order " +
        //"join active_runners on active_runners.runner_id = active_pride_run_order.runner_id " +
        //"join race_category on race_category.rc_id = active_pride_run_order.rc_id " +
        //"join gender on gender.gen_id = active_pride_run_order.gen_id order by order_id asc";

        String sqlStr = "select race_category.rc_id, runners.runner_id, gender.gen_id from active_pride_run_order " +
"join runners on runners.runner_id = active_pride_run_order.runner_id " +
"join race_category on race_category.rc_id = active_pride_run_order.rc_id " +
"join gender on gender.gen_id = active_pride_run_order.gen_id order by order_id asc";

        return dbManager.executeODBCSQL(sqlStr);
    }

    public OdbcDataReader getAllPrideRunOrdersODBC()
    {
        String sqlStr = "select race_category.rc_id, runners.runner_id, gender.gen_id from pride_run_order " +
        "join runners on runners.runner_id = pride_run_order.runner_id " +
        "join race_category on race_category.rc_id = pride_run_order.rc_id " +
        "join gender on gender.gen_id = pride_run_order.gen_id order by order_id asc";
        return dbManager.executeODBCSQL(sqlStr);
    }

    public DataSet getAllEventEntries(String year)
    {
        String sqlStr = "select event_entry.eve_id, event_entry.eve_year, race_category.rc_desc, gender.gen_desc, runners.first_name, runners.last_name, " +
        "runners.dob, runners.email, runners.phone, runners.address1, runners.address2, runners.city, runners.state, runners.zip, event_entry.bib " +
        "from event_entry " +
        "join runners on runners.runner_id = event_entry.runner_id " +
        "join race_category on race_category.rc_id = event_entry.rc_id " +
        "join gender on gender.gen_id = event_entry.gen_id " +
        "where eve_year in (" + year + " , " + "2012 ) order by event_entry.eve_id asc";
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getAllEBFRWEventEntries(String year)
    {
        String cancelled = "Cancelled";
        String sqlStr = "select event_entry.eve_id, event_entry.eve_year, race_category.rc_desc, gender.gen_desc, runners.first_name, runners.last_name, " +
        "runners.dob, runners.email, runners.phone, runners.address1, runners.address2, runners.city, runners.state, runners.zip, event_entry.bib, " +
        "pride_run_order.order_status " +
        "from event_entry " +
        "join runners on runners.runner_id = event_entry.runner_id " +
        "join race_category on race_category.rc_id = event_entry.rc_id " +
        "join gender on gender.gen_id = event_entry.gen_id " +
        "join pride_run_order on pride_run_order.runner_id = event_entry.runner_id " +
        "where eve_year in (" + year + " , " + "2012 ) and pride_run_order.order_status <> " + "'" + cancelled + "'" + " order by event_entry.eve_id asc";
        //"where eve_year in (" + year + " , " + "2012 ) order by event_entry.eve_id asc";
        return dbManager.getDataSetODBC(sqlStr);
    }

    public void insertEventEntry(String eve_year, int rc_id, int runner_id, int gen_id)
    {
        String sqlStr = "insert into event_entry (eve_year, rc_id, runner_id, gen_id) values (" +
        eve_year + "," + rc_id + "," + runner_id + "," + gen_id + ")";
        dbManager.executeODBCSQL(sqlStr);
        dbManager.closeOdbcConnection();
    }

    public DataSet getAllPrideRunOrders()
    {
        String sqlStr = "select order_id, order_status, order_date, payment_date, payment_type, rc_desc, gen_desc, first_name, last_name, dob, email, phone, address1, address2, " +
        "city, state, zip,waiver from pride_run_order " +
        "join runners on runners.runner_id = pride_run_order.runner_id " +
        "join race_category on race_category.rc_id = pride_run_order.rc_id " +
        "join gender on gender.gen_id = pride_run_order.gen_id " +
        "where race_year = 2012 order by order_id asc";
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getAllDonations()
    {
        string sqlStr = "select * from pride_donation order by idx asc";
        return dbManager.getDataSetODBC(sqlStr);
    }

    public DataSet getPrideRunOrderSummary()
    {
        string sqlStr = "select rc.rc_desc, g.gen_desc, count(r.order_id) as totalOrders from pride_run_order r, " +
        " race_category rc, gender g " +
        " where r.race_year = 2012 and r.gen_id in (1, 2) and r.order_status <> 'Cancelled'" +
        " and rc.rc_id = r.rc_id " +
        " and r.gen_id = g.gen_id " +
        " group by r.rc_id, r.gen_id";

        return dbManager.getDataSetODBC(sqlStr);
    }

    public String getTotalNumberOfRegistered()
    {
        String sqlStr = "select count(*) from pride_run_order where race_year = 2012 and order_status <> 'Cancelled'";
        OdbcDataReader dr = dbManager.executeODBCSQL(sqlStr);
        if (dr.Read())
        {
            return dr.GetString(0);
        }
        else
        {
            return "";
        }

    }

    public DataSet getPrideRunOrdersByStatus(String status)
    {
        String sqlStr = "select order_id, order_status, order_date, payment_date, payment_type, rc_desc, gen_desc, first_name, last_name, dob, email, phone, address1, address2, " +
        "city, state, zip,waiver from pride_run_order " +
        "join runners on runners.runner_id = pride_run_order.runner_id " +
        "join race_category on race_category.rc_id = pride_run_order.rc_id " +
        "join gender on gender.gen_id = pride_run_order.gen_id " +
        "where pride_run_order.order_status = '" + status + "' " +
        "and race_year = 2012 order by order_id asc";
        return dbManager.getDataSetODBC(sqlStr);
    }

    public int getCategoryId(string category)
    {
        String sqlStr = "select rc_id from race_category where rc_desc = '" + category + "'";
        OdbcDataReader dr = dbManager.executeODBCSQL(sqlStr);
        int ret;

        if (dr.Read())
        {
            ret = dr.GetInt16(0);
        }
        else
            ret = 0;
        dbManager.closeOdbcConnection();

        return ret;
    }

    public int getGenderId(string gender)
    {
        String sqlStr = "select gen_id from gender where gen_desc = '" + gender + "'";
        OdbcDataReader dr = dbManager.executeODBCSQL(sqlStr);
        int ret;
        if (dr.Read())
        {
            ret = dr.GetInt16(0);
        }
        else
            ret = 0;
        dbManager.closeOdbcConnection();
        return ret;
    }

    public void updateOrderStatus(int orderId, String status)
    {
        String sqlStr = "update pride_run_order set order_status='" + status + "' where order_id =" + orderId;
        dbManager.executeODBCCommandSQL(sqlStr);
        dbManager.closeOdbcConnection();
    }

    public void updateOrder(int orderId, String status, String paymentDate, String paymenTtype)
    {
        String sqlStr = "";
        if (status.Equals(""))
        {
            sqlStr = "update pride_run_order set payment_date='" + paymentDate + "', payment_type='" +
            paymenTtype + "' where order_id=" + orderId;
        }
        else
        {
            sqlStr = "update pride_run_order set order_status='" + status + "', payment_date='" + paymentDate + "', payment_type='" +
                paymenTtype + "' where order_id=" + orderId;

        }
            dbManager.executeODBCCommandSQL(sqlStr);
            dbManager.closeOdbcConnection();
    }

    public void addDocument(string docType, string year, string dateSeason, string fileName)
    {
        string sqlStr = "insert into DOCUMENTS (DOC_TYPE, YEAR, DATE_SEASON, FILE_NAME) VALUES ('" + docType + "','" + year + "','" + dateSeason + "','" + fileName + "')";
        dbManager.executeODBCCommandSQL(sqlStr);
    }

    public DataSet getDocumentsDataSet(string docType)
    {
        string sqlStr = "select * from documents where doc_type = '" + docType + "' order by year desc";
        return dbManager.getDataSetODBC(sqlStr);
    }

    public OdbcDataReader getDocuments(String docType)
    {
        string sqlStr = "select * from documents where doc_type = '" + docType + "' order by year desc, date_season asc";
        return dbManager.executeODBCSQL(sqlStr);
    }

    public String getNextRun()
    {
        DateTime today = DateTime.Now;

        today = today.AddDays(7);

        String s = today.Year + "-" + today.Month +"-" + today.Day + "";

        return s + "|" + ((today.Day / 7) + 1).ToString();

    }

    
}