function getMenuType(menuChose) {
    var m;
    switch (menuChose){
        case 0:
            m = document.getElementById("menuName");
            m.src="songManager.jsp";
            break;
        case 1:
            m = document.getElementById("menuName");
            m.src="singerManager.jsp";
            break;
        case 2:
            m = document.getElementById("menuName");
            m.src="specialManager.jsp";
            break;
        case 3:
            m = document.getElementById("menuName");
            m.src="infomations.html";
            break;
        case 4:
            m = document.getElementById("menuName");
            m.src="informationManager.jsp";
            break;
        case 5:
            m = document.getElementById("menuName");
            m.src="musicManager.html";
            break;

        case 6:
            m = document.getElementById("menuName");
            m.src="menuUser11.html";
            break;
        case 7:
            m = document.getElementById("menuName");
            m.src="personBasic.jsp";
            break;

        case 8:
            m = document.getElementById("menuName");
            m.src="password.jsp";
            break;
        case 9:
            var m = document.getElementById("menuName");
            m.src="musicManager.html";
            break;

        case 10:
            m = document.getElementById("menuName");
            m.src="help.html";
            break;
        case 11:
            m = document.getElementById("menuName");
            m.src="userTypeManager.jsp";
            break;

        case 12:
            m = document.getElementById("menuName");
            m.src="UserManager.jsp";
            break;
        case 13:
            m = document.getElementById("menuName");
            m.src="home.jsp";
            break;

    }
}