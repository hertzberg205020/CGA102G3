
function checkout() {
    let obj = {
        prodID: [],
        amountArray: []
    }
    let path = $('#path').val();
    $('input[type=checkbox]:checked').each(function () {
        let amount = $(this).parents('tr').find('select').val();
        if ($(this).val().length !== 0)
            obj.prodID.push($(this).val());
        if (amount)
            obj.amountArray.push(amount);
    })

    if (obj.prodID.length === 0) swal('未選取商品!','麻煩重新選擇!', "error");
    else {
        $.ajax({
            type :"post",
            url  : `${path}/ProdServlet.do`,
            data : {
               'action':'checkout','prodID':JSON.stringify(obj.prodID),'amountArray':JSON.stringify(obj.amountArray)
            },
            dataType: "text",
            success : function(myjson) {
                console.log('成功');
                location.href = `${path}/front-end/prod/checkout.jsp`
            }
        })
    }
}
