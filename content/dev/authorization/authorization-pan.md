---
title: "Authorization using PAN"
date: "2020-01-23"
weight: 90
menu: 
  main:
    identifier: dev-pan
    name: Authorization (PAN)
    parent: dev-auth
---

Authorizations can be created using PAN directly. This approach adds many requirements in order to comply with PCI DSS-rules and is not recommended for most customers, however.

<!--more-->

### Example request
```json
POST https://api.cardfunc.com/authorization
Authentication: Bearer <public.api.key>

{
    "amount": 1337.42,
    "currency": "SEK",
    "card": {
        "pan": "4111111111111111",
        "expires" : [10, 21],
        "csc": "987"
    }
}
```
The body of the request contains an object of the Authorization.Creatable data type.

The response contains an account token, that can be used in future authorization calls.

## Authorization.Creatable data type

| Property     | Type             | Description                                  |
|--------------|------------------|----------------------------------------------|
| `number`     | `string`         | your order number                            |
| `descriptor` | `string`         | replaces your default descriptor if provided |
| `ip`         | `string`         | your customer's ip number                    |
| `amount`     | `number`         | amount the authorization is valid for        |
| `currency`   | `string`         | three letter currency code, e.g. "SEK"       |
| `card`       | `Card.Creatable` | see Card.Creatable                           |
<!--| `pares` | `string`   | (optional) result from 3D secure                           |-->

## Card.Creatable data type

| Property  | Type       | Description               |
|-----------|------------|---------------------------|
| `pan`     | `string`   | primary account number    |
| `expires` | `number[]` | expiration month and year |
| `csc`     | `string`   | (optional) csc code       |
<!--| | `pares`   | `string`  | (optional) |-->
