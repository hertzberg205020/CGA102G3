window.onload = function (){
    let obj = {
        prodID: JSON.parse(sessionStorage.getItem("prodID")),
        quantityarray: JSON.parse(sessionStorage.getItem("quantityarray"))
    }
    let path = $('#path').val();
    $.ajax({
        url: path + '/ProdServlet.do',
        type:'post',
        dataType:'json',
        data:{'action':'finish'},
        success:function(res){
            let total = 0;
            for (let i = 0 ; i <res.length; i++){
                let json = res[i];
                let price = 0;
                let amount = json.amount;
                let discount = json.discount;
                if (discount === 'N') price = json.price;
                else price = json.salePrice;
                let one = price * amount;
                total += one;
                $('tbody').prepend('<tr >\n' +
                    '                <th>'+json.title+'</th>\n' +
                    '                <th> <img src="'+path+'\\static\\images\\books\\'+json.prodID+'.jpg" alt="" height="100px" width="80px"></th>\n' +
                    '                <th class="text-center">'+price+'</th>\n' +
                    '                <th class="text-center">'+amount+'</th>\n' +
                    '                <th>'+one+'</th>\n' +
                    '            </tr>')
            }
            $('#total').text(total);
        },
        error:function(err){console.log(err)},
    });
}