window.onload = function (){
    let path = $('#path').val();
    fetch(path + '/ProdServlet.do?action=shop')
        .then(response => response.json())
        .then(function(myjson) {
            for(let i=0; i<myjson.length; i++){
                let json = myjson[i];
                $('.flex').append('<div class="card text-center" id='+ json.prodID +'></div>');
                $('#'+`${json.prodID}`).append('<a href="'+path+'/ProdServlet.do?action=getOne_For_Display&prodID='+json.prodID+'">'
                    + '<img src="'+path+'/static/images/books/'+json.prodID+'.jpg" class="card-img-top"></a>');
                $('#'+`${json.prodID}`).append('<div class="card-body" id=prodid-'+json.prodID+'></div>');
                $('#'+`${json.prodID}`).children(':first-child').append('<h5 class="card-title">'+json.title+'</h5>');
                $('#'+`${json.prodID}`).children('div').append('<p class="card-text"><span class="info-title">'
                    + '定價:</span><span class="info-content">$'+json.price+'</span></p><button class="btn btn-primary" onclick="add(this)" style="width: 70%">加入購物車</button>')
            }
        });
}

function add(e) {
    let path = $('#path').val();
    let id =($(e).parent().attr('id')).substr(7);
    fetch(path + '/ProdServlet.do?prodID=' + id + '&action=add')
        .then(response => response.text())
        .then(myjson => {
            if(myjson === 'success') swal("Good job!", "加入成功", "success");
            else swal("Oops...", "加入失敗!", "error");
        })
}

