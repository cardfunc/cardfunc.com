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
Authentication: Bearer <public.api.key>

{
    "amount": 1337.42,
    "currency": "SEK",
    "card": {
        "pan": "4111111111111111",
        "expires" : [10, 21],
        "csc": "123"
    }
}
```
The body of the request contains an object of the Authorization data type.

## Authorization data type

| Property     | Type             | Description                                  |
|--------------|------------------|----------------------------------------------|
| `number`     | `string`         | your order number                            |
| `descriptor` | `string`         | replaces your default descriptor if provided |
| `ip`         | `string`         | your customer's ip number                    |
| `amount`     | `number`         | amount the authorization is valid for        |
| `currency`   | `string`         | three letter currency code, e.g. "SEK"       |
| `account`    | `string`         | "create" or account number                   |
| `card`       | `Card.Creatable` | see Card.Creatable                           |
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
Authentication: Bearer <private.api.key>
```

# Capture authorization

### Request

Replace {authorization} with the id for the specific authorization.

```json
POST https://api.cardfunc.com/authorization/{authorization}/capture
Authentication: Bearer <private.api.key>
```

# Cancel authorization

### Request

Replace {authorization} with the id for the specific authorization.

```json
POST https://api.cardfunc.com/authorization/{authorization}/cancel
Authentication: Bearer <private.api.key>
```

## Cancel data type
| Property     | Type      | Description                                             |
|--------------|-----------|---------------------------------------------------------|
| `id`         | `string`  | id for authorization                                    |
| `descriptor` | `string`  | replaces your default descriptor if included            |
| `reference`  | `string`  | reference to aquirer                                    |
| `created`    | `string`  | date as ISO string                                      |

# Refund authorization

### Request

Replace {authorization} with the id for the specific authorization.

```json
POST https://api.cardfunc.com/authorization/{authorization}/refund
Authentication: Bearer <private.api.key>
```

## Refund.creatable data type
| Property     | Type     | Description                             |
|--------------|----------|-----------------------------------------|
| `amount`     | `number` | amount to be refunded                   |
| `descriptor` | `string` | replaces default descriptor if included |
