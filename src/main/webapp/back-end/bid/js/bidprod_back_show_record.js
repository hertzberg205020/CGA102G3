window.onload = function (){
	let ID = document.getElementById('BidID');
	let bidID = ID.innerText;
 	fetch('/CGA102G3//bid/api/getAllBiddersByBidId?bidID=' + bidID)
 		.then((response) => {
 			return response.json();
 		})
 		.then(function(jsonData) {
			if (jsonData == 0) {
				$('.canvas').prepend(`<div class="text-center text-secondary">尚無競標紀錄!</div>`);
			} else if (jsonData != 0) {
	 		 	let labels = [];
	 		 	for (let i = 1; i <= jsonData.length; i++) {
	 		 	    labels[i-1] = i;
	 		 	}
	 		 	for (let i = 0; i < jsonData.length; i++) {
	 		 	    let xKey = "x";
	 		 	    let xValue = i + 1;
	 		 	    jsonData[i][xKey] = xValue;
	 		 	}
				
	 		    const ctx = document.getElementById('myChart').getContext("2d");
				let gradient = ctx.createLinearGradient(0, 0, 0, 400);
				gradient.addColorStop(0, "rgba(58, 123, 213, 1)");
				gradient.addColorStop(1, "rgba(0, 210, 255, 0.3)");
				
	 		    const myChart = new Chart(ctx, {
	 		 	    type: 'line',
	 		 	    data: {
	 		 	        labels: labels,
	 		 	        datasets: [{
	 		 	        	label: "出價金額",
	 		 	            data: jsonData,
	 		 	            parsing: {
	 		 	                yAxisKey: "price"
	 		 	            },
	 		 	            fill: true,
	 		 	            backgroundColor: gradient,
	 		 	            borderColor: '#fff'
	 		 	        }]
	 		 	    }, 
	 		 	        options: {
	 		 	            responsive: true,
	 		 	            plugins: {
	 		 	                legend: {
	 		 	                    display: true,
	 		 	                    labels: {
	 		 	                        color: 'rgb(100, 100, 100)'
	 		 	                    }
	 		 	                }
	 		 	            }
	 		 	        }
	 		 	});
			}
 		});
}
