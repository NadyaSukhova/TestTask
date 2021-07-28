<html>
<cfinclude template="default.cfm"> 
<cflogin> 
<cfset roles = "user"> 
<cfloginuser name = "#Form.login#" password = "#Form.password#" 
roles = "#roles#"/> 
</cflogin>
  <h1  style = " text-align: center; font-size: 30; color: #ffffff; padding-top: 10%;">Добро пожаловать!</h1>
<p  style = " text-align: center; font-size: 20; color: #ffffff;">
    <cfoutput> 
Вы вошли под логином '#Form.login#'.</cfoutput> </p>
</html>