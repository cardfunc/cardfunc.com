---
title: "Other"
date: "2019-01-17"
weight: 70
menu: 
  main:
    identifier: dev-ref-other
    name: Other
    parent: dev-reference
---

Some simple data types used in requests to and responses from our endpoints.
<!--more-->



## Address

| Property      | Type     | Description    |
|---------------|----------|----------------|
| `street`      | `string` | street address |
| `zipCode`     | `string` | area code      |
| `city`        | `string` | city           |
| `countryCode` | `string` | e.g. "SE"      |

### Example:
```json
{
    "street": "Storgatan 1",
    "zipCode": 111 23,
    "city": "Stockholm",
    "countryCode": "SE"
}
```

## Addresses

| Property   | Type      | Description                     |
|------------|-----------|---------------------------------|
| `primary`  | `Address` | use Address datatype            |
| `billing`  | `Address` | (optional) use Address datatype |
| `delivery` | `Address` | (optional) use Address datatype |
| `visit`    | `Address` | (optional) use Address datatype |

## EmailAddresses

| Property  | Type     | Description           |
|-----------|----------|-----------------------|
| `primary` | `string` | primary email address |
| `billing` | `string` | billing email address |

### Example:
```json
{
    "primary": "main@company.com",
    "billing": "billing@company.com"
}
```

## PhoneNumbers

| Property    | Type     | Description          |
|-------------|----------|----------------------|
| `primary`   | `string` | primary phone number |
| `cellphone` | `string` | cellphone number     |
| `landline`  | `string` | landline number      |
