---
title: "Authorization using CardFunc Element"
date: "2019-08-01"
weight: 40
menu: 
    main:
        identifier: dev-element
        name: Authorization (element)
        parent: dev-auth
---

To provide a user interface for an end-user to enter sensitive card information the CardFunc Element is used.

<!--more-->

# Usage
CardFunc Element is a webbased technology. In the context on native apps the element should be placed on a webpage that is viewed inside a web view.

## Embedding
CardFunc Element is delivered as a web component. To use it start by including the necessary script file in your html header:

```html
<script type="module" src="./build/cardfunc-element.esm.js"></script>
<script nomodule src="./build/cardfunc-element.js"></script>
```

For styling purposes a reference the required theme is also needed in the html-header:

```html
<link rel="stylesheet" type="text/css" href="https://theme.payfunc.com/ct-light/index.css">
```

To actually embed the CardFunc Element you add the following element where you want it to show up in your page:

```html
<cardfunc-element api-key="public.api.key"></cardfunc-element>
```

Make sure to replace `public.api.key` with the public API key of the relevant merchant.

## Create Authorization

In order to create an actual authorization the method `submit` shall be invoked on the `cardfunc-element`.

It can be done like this:
```js
const cardfunc = document.getElementsByTagName("cardfunc-element").index(0)
const authorization = await cardfunc.submit({
	amount: 1337.42, // amount
	currency: "SEK", // currency used
	number: "1234abc", // unique order number
})
```

# Example

A complete working example looks like this:


And this is the corresponding code:

```html
<!DOCTYPE html>
<html dir="ltr" lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=5.0">
		<title>CardFunc Element Test</title>
		<script src="https://api.cardfunc.com/ui/element/cardfunc-element.js"></script>
		<link rel="stylesheet" type="text/css" href="https://theme.payfunc.com/ct-light/index.css">
	</head>
	<body>
		<form>
			<cardfunc-element api-key="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL2FwaS5jYXJkZnVuYy5jb20iLCJpYXQiOjE1Nzk3MDAyNDU2MTYsImF1ZCI6InB1YmxpYyIsInN1YiI6InRlc3QiLCJuYW1lIjoidGVzdCIsInVybCI6Imh0dHA6Ly9leGFtcGxlLmNvbSIsImRlc2NyaXB0b3IiOiJ0ZXN0IHRyYW5zYWN0aW9uIiwiY291bnRyeSI6IlNFIiwiYWNxdWlyZXIiOiJtMkM4T1NqT2lFYnVBVmFPZmFYajE4emhVcjVaaTJGNG9paTczaTl0QlFJQmxpOGxYY05PLVFSQl9PTkgxdjE0ZWFxclR3NHRiVWlSN3BjZGdPZGk2VzBpTENKclpYa2lPaUl6Tm1VM05HRTJPUzAzWm1WbExUUmhNemN0WW1Oa09TMDJZVEUwTWpJd01qaG1aak1pZlEiLCJtaWQiOiIxMjM0IiwibWNjIjoiMTIzNCIsImJpbiI6eyJtYXN0ZXJjYXJkIjoiMTM0Njc4IiwidmlzYSI6IjEyMzQifX0.vdASM3Ug-MsOcmktQDO9NcOweZ0UD_f9Us3rvEfTmEM"></cardfunc-element>
			<button id="submit" type="button">submit</button>
		</form>
		<code>
		</code>
		<script>
			const cardForm = document.getElementsByTagName("cardfunc-element").item(0)
			const submit = document.getElementById("submit")
			const code = document.getElementsByTagName("code").item(0)
			if (cardForm && submit)
				submit.onclick = event => {
					console.log("submit")
					cardForm.submit({
						amount: 1337.42,
						currency: "SEK",
						number: "orderno",
						descriptor: "reference"
					}).then(payment => code.innerText += (typeof payment == "string" ? payment : JSON.stringify(payment)) + "\n\n")
					event.preventDefault()
					event.stopPropagation()
				}
		</script>

	</body>
</html>

```

