$(function () {

    /**
     * 搜索资源
     */
    $("#bt_searchSource").click(function () {
        var keyword = $("#searchSourceInput").val();
        if ("" == keyword)
            return;
        $.ajax({
            type: "POST",
            url: "searchSource",
            data: {keyword: keyword},
            dataType: "json",
            success: function (data) {
                current_data = data;
                clearTags();
                reloadSourceList();
            }
        });
    });

    /**
     * 更改选中的标签
     */
    $("[name='lan']").click(function () {
        if ($(this).hasClass('active'))
            $(this).removeClass('active');
        else
            $(this).addClass('active');
        $("[id='showtag']").each(function () {
            $(this).remove();
        });
        var showhtml = "";
        $("[name='lan'][class='active']").each(function () {
            var tag = $(this).find('a').html();
            showhtml += '<h3 id="showtag" style="display:inline;margin:5px;"><span class="label label-default">' + tag + '</span></h3>';
        });
        $("h3:last").append(showhtml);
        getSources();
    });

    /**
     * 更改选中的类型，cur_selected_type值设置为类型
     */
    $("[name='sourcetype']").click(function () {
        current_type = $(this).attr('value');
        reloadSourceList();
    });

    window.onload = function () {
        $.ajax({
            type: "POST",
            url: "getDownloadOrder",
            dataType: "json",
            success: function (data) {
                current_download_order = data;
                loadDownloadOrder();
            }
        });
        $.ajax({
            type: "POST",
            url: "getTimeOrder",
            dataType: "json",
            success: function (data) {
                current_time_order = data;
                loadTimeOrder();
            }
        });
    }
});

/**
 * ajax获取资源
 */
function getSources() {
    var tagids = "";
    $("[name='lan'][class='active']").each(function () {
        tagids += $(this).val() + ";";
    });
    $.ajax({
        type: "POST",
        url: "/getSource",
        data: {tagids: tagids},
        datatype: "json",
        success: function (data) {
            current_data = data;
            reloadSourceList();
        }
    });
}
/**
 * 重新加载资源列表
 */
function reloadSourceList() {
    var str0 = "<div class=\"well\">";
    var str1 = "</div>";
    var str = "";
    var space = "&nbsp;&nbsp;&nbsp;&nbsp;";
    for (var i = 0; i < current_data.length; i++) {
        var source = current_data[i];
        if (source.stype == current_type) {
            str += "<ul class=\"list-group\">";
            str += "<li class=\"list-group-item\">标题：" + source.sourcename + "</li>";
            str += "<li class=\"list-group-item\">语言: " + source.tagstext + space +
                "上传者: " + source.author + space + "上传时间: " + source.uploadtime + space + "下载等级： " + source.srole + "</li>";
            str += "<li class=\"list-group-item\">简介：" + source.sdescribe + "</li>";
            str += "<li class=\"list-group-item\">下载链接：<a href=\"/download?sourceid=" + source.sourceid + "\">" + source.sourcename + "</a></li>";
            str += "</ul>";
        }
    }
    if (str == "")
        str = "未找到相关记录"
    $("#" + current_type + "tab").html(str0 + str + str1);
}

/**
 * 清空选中的标签
 */
function clearTags() {
    $("[name='lan'][class='active']").each(function () {
        $(this).removeClass("active");
    });
    $("[id='showtag']").each(function () {
        $(this).remove();
    });
}

function loadDownloadOrder() {
    var str = "";
    for (var i = 0; i < current_download_order.length; i++) {
        var source = current_download_order[i];
        str += "<a href='#' onclick='showOrder(current_download_order)' class='list-group-item'>";
        str += "<p class=\"list-group-item-text\">";
        str += source.sourcename;
        str += " <span class=\"badge\">" + source.visits + "</span>";
        str += "</p></a>";
    }
    $("#downloadorder").html(str);
}

function loadTimeOrder() {
    var str = "";
    for (var i = 0; i < current_time_order.length; i++) {
        var source = current_time_order[i];
        str += "<a href='#' onclick='showOrder(current_time_order)' class='list-group-item'>";
        str += "<p class=\"list-group-item-text\">";
        str += source.sourcename;
        str += " <span class=\"badge\">" + source.visits + "</span>";
        str += "</p></a>";
    }
    $("#timeorder").html(str);
}

function showOrder(data) {
    current_data = data;
    current_type = "all";
    clearTags();
    reloadSourceList();
}

var current_download_order = "";
var current_time_order = "";
var current_data = "";
var current_type = "all";