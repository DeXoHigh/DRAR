$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
        if (item.type === "changehtm") {
            $("#ifo").html(item.text)
        }

    })
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://dexo_rar/exit', JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post('http://dexo_rar/exit', JSON.stringify({}));
        return
    })
    $(".btn-3").click(function () {

        var id = $("#id").val()
        
        $.post('http://dexo_rar/dexoapasapebuton', JSON.stringify({
            id: id
        }));
        return
    })
})
