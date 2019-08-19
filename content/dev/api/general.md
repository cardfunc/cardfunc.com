---
title: "General"
date: "2019-08-01"
weight: 20
menu: 
    main:
        parent: dev-api
        name: General
---
# URL
The PayFunc API is reachable at the following URL:
```
https://payfunc.azurewebsites.net/api/
```
The same URL is used both for testing and for production. It is the API key that determines if you are using the system for testing or production.

# Content Types
Requests should be done done using the following header:
```http
Accept: application/json; charset=utf-8
```
Responses will come as UTF-8 encoded JSON:s with the following header:
```http
Content-Type: application/json; charset=utf-8
```

# Authentication
All request to the API except login requests to the [`me`](./me) endpoint are done using the bearer authentication pattern.
```http
Authorization: Bearer <your.api.key>
```

API keys always come in pairs of two:
1. _private_ Used for priviligade access to the administration parts of the API.
2. _public_ Used for creating new orders from the end users browser.

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
        "type": "model.Order.Creatable",
        "description": "A valid order to be created."
    }
}
```