<html>
    <cfinclude template="default.cfm"> 
                <link rel="stylesheet" href="sortable.min.css" />
<script src="sortable.min.js"></script>  
<head>
<title>Input form</title>
</head>
<script>
     function status(numb){
         var res = 'ошибка'
         if (numb == 1){
             res =  "Новая"
         }
         if (numb == 2){
             res =  "Открытая"
         }
         if (numb == 3){
             res =  "Решенная"
         }
         if (numb == 4){
             res =  "Закрытая"
         }
         document.getElementById('status').innerHTML = res;
     }
</script>

<script>
     function urgency(numb){
         var res = 'ошибка'
         if (numb == 1){
             res =  "Очень срочно"
         }
         if (numb == 2){
             res =  "Срочно"
         }
         if (numb == 3){
             res =  "Несрочно"
         }
         if (numb == 4){
             res =  "Совсем несрочно"
         }
         document.getElementById('urgency').innerHTML = res;
     }
</script>
    
    
    
<script>
     function criticality(numb){
         var res = 'ошибка'
         if (numb == 1){
             res =  "Авария"
         }
         if (numb == 2){
             res =  "Критичная"
         }
         if (numb == 3){
             res =  "Некритичная"
         }
         if (numb == 4){
             res =  "Запрос на изменение"
         }
         document.getElementById('criticality').innerHTML = res;
     }
</script>
    
<body>
<!--- If the Contractor check box is clear), set the value of the Form.Contract
to "No" --->

<!--- Insert the new record --->

    
<cfif #Form.status# neq 4>
<cfquery name="UpdateMistake" >
UPDATE mistake
SET date = '#Form.date#',
    user_login = '#GetAuthUser()#', 
    status = #Form.status#, 
    urgency = #Form.urgency#,
    short_description = '#Form.short_description#', 
    long_description = '#Form.long_description#', 
    criticality = #Form.criticality#
WHERE id = #id_mist#
</cfquery> 
    
<cfquery name="FindRecord" >
SELECT id FROM history WHERE id_mistake = #id_mist# ORDER BY date_mistake LIMIT 1
</cfquery>
    
<cfset latest_hist = FindRecord.id>
    
<cfquery name="UpdateHistory" >
UPDATE history
SET id_mistake = #id_mist#,
    date_mistake = '#Form.date#',
    user_login = '#GetAuthUser()#', 
    status_mistake = #Form.status#, 
    urgency_mistake = #Form.urgency#,
    short_description_mistake = '#Form.short_description#', 
    long_description_mistake = '#Form.long_description#', 
    criticality_mistake = #Form.criticality#
WHERE id = #latest_hist#
</cfquery> 

  <h2 style = " text-align: center; font-size: 30; color: #ffffff; padding-top: 10%">Ошибка обновлена</h2>
<p  style = " font-size: 20; color: #ffffff;"><cfoutput>Пользователь под логином '#GetAuthUser()#' обновил ошибку номер #id_mist# от #Form.date#
    со статусом  "<span id="status"></span>", срочностью "<span id="urgency"></span>" и критичностью "<span id="criticality"></span>".<br>
    С описанием: 
#Form.short_description# <br> #Form.long_description#
<script>status(#Form.status#)</script>
    <script>urgency(#Form.urgency#)</script>
    <script>criticality(#Form.criticality#)</script>
    </cfoutput></p>
<h2 style = " text-align: center; font-size: 30; color: #ffffff;">История ошибки</h2>
    <style>
   table {
    width: 400px; /* Ширина таблицы */
    margin: auto; /* Выравниваем таблицу по центру окна  */
   }

   td {
    text-align: center; /* Выравниваем текст по центру ячейки */
       background: white;
       color: black;
   }

  </style>
<cfquery name="GetEmployees">
SELECT id_mistake, date_mistake, user_login, status_mistake, urgency_mistake, short_description_mistake, long_description_mistake, criticality_mistake
FROM history WHERE id_mistake = #id_mist#
</cfquery>
<table cellspacing ="10" cellpadding = "3" class="sortable">
<thead>
  <tr>
    <th>Номер ошибки</th>
    <th>Дата</th>
    <th>Логин пользователя</th>
    <th>Статус</th>
    <th>Срочность</th>
    <th>Критичность</th>
    <th>Краткое описание</th>
    <th>Подробное описание</th>
  </tr>
</thead>
<cfoutput query="GetEmployees">
<tr>

<cfif #status_mistake# eq "1"> 
<cfset status = "Новая"> <cfelseif #status_mistake# eq "2"> 
<cfset status = "Открытая">
    <cfelseif #status_mistake# eq "3"> 
<cfset status = "Решённая">
<cfelse> 
<cfset status = "Закрытая">
</cfif>
    
<cfif #urgency_mistake# eq "1"> 
<cfset urgency = "Очень срочно"> <cfelseif #urgency_mistake# eq "2"> 
<cfset urgency = "Срочно">
    <cfelseif #urgency_mistake# eq "3"> 
<cfset urgency = "Несрочно">
<cfelse> 
<cfset urgency = "Совсем несрочно">
</cfif>
    
    
<cfif #criticality_mistake# eq "1"> 
<cfset criticality = "Авария"> <cfelseif #criticality_mistake# eq "2"> 
<cfset criticality = "Критичная">
    <cfelseif #criticality_mistake# eq "3"> 
<cfset criticality = "Некритичная">
<cfelse> 
<cfset criticality = "Запрос на изменение">
</cfif> 
<td align="center">#id_mistake#</td>
<td align="center">#date_mistake#</td>
<td align="center">#user_login#</td>
<td align="center">#status#</td>
<td align="center">#urgency#</td>
<td align="center">#criticality#</td>
<td align="center">#short_description_mistake#</td>
<td align="center">#long_description_mistake#</td>   
<script>status(#status_mistake#)</script>
    <script>urgency(#urgency_mistake#)</script>
    <script>criticality(#criticality_mistake#)</script>
</cfoutput>
</table>
<cfelse>
<cfquery name="DeleteMistake" >
  DELETE FROM mistake 
        WHERE id = #id_mist# 
</cfquery> 
<cfquery name="DeleteMistake" >
  DELETE FROM history WHERE id_mistake = #id_mist# 
</cfquery> 
  <h2 style = " text-align: center; font-size: 30; color: #ffffff; padding-top: 10%">Ошибка удалена </h2>
<p  style = " font-size: 20; color: #ffffff;"><cfoutput>Пользователь под логином '#GetAuthUser()#' удалил ошибку номер #id_mist# от #Form.date#
    со срочностью "<span id="urgency"></span>" и критичностью "<span id="criticality"></span>".<br>
    С описанием: 
#Form.short_description# <br> #Form.long_description#</p>
<script>status(#Form.status#)</script>
    <script>urgency(#Form.urgency#)</script>
    <script>criticality(#Form.criticality#)</script>
    </cfoutput>
</cfif>   
    

</body>
</html>

