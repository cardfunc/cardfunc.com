---
title: "Refund authorization"
date: "2020-01-23"
weight: 90
menu: 
  main:
    parent: dev
    name: Refund
---

The `refund` endpoint is used for refunding an amount that has already been captured, using an authorization.

<!--more-->

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
