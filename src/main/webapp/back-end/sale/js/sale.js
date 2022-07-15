window.onload = function () {
    console.log('111')
    let path = $('#path').val();
    fetch(path + '/SaleServlet.do?action=getAll')
        .then(response => response.json())
        .then(function (myjson) {
            for (let i = 0; i < myjson.length; i++) {
                let json = myjson[i];
                $('tbody').append(`            <tr>
                <td>${json.saleID}</td>
                <td>${json.saleStart}</td>
                <td>${json.saleEnd}</td>
                <td><button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#edit"
                            data-title="${json.saleID}"><i class="bi bi-card-list"></i></button></td>
                <td><button class="delete btn btn-danger" onclick="deleteOne(this)">取消</button></td>
            </tr>`)
            }

            //明細
            $('#edit').on('show.bs.modal', function (e) {
                let btn = $(e.relatedTarget); //抓取觸發按鈕的資料
                let title = btn.data('title');
                let modal = $(this); //要修改的modal就是現在開啟的這個modal
                fetch(`${path}/SaleServlet.do?action=getDetail&saleID=${title}`)
                    .then(response => response.json())
                    .then(function (myjson) {
                        modal.find('tbody').html("");
                        for (let i = 0; i < myjson.length; i++) {
                            let json = myjson[i];
                            modal.find('tbody').append(`<tr>
                    <td>${json.title}</td>
                    <td><img src="${path}/static/images/books/${json.prodID}.jpg" height="100px" width="80px"></td>
                    <td>$ ${json.salePrice}元</td>
                </tr>>`)
                        }
                    })
            })
        })
}

function detail(e) {
    let path = $('#path').val();

    if ($(e).prop('checked')) {
        fetch(`${path}/SaleServlet.do?action=getDetail&saleID=${id}`)
            .then(response => response.json())
            .then(function (myjson) {
                $(e).parents('tr').after(`<tr class="table-warning saleID${id}">
					<td></td>
					<th>prodID</th>
					<th colspan="2">sale_price</th>
					<th></th>
					</tr>`)
                for (let i = myjson.length - 1; i >= 0; i--) {
                    let json = myjson[i];
                    $(e).parents('tr').next().after(`
                    <tr class="saleID${id}">
                    <td></td>
                    <td>${json.prodID}</td>
                    <td colspan="2">${json.salePrice}元</td>
                    <td></td>
                    </tr>
                    `)
                }
            })
    } else {
        $('.saleID' + `${id}`).remove()
    }
};




