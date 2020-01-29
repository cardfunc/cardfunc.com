---
title: "Example JS"
weight: 30
mode: body
---
```js
const response = await fetch("https://api.cardfunc.com/authorization", {
	method: "POST",
	headers: { Authentication: "Bearer <public.api.key>" }
	body: JSON.stringify(
		{
			"number": "<unique order identifier>",
			"amount": 1337.42,
			"currency": "SEK",
      "account": "<account token>"
		}
	)
}
```
