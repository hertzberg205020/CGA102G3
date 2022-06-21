let curPage = 1;
let keyword = '';
let books = [];
let _prePage = -1;
let _nextPage = -1;
const nextPageBtn = document.querySelector('#nextPageBtn');
const prePageBtn = document.querySelector('#prePageBtn');
const prefix = document.querySelector('#prefix').value;
const keyword_input = document.querySelector('#keyword_input');
const search_btn = document.querySelector('#search_btn');


/**
 * 加載書籍資訊，每頁12筆
 */
function loadInf() {
    $.ajax({
        type: 'GET',
        url: `${prefix}/book/api/getBooksByKeyword`,
        data: {
            'page': curPage,
            'keyword': keyword
        },
        dataType: 'json',
        async: false,
        success: function (response) {
            // {nextPage: 2, date: []}
            let {nextPage, data} = response;
            _nextPage = nextPage;
            books = [...data];
        },
        error: function (thrownError) {
            console.log(thrownError);
        }
    });
}

/**
 * authors {String}
 * @param authors
 * @returns {string}
 */
function selectOneAuthor(authors) {
    const names = authors.split('/');
    return names[0];
}


// 呈現搜索數據
function showInfo() {
    const tbody = $('tbody');
    // 清理畫面
    tbody.empty();
    for (const book of books) {
        tbody.append(`
             <tr>
                <th scope="row">${book.bookID}</th>
                <td>${book.ISBN}</td>
                <td>${book.edition}</td>
<!--                <td>${selectOneAuthor(book.author)}</td>-->
                <td>${book.title}</td>
                <td>${book.categoryName}</td>
                <td>
                    <button type="button" class="btn btn-primary"><i class="far fa-eye"></i></button>
                    <button type="button" class="btn btn-success" 
                        onclick="javascript:location.href='${prefix}/book/update/getOneForUpdate?bookID=${book.bookID}'">
                        <i class="fas fa-edit"></i>
                    </button>
                </td>
            </tr> 
        `);

    }
    if (books.length === 0) {
        tbody.append(`未找到符合條件的結果`);
    }

    nextPageBtn.hidden = (_nextPage === -1);
    prePageBtn.hidden = (curPage <= 1);
}

function init() {
    loadInf();
    showInfo();

    nextPageBtn.addEventListener('click', (evt) => {
        _prePage = curPage;
        curPage++;
        loadInf();
        showInfo();
    });

    prePageBtn.addEventListener('click', (evt) => {
        [curPage, _nextPage] = [_prePage, curPage];
        _prePage--;
        loadInf();
        showInfo();
    });

    search_btn.addEventListener('click', () => {
        keyword_input.value = keyword_input.value.trim();
        if (keyword_input.value === '') {
            curPage = 1;
            keyword = '';
            loadInf();
            showInfo();
        }
        curPage = 1;
        keyword = keyword_input.value;
        loadInf();
        showInfo();
    });

}

init();