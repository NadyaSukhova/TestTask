<html>
<cfinclude template="default.cfm"> 
<head>
<style>
    
    td{
        
        font-size: 15;
        padding-top: 10px;
    }
    input{
        
        font-size: 15
    } 
    input{
        
        font-size: 15
    } 
     select{
        
        font-size: 15
    }
    textarea{
        
        font-size: 15
    }
</style>
<title>Insert Data Form</title>
</head>

<body>
 <div style = "position: fixed;
                  top: 33%;
                  left: 38%;
                  background-color: rgba(255, 255, 255);
                  padding-bottom: 20px;
                  padding-left: 104.5px;
                  padding-right: 104.5px;
                  border-radius: 8.3%">
<h2 style = " text-align: center; font-size: 30; color: #4e006f; ">Регистрация</h2>

<table>
<!--- begin html form;
put action page in the "action" attribute of the form tag. --->
<form action="insert_registry.cfm" method="post">
<tr>
<td>Введите логин:</td>
<td><input type="Text" name="login" size="4" maxlength="80"></td>
</tr>
<tr>
<td>Введите Имя:</td>
<td><input type="Text" name="name" size="4" maxlength="15"></td><tr>
<td>Введите Фамилию:</td>

<td><input type="Text" name="surname" size="4" maxlength="20"></td> 
</tr>
<tr>
<td>Введите пароль:</td>
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
            var login = document.getElementsByName("login")[0].value;
            if (res.includes(login)){
                alert("Данный логин уже занят!");
                event.preventDefault();}
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