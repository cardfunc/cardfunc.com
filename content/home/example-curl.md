---
draft: true
title: "Example Curl"
date: 2019-08-01T13:35:37+02:00
weight: 61
mode: body
---
```bash
curl -X POST https://api.payfunc.com/order \
	-u "Bearer <your api key>"               \
	-d "number=<your order identifier>"      \
	-d "items=1337.42"                       \
	-d "currency=EUR"                        \
	-d "payment[type]=card"                  \
	-d "payment[account]=<account id>"
```
