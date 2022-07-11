/* table of content toggle collapse */ 
        
function toggleTOC() {
    let len = 1000;
    let div = document.getElementById('content');
    let content = div.innerHTML;

    let span = document.createElement('span');
    let a = document.createElement('a');
    span.innerHTML = content.substring(0, len);

    a.innerHTML = content.length > len? '  <i class="bi bi-caret-down-square"></i>看更多':'';
    a.href = "javascript: void(0)";
    a.id = "readMore"
    
    a.onclick = function() {
        if (a.innerHTML.indexOf('看更多') > 0) {
            a.innerHTML = '  <i class="bi bi-caret-up-square"></i>收起';
            span.innerHTML = content;
        } else {
            a.innerHTML = '  <i class="bi bi-caret-down-square"></i>看更多';
            span.innerHTML = content.substring(0, len);
        }
    }
    div.innerHTML = "";
    div.appendChild(span);
    div.appendChild(a);
}
