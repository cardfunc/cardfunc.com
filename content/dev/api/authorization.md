---
title: "Authorization"
date: "2020-01-23"
weight: 30
menu: 
  main:
    parent: dev-api
    name: Authorization
---

The `authorization` endpoint is used for creating and listing authorizations.

<!--more-->

# Create authorization

An authorization can be created using card data directly.

### Example request
```json
POST https://api.cardfunc.com/authorization
Authentication: Bearer <your.public.api.key>

{
    "amount": 1337.42,
    "currency": "SEK",
    "card": {
        "pan": "1111222233334444123",
        "expires" : [10, 21],
        "csc": "123"
    }
}
```
The body of the request contains an object of the Authorization data type.

## Authorization data type

| Property     | Type             | Description                                             |
|--------------|------------------|---------------------------------------------------------|
| `number`     | `string`         | (optional) your order number                            |
| `descriptor` | `string`         | (optional) replaces your default descriptor if provided |
| `ip`         | `string`         | (optional) your customer's ip number                    |
| `amount`     | `number`         | (optional) amount the authorization is valid for        |
| `currency`   | `string`         | (optional) three letter currency code, e.g. "SEK"       |
| `account`    | `string`         | (optional) "create" or account number                   |
| `card`       | `Card.Creatable` | (optional) see Card.Creatable                           |
<!--| `pares` | `string`   | (optional) result from 3D secure                           |-->

## Card.Creatable data type

| Property  | Type       | Description               |
|-----------|------------|---------------------------|
| `pan`     | `string`   | primary account number    |
| `expires` | `number[]` | expiration month and year |
| `csc`     | `string`   | (optional) csc code       |
<!--| | `pares`   | `string`  | (optional) |-->

# List authorizations

Previously created authorizations can be listed.

### Request

```json
GET https://api.cardfunc.com/authorization
Authentication: Bearer <your.private.api.key>
```

# Capture authorization

### Request

Replace {authorization} with the id for the specific authorization.

```json
POST https://api.cardfunc.com/authorization/{authorization}/capture
Authentication: Bearer <your.private.api.key>
```

# Cancel authorization

### Request

Replace {authorization} with the id for the specific authorization.

```json
POST https://api.cardfunc.com/authorization/{authorization}/cancel
Authentication: Bearer <your.private.api.key>
```

# Refund authorization

### Request

Replace {authorization} with the id for the specific authorization.

```json
POST https://api.cardfunc.com/authorization/{authorization}/refund
Authentication: Bearer <your.private.api.key>
```
