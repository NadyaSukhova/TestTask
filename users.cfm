<html>
<head>
<title>History</title>
</head>
 <style>
   table {
    width: 400px;/* Ширина таблицы */
    margin: auto; /* Выравниваем таблицу по центру окна  */
   }

   td {
    text-align: center; /* Выравниваем текст по центру ячейки */
       background: white;
       color: black;
   }

  </style>
<cfinclude template="default.cfm"> 
<link rel="stylesheet" href="sortable.min.css" />
<script src="sortable.min.js"></script>  
<body>
<cfquery name="GetEmployees">
SELECT *
FROM account
</cfquery>
<h2 style = " text-align: center; font-size: 30; color: #ffffff; padding-top: 10%;">Пользователи:</h2>
<table cellspacing ="10" cellpadding = "3"  class="sortable">
    <thead>
  <tr>
    <th>Логин</th>
    <th>Имя</th>
    <th>Фамилия</th>
  </tr>
    </thead>
    <cfoutput query="GetEmployees">
<tr>
    
<td align="center">#login#</td>
<td align="center">#name#</td>
<td align="center">#surname#</td>
  
</tr>
</cfoutput>
</table>
<br>
<cfif IsDefined("Form.Contractor")>
<cfoutput>Contractor: #Form.Contractor#</cfoutput>
</cfif>
</body>
</html>