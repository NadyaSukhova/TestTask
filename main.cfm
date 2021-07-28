<html>
<cfinclude template="default.cfm"> 
<head>
<title>Insert Data Form</title>
</head>

<body>
    
     <cfif #GetAuthUser()# neq "">
        <h2 style = " text-align: center; font-size: 30; color: #ffffff; padding-top: 10%"><cfoutput>Добро пожаловать, #GetAuthUser()#!</cfoutput></h2>
         <p  style = " font-size: 20; color: #ffffff; text-align: center">Вы используете прототип системы учета ошибок, обнаруженных в процессе
    тестирования программного обеспечения.</p>
    <cfelse>
            <h2 style = " text-align: center; font-size: 30; color: #ffffff; padding-top: 10%"><cfoutput>Добро пожаловать!</cfoutput></h2>
        <p  style = " font-size: 20; color: #ffffff; text-align: center">Для работы с прототипом системы учета ошибок, обнаруженных в процессе
    тестирования программного обеспечения, войдите в систему.</p>
    </cfif>
         
         
    

    </body>
</html>