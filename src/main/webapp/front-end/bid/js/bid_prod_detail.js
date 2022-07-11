const bidDirectPrice = parseInt(document.querySelector('#bidDirectPrice').textContent.trim());
const bidStartPrice = parseInt(document.querySelector('#bidStartPrice').textContent.trim());
const offerPriceBtn = document.getElementById('offerPriceBtn');
const directGetBtn = document.getElementById('directGetBtn');
const bidPriceDOM = document.getElementById('bidPrice');
const directGetWarn = document.getElementById('directGetWarn');
const {body} = document;


// ============================上線後要拿掉============================
const testMbrIDBtn = document.getElementById('testMbrIDBtn');
// ============================上線後要拿掉============================



// ============================競標時間倒數計時器============================
// Set the date we're counting down to
const endTime = parseInt(document.getElementById('bidEnd').value);
const countDownDate = new Date(endTime).getTime();


// Update the count down every 1 second
const timer = setInterval(function() {

    // Get today's date and time
    const now = new Date().getTime();

    // Find the distance between now and the count down date
    const distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the result in the element with id="demo"
    document.getElementById("timerCounter").innerHTML = days + "天 " + hours + "時 "
        + minutes + "分 " + seconds + "秒 ";

    // If the count down is finished, write some text
    if (distance < 0) {
        clearInterval(timer);
        document.getElementById("timerCounter").innerHTML = "競標結束";
        const curWinnerID = $('#curWinnerID');
        if (curWinnerID.text() === '目前無會員出價') {
            curWinnerID.text('流標');
        } else {
            curWinnerID.text(curWinnerID.text() + ' 得標');
        }
        directGetBtn['disabled'] = true;
        offerPriceBtn['disabled'] = true;
    }
}, 1000);

// ============================競標時間倒數計時器============================




// ============================倒數結束要做的事============================
// const finish = setTimeout(() => {
//     const curWinnerID = $('#curWinnerID');
//     if (curWinnerID.text() === '目前無會員出價') {
//         curWinnerID.text('流標');
//     } else {
//         curWinnerID.text(curWinnerID.text() + ' 得標');
//     }
//     directGetBtn['disabled'] = true;
//     offerPriceBtn['disabled'] = true;
// }, countDownDate - new Date().getTime());
// ============================倒數結束要做的事============================




// ==========================================websocket==========================================
const bidID = parseInt(document.querySelector('#bidID').value.trim());
const endPoint = `/BidActivity/${bidID}`;
const host = window.location.host;
const path = window.location.pathname;

// 用這個可以避免用jsp中${pageContext.request.contextPath}找項目路徑
const webCtx = path.substring(0, path.indexOf('/', 1));
const prefix = webCtx;
const endPointURL = "ws://" + window.location.host + webCtx + endPoint;
let webSocket

function connect() {
    webSocket = new WebSocket(endPointURL);
    webSocket.addEventListener('open', event => { });
    webSocket.addEventListener('message', event => {
        let rspJson = JSON.parse(event.data);
        const {action, bidder, traceBidID} = rspJson;
        const curWinnerID = $('#curWinnerID');
        const curBidPrice = $('#curBidPrice');
        if (traceBidID !== bidID) {
            return;
        }
        if (action === "init") {
            let {mbrID, price} = bidder;

            if (mbrID === -1) {
                curWinnerID.text('目前無會員出價');
                curBidPrice.text($('#bidStartPrice').text());
                return;
            }
            curWinnerID.text(mbrID);
            curBidPrice.text(price);
            return;
        }

        if (action === "CONTINUED") {
            let {mbrID, price} = bidder;
            curWinnerID.text(mbrID);
            curBidPrice.text(price);
            return;
        }

        if (action === "ENDGAME") {
            let {mbrID, price} = bidder;
            curWinnerID.text(`${mbrID} 得標`);
            curBidPrice.text(price);
            directGetBtn['disabled'] = true;
            offerPriceBtn['disabled'] = true;
            clearInterval(timer);
            document.getElementById("timerCounter").innerHTML = "競標結束";
            return;
        }
    });
    webSocket.addEventListener('close', event => { });
    webSocket.addEventListener('error', event => { });
}

// ==========================================websocket==========================================

const summary = document.querySelector('#summary');

/**
 * 將書籍簡介內容換行
 */
