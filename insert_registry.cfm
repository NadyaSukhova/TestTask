<html>
    <cfinclude template="default.cfm"> 
<head>
<title>Input form</title>
</head>
    
<body>
<!--- If the Contractor check box is clear), set the value of the Form.Contract
to "No" --->

<!--- Insert the new record --->

<cfquery name="AddUser">
    INSERT INTO account
    VALUES ('#Form.login#', '#Form.name#',
    '#Form.surname#', '#Form.password1#')
</cfquery>
    
 <h2 style = " text-align: center; font-size: 30; color: #ffffff; padding-top: 10%">Поздравляем с регистрацией!</h2>
<p  style = " font-size: 20; color: #ffffff; text-align: center"><cfoutput>Пользователь #Form.surname# #Form.name# зарегестрирован!
    </cfoutput></p>
    
    

</body>
</html>

