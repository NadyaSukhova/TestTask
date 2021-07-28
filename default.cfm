<link rel="stylesheet" href="style.css">
<cfinclude template="Application.cfm"/>

<header>

    <br>
    <nav role="navigation">
    <ul>
        <li><cfif #GetAuthUser()# neq "">
        <a href="unlogin.cfm">Выход</a>
    <cfelse>
            <a href="login.cfm">Вход</a>
    </cfif></li>
        <li><a href="main.cfm">Главная</a></li>
        <li><a href="registry.cfm">Регистрация</a></li>
        <li ><a href="reduct.cfm">Настройки</a></li>
        <li><a href="1.cfm">Добавление ошибки</a></li>
        <li><a href="history.cfm">Список ошибок</a></li>
        <li><a href="users.cfm">Список пользователей</a></li>
        
        
        
    </ul>
    </nav>
    <ul style = "font-size: 33; text-align: center; height: 24px; color: #ffffff; font-family: fantasy">
    <br>
    
</ul>
</header>