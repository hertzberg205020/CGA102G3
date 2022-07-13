//大吳老師日期選擇器
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){
    $('#date1').datetimepicker({
        closeOnWithoutClick :false,
        format:'Y-m-d',
        onShow:function(){
            this.setOptions({
                maxDate:$('#date2').val()?$('#date2').val():false
            })
        },
        timepicker: false
    });
    $('#date2').datetimepicker({
        closeOnWithoutClick :false,
        format:'Y-m-d',
        onShow:function(){
            this.setOptions({
                minDate:$('#date1').val()?$('#date1').val():false
            })
        },
        timepicker:false
    });
});
let path = $('#path').val();
$('#date1').change(function (){
    if (!$(this).val()) swal("哎呀!", "還沒選取時間!", "error");
    else{
        $.ajax({
            url: path + '/SaleServlet.do',
            type: 'post',
            dataType : 'text',
            data : {'action':'judge1','saleStart': $('#date1').val()},
            success : function (res){
                console.log(res)
                if (res === 'false') swal("哎呀!", "起始時間無法選取!", "error");
            },
            error : function (err) {
                console.log(err);
            }
        })
    }
})
$('#date2').blur(function (){
    if(!$(this).val()) swal("哎呀!", "還沒選取時間!", "error");
    else {
        $.ajax({
            url : path + '/SaleServlet.do',
            type: 'post',
            dataType : 'text',
            data : {'action':'judge2','saleStart': $('#date1').val(),'saleEnd':$('#date2').val()},
            success : function (res){
                console.log(res);
                if (res === 'true'){
                    $('button').removeAttr('disabled');
                }else {
                    $('button').attr('disabled', 'disabled');
                    swal("哎呀!", "此區間已有方案!", "error");
                }
            },
            error : function (err) {
                console.log(err);
            }
        })
    }
})
$('button').click(function (){
    $.ajax({
        url : path + '/SaleServlet.do',
        type: 'post',
        dataType : 'text',
        data : {'action': 'add', 'saleStart': $('#date1').val(),'saleEnd':$('#date2').val(), 'category' : $('select[name=category]').val(),'discount':$('select[name=discount]').val()},
        success : function (res){
            if(res === "true"){
                swal("Good job!", "加入成功", "success");
                location.href = path + '/back-end/sale/sale.jsp';
            }
        },
        error : function (err) {
            console.log(err);
        }
    });
})