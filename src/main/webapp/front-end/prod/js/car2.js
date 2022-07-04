//抓取選取的 bookID & 數量存入SessionStorage
function checkout() {
    let obj = {
        prodID: [],
        quantityarray: []
    }
    let path = $('#path').val();
    $('input[type=checkbox]:checked').each(function () {
        let quantity = $(this).parents('tr').find('select').val();
        if ($(this).val().length !== 0)
            obj.prodID.push($(this).val());
        if (quantity)
            obj.quantityarray.push(quantity);
    })
    sessionStorage.setItem("prodID", JSON.stringify(obj.prodID));
    sessionStorage.setItem("quantityarray", JSON.stringify(obj.quantityarray));
    console.log(obj.prodID.length)
    if (obj.prodID.length === 0) alert('未選取商品');
    else location.href = path + '/front-end/prod/checkout.jsp';
}
