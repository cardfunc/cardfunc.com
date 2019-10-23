---
title: "PayFunc Checkout"
date: "2019-08-01"
weight: 20
menu: 
    main:
        parent: dev-ui
        name: Checkout
---

The PayFunc Checkout is perfect for e-commerce applications where the end user checks out after having selected items into a virtual shopping cart.
<!--more-->
``` html
<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Checkout</title>
		<script src="http://api.payfunc.com/ui/checkout/payfunc-checkout.js"></script>
		<link href="https://theme.payfunc.com/ct-light/index.css" rel="stylesheet">
	</head>
	<body>
	<header><h1>Checkout</h1></header>
		<main>
			<form action="/done" method="post">
				<payfunc-checkout client="-c9vNJkoJAyK" number="XESm7kro-nY3" items="1337.42" currency="SEK" api-key="<public-api-key>"></payfunc-checkout>
			</form>
		</main>
	</body>
</html>
```