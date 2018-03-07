$(function(){
    setRem()
    var timer;
    $(window).on("resize",function(){
        clearTimeout(timer);
        timer=setTimeout(function(){
            setRem();
        },100)
    })
})
function setRem(){
    var clientWidth=$(window).width();
    var nowRem=(clientWidth/375*100);
    $("html").css("font-size",parseInt(nowRem,10)+"px");
};
