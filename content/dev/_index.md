---
title: "CardFunc Developer Documentation"
date: "2019-08-01"
weight: 20
menu: 
    main:
        identifier: dev
        name: Developers
---
CardFunc provides functionality for handling the various steps that can be involved in a card payment.
* First an authorization is created. This reserves an amount that can later be withdrawn from the account.
* Performing a capture, using the authorization, withdraws either the full amount or a part of it from the account.
* Until capture, the authorization can be cancelled, so that it can no longer be used for capture.
* Captured amounts can be refunded, either fully or partially.
