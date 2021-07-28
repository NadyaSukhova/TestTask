<html>
<cfinclude template="default.cfm"> 
<head>
<title>Insert Data Form</title>
</head>
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

 <cfif #GetAuthUser()# neq "">
     <body style=" color: black">
    <div style = "position: fixed;
                  top: 33%;
                  left: 38%;
                  background-color: rgba(255, 255, 255);
                  padding-bottom: 20px;
                  padding-left: 50px;
                  padding-right: 50px;
                  border-radius: 7%">
<h2 style = " text-align: center; font-size: 30; color: #4e006f; ">Опишите ошибку</h2>
     <br>
<table style ="font-size: 25">
<!--- begin html form;
put action page in the "action" attribute of the form tag. --->
<form action="insert_action.cfm" method="post" >
<tr>
<td >Номер:</td>
<td><input type="Text" name="id" size="4" maxlength="4" style =" "></td>
</tr>
<tr>
<td>Дата выхода:</td>
<td><input type="date" name="date" size="4" ></td><tr>
<td>Пользователь:</td>
<td><cfoutput>#GetAuthUser()#</cfoutput></td>
</tr>
<tr>
<td>Короткое описание:</td>
<td><textarea name="short_description" ></textarea></td>
</tr>
<tr>
<td>Подробное описание:</td>
<td><textarea name="long_description" ></textarea></td>
</tr>
<tr>
<td>Статус:</td>
<td><select name="status" id = "status" >
    <option value = "1">Новая</option>
    <option value = "2">Открытая</option>
    <option value = "3">Решенная</option>
    <option value = "4">Закрытая</option>
</select></td>
</tr>
<tr>
<td>Срочность:</td>
<td><select name="urgency" >
    <option value = "1">Очень срочно</option>
    <option value = "2">Срочно</option>
    <option value = "3">Несрочно</option>
    <option value = "4">Совсем несрочно</option>
</select></td>
</tr>
<tr>
<td>Критичность:</td>
<td><select name="criticality" >
    <option value = "1">Авария</option>
    <option value = "2">Критичная</option>
    <option value = "3">Некритичная</option>
    <option value = "4">Запрос на изменение</option>
</select></td>
</tr>
<tr>
<td>&nbsp;</td>
    
<cfquery name = "GetID" dataSource = "testbd"> 
SELECT *
FROM mistake 
</cfquery> 
    
<cfquery name = "GetSolved" dataSource = "testbd"> 
SELECT *
FROM mistake WHERE status = 3
</cfquery> 
    
<cfquery name = "History"> 
SELECT *
FROM history 
</cfquery> 
    
<cfscript>
list_all = valueList(GetID.id);
list_solved = valueList(GetSolved.id);
list_hist1 = valueList(History.id_mistake);         
list_hist2 = valueList(History.date_mistake);
list_hist3 = valueList(History.user_login);         
list_hist4 = valueList(History.date_mistake);
list_hist5 = valueList(History.status_mistake);         
list_hist6 = valueList(History.urgency_mistake);
list_hist7 = valueList(History.criticality_mistake);         
list_hist8 = valueList(History.short_description_mistake);
list_hist9 = valueList(History.long_description_mistake);
    
    
    
msg = serializeJSON(listToArray(list_all,",",true));
solved = serializeJSON(listToArray(list_solved,",",true));

id_mistake = serializeJSON(listToArray(list_hist1,",",true));
date_mistake = serializeJSON(listToArray(list_hist2,",",true));
user_login = serializeJSON(listToArray(list_hist3,",",true));
date_mistake = serializeJSON(listToArray(list_hist4,",",true));
status_mistake = serializeJSON(listToArray(list_hist5,",",true));
urgency_mistake = serializeJSON(listToArray(list_hist6,",",true));
criticality_mistake = serializeJSON(listToArray(list_hist7,",",true));
short_description_mistake = serializeJSON(listToArray(list_hist8,",",true));
long_description_mistake = serializeJSON(listToArray(list_hist9,",",true));


</cfscript>

    <script>
        function buttonClicked(){
            var res = <cfoutput>#msg#</cfoutput>;
            var solved = <cfoutput>#solved#</cfoutput>;
            var status_numb =  document.getElementById("status").value;
            var id = document.getElementsByName("id")[0].value;
            if (res.includes(id) && status_numb == "1"){
                alert("Ошибка с таким номером уже существует!");
                event.preventDefault();}
            
            if (!(res.includes(id)) && (status_numb == "2" || status_numb == "3" || status_numb == "4")){
                alert("Ошибки с таким номером не существует!");
                event.preventDefault();}
            
            if ((!(solved.includes(id)) || solved == "") && status_numb == "4"){
                        alert("Данная задача не была решена");
                event.preventDefault();
                }
                   
           if (document.getElementsByName("short_description")[0].value == '' || document.getElementsByName("long_description")[0].value == '' || document.getElementsByName("date")[0].value == ''){
               alert("Пожалуйста, заполните все поля!");
            event.preventDefault();
           }
            

        }
    </script>
<tr></tr>

<td><input type="Submit" value="Подтвердить" onclick="buttonClicked()" style = "font-size: 18; background:rgb(158,158,243); color:white; border: none">&nbsp;
    <input type="Reset" value="Очистить" style = "font-size: 18; background:rgb(158,158,243); color:white; border: none"></td>
</tr>
</form>
</table>
     </body>
<cfelse>
    <h2 style = " text-align: center; font-size: 30; color: #ffffff; padding-top: 10%">Простите!</h2>
<p  style = " text-align: center; font-size: 20; color: #ffffff;"> Вы не можете добавить ошибку, не войдя в систему.</p>
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