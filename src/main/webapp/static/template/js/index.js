/**
 Alan, for Front-index
 */
  window.onload = function (){
        fetch('/CGA102G3/ProdServlet.do?action=indexshop')
            .then(response => response.json())
            .then(function(myjson) {
             	console.log(myjson);
                for(let i = 0; i < myjson.length; i++) {
         let json= myjson[i];
         
         if (json.discount === 'Y') {
         $('#prod_list').append(`</li>
         		 <div class="col-3" style="margin-top:20px; margin-bottom:20px">
         		 	<div class="mb-2" style="height: 200px;margin: auto;text-align: center;">
         		 		<img style="height:100%; margin:auto;" src="/CGA102G3/static/images/books/${json.bookID}.jpg"></div>
                 	<div class="title" style="width:200px; font-weight:700;">
                 		<a href="/CGA102G3/ProdServlet.do?action=getOne_For_Display&prodID=${json.prodID}" style="width:100px" >${json.title}</a></div>
              	 	<div class="2-price text-dark mb-2 p-2" style="width:200px;">
              	 		定價: <span style="text-decoration:line-through;">${json.price1}</span>元<br>
              	 		優惠: <span style="color:indianred;">${json.price2}</span>元</div>
          		 	<div class="2-btn"style="width:200px;display:flex;margin-left:-15px">
          		 		<button class="btn btn-sm btn-warning ml-3" style="width:100px" onClick="add(${json.bookID})">
          		 		放入購物車</button>
           		 </div></li>`)
        }else{
		$('#prod_list').append(`</li>
         		 <div class="col-3" style="margin-top:20px; margin-bottom:20px">
         		 	<div class="mb-2" style="height: 200px;margin: auto;text-align: center;">
         		 		<img style="height:100%; margin:auto;" src="/CGA102G3/static/images/books/${json.bookID}.jpg"></div>
                 	<div class="title" style="width:200px; font-weight:700;">
                 		<a href="/CGA102G3/ProdServlet.do?action=getOne_For_Display&prodID=${json.prodID}" style="width:100px" >${json.title}</a></div>
              	 	<div class="2-price text-dark mb-2 p-2" style="width:200px;">
              	 		定價: <span>${json.price1}</span>元</div><br>
          		 	<div class="2-btn"style="width:200px;display:flex;margin-left:-15px">
          		 		<button class="btn btn-sm btn-warning ml-3" style="width:100px" onClick="add(${json.bookID})">
          		 		放入購物車</button>
					</div></li>`)
				}
            }
    	})
    	
    	
    	 fetch('/CGA102G3/ProdServlet.do?action=indexts')
            .then(response => response.json())
            .then(function(myjson) {
             	console.log(myjson);
                for(let i = 0; i < myjson.length; i++) {
         let json= myjson[i];
         
 if (json.discount === 'Y') {
         $('#topsale_list').append(`</li>
         		 <div class="col-3" style="margin-top:20px; margin-bottom:20px">
         		 	<div class="mb-2" style="height: 200px;margin: auto;text-align: center;">
         		 		<img style="height:100%; margin:auto;" src="/CGA102G3/static/images/books/${json.bookID}.jpg"></div>
                 	<div class="title" style="width:200px; font-weight:700;">
                 		<a href="/CGA102G3/ProdServlet.do?action=getOne_For_Display&prodID=${json.prodID}" style="width:100px" >${json.title}</a></div>
              	 	<div class="2-price text-dark mb-2 p-2" style="width:200px;">
              	 		定價: <span style="text-decoration:line-through;">${json.price1}</span>元<br>
              	 		優惠: <span style="color:indianred;">${json.price2}</span>元</div>
          		 	<div class="2-btn"style="width:200px;display:flex;margin-left:-15px">
          		 		<button class="btn btn-sm btn-warning ml-3" style="width:100px" onClick="add(${json.bookID})">
          		 		放入購物車</button>
           		 </div></li>`)
        }else{
		$('#topsale_list').append(`</li>
         		 <div class="col-3" style="margin-top:20px; margin-bottom:20px">
         		 	<div class="mb-2" style="height: 200px;margin: auto;text-align: center;">
         		 		<img style="height:100%; margin:auto;" src="/CGA102G3/static/images/books/${json.bookID}.jpg"></div>
                 	<div class="title" style="width:200px; font-weight:700;">
                 		<a href="/CGA102G3/ProdServlet.do?action=getOne_For_Display&prodID=${json.prodID}" style="width:100px" >${json.title}</a></div>
              	 	<div class="2-price text-dark mb-2 p-2" style="width:200px;">
              	 		定價: <span>${json.price1}</span>元</div><br>
          		 	<div class="2-btn"style="width:200px;display:flex;margin-left:-15px">
          		 		<button class="btn btn-sm btn-warning ml-3" style="width:100px" onClick="add(${json.bookID})">
          		 		放入購物車</button>
          		 		</div></li>`)
				}
            }
         }
    )};