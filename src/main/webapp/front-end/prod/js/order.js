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
        data:{'action':'finish', 'json' : JSON.stringify(obj)},
        success:function(res){
            let total = 0;
            for (let i = 0 ; i <res.length; i++){
                let json = res[i];
                let one = (json.prodVO.price) * (json.quantity);
                total += one;
                $('tbody').prepend('<tr >\n' +
                    '                <th>'+json.prodVO.book.title+'</th>\n' +
                    '                <th> <img src="'+path+'\\static\\images\\books\\'+json.prodVO.prodID+'.jpg" alt="" height="100px" width="80px"></th>\n' +
                    '                <th class="text-center">'+json.prodVO.price+'</th>\n' +
                    '                <th class="text-center">'+json.quantity+'</th>\n' +
                    '                <th>'+one+'</th>\n' +
                    '            </tr>')
            }
            debugger
            $('#total').text(total);
            sessionStorage.removeItem("prodID");
            console.log('移除1');
            sessionStorage.removeItem("quantityarray")
            console.log('移除2');
            },
        error:function(err){console.log(err)},
    });
}