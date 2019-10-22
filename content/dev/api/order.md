---
title: "Order"
date: "2019-08-01"
weight: 30
menu: 
  main:
    parent: dev-api
    name: Order
---

The `order` endpoint is the primary endpoint used for creating and administrating orders.

# Creating

### Card Account Payment
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
	"number": "your order identifier",
	"items": 1337.42,
	"currency": "EUR",
	"created": "2019-01-01T13:37Z",
	"payment": {
		"id": "<payment id>",
		"type": "card",
		"account": "<account id>",
		"amount": 1337.42,
		"currency": "EUR"
	},
	"event": [
		{ 
			"type": "created",
			"date": "2019-01-01T13:37Z",
		}
	]
}
```

# Charge, Cancel & Refund

## Change & Cancel
Once the end user has placed the order you can then _charge_ or _cancel_ the order. Charge is usually performed once the order has been fullfilled and cancel is done to cancel the order.

### Cancel Single Order 
#### Request
```json
PATCH https://api.payfunc.com/order/
Authentication: Bearer <your.api.key>

[
	{
		"id": "<order id>",
		"event": [
			{ "type": "cancel" }
		]
	}
]
```
### Charge Single Order 
#### Request
```json
PATCH https://api.payfunc.com/order/
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
## Refund
A order that has been charged can be refunded. This is usefull if the customer ends up returning the ordered items.
### Refund Single Order 
#### Request
```json
POST https://api.payfunc.com/order/<order id>/event
Authentication: Bearer <your.api.key>

{
	"type": "charge",
	"amount": 1000
}
```
## Multiple Orders
The API allows for manipulating several orders with one single API call.
#### Request
```json
PATCH https://api.payfunc.com/order/
Authentication: Bearer <your.api.key>

[
	{ "id": "<order id 0>", "event": [ { "type": "cancel" } ] }
	{ "id": "<order id 1>", "event": [ { "type": "charge" } ] }
	{ "id": "<order id 2>", "event": [ { "type": "charge" } ] }
]
```
