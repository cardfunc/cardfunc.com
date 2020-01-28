---
title: "Authorization using token"
date: "2020-01-27"
weight: 60
menu: 
  main:
    identifier: dev-token
    name: Authorization (token)
    parent: dev-auth
---

Once an account token has been created, it can be used when creating new authorizations.

<!--more-->

### Example request
```json
POST https://api.cardfunc.com/authorization
Authentication: Bearer <public.api.key>

{
    "amount": 1337.42,
    "currency": "SEK",
    "account": <token>
}
```