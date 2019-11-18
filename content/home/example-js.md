---
title: "Example JS"
date: 2019-08-01T13:35:37+02:00
weight: 20
mode: body
---
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
