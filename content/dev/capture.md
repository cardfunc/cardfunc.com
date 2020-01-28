---
title: "Capture"
date: "2020-01-27"
weight: 70
menu: 
  main:
    parent: dev
    name: Capture
---

The `capture` endpoint is used for performing capture, using an authorization.

<!--more-->


# Create capture

### Request

Replace {authorization} with the authorization string for the specific authorization.

```json
POST https://api.cardfunc.com/authorization/{authorization}/capture
Authentication: Bearer <private.api.key>
```
The body of the request contains an object of the Capture.Creatable data type, which may be an empty object.

### Example: Capturing full amount

A call can be made to capture the full amount of the authorization. In that case, there is no need to specify the amount.

```json
POST https://api.cardfunc.com/authorization/{authorization}/capture
Authentication: Bearer <private.api.key>
{}
```

### Example: Capturing part of the amount

```json
POST https://api.cardfunc.com/authorization/{authorization}/capture
Authentication: Bearer <private.api.key>
{
  "amount": 200
}
```

### Example: Using another descriptor than the one in the authorization

```json
POST https://api.cardfunc.com/authorization/{authorization}/capture
Authentication: Bearer <private.api.key>
{
  "descriptor": "Refund for undeliverable product."
}
```

## Capture.Creatable data type
| Property     | Type     | Description                                                        |
|--------------|----------|--------------------------------------------------------------------|
| `descriptor` | `string` | Replaces default descriptor if provided.                           |
| `amount`     | `number` | Amount to capture if provided, otherwise full amount will be used. |
