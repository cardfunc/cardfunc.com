---
title: "Order"
date: "2019-01-17"
weight: 30
menu: 
  main:
    identifier: dev-ref-order
    name: Order
    parent: dev-reference
---

When creating orders, the Creatable Order datatype is used. In the response from the endpoint an object of the Order data type will be returned.
<!--more-->
## Creatable Order
When calling the order endpoint to create an order, include a creatable order object. Several properties are optional, and for the "items" property, either a number representing the whole order amount, a single [`Item`](../item) object or an array of [`Item`](../item) objects can be used.

| Property   | Type                     | Description                                                                 |
|------------|--------------------------|-----------------------------------------------------------------------------|
| `number`   | `string`                 | (optional) order number in your system                                      |
| `client`   | `string`                 | (optional) our id for the computer and browser used when creating the order |
| `customer` | `Customer`               | (optional) see [`Customer`](../customer) data type                          |
| `items`    | `number | Item | Item[]` | see [`Item`](../item) data type                                             |
| `currency` | `string`                 | 3-letter currency code, e.g. "SEK"                                          |
| `payment`  | `Payment`                | see Payment data type                                                       |
| `theme`    | `string`                 | (optional) name of color theme to use in checkout                           |
| `meta`     | `any`                    | (optional)                                                                  |
| `callback` | `string`                 | (optional)                                                                  |

### Example:
```json
{
    "number": "aaa-001",
    "item": [
        {
            "name": "t-shirt",
            "price": 42.00,
            "quantity": 2
        },
        {
            "name": "trousers",
            "price": 100.00,
            "quantity": 1,
            "unit": "st",
            "vat": 25.00
        }
    ]
    "currency": "SEK",
    "payment": {
        "type": "",
        "method": "",
        "contact": "+460811122233",
        "created": "2020-01-01T10:11:12.199Z",
        "service": "PayFunc",
        "amount": 209.00,
        "currency": "SEK"
    }
}
```

## Order
Responses from the Order endpoint will contain an Order object, which includes an "id" and "created" property, in addition to the ones in the Creatable Order type.

| Property   | Type                     | Description                                                                 |
|------------|--------------------------|-----------------------------------------------------------------------------|
| `id`       | `string`                 | our id for the order                                                        |
| `number`   | `string`                 | (optional) order number in your system                                      |
| `client`   | `string`                 | (optional) our id for the computer and browser used when creating the order |
| `created`  | `string`                 | date in ISO format                                                          |
| `customer` | `Customer`               | (optional)see [`Customer`](../customer) data type                           |
| `items`    | `number | Item | Item[]` | see [`Item`](../item) data type                                             |
| `currency` | `string`                 | 3-letter currency code, e.g. "SEK"                                          |
| `payment`  | `Payment`                | see Payment data type                                                       |
| `theme`    | `string`                 | (optional) name of color theme to use in checkout                           |
| `meta`     | `any`                    | (optional)                                                                  |
| `callback` | `string`                 | (optional)                                                                  |

### Example:
```json
{
    "id": "BlTmF3S382kFbn5U",
    "number": "aaa-00b",
    "item": {
        "name": "rubber duck",
        "price": 50.00,
        "quantity": 2,
    },
    "currency": "SEK",
    "payment": {
        "type": "",
        "method": "",
        "contact": "+460811122233",
        "created": "2020-01-01T10:11:12.199Z",
        "service": "PayFunc",
        "amount": 100.00,
        "currency": "SEK"
    },
    "created": "2020-01-01T10:11:12.199Z"
}
```