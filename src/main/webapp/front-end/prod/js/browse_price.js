window.onload = function (){
    fetch('/CGA102G3/ProdServlet.do?action=shop_Price')
        .then(response => response.json())
        .then(function(myjson) {
            let result = document.getElementById('result');
//   			result.innerText = myjson.length;
            let dataRow = 0;
            if (myjson.length == 0) {
                $('.d-flex').append(`<div class="text-center text-muted" style="font-size: 20px;">查無相關商品</div>`);
            }

            for(let i = 0; i < myjson.length; i++) {
                let json= myjson[i];
                let x = 0;
                let json2= myjson[i+1];
                if(json2){
                    x = json2.prodID
                }
                let y = 0;
                let json3= myjson[i-1];
                if(json3){
                    y = json3.prodID;
                }
                if (json.prodID  === x) {
                    $('.d-flex').append(`<div class="flex-item mb-3" id=${json2.prodID}>
												<div class="picture mb-2">
													<img src="/CGA102G3/static/images/books/${json2.prodID}.jpg">
												</div>
												<div class="title text-dark p-2" style="font-weight:600;">
													<a href="/CGA102G3/ProdServlet.do?action=getOne_For_Display&prodID=${json2.prodID}">${json2.title}</a>
												</div>
												<div class="price text-dark mb-2 p-2 " style="font-size: 14px;">價格: <span style="text-decoration:line-through;">${json2.price1}</span> 元 優惠價: <span style="color:indianred;">${json2.price2}</span> 元
												</div>
												<button class="btn btn-sm btn-warning ml-3" onclick="add(this)">加入購物車 <i class="bi bi-cart-plus"></i></button>
											</div>`);
                    dataRow++;
                } else if (json.prodID === y) {
                    continue;
                }
                else {
                    if (json.discount === 'Y') {
                        $('.d-flex').append(`<div class="flex-item mb-3" id=${json.prodID}>
												<div class="picture mb-2">
													<img src="/CGA102G3/static/images/books/${json.prodID}.jpg">
												</div>
												<div class="title text-dark p-2" style="font-weight:600;">
													<a href="/CGA102G3/ProdServlet.do?action=getOne_For_Display&prodID=${json.prodID}">${json.title}</a>
												</div>
												<div class="price text-dark mb-2 p-2 " style="font-size: 14px;">價格: <span style="text-decoration:line-through;">${json.price1}</span> 元 優惠價: <span style="color:indianred;">${json.price2}</span> 元
												</div>
												<button class="btn btn-sm btn-warning ml-3" onclick="add(this)">加入購物車 <i class="bi bi-cart-plus"></i></button>
											</div>`);
                        dataRow++;
                    } else if (json.discount === 'N') {
                        $('.d-flex').append(`<div class="flex-item mb-3" id=${json.prodID}>
								<div class="picture mb-2">
									<img src="/CGA102G3/static/images/books/${json.prodID}.jpg">
								</div>
								<div class="title text-dark p-2" style="font-weight:600;">
									<a href="/CGA102G3/ProdServlet.do?action=getOne_For_Display&prodID=${json.prodID}">${json.title}</a>
								</div>
								<div class="price text-dark mb-2 p-2" style="font-size: 14px;">價格: <span>${json.price1} 元</div>
								<button class="btn btn-sm btn-warning ml-3" onclick="add(this)">加入購物車 <i class="bi bi-cart-plus"></i></button>
							</div>`);
                        dataRow++;
                    }
                }
            }
            result.innerText = dataRow;
        });
    fetch('/CGA102G3/ProdServlet.do?action=get_Category')
        .then(response => response.json())
        .then(function(myjson) {
            for(let i = 0; i < myjson.length; i++) {
                let json= myjson[i];
                $('.side').append(`<div class="col-12 category-item mb-2" id=c ${json.categoryID} ><a href="/CGA102G3/ProdServlet.do?action=get_Category_Prod&categoryID=${json.categoryID}"> ${json.categoryName} </a></div>`);
            }
        });
}


function add(e) {

    let path = $('#path').val();
    let id = $(e).parent().attr('id');

    console.log(id)

    fetch(path + '/ProdServlet.do?prodID=' + id + '&action=add')
        .then(response => response.text())
        .then(myjson => {
            if (myjson === 'success') swal("Good job!", "加入成功", "success");
            else {
                swal("加入失敗!請先登入", "5秒後為你跳轉畫面", "error");
                setTimeout(function () {
                    location.href = `${path}/front-end/mem/login.jsp`
                }, 3000);
            }
        })
}





