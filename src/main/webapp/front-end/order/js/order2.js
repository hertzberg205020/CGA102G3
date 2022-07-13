window.onload = function () {
    let path = $('#path').val();
    fetch(`${path}/OrderServlet.do?action=getByMbrID`)
        .then(response => response.json())
        .then(function (myjson) {
            for (let i = 0; i < myjson.length; i++) {
                let json = myjson[i];
                let method = json.payMethod;
                let m = null;
                switch (method) {
                    case 0:
                        m = '信用卡';
                        break
                    case 1:
                        m = 'TibaNi錢包';
                        break
                    case 2:
                        m = '貨到付款';
                        break
                }
                let orderStatus = json.orderStatus;
                let o = null;
                switch (orderStatus) {
                    case 0:
                        o = '訂單成立';
                        break
                    case 1:
                        o = '配送中';
                        break
                    case 2:
                        o = '訂單完成';
                        break
                    case 3:
                        o = '訂單取消';
                        break
                }
                let shipStatus = json.shipStatus;
                let s = null;
                switch (shipStatus) {
                    case 0:
                        s = '撿貨中';
                        break
                    case 1:
                        s = '配送中';
                        break
                    case 2:
                        s = '已送達';
                        break
                    case 3:
                        s = '訂單取消';
                        break
                }
                $('tbody').append(` <tr>
                    <th scope="row">${json.orderID}</th>
                    <td>${json.orderDate}</td>
                    <td>${m}</td>
                    <td>${json.totalPrice}</td>
                    <td class="order-status">${o}</td>
                    <td class="ship-status">${s}</td>
                    <td><button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#edit"
                            data-title="${json.orderID}"><i class="bi bi-card-list"></i></button></td>
                    <td><button class="btn btn-sm cancel btn-danger" disabled>取消訂單</button></td>
                    <td><button class="btn btn-sm finish btn-info" disabled>完成訂單</button></td>
                </tr>`)

            }
            $('.cancel').each(function (){
                if ($(this).parents('tr').find('td.order-status').text() === '訂單成立' && $(this).parents('tr').find('td.ship-status').text() === '撿貨中'){
                $(this).removeAttr('disabled');
                }
            })
            $('.finish').each(function (){
                if ($(this).parents('tr').find('td.order-status').text() === '配送中' && $(this).parents('tr').find('td.ship-status').text() === '已送達'){
                $(this).removeAttr('disabled');
                }
            })
            $('.cancel').click(function (){
                let orderID = $(this).parents('tr').find('th').text();
                let e = $(this);
                swal({
                    title: "確定取消?",
                    text: "取消後，訂單無法復原!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            fetch(`${path}/OrderServlet.do?action=cancel&orderID=${orderID}`)
                                .then(response => response.text())
                                .then(function (res){
                                    if (res === 'true'){
                                        swal("成功刪除!", {
                                            icon: "success",
                                        });
                                        e.attr('disabled','disabled');
                                        e.parents('tr').find('td.ship-status').text('訂單取消')
                                        e.parents('tr').find('td.order-status').text('訂單取消')
                                    }else {
                                        swal("刪除失敗!", {
                                            icon: "error",
                                        });
                                    }
                                })
                        } else {
                            swal("保存訂單!");
                        }
                    });
            })

            $('.finish').click(function (){
                let orderID = $(this).parents('tr').find('th').text();
                let e = $(this);
                swal({
                    title: "確定取消?",
                    text: "取消後，訂單無法復原!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            fetch(`${path}/OrderServlet.do?action=finish&orderID=${orderID}`)
                                .then(response => response.text())
                                .then(function (res){
                                    if (res === 'true'){
                                        swal("訂單完成!", {
                                            icon: "success",
                                        });
                                        e.attr('disabled','disabled');
                                        e.parents('tr').find('td.order-status').text('訂單完成')
                                    }else {
                                        swal("訂單完成失敗!", {
                                            icon: "error",
                                        });
                                    }
                                })
                        } else {
                            swal("保存訂單!");
                        }
                    });
            })
        })
    $('#edit').on('show.bs.modal', function (e) {
        let btn = $(e.relatedTarget); //抓取觸發按鈕的資料
        let title = btn.data('title');
        let modal = $(this); //要修改的modal就是現在開啟的這個modal
        fetch(`${path}/OrderServlet.do?action=getDetail&orderID=${title}`)
            .then(response => response.json())
            .then(function (myjson) {
                modal.find('tbody').html("");
                for (let i = 0; i < myjson.length; i++) {
                    let json = myjson[i];
                    modal.find('tbody').append(`<tr>
                    <td>${json.title}</td>
                    <td><img src="${path}/static/images/books/${json.bookID}.jpg" height="100px" width="80px"></td>
                    <td>${json.amount}本</td>
                    <td>$${json.price}元</td>
                </tr>>`)
                }
            })
    })

}