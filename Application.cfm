<cfapplication sessionmanagement="true"
               setclientcookies="yes" 
               name="newland_tours" 
               sessionTimeout ="#CreateTimeSpan(0, 0, 20, 0)#" 
               datasource = "testbd"
               loginStorage = "session">