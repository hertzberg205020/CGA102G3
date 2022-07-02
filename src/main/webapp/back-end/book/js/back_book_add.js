const form = document.querySelector('form');
const title = document.querySelector('#title');
const ISBN = document.querySelector('#ISBN');
const book_category = document.querySelector('#book_category');
const author = document.querySelector('#author');
const edition = document.querySelector('#edition');
const submit_btn = document.querySelector('#submit_btn');
const uploadImg = document.querySelector('#uploadImg');
const publisher = document.querySelector('#publisher');
const translator = document.querySelector('#translator');
const prefix = document.querySelector('#prefix').value;
const fieldset = document.querySelector('fieldset');


const status = {'ISBN': false, 'edition': false, title: false, author: false};
let editions = [];


/**
 * 生成書目種類選項
 * @param {Object} categories 書目種類列表
 */
function genCategories(categories) {
    for (const category of categories) {
        $('#book_category').append(`
            <option value="${category['categoryName']}">${category['categoryName']}</option>>
        `);
    }
}

/**
 * 發送api，獲得書目種類
 */
function getCategories() {
    $.ajax({
        type: 'GET',
        url: `${prefix}/book/api/getCategories`,
        dataType: 'json',
        async: false,
        success: function (response) {
            const categories = [];
            categories.push(...response);
            genCategories(categories);
        },
        error: function (thrownError) {
            console.log(thrownError);
        }
    });
}

/**
 * 檢視輸入的isbn格式是否正確
 * @param isbn
 */
function isbn_validate(isbn) {
    // const subject = document.getElementById("isbn").value;

    // Checks for ISBN-10 or ISBN-13 format
    // https://www.oreilly.com/library/view/regular-expressions-cookbook/9781449327453/ch04s13.html
    const ISBN_13_pattern = '^' +
        '(?:ISBN(?:-13)?:?\\ )?' +
        '(?=' +
        '[0-9]{13}$' +
        '|' +
        '(?=(?:[0-9]+[-\\ ]){4})' +
        '[-\\ 0-9]{17}$' +
        ')' +
        '97[89][-\\ ]?' +
        '[0-9]{1,5}[-\\ ]?' +
        '[0-9]+[-\\ ]?[0-9]+[-\\ ]?' +
        '[0-9]' +
        '$';

    const regex = new RegExp(ISBN_13_pattern);

    if (regex.test(isbn)) {
        // Remove non ISBN digits, then split into an array
        const chars = isbn.replace(/[- ]|^ISBN(?:-1[03])?:?/g, "").split("");
        // Remove the final ISBN digit from `chars`, and assign it to `last`
        const last = chars.pop();
        let sum = 0;
        let check, i;

        if (chars.length === 9) {
            // Compute the ISBN-10 check digit
            chars.reverse();
            for (i = 0; i < chars.length; i++) {
                sum += (i + 2) * parseInt(chars[i], 10);
            }
            check = 11 - (sum % 11);
            if (check === 10) {
                check = "X";
            } else if (check === 11) {
                check = "0";
            }
        } else {
            // Compute the ISBN-13 check digit
            for (i = 0; i < chars.length; i++) {
                sum += (i % 2 * 2 + 1) * parseInt(chars[i], 10);
            }
            check = 10 - (sum % 10);
            if (check === 10) {
                check = "0";
            }
        }

        return parseInt(check) === parseInt(last);

    } else {
        return false;
    }
}

function chkPass() {
    let res = 0;
    for (const filed in status) {
        if (!status[filed]) {
            submit_btn['disabled'] = true;
            return;
        }
    }
    submit_btn['disabled'] = false;
}

function sendFormData(res) {
    const bookData = new FormData(form);
    $.ajax({
        type: 'POST',
        url: `${prefix}/book/edit`,
        data: bookData,
        contentType: false,
        processData: false,
        dataType: 'json',
        async: false,
        success: function (response) {
            const {err, msg} = {...response};
            res['err'] = err;
            fieldset['disabled'] = true;
            submit_btn['disabled'] = true;
        },
        error: function (thrownError) {
            console.log(thrownError);
        }
    });
}


/**
 * 初始化各式綁定事件
 */
