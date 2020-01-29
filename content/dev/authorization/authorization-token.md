---
title: "Authorization using Account Token"
date: "2020-01-27"
weight: 60
menu: 
  main:
    identifier: dev-token
    name: Authorization (token)
    parent: dev-auth
---
When the same customer performs _multiple payments_ over time, an _account token_ can be used instead of entering the card data time and time again.

<!--more-->

# Creating an Account Token
In order to create an account token to use for future payments, the `submit` function in CardFunc Element is used with the "account" property set to "create". This can be done in connection with the customer's first payment.

### Example account creation
```js
const cardfunc = document.getElementsByTagName("cardfunc-element").index(0)
const authorization = await cardfunc.submit({
  account: "create",
	amount: 1337.42,
	currency: "SEK",
	number: "1234abc",
})
```

The response will contain an account token.

# Authorization using an Account Token
Once an account token has been created, it can be used when creating new authorizations.

### Example request
```json
POST https://api.cardfunc.com/authorization
Authentication: Bearer <public.api.key>

{
    "amount": 1337.42,
    "currency": "SEK",
    "account": <Account Token>
}
```