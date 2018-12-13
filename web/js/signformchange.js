
/*$(function ()
{
        $('.change a').click(function ()
        {
            $('.signform').animate({height: 'toggle', opacity: 'toggle'}, 'slow');
        });
})*/
 
function start(data) {
    if (data == null) {
        document.getElementById('signform').style.display = "";
    }
    else{
        document.getElementById('login-menu').style.display="";
    }
}

function changeSrc(data)
{
    if(data == null){
        document.getElementById("myImage").src="/image/2.gif";
    }
    else{
        document.getElementById("myImage").src=data;
    }
}
function signclose() {
    document.getElementById('signform').style.display="none"
    document.getElementById('registerform').style.display="none"
}
function loading() {
    document.getElementById('registerloading').style.display=""
}