---
title: "Payments for Programmers"
date: 2019-08-01T13:35:37+02:00
weight: 10
---

PayFunc provides easy to integrate solutions for payments and monetary transactions for your web and app based needs.

```js
const response = await fetch("https://api.payfunc.com/order", {
	method: "POST",
	headers: { Authentication: "Bearer <public api key>" }
	body: JSON.stringify(
		{
			"number": "<unique order identifier>",
			"items": 1337.42,
			"currency": "EUR",
			"payment": {
				"type": "card",
				"account": "<account id>"
			}
		}
	)
}
```
<!--
```bash
curl -X POST https://api.payfunc.com/order \
	-u "Bearer <your api key>"         \
	-d "number=<your order identifier>"  \
	-d "items=1337.42"                 \
	-d "currency=EUR"                  \
	-d "payment[type]=card"            \
	-d "payment[account]=<account id>"
```
-->
