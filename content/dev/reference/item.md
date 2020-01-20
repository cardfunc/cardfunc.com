---
title: "Item"
date: "2019-01-17"
weight: 60
menu: 
  main:
    identifier: dev-ref-item
    name: Item
    parent: dev-reference
---

Data type used to specify what products are included in an order.
<!--more-->
For Item, all properties are optional, but if vat is included, price must be included too. Quantity will be treated as 1 if it's not included.

## Item

| Property   | Type     | Description                                   |
|------------|----------|-----------------------------------------------|
| `number`   | `string` | (optional) product number in your system      |
| `name`     | `string` | (optional) name or description of the product |
| `price`    | `number` | (optional) price per unit (excluding VAT)     |
| `quantity` | `number` | (optional) number of units                    |
| `unit`     | `string` | (optional) unit for measuring the product     |
| `vat`      | `number` | (optional) VAT per unit                       |
| `rebate`   | `number` | (optional) rebate per unit                    |

### Example:
```json
{
	"number": "abc123",
	"name": "ceramic vase",
	"price": 100,
	"quantity": 2,
	"unit": "pcs",
	"vat": 25,
	"rebate": 0
}
```