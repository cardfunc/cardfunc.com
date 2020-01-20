---
title: "Customer"
date: "2019-01-17"
weight: 50
menu: 
  main:
    identifier: dev-ref-customer
    name: Customer
    parent: dev-reference
---

Data type representing a customer.
<!--more-->

## Customer

| Property         | Type                      | Description                                                         |
|------------------|---------------------------|---------------------------------------------------------------------|
| `type`           | `string`                  | either "organization" or "person"                                   |
| `identityNumber` | `string`                  | (optional) official identity number with 10 or 12 digits            |
| `id`             | `string`                  | (optional) id within our system                                     |
| `number`         | `string`                  | (optional) identifier in your system                                |
| `name`           | `string`                  | (optional) name of customer                                         |
| `address`        | `Address | Addresses`     | (optional) use [`Address`](../other) Address or Addresses datatypes |
| `email`          | `string | EmailAddresses` | (optional) one email address as a string or two as [`EmailAddresses`](../other) |
| `phone`          | `string | PhoneNumbers`   | (optional) one phone number as a string or several as [`PhoneNumbers`](../other) |