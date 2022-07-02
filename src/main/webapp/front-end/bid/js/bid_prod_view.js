let curPage = 1;
let keyword = '';
let bidInfoList = [];
let _prePage = -1;
let _nextPage = -1;
const nextPageBtn = document.querySelector('#nextPageBtn');
const prePageBtn = document.querySelector('#prePageBtn');
const prefix = document.querySelector('#prefix').value;
const keyword_input = document.querySelector('#keyword_input');
const keyword_input_btn = document.querySelector('#keyword_input_btn');


/**
 * 加載書籍資訊，每頁12筆
 */
function loadInf() {
    $.ajax({
        type: 'GET',
        url: `${prefix}/bid/api/getBidInfoListByKeyword`,
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
            bidInfoList = [...data];
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

/**
 * 日期格式
 * @param current_datetime
 * @returns {string}
 */
// const formatDate = (current_datetime) => {
//     return current_datetime.getFullYear() + "-" + (current_datetime.getMonth() + 1) + "-" + current_datetime.getDate() + " " + current_datetime.getHours() + ":" + current_datetime.getMinutes() + ":" + current_datetime.getSeconds();
// }

// 呈現搜索數據
function showInfo() {
    const tbody = $('tbody');
    // 清理畫面
    tbody.empty();
    for (const bidInfo of bidInfoList) {
        tbody.append(`
             <tr>
                <th scope="row">${bidInfo.bid_id}</th>
                <td>${bidInfo.ISBN}</td>
                <td>${bidInfo.edition}</td>
                <td>${bidInfo.title}</td>
                <td>${bidInfo.bid_end}</td>
                <td>
                    <button type="button" class="btn btn-primary" 
                    onclick="javascript:location.href='${prefix}/bid/participate/getOneBid?bidID=${bidInfo.bid_id}'">
                        <i class="far fa-eye"></i>
                    </button>
                </td>
            </tr> 
        `);

    }
    if (bidInfoList.length === 0) {
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

    keyword_input_btn.addEventListener('click', () => {
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