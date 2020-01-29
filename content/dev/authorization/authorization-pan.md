---
title: "Authorization using PAN"
date: "2020-01-23"
weight: 90
menu: 
  main:
    identifier: dev-pan
    name: Authorization (PAN)
    parent: dev-auth
---

Authorizations can be created using PAN directly. This approach adds many requirements in order to comply with PCI DSS-rules and is not recommended for most customers, however.

<!--more-->

### Example request
```json
POST https://api.cardfunc.com/authorization
Authentication: Bearer <public.api.key>

{
	"number": "axb01",
	"descriptor": "A test transaction",
	"amount": 1337.42,
	"currency": "SEK",
	"card": {
		"pan": "4111111111111111",
		"expires": [1, 20],
		"csc": "987"
	}
}
```
The body of the request contains an object of the Authorization.Creatable data type.

### Example response

The response from the call will contain the signed authorization as a _JSON Web Token_ (JWT).
```
eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJjYXJkIiwiaWF0IjoxNTgwMjIzMTA2NjM2LCJpZCI6ImFHMDBqT25sREc4RSIsIm51bWJlciI6ImF4YjAxIiwicmVmZXJlbmNlIjoiZDI1ZmE4MzQtODkwNi00NWZmLWE3MjItNmQ5ZGFlYzk2ZGI5IiwiZGVzY3JpcHRvciI6IkEgdGVzdCB0cmFuc2FjdGlvbiIsImNyZWF0ZWQiOiIyMDIwLTAxLTI4VDE0OjUxOjQ1KzAwOjAwIiwiYW1vdW50IjoxMzM3LjQyLCJjdXJyZW5jeSI6IlNFSyIsImNhcmQiOnsiaWQiOiJLUlVwRW56XyIsInNjaGVtZSI6InZpc2EiLCJpaW4iOiI0MTExMTEiLCJsYXN0NCI6IjExMTEiLCJleHBpcmVzIjpbMSwyMF19LCJjYXB0dXJlIjpbXSwicmVmdW5kIjpbXX0.sjQhv8yBmovGU4hmdiLI5Yz5p5t_cKAnj3qumM6jjrZoOAnCEBKyWVCGE0IUPhew2rtAKrExVC42rNVkEJzUbRXwlZluHTHfHIYgoRjd-2kJuK5669Uy3looj1NgVT9gYcqFjWtJevEmOlO6_DON_gC9ETI6EQYvFAQFn9JmZh0xsXKobl11dn3XqaBf64q6Ojl4fiJz8RH23ouJ_a-xjuOLFly8JDhHLUDInLfD22qTvUwlyWE27vmPmyl2_Dn3iFWP-_tgO7zpCjs1ysdcU53LipzjhdCU_IUgNwQx20rsbWAZCflufQank5U_8gp_dUZ64c3QRLglKvrjzKBXdA
```

## Authorization.Creatable data type

| Property     | Type             | Description                                  |
|--------------|------------------|----------------------------------------------|
| `number`     | `string`         | your order number                            |
| `descriptor` | `string`         | replaces your default descriptor if provided |
| `ip`         | `string`         | your customer's ip number                    |
| `amount`     | `number`         | amount the authorization is valid for        |
| `currency`   | `string`         | three letter currency code, e.g. "SEK"       |
| `card`       | `Card.Creatable` | see Card.Creatable                           |
<!--| `pares` | `string`   | (optional) result from 3D secure                           |-->

## Card.Creatable data type

| Property  | Type       | Description               |
|-----------|------------|---------------------------|
| `pan`     | `string`   | primary account number    |
| `expires` | `number[]` | expiration month and year |
| `csc`     | `string`   | (optional) csc code       |
<!--| | `pares`   | `string`  | (optional) |-->
