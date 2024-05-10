# USD to LKR rate check service

This service is to check the current USD to LKR rate at Sampath bank. This is implementerd using [Ballerina](https://ballerina.io/) language.

## How to run
Use `bal run` command to run the service. 

```bash
bal run
```

## How to get the rate
Send a GET request to `localhost:9090/rates/getUsdToLkr` to get the current rate.

```bash
curl localhost:8090/rates/getUsdToLkr
```
