window.onload = function () {
    let path = $('#path').val()
    fetch(`${path}/ProdServlet.do?action=checkout2`)
        .then(response => response.text())
        .then(function (myjson){
            $('#total').text(myjson)
        })
}