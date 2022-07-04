window.onload = function (){
    fetch('/CGA102G3/ProdServlet.do?action=shop_Category')
        .then(response => response.json())
        .then(function(myjson) {
            for(let i = 0; i < myjson.length; i++) {
					let json= myjson[i];
					console.log(json);
	                if (json.discount === 'Y') {
						$('.d-flex').append(`<div class="flex-item mb-3" id=${json.prodID}><div class="picture mb-2"><img src="/CGA102G3/static/images/books/${json.prodID}.jpg"></div><div class="title text-dark p-2" style="font-weight:600;"><a href="/CGA102G3/ProdServlet.do?action=getOne_For_Display&prodID=${json.prodID}">${json.title}</a></div><div class="price text-dark mb-2 p-2 ">價格: <span style="text-decoration:line-through;">${json.price1}</span> 優惠價: <span style="color:indianred;">${json.price2}</span></div><button class="btn btn-sm btn-warning ml-3" onclick="add(this)">放入購物車</button><button class="btn btn-sm btn-outline-secondary ml-2 onclick="#">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button></div>`);
					} else {
						$('.d-flex').append(`<div class="flex-item mb-3" id=${json.prodID}><div class="picture mb-2"><img src="/CGA102G3/static/images/books/${json.prodID}.jpg"></div><div class="title text-dark p-2" style="font-weight:600;"><a href="/CGA102G3/ProdServlet.do?action=getOne_For_Display&prodID=${json.prodID}">${json.title}</a></div><div class="price text-dark mb-2 p-2 ">價格: <span>${json.price1}</div><button class="btn btn-sm btn-warning ml-3" onclick="add(this)">放入購物車</button><button class="btn btn-sm btn-outline-secondary ml-2 onclick="#">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button></div>`);
					}

				}
        });
      fetch('/CGA102G3/ProdServlet.do?action=get_Category')
        .then(response => response.json())
        .then(function(myjson) {
            for(let i = 0; i < myjson.length; i++) {
					let json= myjson[i];
					$('.side').append(`<div class="col-12 category-item mb-2" id=c ${json.categoryID} ><a href="#"> ${json.categoryName} </a></div>`);
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




//window.onload = function (){
//    fetch('/CGA102G3/ProdServlet.do?action=shop')
//        .then(response => response.json())
//        .then(function(myjson) {
//            for(let i = 0; i < myjson.length; i++) {
//					let json= myjson[i];
//					$('.d-flex').append('<div class="flex-item mb-3" id=' + json.prodID + '></div>');
//	                $('#' +`${json.prodID}`).append('<div class="picture mb-2"><img src="/CGA102G3/static/images/books/' + json.prodID + '.jpg"></div>');
//	                $('#' +`${json.prodID}`).append('<div class="title text-dark p-2" style="font-weight:600;"><a href="/CGA102G3/ProdServlet?action=getOne_For_Display&prodID=' + json.prodID + '">' + json.title + '</a></div>');
//					if (json.discount === 'Y') {
//						$('#' +`${json.prodID}`).append('<div class="price text-dark mb-2 p-2 ">價格: <span style="text-decoration:line-through;">'+ json.price1 + '</span> 優惠價: <span style="color:indianred;">' + json.price2 + '</span></div>');
//					} else {	
//						$('#' +`${json.prodID}`).append('<div class="price text-dark mb-2 p-2 ">價格: <span>'+ json.price1 + '</div>');
//	                }
//					$('#' +`${json.prodID}`).append('<button class="btn btn-sm btn-warning ml-3" onclick="add(this)">放入購物車</button>');
//	                $('#' +`${json.prodID}`).append('<button class="btn btn-sm btn-outline-secondary ml-2 onclick="#">收藏 <i class="bi bi-heart-fill" style="color: lightcoral"></i></button>');
//				}
//        });
//      fetch('/CGA102G3/ProdServlet.do?action=get_Category')
//        .then(response => response.json())
//        .then(function(myjson) {
//            for(let i = 0; i < myjson.length; i++) {
//					let json= myjson[i];
//					$('.side').append(`<div class="category-item mb-2" id=c ${json.categoryID} ><a href="#"> ${json.categoryName} </a></div>`);
//				}
//        });
//}

