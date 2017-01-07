/**
 * Created by wsx on 2016/11/1.
 */
$(function () {
    var pnameflag = false;//工程名字标志
    var phonorflag = false;//工程荣誉标志
    var prankflag = false;//工程位置标志
    var pimgflag = false;//图片标志
    $("#pname").blur(function () {
        if($(this).val() != ""){
            pnameflag = true;
        }
    });
    $("#phonor").blur(function () {
        if($(this).val() != ""){
            phonorflag = true;
        }
    });
    $("#prank").blur(function () {
        if($(this).val() != ""){
            prankflag = true;
        }
    });
    $('#pimg').change(function () {
        var filepath = $(this).val();
        var ext = filepath.substring(filepath.lastIndexOf("."), filepath.length).toUpperCase();
        if(ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG"){
            alert("图片限于bmp,png,gif,jpeg,jpg格式");
            $(this).val("");
            pimgflag = flase;
        }else{
            var filesize = document.getElementById("pimg").files[0].size/1024/1024;
            if(filesize > 2){
                alert("图片请小于5M");
                $(this).val("");
                pimgflag = flase;
            }
            pimgflag = true;
        }
    });
    $('#tijiao').click(function () {
        if(!pimgflag || !pnameflag || !phonorflag || !prankflag ){
            alert("信息有未填写的！");
            return;
        }
        if(testEditor.getMarkdown() == ""){
            alert("markdown空无内容！");
            return;
        }
        var formData = new FormData();
        formData.append("pname",$("#pname").val());
        alert($("#pname").val());
        formData.append("phonor",$("#phonor").val());
        alert($("#phonor").val());
        formData.append("prank",$("#prank").val());
        alert($("#prank").val());
        formData.append("pimg",$("#pimg")[0].files[0]);
        formData.append("pinfo",testEditor.getMarkdown());
        alert(testEditor.getMarkdown());


        $.ajax({
            url:"/back/addproajax",
            type:"POST",
            data:formData,
            cache: false,
            processData: false,
            contentType: false,
            success:function(data){
                alert(data);
            }
        });


        // $.ajax({
        //     url:"/back/addproajax",
        //     type:"POST",
        //     data:formData,
        //     processData : false,
        //     ontentType : false,
        //     beforeSend: function() {
        //         alert("before");
        //     },
        //     success: function() {
        //         alert("success");
        //     },
        //     complete: function() {
        //         alert("complete");
        //     },
        //     error : function() {
        //         alert("error");
        //     }
        // });




        // $.ajax({
        //     type: "POST",
        //     url: "/feedback",
        //     data: {name: "1",
        //         email:"2@1.com",
        //         subject:"ds",
        //         content:"fdsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        //     },
        //     dataType:"text",
        //     beforeSend: function() {
        //         alert("before");
        //     },
        //     success: function (data) {
        //         if (data == "success") {
        //             alert("反馈成功，谢谢支持！！");
        //         }
        //     },
        //     complete: function() {
        //         alert("complete");
        //     },
        //     error : function() {
        //         alert("error");
        //     }
        // });
    });

});