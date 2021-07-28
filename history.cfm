<html>
<head>
<title>Mistakes</title>
</head>
<cfinclude template="default.cfm"> 
<body>
    
<link rel="stylesheet" href="sortable.min.css" />
<script src="sortable.min.js"></script>  
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
SELECT * FROM mistake
</cfquery>
<h2 style = " text-align: center; font-size: 30; color: #ffffff; padding-top: 10%;">Список ошибок</h2>
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
    
<cfif #status# eq "1"> 
<cfset status = "Новая"> <cfelseif #status# eq "2"> 
<cfset status = "Открытая">
    <cfelseif #status# eq "3"> 
<cfset status = "Решённая">
<cfelse> 
<cfset status = "Закрытая">
</cfif>
    
<cfif #urgency# eq "1"> 
<cfset urgency = "Очень срочно"> <cfelseif #urgency# eq "2"> 
<cfset urgency = "Срочно">
    <cfelseif #urgency# eq "3"> 
<cfset urgency = "Несрочно">
<cfelse> 
<cfset urgency = "Совсем несрочно">
</cfif>
    
    
<cfif #criticality# eq "1"> 
<cfset criticality = "Авария"> <cfelseif #criticality# eq "2"> 
<cfset criticality = "Критичная">
    <cfelseif #criticality# eq "3"> 
<cfset criticality = "Некритичная">
<cfelse> 
<cfset criticality = "Запрос на изменение">
</cfif>
    
<td align="center"> <a style="font-size: 100%; color:red" href="reductmistake.cfm?id_mist=#id#">#id#</a></td>
<td align="center">#date#</td>
<td align="center">#user_login#</td>
<td align="center">#status#</td>
<td align="center">#urgency#</td>
<td align="center">#criticality#</td>
<td align="center">#short_description#</td>
<td align="center">#long_description#</td>   
</tr>
<script>status(#status#)</script>
    <script>urgency(#urgency#)</script>
    <script>criticality(#criticality#)</script>
</cfoutput>
</table>
<br>
<cfif IsDefined("Form.Contractor")>
<cfoutput>Contractor: #Form.Contractor#</cfoutput>
</cfif>
</body>
</html>