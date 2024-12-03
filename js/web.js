//#########################################menu
//$(document).ready(function () {
//    $("#btHome").button({
//        icons: {
//            primary: "ui-icon ui-icon-star"
//        }
//    });
//    $("#btShow").button({
//        icons: {
//            primary: "ui-icon ui-icon-heart"
//        }
//    });
//});

function webAjax(_url, _data, _function, _BeforeSend, _mode, _type) {
    //_url***
    //_data***
    if (_mode == undefined) { _mode = 'default'; }
    if (_type == undefined) { _type = 'POST'; }
    switch (_mode) {
        case "default":
            $.ajax({
                type: _type,
                url: _url,
                data: _data,
                success: _function,
                beforeSend : _BeforeSend
            });
            break;
        case "return":
            var _txt = $.ajax({
                url: _url,
                global: false,
                type: _type,
                data: _data,
                dataType: "html",
                async: false,
                success: _function
            }
            ).responseText;
            return _txt;
            break;
    }
}