function displaySummary() {
    // let content = summary.innerHTML;
    // summary.innerHTML = content.replace(/[\n(\r\n)]/g, `<br/>`);
    let array = summary.textContent.split(/[\n(\r\n)]/g);
    $('#summary').remove();
    for (const line of array) {
        if (line.trim().length !== 0) {
            $('#summary_container').append(
                `${line}<br/>`
            );
        }
    }
}

const tableContent = document.querySelector('#tableContent');

/**
 * 將書籍目錄內容換行
 */
function displayTableContent() {
    let content = tableContent.innerHTML;
    tableContent.innerHTML = content.replace(/[\n(\r\n)]/g, `<br/>`);
}

const warn = document.getElementById('warn');

/**
 * 檢查是否登入過
 * @returns {*}
 */
function identity() {
    let isChk = false;
    $.ajax({
        type: 'GET',
        url: `${prefix}/bid/api/getIdentify`,
        dataType: 'json',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async: false,
        success: function (response) {
            const {err, msg} = response;
            isChk = !err;
        },
        error: function (thrownError) {
            console.log(thrownError);
        }
    });
    return isChk;
}

function isValid4Bid() {
    let res = false;

    $.ajax({
        type: 'GET',
        url: `${prefix}/bid/api/isValid4Bid`,
        dataType: 'json',
        data: {
            'bidPrice': bidPriceDOM.value,
            'bidID': bidID
        },
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async: false,
        success: function (response) {
            const {err, msg} = response;
            let classList = bidPriceDOM.classList;

            if (err) {
                classList.add('is-invalid');
                warn.textContent = msg;
            } else {
                classList.remove('is-invalid');
            }
            res = !err;
        },
        error: function (thrownError) {
            console.log(thrownError);
        }
    });
    return res;
}

function isValid4TakeBid() {
    let res = false;

    $.ajax({
        type: 'GET',
        url: `${prefix}/bid/api/isValid4TakeBid`,
        dataType: 'json',
        data: {
            'bidID': bidID
        },
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async: false,
        success: function (response) {
            const {err, msg} = response;

            if (err) {
                directGetWarn.textContent = msg;
            } else {
                directGetWarn.textContent = '';
            }
            res = !err;
        },
        error: function (thrownError) {
            console.log(thrownError);
        }
    });
    return res;
}


function init() {
    displaySummary();
    displayTableContent();
    connect();
    offerPriceBtn.addEventListener('click', function (event) {
        event.preventDefault();
        let classList = bidPriceDOM.classList;
        classList.remove('is-valid');
        classList.remove('is-invalid');
        if (!identity()) {
            classList.add('is-invalid');
            warn.textContent = '請登入';
            return;
        }
        if (isValid4Bid()) {
            let jsonObj = {
                'bidder': {'mbrID': -1, 'price': bidPriceDOM.value},
                'traceBidID': bidID,
                'action': 'BidIncrement',
            }
            webSocket.send(JSON.stringify(jsonObj));
        }

    });

    // ==================================這是後門，上線要拿掉==================================
    testMbrIDBtn.addEventListener('click', function (event) {
        event.preventDefault();
        const testMbrID = document.getElementById('testMbrID');
        $.ajax({
            type: 'GET',
            url: `${prefix}/bid/api/getMbrID`,
            data: {'mbrID': testMbrID.value},
            dataType: 'json',
            xhrFields: {
                withCredentials: true // 这里设置了withCredentials
            },
            async: false,
            success: function (response) {

            },
            error: function (thrownError) {
                console.log(thrownError);
            }
        });
    });
    // ==================================這是後門，上線要拿掉==================================

    // ==================================直購==================================
    directGetBtn.addEventListener('click', function (event) {
        directGetWarn.textContent = '';
        if (!identity()) {
            directGetWarn.textContent = '請登入';
            return;
        }
        if(isValid4TakeBid()) {
            // 邏輯跟競標出價87%像
            let jsonObj = {
                'bidder': {'mbrID': -1, 'price': -1},
                'traceBidID': bidID,
                'action': 'DirectGet',
            }
            webSocket.send(JSON.stringify(jsonObj));
        }


    });

    body.addEventListener('unload', () => {
        webSocket.clone();
    })

    // ==================================直購==================================
}

init();

