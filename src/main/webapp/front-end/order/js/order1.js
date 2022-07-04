window.onload = function (){
    let path = $('#path').val();
    fetch(path + '/OrderServlet.do?action=getByMbrID')
        .then(response => response.json())
        .then(function (myjson) {
            for (let i = 0 ; i < myjson.length; i++){
                let json = myjson[i];
                let method = json.payMethod;
                let m = null;
                switch (method){
                    case 0:
                        m = '信用卡';
                        break;
                    case 1:
                        m = 'TibaNi錢包';
                        break;
                    case 2:
                        m = '貨到付款';
                        break;
                }
                let oStatus = json.orderStatus;
                let o = null;
                switch (oStatus){
                    case 0:
                        o = '訂單成立';
                        break;
                    case 1:
                        o = '配送中';
                        break;
                    case 2:
                        o = '訂單完成';
                        break;
                    case 3:
                        o = '訂單取消';
                        break;
                }
                let sStatus = json.shipStatus;
                let s = null;
                switch (sStatus){
                    case 0:
                        s = '撿貨中';
                        break;
                    case 1:
                        s = '配送中';
                        break;
                    case 2:
                        s = '已送達';
                        break;
                    case 3:
                        s = '訂單取消';
                        break;
                }
                $('tbody').append(`                <tr>
                    <th scope="row">${json.orderID}</th>
                    <td>${json.orderDate}</td>
                    <td>${m}</td>
                    <td>${json.totalPrice}</td>
                    <td class="order-status">${o}</td>
                    <td class="ship-status">${s}</td>
                    <td><button class="btn btn-sm detail"><i class="bi bi-card-list"></i></button></td>
                    <td><button class="btn btn-sm cancel btn-danger" disabled>取消訂單</button></td>
                    <td><button class="btn btn-sm finish btn-info" disabled>完成訂單</button></td>
                </tr>`)
            }
            // 取消&完成按鈕顯現
            $(('.cancel')).each(function () {
                if ($(this).parents('tr').find('td.order-status').text() === '訂單成立' && $(this).parents('tr').find('td.ship-status').text() === '撿貨中') {
                    $(this).removeAttr('disabled')
                }
            })
            $(('.finish')).each(function () {
                if ($(this).parents('tr').find('td.order-status').text() === '配送中' && $(this).parents('tr').find('td.ship-status').text() === '已送達') {
                    $(this).removeAttr('disabled')
                }
            })

            //點擊按鈕
            $('.cancel').click(function () {
                $(this).attr('disabled', 'disabled');
                $(this).parents('tr').find('td.order-status').text('訂單取消')
            })
            $('.finish').click(function () {
                $(this).attr('disabled', 'disabled');
                $(this).parents('tr').find('td.order-status').text('訂單完成')
            })

        })
}