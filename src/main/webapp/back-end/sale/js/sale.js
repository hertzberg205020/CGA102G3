
window.onload = function () {
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
                <td><input type="checkbox" class="detail" onclick="detail(this)">
                </td>
            </tr>`)
            }
        })
}

function detail(e) {
    let path = $('#path').val();
    let id = $(e).parents('tr').find('td:first').text();
    if ($(e).prop('checked')) {
        fetch(`${path}/SaleServlet.do?action=getDetail&saleID=${id}`)
            .then(response => response.json())
            .then(function (myjson) {
                console.log(myjson);
                $(e).parents('tr').after(`<tr class="table-warning saleID${id}">
					<td></td>
					<th>prodID</th>
					<th colspan="2">sale_price</th>
					</tr>`)
                for (let i = myjson.length-1 ;i >= 0; i--) {
                    let json = myjson[i];
                    $(e).parents('tr').next().after(`
                    <tr class="saleID${id}">
                    <td></td>
                    <td>${json.prodID}</td>
                    <td colspan="2">${json.salePrice}</td>
                    </tr>
                    `)
                }
            })
    } else {
        $('.saleID' + `${id}`).remove()
    }
}
