<html>
    <cfinclude template="default.cfm"> 
<head>
<title>Input form</title>
</head>
    
<body>
<!--- If the Contractor check box is clear), set the value of the Form.Contract
to "No" --->

<!--- Insert the new record --->

<cfquery name="UpdateAccount" >
UPDATE account
SET name = '#Form.name#', 
    surname = '#Form.surname#', 
    password = '#Form.password1#'
WHERE login = <cfqueryparam value="#GetAuthUser()#" cfsqltype="cf_sql_varchar">
</cfquery> 

  <h2 style = " text-align: center; font-size: 30; color: #ffffff; padding-top: 10%">Информация о пользователе обновлена. </h2>
<p  style = " font-size: 20; color: #ffffff; text-align: center"><cfoutput>Пользователь под логином '#GetAuthUser()#' изменил данные о себе.
    </cfoutput></p>
   
    

</body>
</html>

