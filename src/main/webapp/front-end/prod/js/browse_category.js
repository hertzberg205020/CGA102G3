window.onload = function (){
    fetch('/CGA102G3/ProdServlet.do?action=shop_Category')
        .then(response => response.json())
        .then(function(myjson) {
            let result = document.getElementById('result');
   			result.innerText = myjson.length;
   			
			if (myjson.length == 0 ) {
			$('.d-flex').append(`<div class="text-center text-muted" style="font-size: 20px;">此分類目前無商品</div>`);
			}
			
            for(let i = 0; i < myjson.length; i++) {
					let json= myjson[i];
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
					} else {
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
					}
				}
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
    let id =($(e).parent().attr('id'));
    fetch('/CGA102G3/ProdServlet.do?prodID=' + id + '&action=add')
        .then(response => response.text())
        .then(myjson => {
            if(myjson === 'success') alert('加入成功');
            else alert('加入失敗');
        })
}
