window.onload = function () {
    let path = $('#path').val();
    fetch(path + '/ProdServlet.do?action=car&prodID=0')
        .then(response => response.json())
        .then(function (myjson) {
            if (myjson.length == 0) {
                $('tbody').append('           <tr>\n' +
                    '                <th colspan="6" class="text-center table-danger">無選取產品</th>\n' +
                    '           </tr>')
            } else {
                for (let i = 0; i < myjson.length; i++) {
                    let json = myjson[i];
                    $('tbody').append('<tr>\n' +
                        '<td scope="row">\n' +
                        '<div class="form-check" id="prod' + json.prodID + '">\n' +
                        '<input class="form-check-input item-btn" type="checkbox" value="' + json.prodID + '" id="btn' + (i + 1) + '">\n' +
                        '<label class="form-check-label" for="btn' + (i + 1) + '">\n' +
                        '' + json.book.title + '\n' +
                        '</label>\n' +
                        '</div>\n' +
                        '</td>\n' +
                        '<td><img src="'+path+'/static/images/books/' + json.prodID + '.jpg" alt="" height="100px" width="80px"></td>\n' +
                        '<td>\n' +
                        '<div>$' + json.price + '</div>\n' +
                        '</td>\n' +
                        '<td><select class="quantity" >\n' +
                        '</select>\n' +
                        '</td>\n' +
                        '<td>\n' +
                        '<div class="total">$' + json.price + '</div>\n' +
                        '</td>\n' +
                        '<td>\n' +
                        '<button type="button" class="btn btn-outline-danger cancel">取消</button>\n' +
                        '</td>\n' +
                        '</tr>')
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

            //生成select數量選單
            let quantityarry = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
            for (n in quantityarry) {
                let option = $("<option>").val(quantityarry[n]).text(quantityarry[n]);
                $('.quantity').append(option);
            }
            ;

            //改變數量顯示價格
            $('.quantity').on('change', function () {
                let a = $(this).val();
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
                            $('tbody').append('           <tr>\n' +
                                '                <th colspan="6" class="text-center table-danger">無選取產品</th>\n' +
                                '           </tr>')
                            $('button').remove();
                        }
                    })
            })
        })
}

