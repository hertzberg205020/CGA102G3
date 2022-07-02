const prefix = document.getElementById('prefix').value;
const mbrID = document.getElementById('mbrID').value;

// Call start
(async() => {
    await init();
})();

// dataTable樣式控制
$(document).ready( function () {
    $('#myTable').removeAttr('width').DataTable(
        {searching: false,
              info: false,
              paging: false,
              columnDefs: [
                { width: "10%", targets: 0, className: "dt-head-center", orderable: false },
                { width: "20%", targets: 1, className: "dt-head-center", orderable: false },
                { width: "10%", targets: 2, className: "dt-head-center", orderable: false },
                { width: "30%", targets: 3, className: "dt-head-center", orderable: false },
                { width: "10%", targets: 4, className: "dt-head-center", orderable: false },
                { width: "10%", targets: 5, className: "dt-head-center", orderable: false },
              ],
             fixedColumns: true
        }
    );
} );

function showEmpty() {
    const tbody = $('tbody');
    // 清理畫面
    tbody.empty();
    tbody.append(`
                 <tr>
                    <th colspan="6" style="color: #e4606d">未有任何競標訂單</th>
                </tr>
            `);
}

async function loadInf() {

    let url = `${prefix}/bidOrder/api/getBidOrderInfo?mbrID=${mbrID}`;
    await fetch(url, {
        method: 'GET',
        // headers 加入 json 格式
        headers: {
            'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        // body 將 json 轉字串送出
        // body: JSON.stringify({
        //     'mbrID': mbrID
        // })
    }).then((response) => {
        return response.json();
    }).then((jsonData) => {
        // 相當於success
        const {stat, data} = {...jsonData};
        if (stat === 'successful') {
            showInfo(data);
        }
        if (stat === 'empty') {
            showEmpty();
        }
    }).catch((err) => {
        console.log('錯誤:', err);
    });
}

function showInfo(data) {
    const tbody = $('tbody');
    // 清理畫面
    tbody.empty();
    for (const bidInfo of data) {
        const date = new Date(bidInfo.bidOrderDate);
        const formattedDate = date.toLocaleString('zh-TW', {
            year: "numeric",
            month: "short",
            day: "numeric",
            hour: "numeric",
            minute: "2-digit"
        });
        if (bidInfo.bidShipStat === '配送中') {
            tbody.append(`
                 <tr>
                    <th scope="row">${bidInfo.bidID}</th>
                    <td>${formattedDate}</td>
                    <td>${bidInfo.bidPrice}</td>
                    <td class="bookTitle">${bidInfo.title}</td>
                    <td>${bidInfo.bidShipStat}</td>
                    <td><button class="btn btn-sm chk_btn" id="${bidInfo.bidOrderID}">貨到確認</button></td>
                </tr>
            `);
            $(`#${bidInfo.bidOrderID}`).click(async function () {
                $(this).parent().prev().text('已送達');
                // 發送ajax請求，變更訂單狀態
                await(
                    async () => {
                        fetch(`${prefix}/bidOrder/api/updateStat2Delivered?bidOrderID=${bidInfo.bidOrderID}`
                            , {
                                method: 'GET',
                                // headers 加入 json 格式
                                headers: {
                                    'Content-Type': 'application/json',
                                },
                                credentials: 'same-origin',
                            }).then((response) => {
                            return response.json();
                        }).then((jsonData) => {
                            // 相當於success
                            const {stat} = {...jsonData};
                            if (stat === 'successful') {
                                swal({
                                    position: 'top',
                                    icon: 'success',
                                    title: '發送通知已收貨成功',
                                    button: false,
                                    timer: 2000
                                });
                            }
                        }).catch((err) => {
                            console.log('錯誤:', err);
                        })
                    }
                )();

                $(this).hide('slow');
            });
        } else {
            tbody.append(`
                 <tr>
                    <th scope="row">${bidInfo.bidID}</th>
                    <td>${formattedDate}</td>
                    <td>${bidInfo.bidPrice}</td>
                    <td class="bookTitle">${bidInfo.title}</td>
                    <td>${bidInfo.bidShipStat}</td>
                    <td></td>
                </tr>
            `);
        }
    }
}


async function init() {
    await loadInf();
}



