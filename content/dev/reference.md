---
title: "Data type reference"
date: "2020-01-23"
weight: 100
menu: 
  main:
    parent: dev
    name: Reference
---

The Reference section describes data types used in requests to and responses from the CardFunc API.

<!--more-->

## Authorization.Creatable data type

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

## Capture.Creatable data type
| Property     | Type     | Description                                                        |
|--------------|----------|--------------------------------------------------------------------|
| `descriptor` | `string` | Replaces default descriptor if provided.                           |
| `amount`     | `number` | Amount to capture if provided, otherwise full amount will be used. |

## Cancel data type
| Property     | Type      | Description                                             |
|--------------|-----------|---------------------------------------------------------|
| `id`         | `string`  | id for authorization                                    |
| `descriptor` | `string`  | replaces your default descriptor if included            |
| `reference`  | `string`  | reference to aquirer                                    |
| `created`    | `string`  | date as ISO string                                      |

## Refund.creatable data type
| Property     | Type     | Description                             |
|--------------|----------|-----------------------------------------|
| `amount`     | `number` | amount to be refunded                   |
| `descriptor` | `string` | replaces default descriptor if included |
