---
draft: true
title: "Example JS"
date: 2019-08-01T13:35:37+02:00
weight: 30
mode: body
---
```js
const response = await fetch("https://api.cardfunc.com/authorization", {
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
