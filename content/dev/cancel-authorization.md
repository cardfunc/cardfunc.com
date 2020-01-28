---
title: "Cancel authorization"
date: "2020-01-23"
weight: 80
menu: 
  main:
    parent: dev
    name: Cancel
---

The `Cancel` endpoint is used to cancel the authorization to withdraw a reserved amount. If capture has already been performed on the authorization, cancelling the authorization will not refund the amount. For that, the `refund` endpoint should be used.

<!--more-->

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
