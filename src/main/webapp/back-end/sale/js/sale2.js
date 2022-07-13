
$('#search').click(function (){
    let path = $('#path').val();
    let id = $('input[name=bid_id]').val()
    if (id.match(/^([1-9]\d*)(\.\d*[0-9])?$/)){
        fetch(`${path}/SaleServlet.do?action=getOne&saleID=${id}`)
            .then(response => response.json())
            .then(function (json) {
                if (json){
                    $('tbody').html(`            <tr>
                <td>${json.saleID}</td>
                <td>${json.saleStart}</td>
                <td>${json.saleEnd}</td>
                <td><button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#edit"
                            data-title="${json.saleID}"><i class="bi bi-card-list"></i></button></td>
                <td><button class="delete2 btn btn-danger" onclick="deleteOne(this)">取消</button></td>
            </tr>`)
                }else {
            //         $('tbody').html(`            <tr class="table-danger">
            //     <td colspan="5">查無資料</td>
            // </tr>`)
                    swal("查無資料!", "請重新輸入!", "error");
                }
            })
    }else swal("格式錯誤!", "只能是數字且開頭不為0!", "error");
})
function deleteOne(e){
    let path = $('#path').val();
    let saleID = $(e).parents('tr').find('td:first').text();
    let tr = $(e).parents('tr');
    swal({
        title: "確定刪除?",
        text: "刪除後，資料無法復原!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {
                fetch(`${path}/SaleServlet.do?action=delete&saleID=${saleID}`)
                    .then(response => response.text())
                    .then(function (res){
                        if (res === 'true'){
                            swal("成功刪除!", {
                                icon: "success",
                            });
                            tr.remove();
                        }else {
                            swal("刪除失敗!", {
                                icon: "error",
                            });
                        }
                    })
            } else {
                swal("取消刪除!");
            }
        });
}