function init() {
    /**
     * 使用sweetAlter綁定提交事件
     */
    submit_btn.addEventListener('click', event => {
        event.preventDefault();    // ←取消預設事件行為
        swal({
            title: "確認送出 ?",
            text: "請再次確認輸入資料",
            icon: "info",
            buttons: true,
            dangerMode: true,
        })
            .then((willDelete) => {
                if (willDelete) {
                    // form.submit();
                    // 送出資料
                    let res = {err: true};
                    sendFormData(res);
                    if (!res['err']) {
                        swal({
                            position: 'top',
                            icon: 'success',
                            title: '資料新增成功',
                            button: false,
                            timer: 2000
                        });
                    } else {
                        swal({
                            title: "新增失敗",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        });
                    }

                } else {
                    swal({
                        title: "未新增任額資訊",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true,
                    });
                }
            });
    });

    function editionDuplicatedHint() {
        let hint = '';
        for (const e of editions) {
            hint += `${e}, `;
        }
        $('#edition ~.invalid-feedback').text(`資料庫中已有第${hint.slice(0, -2)} 版次`);
        edition.classList.add('is-invalid');
        status['edition'] = false;
    }

    /**
     * 上傳圖片時顯示所上傳的圖片
     */
    uploadImg.addEventListener('change', (evt) => {
        // 取得input['file']中所上傳的檔案
        const files = evt.target.files;
        const img_container = $('#img_container');
        const url = window.URL.createObjectURL(files[files.length - 1]);
        // 清空照片 或 No files selected!
        img_container.empty();
        // 插入照片
        img_container.append(`
            <img src="${url}" id="fileImg" class="">
        `);
    });

    ISBN.addEventListener('blur', (evt) => {
        // 每次輸入都重新驗證
        status['ISBN'] = false;
        const value = ISBN.value.replace(/[- ]|^ISBN(?:-1[03])?:?/g, "");
        const _ISBN = $('#ISBN');
        // 移除警告 或 許可提示
        const classList = ISBN.classList;
        classList.remove('is-valid');
        classList.remove('is-invalid');

        if (value === '') {
            return;
        }

        if (!isbn_validate(value)) {
            classList.add('is-invalid');
            $('#ISBN ~ .invalid-feedback').text('isbn格式不正確');
            chkPass();
            return;
        }

        // 用ajax檢視資料庫中是否有有相同isbn編號的書籍，在editions中添加版次
        $.ajax({
            type: 'GET',
            url: `${prefix}/book/api/getEditionsByISBN?ISBN=${value}`,
            dataType: 'json',
            async: false,
            success: function (response) {
                editions = [];
                editions.push(...response);

            },
            error: function (thrownError) {
                console.log(thrownError);
            }
        });


        // 提示資料庫中存有的版次
        const edition_classList = edition.classList;
        edition_classList.remove('is-valid');
        edition_classList.remove('is-invalid');
        if (editions.indexOf(parseInt(edition.value)) !== -1) {
            // 移除許可
            editionDuplicatedHint();
        } else {
            edition_classList.add('is-valid');
            status['edition'] = edition.value;
        }

        classList.add('is-valid');
        $('#ISBN ~ .valid-feedback').text('有效數據');
        status['ISBN'] = value;
        chkPass();

        // 去除除了數字以外的字元
        ISBN.value = value;
    });

    // 避免特定的isbn在資料庫中與上傳數據版次相同
    edition.addEventListener('change', () => {
        // 移除許可提示 和 警告
        const edition_classList = edition.classList;
        edition_classList.remove('is-valid');
        edition_classList.remove('is-invalid');

        status['edition'] = false;

        if (ISBN.classList.contains('is-valid')) {
            //
            if (editions.indexOf(parseInt(edition.value)) === -1) {
                edition_classList.remove('is-invalid');
                edition_classList.add('is-valid');
                status['edition'] = edition.value;
            } else {
                edition_classList.add('is-invalid');
                editionDuplicatedHint();
            }
        }
        chkPass();
    });

    title.addEventListener('change', () => {
        status['title'] = false;
        const classList = title.classList;
        classList.remove('is-invalid');
        classList.remove('is-valid');
        title.value = title.value.trim();
        if (title.value.length !== 0) {
            classList.add('is-valid');
            status['title'] = title.value;
        } else {
            classList.add('is-invalid');
            status['title'] = false;
        }
        chkPass();
    });

    author.addEventListener('change', () => {
        status['author'] = false;
        const classList = author.classList;
        classList.remove('is-invalid');
        classList.remove('is-valid');
        author.value = author.value.trim();
        if (author.value.length !== 0) {
            classList.add('is-valid');
            status['author'] = author.value;
        } else {
            classList.add('is-invalid');
            status['author'] = false;
        }
        chkPass();
    });

    publisher.addEventListener('blur', () => {
        publisher.value = publisher.value.trim();
    });

    translator.addEventListener('blur', () => {
        translator.value = translator.value.trim();
    });


    // datetimepicker
    $.datetimepicker.setLocale('zh'); // kr ko ja en
    $('#pubdate').datetimepicker({
        theme: '',          //theme: 'dark',
        timepicker: true,   //timepicker: false,
        step: 1,            //step: 60 (這是timepicker的預設間隔60分鐘)
        format: 'Y-m-d',
        value: new Date(),
        //disabledDates:    ['2022/06/08','2022/06/09','2022/06/10'], // 去除特定不含
        //startDate:	        '2022/07/10',  // 起始日
        //minDate:           '-1970-01-01', // 去除今日(不含)之前
        //maxDate:           '+1970-01-01'  // 去除今日(不含)之後
    });

    // 檔案上傳時顯示上傳圖片的檔名
    $('#uploadImg').change(function (e) {
        $('.custom-file-label').html(e.target.files[e.target.files.length - 1].name);
    });

    getCategories();
}




init();