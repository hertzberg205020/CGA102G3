window.onload = function () {
    let path = $('#path').val();
    fetch(path + '/ProdServlet.do?action=car&prodID=0')
        .then(response => response.json())
        .then(function (myjson) {
            console.log(myjson)
            if (myjson.length == 0) {
                $('tbody').append(`<tr>
                    <th colspan="6" class="text-center table-danger">無選取產品</th>
                    </tr>`)
                $('main').append('<button type="button" class="btn btn-warning back" style="margin-left: 46%; margin-top: 20px;">返回商城</button>')
            } else {
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
                    $('tbody').append(`<tr>
                        <td scope="row">
                        <div class="form-check" id="prod${json.prodID}">
                        <input class="form-check-input item-btn" type="checkbox" value="${json.prodID}" id="btn${i + 1}">
                        <label class="form-check-label" for="btn${i + 1}">
                        ${json.title}
                        </label>
                        </div>
                        </td>
                        <td><img src="${path}/static/images/books/${json.prodID}.jpg" alt="" height="100px" width="80px"></td>
                        <td>
                        <div>$${price}</div>
                        </td>
                        <td><select class="quantity" >
                        </select>
                        </td>
                        <td  style="width: 80px">
                        <div class="total"  style="width: 80px">$${price * amount}</div>
                        </td>
                        <td>
                        <button type="button" class="btn btn-outline-danger btn-sm cancel" style="width: 50px">取消</button>
                        </td>
                        </tr>`)
                    //生成select數量選單
                    let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,17,18,19,20];
                    let select = $(`#prod${json.prodID}`).parents('tr').find('select');
                    for (n in array) {
                        let option = $("<option>").val(array[n]).text(array[n]);
                        select.append(option);
                    };
                    select.val(`${json.amount}`)
                }
                $('main').append('<button type="button" class="btn btn-warning" onclick="checkout()" style="margin-left: 50%;">結帳</button>')
            }

            //全選功能
            $('#all').click(function () {
                if ($(this).prop('checked')) {
                    $('.form-check-input').prop('checked', true);
                } else {
                    $('.form-check-input').prop('checked', false);
                }
            });
            $('.form-check-input').click(function () {
                let l1 = $('.item-btn').length;
                let l2 = $('.item-btn:checked').length;
                if (l1 === l2) {
                    $('#all').prop('checked', true);
                } else {
                    $('#all').prop('checked', false);
                }
            })

            //改變數量顯示價格
            $('.quantity').on('change', function () {
                let a = $(this).val();
                let prodID = $(this).parents('tr').find('div').attr('id').substr(4)
                fetch(`${path}/ProdServlet.do?action=change&amount=${a}&prodID=${prodID}`)
                    .then(response => response.text())
                    .then(function (myjson){
                        console.log(myjson)
                    })
                let b = parseInt($(this).parent().prev().children().text().substr(1));
                $(this).parent().next().children().text(`$${a * b}`);
            })

            //取消
            $('.cancel').on('click', function () {
                let id = $(this).parents('tr').children().children().attr('id').substr(4);
                $(this).parents('tr').remove();
                let path = $('#path').val();
                fetch(path + '/ProdServlet.do?prodID=' + id + '&action=delete')
                    .then(response => response.text())
                    .then(function (myjson) {
                        console.log(myjson);
                        if (myjson === "empty"){
                            $('tbody').append(`<tr>
                                <th colspan="6" class="text-center table-danger">無選取產品</th>
                                </tr>`)
                            $('button').remove();
                            $('main').append('<button type="button" class="btn btn-warning back" style="margin-left: 46%; margin-top: 20px;">返回商城</button>')

                        }
                    })
            })
            $('.back').click(function (){
                console.log('123')
                location.href = `${path}/front-end/prod/browse.jsp`;
            })
        })
}

