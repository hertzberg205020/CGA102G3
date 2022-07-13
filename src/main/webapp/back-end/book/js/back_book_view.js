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
        let tableContentArr = book['tableContent']?.split(/[\n(\r\n)]/g);
        let summaryArr = book['summary']?.split(/[\n(\r\n)]/g);
        $('#modal_container').append(`
            <div class="modal fade" id=Modal${book.bookID}>
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5>${book.title}</h5>
                                <button class="close" data-dismiss="modal">
                                    <span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h5>簡介</h5>
                                <hr/>
                                <div id=summary${book.bookID}></div>
                                <h5 class="mt-5">目錄</h5>
                                <hr/>
                                <div id=tableContain${book.bookID}></div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" data-dismiss="modal">關閉</button>
                            </div>
                        </div>
                    </div>
            </div>
        `);
        if (tableContentArr !== undefined && tableContentArr.length !== 1) {
            for (const line of tableContentArr) {
                if (line.trim().length !== 0) {
                    $(`#tableContain${book.bookID}`).append(
                        `${line}<br/>`
                    );
                }
            }
        } else {
            $(`#tableContain${book.bookID}`).append(
                `尚未填寫任何資訊<br/>`
            );
        }

        if (summaryArr !== undefined && summaryArr.length !== 1) {
            for (const line of summaryArr) {
                if (line.trim().length !== 0) {
                    $(`#summary${book.bookID}`).append(
                        `${line}<br/>`
                    );
                }
            }
        } else {
            $(`#summary${book.bookID}`).append(
                `尚未填寫任何資訊<br/>`
            );
        }

        tbody.append(`
             <tr>
                <th scope="row" class="align-middle">${book.bookID}</th>
                <td class="align-middle">${book.ISBN}</td>
                <td class="align-middle">${book.edition}</td>
<!--                <td>${selectOneAuthor(book.author)}</td>-->
                <td class="align-middle">${book.title}</td>
                <td class="align-middle">${book.categoryName}</td>
                <td class="align-middle">
                    <button type="button" class="btn btn-primary" data-target=#Modal${book.bookID} data-toggle="modal"><i class="fas fa-cog fa-spin"></i></button>
                    <button type="button" class="btn btn-success" 
                        onclick="javascript:location.href='${prefix}/book/update/getOneForUpdate?bookID=${book.bookID}'">
                        <i class="fa-solid fa-circle-plus fa-beat"></i>
                    </button>
                </td>
            </tr> 
        `);

    }
    if (books.length === 0) {
        tbody.append(`<th colspan="6" style="color: palevioletred">未找到符合條件的結果</th>>`);
    }

    nextPageBtn.classList.remove('invisible');
    prePageBtn.classList.remove('invisible');

    nextPageBtn['disabled'] = (_nextPage === -1);
    prePageBtn['disabled'] = (curPage <= 1);

    if (_nextPage === -1) {
        nextPageBtn.classList.add('invisible');
    }
    if (curPage <= 1) {
        prePageBtn.classList.add('invisible');
    }
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