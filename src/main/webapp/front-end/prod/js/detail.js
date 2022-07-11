window.onload = function (){
    let path = $('#path').val();
    let prodID = $('#prodID').val();
    fetch(`${path}/ProdServlet.do?action=checkSale&prodID=${prodID}`)
        .then(response => response.json())
        .then(function (myjson){
            if (myjson){
                $('.direct-price').css('text-decoration','line-through')
                $('.direct-price').after(`<div class="mb-2">特價: <span style="color:red; font-weight:bold;">${myjson}</span>元</div>`)
            }
        })
}