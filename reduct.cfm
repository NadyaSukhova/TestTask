<html>
<cfinclude template="default.cfm"> 
<head>
<title>Insert Data Form</title>
</head>
 <cfif #GetAuthUser()# neq "">
<body>
  <div style = "position: fixed;
                  top: 33%;
                  left: 36%;
                  background-color: rgba(255, 255, 255);
                  padding-bottom: 20px;
                  padding-left: 105px;
                  padding-right: 105px;
                  border-radius: 10%">
<h2 style = " text-align: center; font-size: 30; color: #4e006f; ">Редактирование информации <br>о пользователе</h2>
<cfquery name = "Account"> 
SELECT *
FROM account 
    WHERE login = <cfqueryparam value="#GetAuthUser()#" cfsqltype="cf_sql_varchar">
</cfquery> 
    
<cfscript>
name = Account.name;
surname = Account.surname;


</cfscript>
<table>
<!--- begin html form;
put action page in the "action" attribute of the form tag. --->
<form action="insert_reduct_account.cfm" method="post">
<tr>
<td>Логин:</td>
<td><cfoutput>#GetAuthUser()#</cfoutput></td>
</tr>
<tr>
<td>Введите Имя:</td>
<td><input type="Text" name="name" size="4" maxlength="15" value="<cfoutput>#name#</cfoutput>"></td><tr>
<td>Введите Фамилию:</td>

<td><input type="Text" name="surname" size="4" maxlength="20" value="<cfoutput>#surname#</cfoutput>"></td> 
</tr>
<tr>
<td>Введите новый пароль:</td>
<td><input type="password" name="password1" size="4" maxlength="20"></td><tr>
</tr>
<td>Подтвердите пароль:</td>
<td><input type="password" name="password2" size="4" maxlength="20"></td><tr>
</tr>
<tr>

<td>&nbsp;</td>
    
<cfquery name = "GetLogin" dataSource = "testbd"> 
SELECT *
FROM account 
</cfquery> 
    
<cfscript>
list_all = valueList(GetLogin.login);
msg = serializeJSON(listToArray(list_all,",",true));
</cfscript>


    <script>
        function buttonClicked(){
            var res = <cfoutput>#msg#</cfoutput>;

            if (document.getElementsByName("password1")[0].value == ''){
                alert("Пожалуйста, введите пароль!");
                event.preventDefault();}
            else{
                 if (document.getElementsByName("password2")[0].value == '' || document.getElementsByName("name")[0].value == '' || document.getElementsByName("surname")[0].value == ''){
                      alert("Пожалуйста, заполните все поля!");
                event.preventDefault();}
                else{
                 var password1 = document.getElementsByName("password1")[0].value;
                 var password2 = document.getElementsByName("password2")[0].value;
                 if (password1 != password2){
                    alert("Пароли не совпадают!");
                    event.preventDefault();}
            }}
           
        }
    </script>

<td><input type="Submit" value="Подтвердить" onclick="buttonClicked()" style = "font-size: 18; background:rgb(158,158,243); color:white; border: none">&nbsp;
    <input type="Reset" value="Очистить" style = "font-size: 18; background:rgb(158,158,243); color:white; border: none"></td>

</form>
</table>
      </div>
</body>
    <cfelse>
    <h2 style = " text-align: center; font-size: 30; color: #ffffff; padding-top: 10%">Простите!</h2>
<p  style = " text-align: center; font-size: 20; color: #ffffff;"> Вы не можете отредактировать профиль, не войдя в систему.</p>
 </cfif> 
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