/**
 * Created by wsx on 2016/10/28.
 */
$(function(){
    $(".mv_float").css("background-color","#fff");
    $(".mv_float").mouseover(function(){
        $(this).css("background-color","rgba(247,77,101,.9)");
    });
    $(".mv_float").mouseout(function(){
        $(this).css("background-color","#fff");
    });
});