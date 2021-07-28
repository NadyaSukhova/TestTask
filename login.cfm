<html>
<cfinclude template="default.cfm"> 
<head>
<title>Insert Data Form</title>
</head>

<body>

  <div style = "position: fixed;
                  top: 33%;
                  left: 38%;
                  background-color: rgba(255, 255, 255);
                  padding-bottom: 20px;
                  padding-left: 105px;
                  padding-right: 105px;
                  border-radius: 10%">
<h2 style = " text-align: center; font-size: 30; color: #4e006f; ">Вход</h2>
<table>
<!--- begin html form;
put action page in the "action" attribute of the form tag. --->
<form action="2.cfm" method="post">
<tr>
<td>Введите логин:</td>
<td><input type="Text" name="login" size="4" maxlength="80"></td>
</tr>
<tr>
<td>Введите пароль:</td>
<td><input type="password" name="password" size="4" maxlength="20"></td><tr>
</tr>
<tr>
<td>&nbsp;</td>
    
<cfquery name = "GetLogin"> 
SELECT *
FROM account 
</cfquery> 
<cfscript>
list_login = valueList(GetLogin.login);
list_password = valueList(GetLogin.password);
login = serializeJSON(listToArray(list_login,",",true));
pas = serializeJSON(listToArray(list_password,",",true));
</cfscript>


    <script>
        function buttonClicked(){
            var res = <cfoutput>#login#</cfoutput>;
            var res2 = <cfoutput>#pas#</cfoutput>;
            var login = document.getElementsByName("login")[0].value;
            var password = document.getElementsByName("password")[0].value;
            if (!(res.includes(login))) {
                alert("Данные не верны!");
                event.preventDefault();}
            else{
                if (res2[res.indexOf(login)] != password){
                     alert("Данные не верны!");
                event.preventDefault();
                }
            }
           
        }
    </script>
<tr></tr>
<td><input type="Submit" value="Подтвердить" onclick="buttonClicked()" style = "font-size: 18; background:rgb(158,158,243); color:white; border: none">&nbsp;
    <input type="Reset" value="Очистить" style = "font-size: 18; background:rgb(158,158,243); color:white; border: none"></td>

</form>
</table>
    </div>
</body>
</html>




<script>
    function readLine(file) {
    var output = false;
    $.ajax({
        url: file,
        success: function(data) {
            output = data.split("\n");       // для проверки выведем в консоль, что получилось
        }
    });
    return output;
}
</script>