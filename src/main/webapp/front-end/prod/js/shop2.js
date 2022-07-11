$('#offcanvasExample').on('show.bs.offcanvas', function (e) {
    let path = $('#path').val();
    let btn = $(e.relatedTarget); //抓取觸發按鈕的資料
    let title = btn.data('title');
    let modal = $(this); //要修改的modal就是現在開啟的這個modal
    fetch(`${path}/ProdServlet.do?action=car`)
        .then(response => response.json())
        .then(function (myjson) {
            console.log(myjson)
            if (myjson.length == 0) {
                modal.find('tbody').append(`<tr>
                    <th colspan="6" class="text-center table-danger">無選取產品</th>
                    </tr>`)
            } else {
                modal.find('tbody').text('')
                for (let i = 0; i < myjson.length; i++) {
                    let json = myjson[i];
                    let discount = json.discount;
                    let amount = 0;
                    amount = json.amount;
                    let price = 0;
                    if (discount === 'N'){
                        price = json.price;
                    }else if (discount === 'Y'){
                        price = json.salePrice;
                    }
                    modal.find('tbody').append(`<tr>
                        <td>     
                        <div class="titleH">${json.title}</div>
                        </td>
                        <td><img src="${path}/static/images/books/${json.prodID}.jpg" alt="" height="100px" width="80px"></td>
                        <td>
                        <div>${amount}</div>
                        </td>
                        <td>
                        <div class="total">$${price}</div>
                        </td>
                        </tr>`)
                }}
        })
})