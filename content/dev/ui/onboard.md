---
title: "PayFunc Onboard"
date: "2019-08-01"
weight: 30
menu: 
    main:
        parent: dev-ui
        name: Onboard
aliases:
    - /content/integrations/onboard/
---

PayFunc Onboard guides your users through the process of creating an account used for later transactions. It handles the full process of entering the credit card information as well as performing the full 3D secure authentication procedure. Once everything is done you will receive an account number that you then can use to perform payments towards the user's credit card without the need for any interaction with the user.

# Integrating PayFunc Onboard

The PayFunc Onboard user interface is web based. It can either be integrated in an existing web application or be used in native application via a webview.

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>PayFunc Onboard</title>
	<script src="https://api.payfunc.com/ui/onboard/payfunc-onboard.js"></script>
	<link href="https://theme.payfunc.com/ct-light/index.css" rel="stylesheet">
</head>
<body>
	<header><h1>PayFunc Onboard</h1></header>
	<main>
		<form action="done" method="get">
			<payfunc-onboard
				number="<your-customer-number>"
				api-key="<public-api-key>"
				></payfunc-onboard>
		</form>
	</main>
</body>
</html>
```
A fully working example is available on [GitHub](https://github.com/payfunc/onboard-example).

Once the user has entered their card information and successfully performed the 3D Secure authentication the form will be submitted with the follwing data in the `payment-methods` field.

```json
[
  {
    "id": "6s-e3dPs6LYS",
    "number": "customer-number-001",
    "created": "2019-09-04T11:05:49+00:00",
    "card": {
      "id": "cwjDQWsv",
      "scheme": "visa",
      "iin": "41000000",
      "last4": "1111",
      "expires": [1, 20]
    }
  }
]
```

# Performing a Payment
Once the user has set up an account with account number `<account id>` you can then:
### Create an Order
#### Request
```json
POST https://api.payfunc.com/order
Authentication: Bearer <your.api.key>

{
    "number": "your order identifier",
    "items": 1337.42,
    "currency": "EUR",
    "payment": {
        "type": "card",
        "account": "<account id>"
    }
}
```
#### Response
```json
{
    "id": "<order id>",
    "number": "your order [Uppsala.JS #30](https://www.meetup.com/Uppsalajs/events/266590693/)identifier",
    "items": 1337.42,
    "currency": "EUR",
    "payment": {
        "id": "<payment id>",
        "type": "card",
        "account": "<account id>"
    }
}
```
### Charge Order
#### Request
```json
POST https://api.payfunc.com/order/<order id>/event
Authentication: Bearer <your.api.key>

{
	"type": "charge",
	"amount": 1000
}
```
