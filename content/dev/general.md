---
title: "General"
date: "2020-01-22"
weight: 20
menu: 
    main:
        parent: dev
        name: General
---
This details the general usage of the CardFunc API.
<!--more-->

# URL
The CardFunc API is reachable at the following URL:
```
https://api.cardfunc.com/
```
The same URL is used both for _testing_ and for _production_. It is the _API key_ that determines if you are using the system for testing or production.

# Content Types
Requests should be done using the following header:
```http
Accept: application/json; charset=utf-8
```
Responses will come as UTF-8 encoded JSON:s with the following header:
```http
Content-Type: application/json; charset=utf-8
```

# Authentication
Unless otherwise specified, requests to the API are done using the _bearer authentication pattern_.
```http
Authorization: Bearer <your.api.key>
```

API keys always come in pairs of two:
1. _private_ Used for privileged access to the administration parts of the API.
2. _public_ Used for creating new orders from the end user's browser.

The API keys determine whether you use the system in test or production mode.

# Error Handling
Errors are returned as a response with a HTTP status of 400 or above. All but exceptional error messages will have the following content type:
```http
Content-Type: application/json; charset=utf-8
```
The body will be a JSON encoded message like this:
```json
{
    "status": 400,
    "type": "invalid content",
    "content": {
        "type": "model.Authorization.Creatable",
        "description": "Content must be a creatable Authorization."
    }
}
```
