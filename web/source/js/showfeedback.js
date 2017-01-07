/**
 * Created by wsx on 2016/10/30.
 */
$(function () {
    $("[name='delfb']").click(function () {
        th = $(this);
        $.ajax({
            type: "POST",
            url: "/back/rmonefeedback",
            data: {id:$(this).attr("value"),
            },
            dataType:"text",
            success: function (data) {
                if (data == "success") {
                    alert("删除成功");
                    th.parent().parent().remove();
                }
            }
        });
    });
});