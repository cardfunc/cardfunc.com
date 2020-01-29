---
title: "Example Curl"
weight: 61
mode: body
---
```bash
curl -X POST https://api.cardfunc.com/authorization \
	-u "Bearer <public.api.key>"               \
	-d "number=<your order identifier>"      \
	-d "amount=1337.42"                       \
	-d "currency=SEK"                        \
	-d "account=<account token>"
```
