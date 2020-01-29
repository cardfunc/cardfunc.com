---
title: "CardFunc Developer Documentation"
date: "2019-08-01"
weight: 20
menu: 
    main:
        identifier: dev
        name: Developers
---
CardFunc provides functionality for handling the various steps that can be involved in a _card payment_.
* First an _authorization_ is created. This reserves an amount that can later be withdrawn from the account.
* Performing a _capture_, using the authorization, withdraws either the full amount or a part of it from the account.
* Until capture, the authorization can be _cancelled_, so that it can no longer be used for capture.
* Captured amounts can be _refunded_, either fully or partially.

In order to perform a card payment, your customer needs to enter the _Primary Account Number_ (PAN), _Expire Date_ and _Card Verification Code_ (CVC, also called CSV, CVV, i.e.) into the CardFunc Element. CardFunc handles card data in accordance with PCI DSS rules.