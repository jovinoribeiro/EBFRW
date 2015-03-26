using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Data.Odbc;

/// Summary description for DBManager
public class DBManager
{
    private bool productionMode = false;

    private OdbcConnection odbcCon;
    private OdbcCommand odbcCommand;

    private void openOdbcConnection()
    {
        String connectionString;

        if (productionMode)
        {
            connectionString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=ebfrontrunners.db.8008114.hostedresource.com; PORT=3306; DATABASE=ebfrontrunners; USER=ebfrontrunners; PASSWORD=Running1s!un; OPTION=0;";
        }
        else
        {
            connectionString = "Driver={MySQL ODBC 3.51 Driver};Server=localhost;Database=frontrunners;Uid=15secs;Pwd=password";
           // connectionString = "Driver={MySQL ODBC 3.51 Driver};Server=localhost;Database=frontrunners;Uid=root;Pwd=TIM052982";
        }
        odbcCon = new OdbcConnection(connectionString);
        odbcCon.Open();
        odbcCommand = odbcCon.CreateCommand();
    }

    public void closeOdbcConnection()
    {
        this.odbcCon.Close();
    }

    public OdbcDataReader executeODBCSQL(String sqlStr)
    {
        openOdbcConnection();
        odbcCommand.CommandText = sqlStr;
        return odbcCommand.ExecuteReader();
    }

    public DataSet getDataSetODBC(string sqlStr)
    {
        openOdbcConnection();
        OdbcDataAdapter myDA = new OdbcDataAdapter(sqlStr, odbcCon);  //new MySqlDataAdapter(sqlStr, connection);
        DataSet myDateSet = new DataSet();
        myDA.Fill(myDateSet);
        closeOdbcConnection();
        return myDateSet;
    }

    public void executeODBCCommandSQL(String sqlStr)
    {
        openOdbcConnection();
        odbcCommand.CommandText = sqlStr;
        odbcCommand.ExecuteNonQuery();
    }

    public int executeODBCCommandSQLAndReturnIds(String sqlStr)
    {
        openOdbcConnection();
        odbcCommand.CommandText = sqlStr;
        odbcCommand.ExecuteNonQuery();
        odbcCommand.ExecuteReader(CommandBehavior.CloseConnection);

        odbcCommand.CommandText = "select LAST_INSERT_ID()";
        OdbcDataReader mdr = odbcCommand.ExecuteReader();
        int id = mdr.GetInt32(0);
        return id;
    }

    

    public int getLastInsertIds()
    {
        //openOdbcConnection();

        odbcCommand.CommandText = "select last_insert_id()";

        OdbcDataReader mdr = odbcCommand.ExecuteReader();

         int id =   mdr.GetInt32(0);
         return id;
       
    }

}