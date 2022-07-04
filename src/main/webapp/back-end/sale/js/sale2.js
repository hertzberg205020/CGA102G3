
$('#search').click(function (){
    let path = $('#path').val();
    let id = $('input[name=bid_id]').val()
    if (id.match(/^[1-9][0-9]$/)){
        fetch(`${path}/SaleServlet.do?action=getOne&saleID=${id}`)
            .then(response => response.json())
            .then(function (json) {
                if (json){
                    $('tbody').html(`            <tr>
                <td>${json.saleID}</td>
                <td>${json.saleStart}</td>
                <td>${json.saleEnd}</td>
                <td><input type="checkbox" class="detail" onclick="detail(this)">
                </td>
            </tr>`)
                }else {
                    $('tbody').html(`            <tr class="table-danger">
                <td colspan="4">查無資料</td>
            </tr>`)
                }
            })
    }else swal("格式錯誤!", "只能是數字且開頭不為0!", "error");
})