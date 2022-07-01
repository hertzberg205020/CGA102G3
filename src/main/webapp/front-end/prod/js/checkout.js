window.onload = function () {
    let obj = {
        prodID: JSON.parse(sessionStorage.getItem("prodID")),
        quantityarray: JSON.parse(sessionStorage.getItem("quantityarray"))
    }
    let path = $('#path').val();
    $.ajax({
        url: path + '/ProdServlet.do',
        type: 'post',
        dataType: 'text',
        data: {'action': 'checkout', 'json': JSON.stringify(obj)},
        success: function (res) {
            console.log(res);
            $('#total').text(res)
        },
        error: function (err) {
            console.log(err)
        },
    });
}

