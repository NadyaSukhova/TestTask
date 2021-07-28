<html>
<cfinclude template="default.cfm"> 
<head>
<title>Insert Data Form</title>
</head>

<body>
 <cfif #GetAuthUser()# neq "">
<div style = "position: fixed;
                  top: 33%;
                  left: 36%;
                  background-color: rgba(255, 255, 255);
                  padding-bottom: 20px;
                  padding-left: 105px;
                  padding-right: 105px;
                  border-radius: 10%">
<h2 style = " text-align: center; font-size: 30; color: #4e006f; ">Опишите ошибку</h2>

    
<cfquery name = "thismistake" dataSource = "testbd"> 
SELECT *
FROM mistake WHERE id = #id_mist# 
</cfquery> 
         
     
<cfscript>
this_date = thismistake.date;
status = thismistake.status;
urgency = thismistake.urgency;
criticality = thismistake.criticality;
short_description = thismistake.short_description;
long_description = thismistake.long_description;
</cfscript>

<table>
<!--- begin html form;
put action page in the "action" attribute of the form tag. --->
<form action="insert_reduct_mistake.cfm?&id_mist=<cfoutput>#id_mist#</cfoutput>" method="post">
<tr>
<td>Номер:</td>
<td><cfoutput>#id_mist#</cfoutput></td>
</tr>
<tr>
<td>Дата выхода:</td>
<td><input type="date" name="date" size="4" value="<cfoutput>#this_date#</cfoutput>"></td><tr>
<td>Пользователь:</td>
<td><cfoutput>#GetAuthUser()#</cfoutput></td>
</tr>
<tr>
<td>Короткое описание:</td>
<td><textarea name="short_description"><cfoutput>#short_description#</cfoutput></textarea></td>
</tr>
<tr>
<td>Подробное описание:</td>
<td><textarea name="long_description"><cfoutput>#long_description#</cfoutput></textarea></td>
</tr>
<tr>
<td>Статус:</td>
<td><select name="status" id = "status">
    <option value = "1">Новая</option>
    <option value = "2">Открытая</option>
    <option value = "3">Решенная</option>
    <option value = "4">Закрытая</option>
</select></td>
</tr>

<tr>
<td>Срочность:</td>
<td><select name="urgency" id = "urgency">
    <option value = "1">Очень срочно</option>
    <option value = "2">Срочно</option>
    <option value = "3">Несрочно</option>
    <option value = "4">Совсем несрочно</option>
</select></td>
</tr>
<tr>
<td>Критичность:</td>
<td><select name="criticality" id = "criticality">
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
FROM history WHERE status_mistake = 3
</cfquery> 
    
    
<cfscript>
list_all = valueList(GetID.id);
list_solved = valueList(GetSolved.id);   
all_mist = serializeJSON(listToArray(list_all,",",true));
solved = serializeJSON(listToArray(list_solved,",",true));

</cfscript>

    <script>
        var st = <cfoutput>#status#</cfoutput> - 1;
        document.getElementById("status").options[st].selected = true;
        var ur = <cfoutput>#urgency#</cfoutput> - 1;
        document.getElementById("urgency").options[ur].selected = true;
        var cr = <cfoutput>#criticality#</cfoutput> - 1;
        document.getElementById("criticality").options[cr].selected = true;
        function buttonClicked(){
            var res = <cfoutput>#all_mist#</cfoutput>;
            var solved = <cfoutput>#solved#</cfoutput>;
            var status_numb =  document.getElementById("status").value;
            var id = "<cfoutput>#id_mist#</cfoutput>";
            
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
<tr>
</tr>
<td><input type="Submit" value="Подтвердить" onclick="buttonClicked()" style = "font-size: 18; background:rgb(158,158,243); color:white; border: none">&nbsp;
    <input type="Reset" value="Очистить" style = "font-size: 18; background:rgb(158,158,243); color:white; border: none"></td>
</tr>
</form>
    
</table>
     <div id = "history"></div>
<cfelse>
    <h2>Простите!</h2>
<p> Вы не можете добавить ошибку, не войдя в систему.</p>
 </cfif> 
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