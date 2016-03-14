<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<style>
		@import url(assets/fonts/Bariol/styles.css);
		@import url(assets/fonts/Righteous/styles.css);	
		body {
		  background-color: #f9f9f9;
		  font-family: 'Bariol';
		}

		.note {
		  margin-top: 60px;
		  text-align: center;
		}

		.note
		.display-note {
		  text-align: left;
		  width: 800px;
		  margin: 0 auto;
		  display: inline-block;
		  background-color: #fff;
		  margin-bottom: 50px;
		  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
		  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
		  -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
		  -ms-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
		  -o-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
		}

		.note
		.desc {
		  padding: 20px;
		}

		.note
		.desc
		.head {
		  margin-bottom: 20px;
		  border-bottom: 2px solid #DADADA;
		}

		.note
		.desc
		.head
		img {
		  width: 75px;
		  height: 95px;
		  margin-bottom: 20px;
		}

		.note
		.desc
		.head
		.head-tag {
		  text-align: right;
		  float: right !important;
		}

		.note
		.desc
		.body {
		  padding-bottom: 30px;
		  display: inline-block;
		}

		.note
		.desc
		.body
		.detail {
		  display: inline-block;
		  float: left;
		  clear: both;
		  text-align: justify;
		}

		.note
		.desc
		.body
		.detail label {
		  line-height: 1.5;
		  word-spacing: 2px;
		  clear: both;
		  float: left;
		}

		.note
		.desc
		.body
		.detail table {
		  width: 750px;
		  border-right: 1px solid #DADADA;
		  border-left: 1px solid #DADADA;
		  border-bottom: 1px solid #DADADA;
		  text-align: center;
		}

		.note
		.desc
		.body
		.detail table tbody tr td {
		  border-bottom: 1px solid #DADADA;
		  border-right: 1px solid #DADADA;
		}

		.note
		.desc
		.body
		.detail table tbody tr td:last-child {
		  border-right: none;
		}

		.note
		.desc
		.body
		.detail table thead {
		  background-color: #3498DB;
		  line-height: 2;
		  color: #fff;
		}

		.note
		.desc
		.body
		.detail table tfoot h3 {
		  color: #3498DB;
		  margin-right: 10px;
		  margin-top:10px;
		  text-align: right;
		}

		.note
		.desc
		.body
		.billto {
		  float: right;
		}
	</style>
</head>
<body>	
	<div class="note">
		<div class="display-note">
			<div class="desc">
				<div class="head">
					<img src="assets/images/logo.png" alt="logo">
					<div class="head-tag">
						<h2>Inovice</h2>
						<h4>Date : 11-11-2015</h4>
					</div>
				</div>
				<div class="body">
					<div class="sideto">
						<div class="detail">
							<h3>Destination :</h3>
							<label><span>Destination:</span> Bandung (Kota)</label>
							<label><span>Service:</span> Citra Van Titipan Kilat (TIKI)</label>
							<label><span>Package:</span> Over Night Service (ONS)</label>
							<label><span>Value:</span> Rp. 600000</label>
							<label><span>Estimation:</span> 0 Day</label>
							<label><span>Airwaybill Number:</span>  - </label>
						</div>
					</div>

					<div class="billto">
						<div class="detail">
							<h3>Bill To :</h3>
							<label><span>Name:</span> Wahyudi</label>
							<label><span>Phone Number:</span> 084547878787</label>
						</div>
					</div>
					
					<div class="detail">
						<h3>Shipping Details :</h3>
						<table class="table">
							<thead>
								<tr>
									<td>Destination</td>
									<td>Service</td>
									<td>Package</td>
									<td>Value</td>
									<td>Estimation</td>
									<td>Air Waybill Number</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Cirebon (Kota)</td>
									<td>Citra Van Titipan Kilat (Tiki)</td>
									<td>Over Night Service (ONS)</td>
									<td>Rp. 60000</td>
									<td>0 Day</td>
									<td> - </td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="detail">
						<h3>Order Details :</h3>
						<table class="table">
							<thead>
								<tr>
									<td>No.</td>
									<td>Product</td>
									<td>Quantity</td>
									<td>Weight(g)</td>
									<td>Total</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Product 1</td>
									<td>1</td>
									<td>100 (g)</td>
									<td>1.000.000</td>
								</tr>

								<tr>
									<td>2</td>
									<td>Product 2</td>
									<td>2</td>
									<td>200 (g)</td>
									<td>2.000.000</td>
								</tr>

								<tr>
									<td>3</td>
									<td>Product 3</td>
									<td>3</td>
									<td>300 (g)</td>
									<td>3.000.000</td>
								</tr>

								<tr>
									<td>4</td>
									<td>Product 4</td>
									<td>4</td>
									<td>400 (g)</td>
									<td>4.000.000</td>
								</tr>
							</tbody>

							<tfoot>
								<tr>
									<td colspan='5'>
										<h3>Total Price: <span>100000</span></h3>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>