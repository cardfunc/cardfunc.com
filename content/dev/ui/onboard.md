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

PayFunc Onboard guides your users through the process of creating an account used for later transactions. It handles the full process of entering the credit card information as well as performing the full 3D secure authentication procedure. Once everything is done you will receive an account number that you then can use to perform payments towards the users credit card without the need for any interaction with the user.

# Integrating PayFunc Onboard

The PayFunc Onboard user interface is web based. It can either be integrated in an existing web application or be used in native application via a webview.

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Onboard</title>
	<script type="module" src="https://payfunc.azurewebsites.net/onboard/build/payfunc-onboard.esm.js"></script>
	<script nomodule src="https://payfunc.azurewebsites.net/onboard/build/payfunc-onboard.js"></script>
	<link href="https://payfunc.azurewebsites.net/onboard/build/payfunc-onboard.css" rel="stylesheet">
</head>
<body>
	<header><h1>Onboard</h1></header>
	<main>
		<form method="post">
			<payfunc-onboard token="<your.api.key>"></payfunc-onboard>
		</form>
	</main>
</body>
</html>
```

Once the user has entered their card information and successfully performed the 3D Secure authentication the form will be submitted with the follwing data in the `payment-methods` field.

```json
[
    {
        "type": "card",
        "id": "<account-id>",
        "scheme": "visa",
        "last4": "9000",
        "country": "SE",
    }
]
```

# Performining a Payment
Once the user has set up an account with account number `<account id>` you can then:
### Create an Order
#### Request
```json
POST https://payfunc.azurewebsites.net/api/order
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
    "number": "your order identifier",
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
PATCH https://payfunc.azurewebsites.net/api/order/
Authentication: Bearer <your.api.key>

[
    {
        "id": "<order id>",
        "event": [
            { "type": "charge" }
        ]
    }
]
```
