---
title: Huobi Option API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.huobi.pro/apikey/'>Sign Up for a Huobi API key </a>
  - Login is required for creating an API key

includes:

search: true
---

# Introduction

## API Documentation Summary

Welcome to the Huobi Option API! You can use our API to access all market data, trading, and account management endpoints.

We have code examples in Shell! You can view code examples in the dark area to the right.

## Market Maker Program

Market maker program gives clients with good market making strategy an opportunity to have customized trading fee structure.

<aside class="notice">
Market makers will not be able to use point cards, VIP rate, rebate or any other fee promotions.
</aside>

### Eligibility Criteria as a Market Maker on Huobi Futures

Welcome users, who are dedicated to maker strategy and have created large trading volume, to participate in Huobi Futures long-term Market Maker project.If you have more than 3 BTC in your Huobi future account, or more than 3 BTC in your Huobi coin margined swap account, or you have more than 3 BTC in your Huobi option account,or more than 100000 USDT in your Huobi USDT Margined swap account, please send the following information to dm_mm@huobi.com:

1. Huobi UIDs (not linked to any rebate program in any accounts)
2. Provide screenshot of trading volume for the past 30 days or VIP/corporate status with other Exchanges

# Changelog

## 1.0.6 2021-5-17 【Transfer between master and sub account（Added parameters in request: client_order_id）】

### 1、Transfer between master and sub account（Added parameters in request: client_order_id）
 - Interface Name：Transfer between master and sub account
 - Interface Type：private
 - Interface URL：/option-api/v1/option_master_sub_transfer

## 1.0.5 2021-2-26 【Added: Query Asset Valuation interface. Modified Query Option Price Limitation interface(Support users not to fill in all input parameters, and the interface returns the price limit data of all available contracts). Modified Query The Last Trade of a Contract interface(Support users not to fill in all input parameters, the interface returns the latest transaction data of all available contracts; And in that case, the return parameter "ch" value is "market.*trade.detail". Added one field in return "tick" parameter: "contract_code")】

### 1. Added Query Asset Valuation interface
 - Interface Name: Query Asset Valuation
 - Interface Type: private
 - interface URL: /option-api/v1/option_balance_valuation

### 2. Modified Query Option Price Limitation interface(Support users not to fill in all input parameters, and the interface returns the price limit data of all available contracts)
 - Interface Name: Query Option Price Limitation
 - Interface Type: public
 - interface URL: /option-api/v1/option_price_limit

### 3. Modified Query The Last Trade of a Contract interface(Support users not to fill in all input parameters, the interface returns the latest transaction data of all available contracts; And in that case, the return parameter "ch" value is "market.*trade.detail". Added one field in return "data" parameter: "contract_code")
 - Interface Name: Query The Last Trade of a Contract
 - Interface Type: public
 - interface URL: /option-ex/market/trade

## 1.0.4 2021-2-5 【Added: Set a Batch of Sub-Account Trading Permissions interface, Query a Batch of Sub-Account's Assets Information Modified: Query The Last Trade of a Contract interface, Query a Batch of Trade Records of a Contract interface, Subscribe Trade Detail Data interface, Request Trade Detail Data interface】

### 1. Added Set a Batch of Sub-Account Trading Permissions interface
 - Interface Name: Set a Batch of Sub-Account Trading Permissions
 - Interface Type: private
 - Interface URL: /option-api/v1/option_sub_auth

### 2. Added Query a Batch of Sub-Account's Assets Information interface
 - Interface Name: Query a Batch of Sub-Account's Assets Information
 - Interface Type: private
 - Interface URL: /option-api/v1/option_sub_account_info_list

### 3. Modified Query The Last Trade of a Contract interface(Added "quantity" in return parameter "data", which means the trading quantity(coin), Calculation formula: quantity(coin) = trading quantity(cont) * contract size. Added "trade_turnover" in return parameter "data", which represents the trading amount(quoted currency). Calculation formula: trade_turnover(quoted currency) = trading quantity(cont) * contract size * trading price.)
 - Interface Name: Query The Last Trade of a Contract
 - Interface Type: public
 - Interface URL: /option-ex/market/trade

### 4. Modified Query a Batch of Trade Records of a Contract interface(Added "quantity" in return parameter "data", which means the trading quantity(coin), Calculation formula: quantity(coin) = trading quantity(cont) * contract size. Added "trade_turnover" in return parameter "data", which represents the trading amount(quoted currency). Calculation formula: trade_turnover(quoted currency) = trading quantity(cont) * contract size * trading price.)
 - Interface Name: Query a Batch of Trade Records of a Contract
 - Interface Type: public
 - Interface URL: /option-ex/market/history/trade

### 5. Subscribe Trade Detail Data interface(Added "quantity" in return parameter "data", which means the trading quantity(coin), Calculation formula: quantity(coin) = trading quantity(cont) * contract size. Added "trade_turnover" in return parameter "data", which represents the trading amount(quoted currency). Calculation formula: trade_turnover(quoted currency) = trading quantity(cont) * contract size * trading price.)
 - Interface Name: Subscribe Trade Detail Data
 - Interface Type: public
 - Subscription Topic: market.$contract_code.trade.detail

### 6. Modified Request Trade Detail Data interface(Added "quantity" in return parameter "data", which means the trading quantity(coin), Calculation formula: quantity(coin) = trading quantity(cont) * contract size. Added "trade_turnover" in return parameter "data", which represents the trading amount(quoted currency). Calculation formula: trade_turnover(quoted currency) = trading quantity(cont) * contract size * trading price.)
 - Interface Name: Request Trade Detail Data
 - Interface Type: public
 - Subscription Topic: market.$contract_code.trade.detail

## 1.0.3 2021-1-29 【Modified Cancel All Orders, Modified Cancel All Trigger Orders, Modified Query Open Orders,Modified Query Trigger Order.  The order_id of submitted trigger order response has been changed from the original natural number self-incrementing ID to a unique identification ID with a length of 18 digits. It is recommended to use the order_id_str (order_id in string type) of submitted order response  to avoid the occurrence of truncation by the system because excessive length.】

### 1. Modified Cancel All Orders(Added two optional parameters in request: direction, indicates order direction, if not filled in means both with available values: “buy”, “sell”. offset, order offset, if not filled in means both with available values: “open”, “close”.)
 - Interface Name: Cancel All Orders
 - Interface Type: private
 - Interface URL: /option-api/v1/option_cancelall

### 2. Modified Cancel All Trigger Orders(Added two optional parameters in request: direction, indicates order direction, if not filled in means both with available values: “buy”, “sell”. offset, order offset, if not filled in means both with available values: “open”, “close”.)
 - Interface Name: Cancel All Trigger Orders
 - Interface Type: private
 - Interface URL: /option-api/v1/option_trigger_cancelall

### 3、Modified Query Open Orders(Added two parameters in request: is sort field, if not filled in means order by create_at descending, with available values “created_at”(descending order).order trade type, if not filled in means all with available values 0:all, 1:open long, 2:open short, 3:close short, 4:close long. Added one field in return parameter "orders": update_time(order updated time, in milliseconds))
 - Interface Name: Query Open Orders
 - Interface Type: private
 - Interface URL: /option-api/v1/option_openorders 

### 4、Modified Query Trigger Order Open Orders(Added one optional parameter in request: trade_type, order trade type, if not filled in means all with available values 0:all, 1:open long, 2:open short, 3:close short, 4:close long.)
 - Interface Name: Query Trigger Order Open Orders
 - Interface Type: private
 - Interface URL: /option-api/v1/option_trigger_openorders

## 1.0.2 2021-01-12 【Modified "Get Option Open Interest Information" Interface、Modified "Subscribe Market Detail Data" Interface、Modified "Query History Orders" Interface、Modified "Query Trigger Order History" Interface】

### 1. Modified "Get Option Open Interest Information" Interface(Added "trade_volume" in return parameter "data" to indicate trading volume within the last 24 hours (cont),  and "trade_amount" to indicate trading volume within the last 24 hours (coin), and "trade_turnover" to represent trading amount within the last 24 hours.)
 - Interface Name: Get Option Open Interest Information
 - Interface Type: public
 - Interface URL: /option-api/v1/option_open_interest

### 2. Modified "Subscribe Market Detail Data" Interface(Added "ask" in return parameter “tick” to represent “sell one” and “bid” to represent "buy one".)
 - Interface Name: Subscribe Market Detail Data
 - Interface Type: public
 - Subscription Topic: market.$contract_code.detail

### 3. Modified "Query History Orders" Interface（Added paprameter "sort_by" to represent "sort fields" with optional values “create_date” and “update_time”). added "update_time" to indicate order's update time））
 - Interface Name: Query History Orders	
 - Interface Type: private
 - Interface URL: /option-api/v1/option_hisorders

### 4. Modified "Query Trigger Order History" Interface（Added paprameter "sort_by" to represent "sort fields" with optional values “created_at” and “update_time”). added "update_time" to indicate order's update time））
 - Interface Name: Query Trigger Order History	
 - Interface Type: private
 - Interface URL: /option-api/v1/option_trigger_hisorders

## 1.0.1 2020-10-10 【Newly added：Added WS interface for subscribing system status updates push】

### 1. Added WS interface for subscribing system status updates push
  - Interface name: subscribe system status updates
  - Interface type: public
  - Subscription topic：public.$service.heartbeat

## 1.0.0  2020-09-01 18:00(GMT+8)
 
# Option API Access Guide

##  API List

permission type  |  Content Type  |   Context                                      |   Request Type   |   Desc                                        | Signature Required   |
--------- | ---------------- | ------------------------------------------------ | ---------------- | ---------------------------------------------- | ---------------------- |
Read  | Market Data      | /option-api/v1/option_contract_info      |  GET              | Query Option Info                      | No                     |
Read  | Market Data      | /option-api/v1/option_index             |  GET              | Query Option Index Price Information           | No                     |
Read  | Market Data      |  /option-api/v1/option_price_limit       |  GET              | Query Option Price Limitation                     | No                     |
Read  | Market Data      | /option-api/v1/option_market_index             |  GET              | Query Market Index           | No                     |
Read  | Market Data      |  /option-api/v1/option_open_interest     |  GET              | Get Option Open Interest Information        | No                     |
Read  | Market Data      |  /option-api/v1/option_delivery_price     |  GET              |  Get Option Estimated Delivery Price         | No                     |
Read  | Market Data      |  /option-api/v1/option_his_open_interest     |  GET              | Query information on history open interest        | No                     |
Read     |  Market Data  |   /option-api/v1/option_api_state            |   GET        |  Query information on system status    |  No  |
Read  | Market Data      |  /option-ex/market/depth                  |  GET              | Query Market Depth                               | No                     |
Read  | Market Data      | /option-ex/market/history/kline          |  GET              | Query KLine Data                                | No                     |
Read  | Market Data      |  /option-ex/market/detail/merged         |  GET              | Query Market Data Overview                       | No                     |
Read  | Market Data      |  /option-ex/market/trade                  |  GET              | Query The Last Trade of a Contract                   | No                     |
Read  | Market Data      | /option-ex/market/history/trade           |  GET              | Query a Batch of Trade Records of a Contract | No                     |
Read  | Account          | /option-api/v1/option_balance_valuation   |  POST             | Query Asset Valuation                    | Yes                    |
Read  | Account          | /option-api/v1/option_account_info   |  POST             | Query User’s Account Information                     | Yes                    |
Read  | Account          | /option-api/v1/option_position_info  |  POST             | Query User’s position Information                    | Yes                    |
Trade    |  Account           |  /option-api/v1/option_sub_auth                |    POST       |       Set a Batch of Sub-Account Trading Permissions       |  Yes  |
Read   | Account | /option-api/v1/option_sub_account_list    | POST             |     Query assets information of all sub-accounts under the master account (Query by coins)     | Yes   |
Read     |  Account           |  /option-api/v1/option_sub_account_info_list   |    POST       |       Query a Batch of Sub-Account's Assets Information      |  Yes  |
Read   | Account | /option-api/v1/option_sub_account_info     | POST             |  Query a single sub-account's assets information   | Yes   |
Read   |  Account  | /option-api/v1/option_sub_position_info    | POST             | Query a single sub-account's position information    | Yes   |
Read   | Account  | /option-api/v1/option_financial_record    | POST             | Query account financial records  | Yes   |
Read     | Account           |  /option-api/v1/option_order_limit |  POST       |  Query contract information on order limit            |  Yes  |
Read     | Account           |  /option-api/v1/option_fee |       POST       | Query information on contract trading fee            |  Yes  |       
Read     | Account           |  /option-api/v1/option_transfer_limit |     POST       |  Query information on Transfer Limit            |  Yes  |
Read     |  Account           |  /option-api/v1/option_position_limit |     POST       |  Query information on position limit            |  Yes  |
Read     |  Account           |   /option-api/v1/option_master_sub_transfer_record   |                  GET        |  Query transfer records of master account    |  No  |
Trade     |  Account           |   /option-api/v1/option_master_sub_transfer  |                  POST        |  transfer between master account and sub-accounts  |  No  |
Read     |  Account           |  /option-api/v1/option_api_trading_status |     POST       |  Query API trading status            |  Yes  |
Trade  | Trade            |  /option-api/v1/option_order          |  POST             | Place an Order                                 | Yes                    |
Trade | Trade            | /option-api/v1/option_batchorder       |  POST             | Place a Batch of Orders                        | Yes                    |
Trade | Trade            | /option-api/v1/option_cancel           |  POST             | Cancel an Order                                | Yes                    |
Trade | Trade            | /option-api/v1/option_cancelall        |  POST             | Cancel All Orders                              | Yes                    |
Trade     |  Trade           |  /option-api/v1/option_lightning_close_position |   POST       |  Place Lightning Close Order            |  Yes  |
Trade  | Trade            |  /option-api/v1/option_trigger_order          |  POST             | Place an Trigger Order                                 | Yes                    |
Trade  | Trade            |  /option-api/v1/option_trigger_cancel          |  POST             | Cancel a Trigger Order                                 | Yes                    |
Trade  | Trade            |  /option-api/v1/option_trigger_cancelall          |  POST             | Cancel all trigger Orders                                 | Yes                    |
Read  | Trade            |  /option-api/v1/option_trigger_openorders          |  POST             | Get all open trigger Orders                                 | Yes                    |
Read | Trade            |  /option-api/v1/option_trigger_hisorders          |  POST             | Get all history trigger Orders                                 | Yes                    |
Read  | Trade  | /option-api/v1/option_order_info       |  POST             | Get Information of an Order                    | Yes                    |
Read  | Trade  |  /option-api/v1/option_order_detail   |  POST             | Get Trade Details of an Order                  | Yes                    |
Read  | Trade  |  /option-api/v1/option_openorders     |  POST             | Get Current Orders                             | Yes                    |
Read  | Trade  |  /option-api/v1/option_hisorders      |  POST             | Get History Orders                             | Yes                    |
Read  | Trade  |  /option-api/v1/option_matchresults       |  POST             | Acquire History Match Results                             | Yes   |

##  Address

Address | Applicable sites | Applicable functions | Applicable trading pairs |
------ | ---- | ---- | ------ |
https://api.hbdm.com  | Huobi Option |  API       | Trading pairs provided by Huobi Option  |

### Notice

If you can't connect "https://api.hbdm.com", please use "https://api.btcgateway.pro" for debug purpose. If your server is deployed in AWS, we recommend using "https://api.hbdm.vn".

## Signature Authentication & Verification

### Signature Guide

Considering that API requests may get tampered in the process of transmission, to keep the transmission secure, you have to use your API Key to do Signature Authentication for all private interface except for public interface (used for acuqiring basic information and market data), in this way to verify whether the parameters/ parameter value get tampered or not in the process of transmission

A legitimate request consists of following parts：

- Request address of method, i.e. visit server address--api.hbdm.com, e.g.:  api.hbdm.com/option-api/v1/option_order

- API Access Key ID (AccessKeyId): Access Key of the API Key that you apply.

- Method of Signature (SignatureMethod): Based on the Hash Aggrement, users calculate the signature via HmacSHA256.

- Signature Version (SignatureVersion): It adopts version 2 in terms of Signature Version.

- Timestamp (Timestamp): The time when you send the request (UTC time zone) : (UTC time zone) : (UTC time zone), e.g.: 2017-05-11T16:22:06

- Must-fill parameters & optional parameters: For each method, there are a group of must-fill parameters and optional parameters used to address the API request, which can be found in the illustration of each method as well as their meaning. Please note that, in terms of "Get" requests, it needs to do Signature calculation for all the original parameters in each method ; In terms of "Post" requests, no need to do Signature calculation for the original parameters in each method, which means only four parameters need to do Signature calculation in "Post" requests, i.e. AccessKeyId, SignatureMethod, SignatureVersion, Timestamp with other parameters placed in "body".

- Signature: The result of Signature calculation which is used to verify if signature is valid and not tampered.


### Create API Key

<a href='https://www.hbg.com/zh-cn/apikey/'>You could  create API Key at</a>

API Key consists of the following two parts.

- "Access Key", the Key used to visit API.
  
- "Secret Key", the Key used to do Signature authentication and verification (visible during application period).

<aside class="notice">
When create API Key, users could bind IP address, as the validity of unbond IP address is only 90 days.
</aside>
<aside class="notice">
API Key has operation authorization of trading, borrowing, deposit and withdrawal etc..
</aside>
<aside class="warning">
Both Access Key and Secret Key are closely related with account security, please do not disclose them to others for any reasons anytime.
</aside>


### Steps for Signature

Normative request for Signature calculation  Different contents will get totally different results when use HMAC to calculate Signature, therefore, please normalize the requests before doing Signature calculation. Take the request of inquering order details as an example:

query details of one order 

`https://api.hbdm.com/option-api/v1/option_order?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

#### 1. Request methods (GET/POST): add line breaker "\n".


`POST\n`

#### 2. Text the visit address in lowercase, adding line breake "\n"

`
api.hbdm.com\n
`

#### 3. Visit the path of methods, adding line breaker "\n"

`
/option-api/v1/option_order\n
`

#### 4. Rank the parameter names according to the sequence of ASCII codes, for example, below is the parameters in original sequence and the new sequence:


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

<aside class="notice">
Use UTF-8 to encode when it has already been encoded by URI with hexadecimals in Uppercase, e.g., ":" wiil be encoded to "%3A" while space to "%20".
</aside>
<aside class="notice">
Timestamp should be written in the form of YYYY-MM-DDThh:mm:ss and encoded with URI.
</aside>


#### 5. After ranking

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

#### 6.  Following the sequence above, link parameters with "&"


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`

#### 7. Form the final character strings that need to do Signature calculation as following:

`POST\n`

`api.hbdm.com\n`

`/option-api/v1/option_order\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`


#### 8. Use the "request character strings" formed in the last step and your Secret Key to create a digital Signature.

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

1. Take the request character string formed in the last step and API Secret Key as two parameters, encoding them with the Hash Function HmacSHA256 to get corresponding Hash value.

2. Encoding the Hash value with base-64 code, the result will be the digital Signature of this request.

#### 9. Add the digital Signature into the parameters of request path.

The final request sent to Server via API should be like:

`https://api.hbdm.com/option-api/v1/option_order?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&order-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`

1. Add all the must authentication parameters into the parameters of request path;

2. Add the digital Signature encoded with URL code into the path parameters with the parameter name of "Signature".

## API Rate Limit Illustration

Future, Coin Margined Swap,Option Swap and USDT Margined Swap are using separate API rate limits.

Please note that, for both public interface and private interface, there are rate limits, more details are as below:

* Generally, the private interface rate limit of API key is at most 48 times every 3 seconds for each UID (Trade Interface: at most 24 times every 3 seconds. Read Interface: at most 24 times every 3 seconds) (this rate limit is shared by all the altcoins contracts delivered by different date).<a href= https://docs.huobigroup.com/docs/option/v1/en/#api-list > API Interface List </a> 

* For public interface used to get information of index, price limit, settlement, delivery, open positions and so on, the rate limit is 60 times every 3 second at most for each IP (this 60 times every 3 second public interface rate limit is shared by all the requests from that IP of non-marketing information, like above).

* In terms of public interface used to get candle chart data, the latest transaction record and information of aggregate market, order book and so on, the rate limit is as below:

     (1) For restful interfaces：all products(futures, coin margined swap, usdt margined swap and option) 800 times/second for one IP at most

    （2）For websocket: The rate limit for “req” request is 50 times at once. No limit for “sub” request as the data will be pushed by sever voluntarily.

* WebSocket, the private order push interface, requires API KEY Verification:

    Each UID can build at most create 30 WS connections for private order push at the same time. For each account, 
    contracts of the same underlying coin only need to subscribe one WS order push, e.g. users only need to create one WS 
    order push connection for BTC Contract which will automatically push orders of BTC-USDT
    contracts. Please note that the rate limit of WS order push and RESTFUL private interface are separated from each other, with no relations.

* Both read and trade interfaces will return the ratelimit info.You can refer to the following fields of "header" from api response. E.g.,you will get the total Read ratelimit("ratelimit-limit") and the remaining Read ratelimit("ratelimit-remaining") when you query the order info(/option-api/v1/option_account_info) , and you will get the total Trade ratelimit("ratelimit-limit") and the remaining Trade ratelimit("ratelimit-remaining") when you place an order(/option-api/v1/option_order)). <a href= https://docs.huobigroup.com/docs/option/v1/en/#api-list > API Interface List </a> 

* Will response following string for "header" via api 

    ratelimit-limit: the upper limit of requests per time, unit: time

    ratelimit-interval: reset interval (reset the number of request), unit: ms

    ratelimit-remaining: the left available request number for this round, unit: time

    ratelimit-reset: upper limit of reset time used to reset request number, unit: ms 



## API Limitation on Order Cancellation Ratio【Not enabled yet】

* The system will calculate the order cancellation ratio automatically when the total number of orders placed via certain order price types by the API user goes equal to or larger than 2,500 within 10 minutes. If the order cancellation ratio is greater than 99%, the user will be prohibited for 5 minutes from placing orders via certain API order price types which will be listed below (The response of placing orders will return: 1084  Your contract API is disabled, please try again after {0} (GMT+8).).
* A 30-minute API order placement prohibition will be triggered if the user was prohibited for 3 times within an hour (The response of placing orders will return: 1084  Your contract API is disabled, please try again after {0} (GMT+8).). After resuming access, the total number of prohibited times will be cleared during the previous period and will not be counted into the total prohibited times in the new period.
* Please note that the prohibition from placing orders will cause no effect on order cancellation via API as well as order placement and cancellation via other terminals. We’ll keep you notified on each prohibition via SMS and email.
* Only four API order price types will be prohibited which are Limit order, Post_only, FOK and IOC. Please note that you can still use freely other order price types during the banned period, such as Lightning Close, BBO, Optimal 5, Optimal 10 and Optimal 20, opponent_ioc, lightning_ioc, optimal_5_ioc, optimal_10_ioc，optimal_20_ioc，opponent_fok，lightning_fok，optimal_5_fok，optimal_10_fok，optimal_20_fok,etc.
* When placing order by using the four prohibited order price types during the prohibition period, the message header returned by interface will include the field: "recovery-time: recovery timestamp" whose unit is millisecond, showing the end time of prohibition, or the access retrieval timestamp; if you are not in the prohibition period, the field is not included in returned header;
* Please note that our system calculates order cancellation ratio according to UID and therefore, the master account UID and sub-accounts UIDs will be counted separately. The calculation period is 10 min/time(The start time starts at 00:00 and the end time is 00:10. Every 10 minutes is a cycle.).
* Definition of Indicators：
  
  - Order Cancellation Ratio =Total number of invalid cancellation / Total number of placed orders (all types of orders placed via API) 
  - Total number of placed order: Total number of placed orders refers to all orders placed via API which meet these requirements:
    - 1.the order type is placing orders (Order Type = 1),
    - 2.order price types include Limit Order, Post_only, FOK and IOC.
    - 3.order creating time should be within the interval between 3 seconds before the start time of the calculation period and the end time of the calculation period.
  - Total number of invalid cancellation:Total number of invalid cancellation refers to all cancellation orders placed via API which meet the requirements.

    - the order type is placing orders (order Type=1),
    - the order price types are Limit Order, post_only, FOK and IOC.
    - the order status is “Orders cancelled” (status=7).
    - order with 0 fulfilled.
    - the interval between order cancellation and placement should be less than or equal to 3 seconds.
    - the order cancellation time should be within the calculation period.
  
- In order to ensure stability and transaction performance of API, please try to reduce order cancellation rate and cancellation amount during peak periods to avoid frequent triggering of API restriction mechanism.Suggestions of reducing order cancellation rate are as below:

  - 1. Set orders’ price to BBO prices as close as possible;

  - 2. Prolong the interval properly between each order placement and cancellation;

  - 3. Try to increase your amount for each order and reduce the frequency of order;

  - 4. Try to improve your order fulfillment rate:

    - （1）Please try to use order prices types that help more on order fulfillment in preference such as BBO, Optimal 5, Optimal 10, Optimal 20, lightning Close, opponent_ioc, lightning_ioc, optimal_5_ioc, optimal_10_ioc，optimal_20_ioc，opponent_fok，lightning_fok，optimal_5_fok，optimal_10_fok，optimal_20_fok, etc.

    - （2）Try to use best bid/ask price when placing IOC orders, FOK orders and Post_only orders.

  - 5. Please try to extend your request polling cycle when implementing your strategy.

## Maintenance with service suspended
During the maintenance of the business system, in addition to the below one interface(<a href='https://docs.huobigroup.com/docs/option/v1/en/#query-whether-the-system-is-available'>Query whether the system is available</a >) for users to query the system status, all “rest” interfaces of the API business will return this in a fixed manner:`{"status": "maintain"}`. During maintenance with service suspended，all websocket notify interfaces except subscribing system status updates（<a href='https://docs.huobigroup.com/docs/option/v1/en/#subscribe-system-status-updates'>Subscribe system status updates</a>）can't work，and will push 1006 error code to clients.

>Response

```json
{
    "status": "maintain"
}
``` 

### The one interfaces is:
- Query whether the system is available: https://api.hbdm.com/heartbeat/

Besides the above one rest interface, for getting the infomation that system maintenance with service suspended, could by subscrib system status updates websocket interface.

## Query whether the system is available  


- Interface `https://api.hbdm.com/heartbeat/`

### Returning Parameter
| Parameter Name | Parameter Type   |   Desc         |
| ------------------ | ------------------ | ------------- | -------------- |
| status             | string                   | "ok" or "error"... 
| \<data\>             | dict object                 | 
| heartbeat             | int                   | future 1: avaiable 0: not available(maintenance with service suspended)
| swap_heartbeat             | int                   | coin margined swap 1: avaiable 0: not available(maintenance with service suspended)
| estimated_recovery_time             | long                   | null: normal. estimated recovery time :millionseconds.
| swap_estimated_recovery_time             | long                   | null: normal. coin margined swap estimated recovery time millionseconds.
| option_heartbeat             | int                   | option 1: avaiable 0: not available(maintenance with service suspended)
| option_estimated_recovery_time             | long                   | null: normal. option estimated recovery time :millionseconds.
| linear_swap_heartbeat             | long                   | USDT margined swap 1: avaiable 0: not available(maintenance with service suspended)
| linear_swap_estimated_recovery_time             | long                   | null: normal. USDT margined swap estimated recovery time millionseconds.
| \</data\>             |                  | 

> Response:

```json

{
    "status":"ok",
    "data":{
        "heartbeat":1,
        "estimated_recovery_time":null,
        "swap_heartbeat":1,
        "swap_estimated_recovery_time":null,
        "option_heartbeat":1,
        "option_estimated_recovery_time":null,
        "linear_swap_heartbeat":1,
        "linear_swap_estimated_recovery_time":null
    },
    "ts":1557714418033
}
```

- Notice: Heartbeat is 1 is available, 0 is not available. 

## Get current system timestamp

 get `https://api.hbdm.com/api/v1/timestamp`

### request
   null
   
> response

```json

{
    "status": "ok",
    "ts": 1578124684692
}

```
### Returning Parameter

| Parameter Name	  | Mandatory | Type      | Desc       | Value Range    |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | Request Processing Result             |                                          |
| ts                     | true | long    | current system timestamp        |                                          |

#### Note:
- It can be used for  system time calibration.。


## Details of Each Error Code

Error Code | Error Details Description|
----- | ---------------------- |
403	|	invalid ID                |
1000 | System error.
1001 | System is unprepared.
1002 | Query error.
1003 | Abnormal redis operation.
1004 | System busy. Please try again later.
1010 | Account doesn't exist.
1011 | The user's session doesn't exist.
1012 | The user's account doesn't exist.
1013 | This contract symbol doesn't exist.
1014 | This contract doesn't exist.
1015 | The index price does not exist.
1016 | The bid offer does not exist. Please input the price.
1017 |  Order doesn't exist.
1018 | Main account doesn't exist.
1019 | Main account doesn't exist in the sub-account white list.
1020 | The number of your sub-account exceeds the maximum. Please contact customer service.
1021 | Account open failed. Main account hasn’t opened contract trading account yet.
1030 | Input error.
1031 | Incorrect form source.
1032 | The number of access exceeded the limit.
1033 | Incorrect field of contract period.
1034 | Incorrect field of order price type.
1035 | Incorrect field of form direction.
1036 | Incorrect field of open long form.
1037 | The leverage is invalid. Please contact the customer service.
1038 | The order price exceeds the precision limit, please modify and order again.
1039 | Buy price must be lower than {0}{1}. Sell price must exceed {2}{3}.
1040 | Invalid amount, please modify and order again.
1041 | The order amount exceeds the limit ({0}Cont), please modify and order again.
1042 | Current positions have triggered position limits ({0}Cont). Please order after changing the amount.
1043 | Current positions have triggered position limits ({0}Cont). Please order after changing the amount.
1044 | Current positions have triggered position limits of our platform. Please order after changing the amount.
1045 | Unable to switch leverage due to open orders.
1046 | Abnormal service. Please try again later.
1047 | Insufficient margin available.
1048 | Insufficient close amount available.
1049 | Open a position with market price is not available.contracts
1050 | Customer's order number is repeated. Please try again later.
1051 | No orders to cancel.
1052 | The number exceeds the batch limit.
1053 | Unable to get the latest price range.
1054 | Unable to get the latest price.
1055 | The price is not reasonable, and the account equity will be less than 0 after placing this order. Please modify the price and place the order.
1056 | In settlement. Your order can’t be placed/withdrew currently.
1057 | Your order can’t be placed due to trading halt.
1058 | Your order can’t be placed due to trade suspension.
1059 | In delivery. Your order can’t be placed/withdrew currently.
1060 | Your order can’t be placed currently due to abnormal contracts status.
1061 | This order doesn't exist.
1062 | Cancelling. Please be patient.
1063 | The order has been executed.
1064 | The main key of order conflicts.
1065 | The form number of client isn't an integer.
1066 | {0} cannot be empty.
1067 | Illegal parameter {0}.
1068 | Export error.
1069 | The price is not reasonable.
1070 | Empty data, cannot be exported.
1071 | Repeated cancellation. Your order has been canceled.
1072 |  Sell price must be lower than {0}{1}.
1073 | Position abnormal. Please contact the customer service.
1074 | Unable to order currently. Please contact the customer service.
1075 | The price is not reasonable, and the margin rate will be less than 0 after placing this order. Please modify the price and place the order.
1076 | No orders, please try again later.
1077 | In settlement or delivery. Unable to get assets of current contract.
1078 | In settlement or delivery. Unable to get assets of some contracts.
1079 | In settlement or delivery. Unable to get positions of current contract.
1080 | In settlement or delivery. Unable to get positions of some contracts.
1081 | The number of your {0} contract trigger orders exceeds the limit {1}.
1082 | Trigger type parameter error.
1083 | Your position is in the process of forced liquidation. Unable to place order temporarily.
1084 | Your contract API is disabled, please try again after {0} (GMT+8).
1085 | Trigger order failed, please modify the price and place the order again or contact the customer service.
1086 | {0} contract is restricted of opening positions on {1}.  Please contact customer service.
1087 | {0} contract is restricted of closing positions on {1}.  Please contact customer service.
1088 | {0} contract is restricted of withdraw order on {1}.  Please contact customer service.
1089 | Transfer is temporarily restricted for {0} account, please contact customer service support.
1090 | Margin rate is lower than 0. Order can’t be placed.
1091 | Equity is less than 0. Order can’t be placed.
1092 | The Flash Closing Order takes the {0}th price at the order book. After placing an order, the account equity will be less than 0. Please manually enter the price or place an order with the counterparty price.
1093 | The Flash Closing Order takes the {0}th price at the order book. The margin rate will be less than 0 after placing an order. Please manually enter the price or place an order with the counterparty price.
1094 | The leverage cannot be empty, please switch the leverage or contact customer service
1095 | Non-trading state, unable to switch the leverage temporarily
1100 | Unable to open a position currently. Please contact the customer service.
1101 | Unable to close a position currently. Please contact the customer service.
1102 | Unable to transfer in currently. Please contact customer service.
1103 | Unable to transfer out currently. Please contact customer service.
1104 | Trading is prohibited due to contracts trading constraints.
1105 | Only Close is available due to contracts trading constraints.
1106 | Delivery or settlement in progress, unable to transfer.
1108 | Abnormal service. Please try again later.
1109 | Sub-account doesn't own the permissions to open positions. Please contact customer service.
1110 | Sub-account  doesn't own the permissions to close positions. Please contact customer service.
1111 | Sub-account doesn't own the permissions to transfer in. Please contact customer service.
1112 | Sub-account doesn't own the permissions to transfer out. Please contact customer service.
1113 | The sub-account does not have transaction permissions. Please login main account to authorize.
1114 | The sub-account does not have transfer permissions. Please login main account to authorize.
1115 | You have no access permissions of this sub-account.
1200 | Login error. Please try again.
1220 | You don’t have access permission as you have not opened contracts trading.
1221 | The total balances of Exchange Account can't meet the requirements for opening contracts.
1222 | The days of opening account can't meet the requirements for opening contracts.
1223 | The VIP level can't meet the requirements for opening contracts.
1224 | Your country/region can't meet the requirements for opening contracts.
1225 | Failed to open contracts.
1226 | Repeated account.
1227 | Huobi Contract does not support sub-accounts. Please log out sub-account and log in again with primary account.
1228 | You have not activated contract trading currently, please activate first. 
1229 | Cannot agree twice.
1230 | You haven't finished the risk verification.
1231 | You haven't finished the ID Verification.
1232 | The format/size of the image you uploaded does not meet the requirements. Please re-upload.
1233 | High leverage is not enabled (Please sign in the APP or web with your main account to agree to the High-Leverage Agreement)
1234 | For {0} contracts, the number of the position-opening orders which are not fully filled cannot exceed {1}.
1235 | For {0} contracts, the number of the position-closing orders which are not fully filled cannot exceed {1}.
1250 | Unable to get the HT_token.
1251 | Unable to get BTC assets. Please try again later.
1252 | Unable to get currency account assets. Please try again later.
1253 | Error in signature verification.
1254 | The sub-account has no permission to open futures, please go to the web side to log in the main account and open.
1300 | Transfer failed.
1301 | Insufficient amount available.
1302 | Transfer failed.
1303 | The single transfer-out amount must be no less than {0}{1}.
1304 | The single transfer-out amount must be no more than {0}{1}.
1305 | The single transfer-in amount must be no less than {0}{1}.
1306 | The single transfer-in amount must be no more than {0}{1}.
1307 | Your accumulative transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.
1308 | Your accumulative transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.
1309 | Your accumulative net transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.
1310 | Your accumulative net transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.
1311 | The platform's accumulative transfer-out amount is over the daily maximum. You can't transfer out for the time being.
1312 | The platform's accumulative transfer-in amount is over the daily maximum. You can't transfer in for the time being.
1313 | The platform's accumulative net transfer-out amount is over the daily maximum. You can't transfer out for the time being.
1314 | The platform's accumulative net transfer-in amount is over the daily maximum. You can't transfer in for the time being.
1315 | Wrong transfer type.
1316 | Failed to freeze the transfer.
1317 | Failed to unfreeze the transfer.
1318 | Failed to confirm the transfer.
1319 | Failed to acquire the available transfer amount.
1320 | The contract status is abnormal. Transfer is unavailable temporarily.
1321 | Transfer failed. Please try again later or contact customer service.
1322 | Invalid amount. Must be more than 0.
1323 | Abnormal service, transfer failed. Please try again later.
1325 | Failed to set trading unit
1326 | Failed to obtain trading units
1327 | No transfer permission, transfer failed, please contact customer service
1328 | No transfer permission, transfer failed, please contact customer service
1329 | No transfer permission, transfer failed, please contact customer service
1330 | No transfer permission, transfer failed, please contact customer service
1331 | Exceeds limit of transfer accuracy (8 digits). Please modify it
1332 | The contract doesn't exist.
1333 | Failed to open the Maker&Taker agreement
1334 | Failed to check the Maker&Taker agreement
1335 | Failed to check the second confirmation setting of Maker&Taker
1336 | Failed to update the second confirmation setting of Maker&Taker
1337 | Failed to check the settings of Maker&Taker
1338 | Failed to update the settings of Maker&Taker
1339 | Nickname contains illegal words, please modify it
1340 | Nickname has been used, please modify it
1341 | The enrollment has ended
1342 | You cannot set nickname for sub-account
1343 | Invalid indicator, please reset
1344 | Sorry, {0} contracts can add market reminders currently at most
1345 | Sorry, currently {0} can set up to {1} reminders
1346 | The indicator already exists, please do not set it repeatedly
1347 | {0} parameter is incorrect, please modify.
1348 | This contract does not support cross margin mode.
1349 | The leverage of the order does not match the leverage of the current position, please switch the leverage first. 
1401 | order price shall be lower than the strike price.
1403 | The number of take-profit and stop-loss orders for {0} contract shall not exceed {1}  
1404 | Take-profit and stop-loss orders can only be bound with orders for opening a position
1405 | The take-profit price shall not be {0}{1}{2} 
1406 | Your chances of lucky draw have been used up 
1407 | The stop-loss price shall not be {0}{1}{2}
1408 | Unable to cancel because the take-profit and stop-loss order does not take effect.
1409 | You have no access to set a take-profit and stop-loss order, please contact our customer service.
1410 | The number of sub-accounts for batch operation cannot exceed {0}
1411 | Settlement in progress, unable to query order information.
1412 | {0} does not meet with the price precision limit {1}.
1413 | You have no access to set a Trailing Stop order, please contact our customer service.
1414 | You have not activated the grid trading. Please log in to the Web or APP with your main account, and agree with the protocol to activate the grid trading.
1415 | Terminate price (Take-profit/Stop-loss price) cannot be within the range of grid price, please modify!
1416 | Exceeds the maximum running time, which is{0} days and {1} hours, please modify!
1417 | Exceeds the range of grid quantity, which is ({0} ~ {1}), please modify!
1418 | At most {0} grids trading orders can be running at the same time, please cancel other grid trading orders first.
1419 | Exceeds the range of initial margin ({0} ~ {1}} {2}).
1420 | You have no access to grid trading on Huobi Futures, please contact our customer service.
1421 | There are open orders or positions of the current contract, please cancel these orders or close these positions first.
1422 | The PnL per grid is expected to be less than 0, please modify!
1423 | The spread between the lowest and the highest grid price is unreasonable, please modify!
1424 | This grid trading has been terminated for other reasons. Therefore, it cannot be modified or manually terminated now.
1425 | The callback rate should be {0}{1}, please modify!
1426 | The activation price should be {0} the latest price.
1427 | The number of your {0} contract trailing stop order orders exceeds the limit {1}.
1428 | The coupon for the same type of contract can only be collected once by each user.
1429 | Already received; please do not collect again!
1430 | Invalid coupon; please refresh!
1431 | The system is in maintenance and is expected to resume at {0} (GMT+8).
12001 | Invalid submission time.
12002 | Incorrect signature version.
12003 | Incorrect signature method.
12004 | Private key is expired.
12005 | Incorrect IP address.
12006 | The submission time can't be empty.
12007 | Incorrect public key.
12008 | Verification failed.
12009 | The user is locked or doesn't exist.

## API Best Practice

### 1. Query contract history orders interface: /option-api/v1/option_hisorders

- To ensure timelines and to reduce latency, users are highly recommended to get contract history orders information faster from server memory using interface “query contract order information” (URL: /option-api/v1/option_order_info).

- For users who use interface “query contract history orders” (URL: /option-api/v1/option_hisorders), please enter as many query conditions as possible (including contract_code, trade_type（recommended to send “0” to query all）, type, status, create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 2. Query contract match results interface: /option-api/v1/option_matchresults

- To improve query performance and response speed, please enter as many querying conditions as possible (including contract_code, trade_type（recommended to send “0” to query all）, create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 3. Query contract financial record interface: /option-api/v1/option_financial_record

- To improve query performance and response speed, please enter as many querying conditions as possible (including symbol, type(recommended to leave it blank to query all), create_date). Besides, try not to enter a big integer in parameter “create_date”. You are kindly suggested to query one-day data at a time.

 

### 4. Query contract order detail interface: /option-api/v1/option_order_detail

- When querying orders without parameter(such as the parameter: created_at), the query result data may be delayed. It is recommended to pass the two parameters of the interface: created_at (order timestamp) and order_type (order type, default 1), the database will be directly queried, and the query results data will be more timely.

- Querying condition “created_at” uses 13-bit long type time stamp (including milliseconds). Querying performance will be improved when accurate time stamps are entered.

- For example: the converted time stamp of "2019/10/18 10:26:22" is 1571365582123. The returned ts from interface “contract_order” can be used as time stamp to query corresponding order. 0 is not allowed in parameter “created_at”.


### 5. WebSocket subscription to Market Depth data:

- For acquiring market depth data within 150 steps, you are kindly suggested to use step0, step1, step2, step3, step4, step5, step14, step15；

- For acquiring market depth data within 20 steps, you are kindly suggested to use step6, step7, step8, step9, step10, step11, step12, step13；

- Since the large volume of pushing 150 steps data every 100ms, WebSocket disconnection may occur frequently if client’s network bandwidth is insufficient or the processing is not in time; therefore, we highly recommend users using step6, step7, step8, step9, step10, step11, step12, step13 to acquire 20 steps data. For instance, subscribing 20 steps data.

`{`

  `"sub": "market.BTC-USDT-200925-C-10000.depth.step6",`

  `"id": "id5"`

`}`

- We also suggest that you subscribe incremental market depth data.orderbook event will be checked every 30ms. If there is no orderbook event, you will not receive any orderbook data.you HAVE TO maintain local orderbook data,such as updating your local orderbook bids and asks data.You can subscribe 20 or 150 unmerged data.

`{`

  `"sub": "market.BTC-USDT-200925-C-10000.depth.size_20.high_freq",`

` "data_type":"incremental", `

` "id": "id1" `

`}`

### 6. Place order interface (URL: /option-api/v1/option_order) and place a batch of orders interface (URL:/option-api/v1/option_batchorder):

- We recommend to fill in the parameter “client_order_id”(should be unique from user-side),which can help users to acquire order status and other order information according to the parameter “client_order_id" from

- query order information interface (URL: /option-api/v1/option_order_info ) when there is no returned information due to network or other problems.

### 7. The best deployment of program server

- It is recommended that place the server in AWS Tokyo C zone and use the api.hbdm.vn domain, which can effectively reduce network disconnection and network timeout.


## Code Demo

PS: option api is similar to future and swap apis.

- <a href='https://github.com/hbdmapi/hbdm_Python'>Python</a>

- <a href='https://github.com/hbdmapi/huobi_option_Java'>Java</a>

- <a href='https://github.com/hbdmapi/huobi_futures_Postman'>Postman</a>

## Strategy Demo

- <a href='https://github.com/hbdmapi/hbdm_Python/tree/master/examples/huobi_option_mm'> Python </a> 

# Option API FAQ

## Access and Authentication

### Q1: Is the API Key  for option and spot the same ?
     
Yes. The option API key and spot API key are same. You can create API using the following link.<a href=https://www.hbg.com/zh-cn/apikey/> click here</a>

### Q2: Why are APIs  disconnected or timeouted?

1. The network connection is unstable if the server locates in China mainland,it is suggested to invoke APIS from a server located in  1c area of AWS Tokyo.

2.  You can use api.btcgateway.pro or api.hbdm.vn to debug for China mainland  network.

### Q3: Why is the websocket often disconnected?

It seems that most of the abnormal websocket  issues (such as disconnect, websocket close )(websocket: close 1006 (abnormal closure))are caused by different network environment. The following measures can effectively reduce websocket issues.

It would be better if the server is located in 1C area of AWS Tokyo with url api.hbdm.vn and implement websocket re-connection mechanism. Both market heartbeat and order heartbeat should response with Pong with different formats, following  Websocket market heartbeat and account heartbeat requirement.<a href=https://docs.huobigroup.com/docs/option/v1/en/#market-heartbeat>here</a>

### Q4:  what is the difference between api.hbdm.com and api.hbdm.vn?

The api.hbdm.vn uses AWS's CDN service. it should be more stable and faster for AWS users. The api.hbdm.com uses Cloudflare's CDN service.

### Q5: Why does signature verification return failure (403: Verification failure) ?

The signature process of option is similar to huobi future . In addition to the following precautions,please refer to the option or the swap or future demo to verify whether the signature is successful. Please check your own signature code after demo verification is successful.The coin margined  swap code demo is <a href=https://docs.huobigroup.com/docs/coin_margined_swap/v1/en/#code-demo>here</a>. The future code demo is <a href=https://docs.huobigroup.com/docs/dm/v1/en/#code-demo>here</a>.The option code demo is <a href=https://docs.huobigroup.com/docs/option/v1/en/#code-demo>here</a>. The USDT Margined Swap code demo is <a href=https://docs.huobigroup.com/docs/usdt_swap/v1/en/#code-demo>here</a>.

1. Check if the API key is valid and copied correctly.
2. Check if the IP is in whitelist
3. Check if th timestamp is UTC time
4. Check if parameters are sorted alphabetically
5. Check if the encoding is UTF-8 
6. Check if the signature has base64 encoding
7. Any method with parameters for GET requests should be signed.
8. Any method with parameters for POST requests don't need to be signed.
9. Check if whether the signature is URI encoded and Hexadecimal characters must be capitalized, such as ":" should be encoded as "%3A", and the space shoule be encoded as "%20"
10. The authorization of websocket is similar to the authorization of restful interface.Pls note that the json body of the websocket authorization shouldn't be URL encoded
11. The host in signature text should be the same as the host in your API request.The proxy may change the request host, you can try without proxy;Some http/websocket library may include port in the host, you can try to append port in signature host, like "api.hbdm.com:443"
12. The hidden text in API Key and Secret Key may have impact on the signature.

If the reason for signature failure has not been found through the above methods. And you can confirm that by this <a href='https://github.com/hbdmapi/huobi_api_rules '>  demo </a > which is specially explaining the signature.

### Q6: Is the ratelimit of public market based on  IP ? Is the ratelimit of interface with  private key based on UID?

Yes. The ratelimit of interface with private key is based on the UID, not the API key. The master and sub accounts are separately ratelimited and don't affect each other.

## Market and Websocket


### Q1: How often are the snapshot orderbook subscription and incremental orderbook subscription pushed?

The snapshot orderbook subscription(market.$contract_code.depth.$type) is checked once every 100MS.If there is an update,it will be pushed. It will be pushed at least 1 second.The incremental orderbook subscription is checked once every 30MS.If there is an update,it will be pushed.If there is no update, it will not be pushed.

### Q2: How often is the market trade subscription pushed?

The market trade subscription will be pushed when there is a transaction. 

### Q3: Are there historical kline data or historical market trade data?

The historical kline data can be obtained via API interface /market/history/kline with the request params from, to (the time period cannot exceed two years). And the qty of data records cannot be exceeding 2000 in each time.

The historical trade data can be obtained by subscribing the websocket topic: market.$symbol.trade.detail 

or can be downloaded from <a href='https://futures.huobi.be/zh-cn/data/landing_page'>download historical market data</a > 

But also, you can download that data using <a href='https://github.com/hbdmapi/huobi_public_data'>The demo of downloading historical market data</a >

### Q4: How to get MACD and other technical indicators on kline? 

The API does not have interfaces to get technical indicators such as MACD. You can refer to TradingView and other websites to calculate them.

### Q5: What is the definition of timestamp in the document? 

The timestamp in the document refers to the total number of seconds or total milliseconds from Greenwich Mean Time, January 1, 1970, 00:00:00 (Beijing Time, January 1, 1970, 08:00:00) to the present.

### Q6: What is the definition of the 150 level and 20 level of MBP?

The Subscription of MBP data: market.$contract_code.depth.$type.150 price level means the current bids and asks splited into 150 level  by price.20 price level means the current bids and asks splited into 20 level by price.

### Q7: What is the meaning of merged depth when subscribing MBP data?

The subscrpition of MBP data:market.$contract_code.depth.$type：

step1 and step7 are merged by 5 decimal places.bids down,asks up.
step2 and step8 are merged by 4 decimal places.bids down,asks up.
step3 and step9 are merged by 3 decimal places.bids down,asks up.
step4 and step10 are merged by 2 decimal places.bids down,asks up.
step5 and step11 are merged by 1 decimal places.bids down,asks up.
step12 and step14 are combined by single digit.bids down,asks up.
step13 and step15 are combined by tens.bids down,asks up.

Example:

step4(0.01): 

bids price: 100.123, 100.245.
The merged bids price are 100.12, 100.24.

asks price: 100.123, 100.245
The merged asks price are 100.13, 100.25.

("Down" and "Up" are rounded up or down, if the price is down, the asks price is not rounded down, and the bids price is rounded up.)

150 price level: step0 to step5, step14, step15；

20 price level: step6 to step13;

More examples：

step1(0.00001):

price: 1.123456
The merged bid price is 1.12345.
The merged ask price is 1.12346.

step7(0.00001):

price: 1.123456
The merged bid price is 1.12345.
The merged ask price is 1.12346.

step6(0.000001)

price: 1.123456
The merged bid price is 1.123456.
The merged ask price is 1.123456.

step11(0.1):

price: 1.123456
The merged bid price is 1.1.
The merged ask price is 1.1.

### Q8:Does websocket's position channel push full data or incrementall data each time? 

Subscription of position event: "positions.BTC-USDT".The latest position is pushed,including the volumes, available volumes, frozen volumes.If there is no update,it will not be pushed. 

### Q9: Does websocket's position channel push data when the unrealized profit is updated?

Subscription of position event: "positions.BTC-USDT".It will not be pushed  if only unrealized profit is updated.
It will be pushed only when position event is updated.

### Q10: What is the difference between market detail and trade detail in WS?

Market Detail(market.$contract_code.detail) is the merged market data. It will be checked every 0.5s,pushed once trade event updates,including the OHLCV data,etc.Trade Detail(market.$contract_code.trade.detail) is pushed once trade event updates,including trade price, trade volume, trade direction,etc.

### Q11: What is the meaning of the two ts pushed by subscription of incremental MBP ?

Subscription of incremental MBP：market.$contract_code.depth.size_${size}.high_freq，The outer ts is the timestamp when the market server sends the data.The inner ts is the timestamp when the orderbook is checked.

### Q12: What is the difference between websocket subscription of MBP and incremental MBP? How often is the incremental MBP pushed?

market.$contract_code.depth.$type is snapshot MBP data，market.$contract_code.depth.size_${size}.high_freq is incremental MBP data.Snapshot MBP data is checked every 100ms,pushed at least every 1s.Incremental MBP data is checked every 30ms.It will not be pushed,if MBP has no update.

### Q13: How to maintain local MBP data subscribing incremental MBP:market.$contract_code.depth.size_${size}.high_freq?

Snapshot MBP data will be pushed for the first time, and the incremental MBP data will be pushed afterwards.

(1) Compare the incremental price with the previous full MBP data, and replace the order amount with the same price;

(2) If the price is not in the local MBP data,add the price to the local MBP data;

(3) If a price level is gone, data such as [8100, 0] will be pushed.You have to remove the same price of local MBP data;

(4) For the same websocket connection, the incremental data version is incremented; if the version is not incremented, you need to re-subscribe and re-maintain the local full MBP data;

## Order and Trade

### Q1: What's the reason for 1004 error code?
We notice that the system is sometimes overloaded when the market suddenly turns to be highly volatile. If the system is busy recently or the following prompts appear:

{“status”: “error”, “err_code”: 1004, “err_msg”: “System busy. Please try again later.”, “ts”:}

please be patient, and do not place or cancel order repeatedly during the process to avoid repeated orders and additional pressure on system performance. In the meanwhile, it is recommended to place and cancel orders through Web and APP.

### Q2: The same order ID and match ID can have multiple trades. for example: if a user take a large amount of maker orders, there will be multiple corresponding trades . How to identify these different trades ?

The field ID returned by the information interface option-api/v1/option_order_detail is a globally unique transaction identifier. if a maker order is matched multiple times, a trade will be pushed once there is a transaction matched.

### Q3: Why does the API return connection reset or Max retris or Timeout error?

Most of the network connectivity problems ,(such as Connection reset or network timeout )  are caused by network instability , you can use the server in AWS Tokyo C area with api.hbdm.vn , which can effectively reduce network timeout errors.

### Q4: How to check the order status without order_id not returned?
 
 If the order_id couldn't be returned due to network problems, you can query the status of the order by adding the custom order number(client_order_id ).

### Q5: What to do if it's diconnected after the websocket subscription of account, order and positions for a while?
  
 When subscribing private accounts, orders and positions, the heartbeat should also be maintained regularlyl ,which is different from the market heartbeat format . Please refer to the "websocket Heartbeat and Authentication Interface" . if the it is disconnected ,please try to reconnect.

### Q6. What is the difference between order status 1 and 2 ? what is the status 3 ?
 
 Status 1 is the preparation for submission. status 2 is the sequential submission  of internal process, which can be considered that it has been accepted by the system.  Status 3 indicated that the order has been  already submitted to market.

### Q7. Is there an interface to get the total assets in BTC of my account ? 
  
 No.

### Q8.  Why is the order filled after the order is withdrawed successfully by placing API cancellation ?
  
 The success return of order cancellation or placement  only represents that the command is excuted successfully and doesn't mean that the order has been cancelled . You can check the order status through the interface option-api/v1/option_order_info.

### Q9: Does the order status of 10 mean the order is failed?

Query the order status by option-api/v1/option_order_info.If the status is 10,the order is failed。

### Q10. How long does it generally take for an API from withdrawing to cancelling successfully ?

The order cancellation command generally takes several tens of ms. The actual status of order cancellation can be obtained by invoking an interface: option-api/v1/option_order_info


## Error Codes

### Q1: What is the reason for 1030 error code?

If you encounter errors such as {"status":"error","err_code":1030,"err_msg":"Abnormal service. Please try again later.","ts":1588093883199},indicating that your input request parameter is not correct, please print your request body and complete URL parameters, and please check the corresponding API document interface one by one.The common example is that the volume must be an integer. 

### Q2: What is the reason for 1048 error code?

If you encounter errors such as {'index': 1, 'err_code': 1048, 'err_msg': 'Insufficient close amount available.'}, indicating that your available position is not enough.You need to query the api option-api/v1/option_position_info to get your available position.

### Q3: What is the reason for 1032 error code? 

1032 means that your request exceeds the ratelimit. The coin margined swap, future, option swap and USDT margined swap limit the rate separately. Please check the ratelimit in the api ratelimit instructions, and you can print the current ratelimit in the header of the API response to check whether the ratelimit is exceeded. It is recommended to increase the request interval delay to avoid exceeding the ratelimit.

## How to solve problems more effectively?

When you report an API error, you need to attach your request URL, the original complete body of the request and the complete request URL parameters, and the original complete log of the server's response. If it is a websocket subscription, you need to provide the address of the subscription, the topic of the subscription, and the original complete log pushed by the server.

If it is an order-related issue, use the API order query interface option-api/v1/option_order_info to keep the complete log returned and provide your UID and order number.


# Option Market Data interface

## Query Option Info 

### Example              
                                   
- GET  `/option-api/v1/option_contract_info`

```shell
curl "https://api.hbdm.com/option-api/v1/option_contract_info?contract_code=BTC-USDT-201225-C-13000"      
```
                                                           
### Request Parameter

  Parameter Name   |   Mandatory  |   Type   |   Description   | Value Range                                           |
------------------ | -------- | ------------- | --------------- | ---------------------- |
| symbol        | false    | string | Coin Code | "BTC","ETH"，If default, all coins will be returned.           |
| trade_partition | false  | string | trade partition | "USDT", Default:"USDT"                                                        |
| contract_type | false    | string | contract type | Weekly: "this_week", Bi-weekly: "next_week", Quarterly: "quarter" |
| contract_code | false    | string | contract code | BTC-USDT-201225-C-13000                                        |

#### Note: 

 - If all input parameters are not filled, query all contracts info under the USDT trading zone by default. If contract_code is filled, query according to contract_code first. ;

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT-201225-C-13000",
            "contract_type": "quarter",
            "contract_size": 0.001,
            "price_tick": 0.01,
            "delivery_date": "20201225",
            "create_date": "20200904",
            "contract_status": 1,
            "option_right_type": "C",
            "exercise_price": 13000,
            "delivery_asset": "BTC",
            "quote_asset": "USDT",
            "trade_partition": "USDT"
        }
    ],
    "ts": 1604641660310
}
```


### Returning Parameter

| Parameter Name         | Mandatory | Type         | Desc                              | Value Range                                                     |
| ----------------- | -------- | ------------ | --------------------------------- | ------------------------------------------------------------ |
| status            | true     | string       | Request Processing Result                      | "ok" , "error"                                               |
| \<data\>            | true     | object array |                                   |                                                              |
| symbol            | true     | string       | Coin Code                         | "BTC","ETH"...                                               |
| trade_partition   | true     | string       | Trade Partition                          | "USDT"                                                       |
| contract_code     | true     | string       | Contract Code (If the strike price has a decimal point, "+" will be used to indicate the decimal point. eg, if the strike price of BTC Weekly call options is 9002.35, the contract code is BTC-USDT-200508-C-9002+35)        | "BTC-USDT-201225-C-13000"        |
| contract_type     | true     | string       | Contract Type                         | "this_week", "next_week", "quarter"           |
| contract_size     | true     | decimal      | Contract Value (how many coins corresponding to one contract) | 0.01...                                                      |
| price_tick        | true     | decimal      | Minimum Variation of Contract Price              | 0.001, 0.01...                                               |
| delivery_date     | true     | string       | Contract Delivery Date                      | eg "20200626"                                                 |
| create_date       | true     | string       | Contract Listing Date                      | eg "20200515"                                                 |
| contract_status   | true     | int          | Contract Status                          | 0: Delisting 1: Listing 2: Pending Listing 3: Suspension 4: Suspending of Listing 5: In Settlement 6: Delivering 7 Settlement Completed 8: Delivered 9: Trading Suspended |
| option_right_type | true     | string       | Options Type                       | C: call options P: put options                                       |
| exercise_price    | true     | decimal      | Strike Price                            | eg 6622                                                       |
| delivery_asset    | true     | string       | Delivery Coin                          | eg "BTC"                                                      |
| quote_asset       | true     | string       | Quote Coin                          | eg"USDT"                                                     |
| \</data\>           |          |              |                                   |                                                              |
| ts                | true     | long         | Time of Response Generation, unit: millisecond        |                                                              |

## Query Option Index Price Information 

### Example                                                
                                                            
- GET `/option-api/v1/option_index` 

```shell
curl "https://api.hbdm.com/option-api/v1/option_index"" 
```

### Request Parameter

| Parameter Name        | Mandatory | Type   | Desc     | Value Range                                |
| --------------- | -------- | ------ | -------- | --------------------------------------- |
| symbol          | false    | string | Index  Coin Code | "BTC","ETH"，If default, all coins will be returned. |

> Response

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC-USDT",
            "index_price": 15666.651003896666666666,
            "index_ts": 1604641743091
        }
    ],
    "ts": 1604641747077
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------------ | -------------------------- | -------------- |
| status          | true     | string       | Request Processing Result               | "ok" , "error" |
| \<data\>          | true     | object array |                            |                |
| symbol          | true     | string       | Index Coin Code                   | "BTC","ETH"... |
| index_price     | true     | decimal      | Index Price                   |                |
| index_ts        | true     | long         |  Time of Response Generation, unit: millisecond |                |
| \</data\>         |          |              |                            |                |
| ts              | true     | long         | Timestamp, unit: millisecond         |                |

  
## Query Option Price Limitation

###  Example      
                                                                          
- GET `/option-api/v1/option_price_limit` 
 
```shell
curl "https://api.hbdm.com/option-api/v1/option_price_limit?contract_code=BTC-USDT-201225-C-13000
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------- | -------- | ------ | -------- | ---------------------- |
| contract_code | false     | string | Contract Code, All swaps default | BTC-USDT-201225-C-13000 |


> Response

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_type": "quarter",
            "contract_code": "BTC-USDT-201225-C-13000",
            "high_limit": 4619.82,
            "low_limit": 1484.26,
            "trade_partition": "USDT"
        }
    ],
    "ts": 1604641793095
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------------ | -------------------------- | -------------------------------------------------- |
| status          | true     | string       | Request Processing Result               | "ok"                                               |
| \<data\>          | true     | object array |                            |                                                    |
| symbol          | true     | string       | Coin Code                   | "BTC","ETH"...                                     |
| trade_partition | true     | string       | Trade Partition                   | "USDT"                                             |
| contract_type   | true     | string       | Contract Type                   | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| contract_code   | true     | string       | Contract Code                   | eg"BTC-USDT-201225-C-13000" ...                     |
| high_limit      | true     | decimal      | Highest Buy Price                   |                                                    |
| low_limit       | true     | decimal      | Lowest Sell Price                  |                                                    |
| \<data\>          |          |              |                            |                                                    |
| ts              | true     | long         | Time of Response Generation, unit: millisecond |                                                    |


## Query Market Index

###  Example      
                                                                          
- GET `/option-api/v1/option_market_index` 
 
```shell
curl "https://api.hbdm.com/option-api/v1/option_market_index?contract_code=BTC-USDT-201225-C-13000
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------ | ------------ | -------------------------------------------------- |
| symbol            | false    | string | Coin Code     | "BTC","ETH"                                        |
| trade_partition   | false    | string | Trade Partition     | "USDT", Default: "USDT"                                               |
| contract_type     | false    | string | Contract Type     | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| option_right_type | false    | string | Options Type | C: Call options P: Put options                              |
| contract_code     | false    | string | Contract Code     | BTC-USDT-201225-C-13000                             |


### Note:

- If contract_code is filled，use contract_code to query；

- If contract_code isn't filled，use symbol+trade_partition+contract_type+option_right_type to query.

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "contract_code": "BTC-USDT-201225-C-13000",
            "symbol": "BTC",
            "iv_last_price": 0.47379972,
            "iv_ask_one": 0.66771509,
            "iv_bid_one": 0.55960657,
            "iv_mark_price": 0.62272073,
            "delta": 0.8249273542423468,
            "gamma": 0.00007202,
            "theta": -9.40283094,
            "vega": 14.82486644,
            "ask_one": 3122.7,
            "bid_one": 2964.33,
            "last_price": 2855.11,
            "mark_price": 3054.4960937643172123041257590971717688,
            "trade_partition": "USDT",
            "contract_type": "quarter",
            "option_right_type": "C"
        }
    ],
    "ts": 1604641840724
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------------ | -------------------------- | -------------------------------------------------- |
| status            | true     | string       | Request Processing Result               | "ok"                                               |
| \<data\>            | true     | object array |                            |                                                    |
| symbol            | true     | string       | Coin Code                   | "BTC","ETH"...                                     |
| trade_partition   | true     | string       | Trade Partition                   | "USDT", Default: "USDT"                                               |
| contract_code     | true     | string       | Contract Code                   | eg"BTC-USDT-201225-C-13000" ...                     |
| contract_type     | true     | string       | Contract Type                   | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| option_right_type | true     | string       | Options Type               | C: Call options P: Put options                              |
| iv_last_price   | true     | decimal      | Latest Price Implied Volatility       |                                                    |
| iv_ask_one        | true     | decimal      | Sell_one Price Implied Volatility           |                                                    |
| iv_bid_one        | true     | decimal      | Buy_one Price Implied Volatility           |                                                    |
| iv_mark_price     | true     | decimal      | Mark Price Implied Volatility         |                                                    |
| delta             | true     | decimal      | DELTA                      |                                                    |
| gamma             | true     | decimal      | GAMMA                      |                                                    |
| theta             | true     | decimal      | THETA                      |                                                    |
| vega              | true     | decimal      | VEGA                       |                                                    |
| ask_one           | true     | decimal      | Sell_one Price                     |                                                    |
| bid_one           | true     | decimal      | Buy_one Price                     |                                                    |
| last_price      | true     | decimal      | Latest Price                 |                                                    |
| mark_price        | true     | decimal      | Mark Price                   |                                                    |
| \<data\>            |          |              |                            |                                                    |
| ts                | true     | long         | Time of Response Generation, unit: millisecond |                                                    |



## Get Option Open Interest Information

###  Example   
                                                                                 
- GET `/option-api/v1/option_open_interest` 

```shell
curl "https://api.hbdm.com/option-api/v1/option_open_interest?contract_code=BTC-USDT-201225-C-13000"
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------ | -------- | ------------------------------------------ |
| symbol          | false    | string | Coin Code | "BTC","ETH"，If default, all coins will be returned.   |
| trade_partition | false    | string | Trade Partition | "USDT" Default: "USDT"                                      |
| contract_type   | false    | string | Contract Type | this_week: Weekly next_week: Bi-weekly quarter: Quarterly |
| contract_code   | false    | string | Contract Code | BTC-USDT-201225-C-13000                    |

### Note:
 - If all input parameters are not filled, query all contracts info under the USDT trading zone by default. If contract_code is filled, query according to contract_code first. 

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "volume": 2947,
            "amount": 2.947,
            "symbol": "BTC",
            "contract_type": "quarter",
            "contract_code": "BTC-USDT-201225-C-13000",
            "trade_partition": "USDT",
            "trade_amount": 1.42,
            "trade_volume": 142,
            "trade_turnover": 7.847622
        }
    ],
    "ts": 1604641943451
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------------ | -------------------------- | -------------------------------------------------- |
| status          | true     | string       | Request Processing Result               | "ok" , "error"                                     |
| \<data\>          | true     | object array |                            |                                                    |
| symbol          | true     | string       | Coin Code                   | "BTC","ETH"...                                     |
| trade_partition | true     | string       | Trade Partition                   | "USDT"                                             |
| contract_code   | true     | string       | Contract Code                   | eg"BTC-USDT-201225-C-13000"                         |
| contract_type   | true     | string       | Contract Type                   | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| amount          | true     | decimal      | Position Amount (coin)                 |                                                    |
| volume          | true     | decimal      | volume (volume)                 |                                                    |
| trade_amount    | true | decimal  | trading volume within the last 24 hours (coin)     |  |
| trade_volume    | true | decimal    | trading volume within the last 24 hours (cont)  |                |
| trade_turnover  | true | decimal    | trading amount within the last 24 hours  |                |
| \</data\>         |          |              |                            |                                                    |
| ts              | true     | long         | Time of Response Generation, unit: millisecond |                                                    |


## Get Option Estimated Delivery Price

###  Example   
                                                                                 
- GET `/option-api/v1/option_delivery_price` 

```shell
curl "https://api.hbdm.com/option-api/v1/option_delivery_price?contract_code=BTC-USDT-201225-C-13000"
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------ | -------- | ------------------------------ |
| symbol          | true     | string | Coin Code | "BTC","ETH"...                 |
| trade_partition | false    | string | Trade Partition | "USDT"，Default: "USDT"   |

>Response:

```json

{
    "status": "ok",
    "data": {
        "symbol": "BTC",
        "trade_partition": "USDT",
        "delivery_price": 13203.1966277128547579298831
    },
    "ts": 1604642022058
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------------ | -------------------------- | -------------- |
| status          | true     | string       | Request Processing Result               | "ok" , "error" |
| \<data\>          | true     | object array |                            |                |
| symbol          | true     | string       | Coin Code                   | "BTC","ETH"... |
| trade_partition | true     | string       | Trade Partition                   | "USDT"         |
| delivery_price  | true     | decimal      | Estimated Delivery Price                 |                |
| \</data\>         |          |              |                            |                |
| ts              | true     | long         | Time of Response Generation, unit: millisecond |                |


## Query information on history open interest

- GET `/option-api/v1/option_his_open_interest`

```shell
curl "https://api.hbdm.com/option-api/v1/option_his_open_interest?symbol=BTC&contract_type=this_week&period=60min&amount_type=1&option_right_type=C&trade_partition=USDT"
```

### Request Parameter 

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------ | ------------ | --------------------------------------------------------- |
| symbol            | true     | string | Coin Code     | "BTC","ETH"...                                            |
| trade_partition   | true     | string | Trade Partition     | "USDT"                                                    |
| contract_type     | true     | string | Contract Type     | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter"        |
| period            | true     | string | Period Type | 1 hours:"60min"，4 hours:"4hour"，12 hours:"12hour"，1 day:"1day" |
| size              | false    | int    | Acquisition Amount     | Default: 48，Value Range [1, 200]                              |
| amount_type       | true     | int    | Unit     | 1: cont，2: coin                                                |
| option_right_type | true     | string | Options Type | C: Call options P: Put options                                     |

> Response:

```json

{
    "status": "ok",
    "data": {
        "symbol": "BTC",
        "contract_type": "quarter",
        "option_right_type": "C",
        "trade_partition": "USDT",
        "tick": [
            {
                "volume": 22688,
                "amount_type": 1,
                "ts": 1604638800000
            },
            {
                "volume": 22633,
                "amount_type": 1,
                "ts": 1604635200000
            }
        ]
    },
    "ts": 1604642063718
}
```

### Returning Parameter 

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------------ | -------------------------- | -------------------------------------------------- |
| status            | true     | string       | Request Processing Result               | "ok" , "error"                                     |
| ts                | true     | long         | Time of Response Generation, unit: millisecond |                                                    |
| \<data\>            | true     | object       | Dictionary Data                   |                                                    |
| symbol            | true     | string       | Coin Code                   | "BTC","ETH"...                                     |
| trade_partition   | true     | string       | Trade Partition                   | "USDT"                                             |
| contract_type     | true     | string       | Contract Type                   | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| option_right_type | true     | string       | Options Type               | C:Call options P:Put options                              |
| \<tick\>            | true     | object array |                            |                                                    |
| volume            | true     | decimal      | Position volume                     |                                                    |
| amount_type       | true     | int          | Unit                   | 1: cont，2: coin                                         |
| ts                | true     | long         | Recording Time                   |                                                    |
| \</tick\>           |          |              |                            |                                                    |
| \</data\>           |          |              |                            |                                                    |

### Notice

 - tick fields: data in the array is arranged in reverse chronological order；

 - data fields: Dictionary Type

##  Query information on system status

- GET `/option-api/v1/option_api_state`

```shell
curl "https://api.hbdm.com/option-api/v1/option_api_state?symbol=BTC&trade_partition=USDT"
```

### Request Parameter 

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------ | -------- | --------------------------------------- |
| symbol          | false    | string | Coin Code | "BTC","ETH","USDT"，If default, all coins will be returned.|
| trade_partition | false    | string | Trade Partition | "USDT"                                  |

### Note:
 - When the symbol is USDT, the return parameter only presents the transfer permission of USDT asset, and the permission for opening/closing positions or cancelling orders could be ignored.

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "open": 1,
            "close": 1,
            "cancel": 1,
            "transfer_in": 1,
            "transfer_out": 1,
            "master_transfer_sub": 1,
            "sub_transfer_master": 1,
            "trade_partition": "USDT"
        }
    ],
    "ts": 1604642146524
}
```

### Returning Parameter 

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------------- | -------- | ------------ | ---------------------------------------------------- | -------------- |
| status              | true     | string       | Request Processing Result                                         | "ok" , "error" |
| ts                  | true     | long         | Time of Response Generation, unit: millisecond                           |                |
| \<data\>              | true     | object array |                                                      |                |
| symbol              | true     | string       | Coin Code                                             | "BTC","ETH"... |
| trade_partition     | true     | string       | Trade Partition                                             | "USDT"         |
| open                | true     | int          | open position access:“1" represents available; "0" represents unvailable             |                |
| close               | true     | int          | close position access:“1" represents available; "0" represents unvailable |                |
| cancel              | true     | int          | cancel order access:“1" represents available; "0" represents unvailable                 |                |
| transfer_in         | true     | int          | Transfer in from exchange account access: 1" represents available; "0" represents unvailable         |                |
| transfer_out        | true     | int          | Transfer out to exchange account access: 1" represents available; "0" represents unvailable         |                |
| master_transfer_sub | true     | int          | transfer from master account to sub-account access: 1" represents available; "0" represents unvailable  |                |
| sub_transfer_master | true     | int          | transfer from sub-account to master account access: 1" represents available; "0" represents unvailable  |                |
| \</data\>             |          |              |                                                      |                |

### Notice

- open refers to the corresponding "API-Open Positions-Ordinary Order" access in Trade Access, and is available when "On", unavailable when "Off";

- close refers to the corresponding "API-Close Positions-Ordinary Order" access in Trade Access, and is available when"On", unavailable when "Off";

- cancel refers to the corresponding "API-Cancel Orders-Ordinary Order" access in Trade Access, and is available when "On", unavailable when "Off";

- transfer_in refers to the corresponding "Other-Transfer-Transfer in from exchange account" access in Trade Access, and is available when "On", unavailable when "Off";

- transfer_out refers to the corresponding "Other-Transfer-Transfer out to exchange account" access in Trade Access, and is available when "On", unavailable when "Off";

- master_transfer_sub refers to the corresponding "API-Transfer-Transfer from master account to sub-account" access in Trade Access, and is available when "On", unavailable when "Off";

- sub_transfer_master refers to the corresponding "API-Transfer-Transfer from sub-account to  master account" access in Trade Access, and is available when "On", unavailable when "Off";


## Query Market Depth

###  Example            
                                            
- GET `/option-ex/market/depth` 

```shell
curl "https://api.hbdm.com/option-ex/market/depth?contract_code=BTC-USDT-201225-C-13000&type=step5"
```  

###  Request Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------- | -------- | ------ | -------- | ------------------------------------------------------------ |
| contract_code | true     | string | Contract Code | "BTC-USDT-201225-C-13000" ...                                 |
| type          | true     | string | Depth Type | (Data within Step150)  step0, step1, step2, step3, step4, step5, step14, step15 (merged depth 1-5,14,15); when step is 0, depth will not be merged, (Data within Step20)  step6, step7, step8, step9, step10, step11, step12, step13(merge depth 7-13); when step is 6, depth will not be merged |

> tick illustration:

```
"tick": {
    "id": Message id.
    "ts": Time of Message Generation, unit: millisecond
    "bids": Buying, [price(hanging unit price), vol(this price represent single contract)], According to the descending order of Price
    "asks": Selling, [price(hanging unit Price), vol(this price represent single contract)], According to the ascending order of Price  
    }

```

> Response:

```json

{
    "ch": "market.BTC-USDT-201225-C-13000.depth.step6",
    "status": "ok",
    "ts": 1604642203490,
    "tick": {
        "mrid": 118879828,
        "id": 1604642202,
        "bids": [
            [
                2943.2,
                552
            ],
            [
                2919.87,
                748
            ]
        ],
        "asks": [
            [
                3094.55,
                381
            ],
            [
                3125.95,
                494
            ]
        ],
        "ts": 1604642202644,
        "version": 1604642202,
        "ch": "market.BTC-USDT-201225-C-13000.depth.step6"
    }
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| -------- | -------- | -------- | ---------------------------------------------------------- | -------------- |
| ch       | true     | string   | Data belonged channel，Format: market.$contract_code.depth.type |                |
| status   | true     | string   | Request Processing Result                                               | "ok" , "error" |
| \<tick\>   | true     | object   |                                                            |                |
| asks     | true     | array    | Sell order book,[price( ask price), vol (quantity (conts) of open orders at this price)], price in ascending order    |                |
| bids     | true     | array    | Buy order book,[price( bid price), vol (quantity (conts) of open orders at this price)], price in decending order     |                |
| ch       | true     | string   | Data belonged channel，Format:  market.period                   |                |
| id       | true     | long     | Message id                                                    |                |
| mrid     | true     | long     | Order ID                                                     |                |
| ts       | true     | long     | Message generation time, unit: millisecond                                  |                |
| version  | true     | long     | Version                                                       |                |
| \</tick\>  |          |          |                                                            |                |
| ts       | true     | long     | Time of Response Generation, unit: millisecond                                 |                |


## Query KLine Data

###  Example     
                                                                   
- GET `/option-ex/market/history/kline` 

```shell
curl "https://api.hbdm.com/option-ex/market/history/kline?period=1min&size=200&contract_code=BTC-USDT-201225-C-13000"
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------- | -------- | ------- | --------------------- | ----------------------------------------------------- |
| contract_code | true     | string  | Contract Code              | "BTC-USDT-201225-C-13000" ...                          |
| period        | true     | string  | kline Type               | 1min, 5min, 15min, 30min, 60min, 4hour,1day,1week,1mon |
| size          | false    | int | Request Amount, default 150    | [1,2000]                                              |
| from          | false    | long | Start Timestamp, 10 digits, seconds |                                                       |
| to            | false    | long | End Timestamp, 10 digits, seconds |                                                       |

### Note

 - Either size or from&to shall be filled. If neither is filled, no data will be returned.

 - If from is filled, to is also required to be filled.  At most two consecutive years's data can be acuqired.

 - If size, from and to are all filled, from and to parameter will be ignored.

> Data Illustration：

```
"data": [
  {
        "id": KLine id,
        "vol": Transaction Volume(amount),
        "count": transaction count
        "open": opening Price
        "close": Closing Price, when the kline is the latest one，it means the latest price
        "low": Lowest price
        "high": highest price
        "amount": transaction volume(currency), sum(every transaction volume(amount)*every contract value/transaction price for this contract)
   }
]
```

> Response:

```json

{
    "ch": "market.BTC-USDT-201225-C-13000.kline.5min",
    "data": [
        {
            "amount": 0,
            "close": 2855.11,
            "count": 0,
            "high": 2855.11,
            "id": 1604641800,
            "low": 2855.11,
            "open": 2855.11,
            "trade_turnover": 0,
            "vol": 0
        },
        {
            "amount": 0,
            "close": 2855.11,
            "count": 0,
            "high": 2855.11,
            "id": 1604642100,
            "low": 2855.11,
            "open": 2855.11,
            "trade_turnover": 0,
            "vol": 0
        }
    ],
    "status": "ok",
    "ts": 1604642303996
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| -------------- | -------- | ------------ | -------------------------------------------------- | -------------- |
| ch             | true     | string       | Data belonged channel，Format:  market.period           |                |
| \<data\>         | true     | object array |                                                    |                |
| id             | true     | long         | kline id,the same as kline timestamp, kline start timestamp   |                |
| vol            | true     | decimal      | Trading volume(conts)，the sum of bilateral (buy&sell) trading volume                     |                |
| count          | true     | decimal      | Filled Order Quantity                                          |                |
| open           | true     | decimal      | Opening Price                                             |                |
| close          | true     | decimal      | Closing price, the price in the last kline is the latest price           |                |
| low            | true     | decimal      | Lowest Price                                             |                |
| high           | true     | decimal      | Highest Price                                             |                |
| amount         | true     | decimal      | Trading Amount(coin), that is (Trading volume(conts)*Contract face value)           |                |
| trade_turnover | true     | decimal      | Trading Amount, that is the sum of（Filled conts of a single order *Contract Face value *Transaction Price） |                |
| \</data\>        |          |              |                                                    |                |
| status         | true     | string       | Request Processing Result                                       | "ok" , "error" |
| ts             | true     | long         | Time of Response Generation, unit: millisecond                         |                |


##  Query Market Data Overview

###  Example            
                                         
- GET `/option-ex/market/detail/merged`
   
```shell
curl "https://api.hbdm.com/option-ex/market/detail/merged?contract_code=BTC-USDT-201225-C-13000"
```


###  Request Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------- | -------- | ------ | -------- | ---------------------------- |
| contract_code | true     | string | Contract Code | "BTC-USDT-201225-C-13000" ... |

> tick Illustration:

```
"tick": {
    "id": KLine id,
    "vol": transaction volume（contract）,
    "count": transaction count
    "open": opening price,
    "close": Closing Price, when the kline is the latest one，it means the latest price
    "low": Lowest price
    "high": highest price
    "amount": transaction volume(currency), sum(every transaction volume(amount)*every contract value/transaction price for this contract)
    "bid": [price of buying one (amount)],
    "ask": [price of selling one (amount)],
    "trade_turnover": trade turnover.

  }
```

> Response:

```json

{
    "ch": "market.BTC-USDT-201225-C-13000.detail.merged",
    "status": "ok",
    "tick": {
        "amount": "1.69",
        "ask": [
            3099.36,
            381
        ],
        "bid": [
            2939.87,
            552
        ],
        "close": "2855.11",
        "count": 5,
        "high": "2855.11",
        "id": 1604642357,
        "low": "2821.97",
        "open": "2821.97",
        "trade_turnover": "4480.8195",
        "ts": 1604642358431,
        "vol": "1690"
    },
    "ts": 1604642358431
}

```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| -------------- | -------- | -------- | ------------------------------------------------------------ | -------------- |
| ch             | true     | string   | Data belonged channel，Format:  market.$contract_code.detail.merged |                |
| status         | true     | string   | Request Processing Result                                                 | "ok" , "error" |
| \<tick\>         | true     | object   |      kline data (Start at 00:00(UTC+8) of the day)                |                |
| id             | true     | long     | kline id,the same as kline timestamp   |                |
| amount         | true     | decimal  | Trading Amount(coin), that is (Trading volume(conts)*Face value of a single contract)                     |                |
| ask            | true     | array    | [Sell_1 price; Sell_1 quantity (conts)]                                          |                |
| bid            | true     | array    | [Buy_1 price; Buy_1 quantity (conts)]                                            |                |
| open           | true     | string   | Opening Price                                                       |                |
| close          | true     | string   | Closing price, the price in the last kline is the latest price                     |                |
| count          | true     | decimal  | Filled Order Quantity                                                     |                |
| high           | true     | string   | Highest Price                                                       |                |
| low            | true     | string   | Lowest Price                                                       |                |
| vol            | true     | string   | Trading Volume (conts)，the sum of bilateral (buy & sell) trading volume.                              |                |
| trade_turnover | true     | string  | Tranding Amount，that is the sum of Filled conts of a single order *Contract Face value *Transaction Price           |                |
| ts             | true     | long     | Timestamp                                                     |                |
| \</tick\>        |          |          |                                                              |                |
| ts             | true     | long     | Time of Response Generation, unit: millisecond                                   |                |


## Query the Last Trade of a Contract

###  Example   
                                          
- GET `/option-ex/market/trade`   

```shell
curl "https://api.hbdm.com/option-ex/market/trade?contract_code=BTC-USDT-201225-C-13000"
```
 
###  Request Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------- | -------- | ------ | -------- | ---------------------------- |
| contract_code | false     | string | Contract Code, All swaps default | "BTC-USDT-201225-C-13000" ... |

> Tick Illustration：

```
"tick": {
  "id": Unique Order Id(symbol level),
  "ts": Latest Transaction time,
  "data": [
    {
      "id": Unique Transaction Id(symbol level),
      "price": Transaction price,
      "amount": transaction amount,
      "direction": Active transaction direction,
      "ts": transaction time
    }
  ]
}
```

> Response:

```json


{
    "ch": "market.*.trade.detail",
    "status": "ok",
    "tick": {
        "data": [
            {
                "amount": "2",
                "contract_code": "BTC-USDT-210326-C-20000",
                "direction": "sell",
                "id": 348060000,
                "price": "27000.2",
                "quantity": "0.002",
                "trade_turnover": "54.0004",
                "ts": 1614065387681
            },
            {
                "amount": "2",
                "contract_code": "BTC-USDT-210326-P-20000",
                "direction": "buy",
                "id": 347030000,
                "price": "88",
                "quantity": "0.002",
                "trade_turnover": "0.176",
                "ts": 1613990541997
            }
        ],
        "id": 1614074418045,
        "ts": 1614074418045
    },
    "ts": 1614074418045
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------- | -------- | ------------ | ------------------------------------------------------------ | ------------ |
| ch        | true     | string       | Data belonged channel，Format:  market.$contract_code.trade.detail |              |
| status    | true     | string       |                                                              | "ok","error" |
| \<tick\>    | true     | object       |                                                              |              |
| id        | true     | long         | Unique Order Id(symbol level)                                         |              |
| ts        | true     | long         | Latest Transaction Time                                               |              |
| \<data\>    | true     | object array |                                                              |              |
| amount    | true     | string       | Trading Amount (conts)，the sum of bilateral (buy & sell) trading Amount.                                |              |
| direction | true     | string       | The direction to buy or sell is the direction of the taker (active transaction)     |              |
| id        | true     | long         | Unique Transaction Id(symbol level)                                        |              |
| price     | true     | string       | Transaction Price                                                       |              |
| ts        | true     | long         | Transaction Time                                                   |              |
| quantity     | true | string | trading quantity(coin)       |      |
| contract_code     | true | string | Contract code       |      |
| trade_turnover     | true | string | trading amount(quoted currency)    |      |
| \</data\>   |          |              |                                                              |              |
| \</tick\>   |          |              |                                                              |              |
| ts        | true     | long         | Time of Response Generation                                                    |              |


## Query a Batch of Trade Records of a Contract

###  Example  
                                                            
- GET `/option-ex/market/history/trade`
   
```shell 
curl "https://api.hbdm.com/option-ex/market/history/trade?contract_code=BTC-USDT-201225-C-13000&size=100"
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------- | -------- | -------- | ------------------------- | ---------------------------- |
| contract_code | true     | string   | Contract Code                  | "BTC-USDT-201225-C-13000" ... |
| size          | true    | int      | Quantity of trade records acquisition  | [1, 2000]                    |

> data Illustration：

```
"data": {
  "id": Unique Order Id(symbol level),
  "ts": Latest transaction time,
  "data": [
    {
      "id": Unique Transaction Id(symbol level),
      "price": transaction price,
      "amount": transaction (amount),
      "direction": active transaction direction
      "ts": transaction time
      }
}
```

> Response:

```json

{
    "ch": "market.BTC-USDT-201225-C-13000.trade.detail",
    "data": [
        {
            "data": [
                {
                    "amount": 10,
                    "direction": "sell",
                    "id": 1174421220000,
                    "price": 2406.83,
                    "ts": 1604581920670,
                    "quantity": 0.01,
                    "trade_turnover":24.0683
                }
            ],
            "id": 117442122,
            "ts": 1604581920670
        },
        {
            "data": [
                {
                    "amount": 970,
                    "direction": "buy",
                    "id": 1182841000000,
                    "price": 2821.97,
                    "ts": 1604615035549,
                    "quantity": 0.97,
                    "trade_turnover":216.0683
                },
                {
                    "amount": 98,
                    "direction": "buy",
                    "id": 1182841000001,
                    "price": 2855.11,
                    "ts": 1604615035549,
                    "quantity": 0.098,
                    "trade_turnover":19.0683
                }
            ],
            "id": 118284100,
            "ts": 1604615035549
        }
    ],
    "status": "ok",
    "ts": 1604642481841
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------- | -------- | ------------ | ------------------------------------------------------------ | ------------- |
| ch        | true     | string       | Data belonged channel，Format:  market.$contract_code.trade.detail |               |
| \<data\>    | true     | object array |                                                              |               |
| \<data\>    | true     | object array |                                                              |               |
| amount    | true     | decimal      | Trading Amount (conts)，the sum of bilateral (buy & sell) trading Amount.                                |               |
| direction | true     | string       | The direction to buy or sell is the direction of the taker (active transaction)       |               |
| id        | true     | long         | Unique Transaction Id(symbol level)                                           |               |
| price     | true     | decimal      | Transaction Price                                                    |               |
| ts        | true     | long         | Transaction Time                                                   |               |
| quantity     | true | decimal | trading quantity(coin)       |      |
| trade_turnover     | true | decimal | trading amount(quoted currency)    |      |
| \</data\>   |          |              |                                                              |               |
| id        | true     | long         | Unique Order Id(symbol level)                                          |               |
| ts        | true     | long         | Latest Transaction Time                                               |               |
| \</data\>   |          |              |                                                              |               |
| status    | true     | string       |                                                              | "ok"，"error" |
| ts        | true     | long         | Time of Response Generation, unit: millisecond                                   |               |

#### Notice
- There are "quantity" parameter in return data only after 21:00:00 on February 3, 2021


# Option Account Interface

## Query Asset Valuation

 - POST `/option-api/v1/option_balance_valuation`

### Request Parameter

| Parameter Name          | Mandatory  | Parameter Type     | Description   | Value Range                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| valuation_asset   | false  | string    |    The valuation according to the certain fiat currency. If not fill in, default as BTC    |   "BTC","USD","USDT","CNY","EUR","GBP","VND","HKD","TWD","MYR","SGD","KRW","RUB","TRY"    |


> Response: 

```json
{
    "status": "ok",
    "data": [
        {
            "valuation_asset": "BTC",
            "balance": "0.05402000000000000"
        }
    ],
    "ts": 1614047794160
}
```

### Returning Parameter

| Parameter Name                   | Mandatory | Parameter Type      | Description                 | Value Range                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | the result of server handles for the request             |                                          |
| \<data\> | true     |  object array      |                    |                                          |
| valuation_asset   | true  | string    |    The valuation according to the certain fiat currency   |  "BTC","USD","USDT","CNY","EUR","GBP","VND","HKD","TWD","MYR","SGD","KRW","RUB","TRY"   |
| balance        | true | string |    Asset Valuation       |         |
| \</data\>            |      |         |                    |                                          |
| ts                     | true | long    | timestamp                |                                          |


## Query User’s Account Information

###  Example          
                                      
- POST `/option-api/v1/option_account_info`  

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT"
}
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------ | -------- | ---------------------------------------------------- |
| symbol          | false    | string | Asset symbol | "BTC"，"ETH"，"USDT"，If default, all coins will be returned. |
| trade_partition | false    | string | Trade Partition | "USDT".Default: USDT                                               |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "USDT",
            "margin_balance": 10.45482,
            "margin_position": 0,
            "margin_frozen": 0,
            "margin_available": 10.45482,
            "profit_real": -0.09418,
            "profit_unreal": 0,
            "withdraw_available": 10.45482,
            "margin_static": 10.45482,
            "premium_frozen": 0,
            "fee_frozen": 0,
            "premium_in": 2.85101,
            "premium_out": 0.47879,
            "delta": null,
            "gamma": null,
            "theta": null,
            "vega": null,
            "option_value": 0,
            "trade_partition": "USDT",
            "fee_asset": "USDT",
            "margin_asset": "USDT"
        }
    ],
    "ts": 1604642578467
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------------ | -------- | ------------ | -------------------------- | -------------- |
| status             | true     | string       | Request Processing Result               | "ok" , "error" |
| ts                 | long     | long         | Time of Response Generation, unit: millisecond |                |
| \<data\>             | true     | object array |                            |                |
| symbol             | true     | string       | Asset symbol                   | "BTC","ETH"... |
| trade_partition    | true     | string       | Trade Partition                   | "USDT"         |
| margin_balance     | true     | decimal      | Account Equity                   |                |
| margin_position    | true     | decimal      | Performance Margin                 |                |
| margin_frozen      | true     | decimal      | Frozen Margin              |                |
| margin_available   | true     | decimal      | Available Margin                 |                |
| profit_real        | true     | decimal      | Realized PnL                 |                |
| profit_unreal      | true     | decimal      | Unrealized PnL                 |                |
| withdraw_available | true     | decimal      | Transferable Amount                 |                |
| margin_static      | true     | decimal      | Static Equity                   |                |
| premium_frozen     | true     | decimal      | Frozen Premium                |                |
| fee_frozen         | true     | decimal      | Frozen Transaction Fee                 |                |
| fee_asset          | true     | string       | Transaction Fee Coin                 |                |
| premium_in         | true     | decimal      | Current week premium income            |                |
| premium_out        | true     | decimal      | Current week premium expense            |                |
| delta              | true     | decimal      | DELTA                      |                |
| gamma              | true     | decimal      | GAMMA                      |                |
| theta              | true     | decimal      | THETA                      |                |
| vega               | true     | decimal      | VEGA                       |                |
| option_value       | true     | decimal      | Option Market Value(unit:"USDT")        |                |
| margin_asset       | true     | decimal      | margin asset                  |    "BTC","ETH","USDT"            |
| \</data\>            |          |              |                            |                |



## Query User’s Position Information

###  Example                           
                     
- POST  `/option-api/v1/option_position_info` 

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "contract_code": "BTC-USDT-201225-C-13000"
}
```

### Request Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------ | -------- | --------------------------------------- |
| symbol          | false    | string | Coin Code | "BTC","ETH"，If default, all coins will be returned.|
| trade_partition | false    | string | Trade Partition | "USDT"                                  |
| contract_code   | false    | string | Contract Code | "BTC-USDT-201225-C-13000" ...            |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT-201225-C-13000",
            "contract_type": "quarter",
            "volume": 1,
            "available": 1,
            "frozen": 0,
            "cost_open": 2897.25,
            "cost_hold": 2897.25,
            "profit_unreal": 0,
            "profit_rate": 0,
            "margin_position": 0,
            "position_value": 2.89725,
            "direction": "buy",
            "profit": -0.005,
            "last_price": 2897.25,
            "delivery_date": "20201225",
            "option_right_type": "C",
            "exercise_price": 13000,
            "quote_asset": "USDT",
            "trade_partition": "USDT",
            "margin_asset": "BTC"
        }
    ],
    "ts": 1604888304689
}
```

### Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------------ | -------------------------- | -------------------------------------------------- |
| status            | true     | string       | Request Processing Result               | "ok" , "error"                                     |
| ts                | true     | long         | Time of Response Generation, unit: millisecond |                                                    |
| \<data\>            | true     | object array |                            |                                                    |
| symbol            | true     | string       | Coin Code                   | "BTC","ETH"...                                     |
| trade_partition   | true     | string       | Trade Partition                   | "USDT"                                             |
| contract_code     | true     | string       | Contract Code                   | "BTC-USDT-201225-C-13000" ...                       |
| contract_type     | true     | string       | Contract Type                   | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| volume            | true     | decimal      | Position Quantity                     |                                                    |
| available         | true     | decimal      | Available Close Quantiy                 |                                                    |
| frozen            | true     | decimal      | Frozen Quantity                   |                                                    |
| cost_open         | true     | decimal      | Average open price                   |                                                    |
| cost_hold         | true     | decimal      | Average position price                   |                                                    |
| profit_unreal     | true     | decimal      | Unrealized PnL                 |                                                    |
| profit_rate       | true     | decimal      | Profit Rate                     |                                                    |
| profit            | true     | decimal      | Profit                       |                                                    |
| margin_position   | true     | decimal      | Performance Margin                 |                                                    |
| position_value    | true     | decimal      | Position Value                   |                                                    |
| direction         | true     | string       | "buy": Buy "sell": Sell         |                                                    |
| last_price        | true     | decimal      | Latest Price                     |                                                    |
| delivery_date     | true     | string       | Delivery Date                     | eg"20200508"                                       |
| option_right_type | true     | string       | Options Type              | C:Call options P:Put options                              |
| exercise_price    | true     | decimal      | Strike Price                    |                                                    |
| quote_asset       | true     | string       | Quote Coin                   | "USDT"...                                          |
| margin_asset      | true     | string       | Margin Coin                | "BTC"...                                           |
| \</data\>           |          |              |                            |                                                    |



## Set a Batch of Sub-Account Trading Permissions

 - POST `/option-api/v1/option_sub_auth`

### Request Parameter

| Parameter Name          | Mandatory  | Type     | Description   | Value Range                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| sub_uid | true  | string | sub-account uid (multiple uids are separated by ",", and one time 10 sub uid at most)	    |                                          |
| sub_auth | true  | int |  sub auth, 1:enable, 0:disable	    |                                          |

#### Note:
- When enable the transaction authority on the sub-account for the first time, deemed to agree to access the contract market.
- If the sub-account trading permission has been enable, the interface will directly return success when request to enable again; if the sub-account trading permission has been disable, the interface will directly return success when request to disable again;

> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "sub_uid": "122343",
                "err_code": 1010,
                "err_msg": "Account doesn't exist."
            }
        ],
        "successes": "123456789"
    },
    "ts": 1612509171791
}    
```

### Returning Parameter

| Parameter Name                   | Mandatory | Type     | Description                                 | Value Range           |
| ---------------------- | ---- | ------ | ---------------------------------- | -------------- |
| status                 | true | string | the result of server handling to request                             | "ok" , "error" |
| \<data\>            |  true    |        |                                    |                |
| \<errors\>            |  true    | object array       |                                    |                |
| sub_uid               | true | string | the list of sub uid which failed                            |                |
| err_code               | true | int    | error code                                |                |
| err_msg                | true | string | error msg                               |                |
| \</errors\>              |      |        |                                    |                |
| successes              | true | string | he list of sub uid which successes |                |
| \</data\>              |      |        |                                    |                |
| ts                     | true | long   | Time of Respond Generation，Unit：Millisecond                      |                |


## Query assets information of all sub-accounts under the master account

- POST `/option-api/v1/option_sub_account_list`

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT"
}
```

### Request Parameters

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------ | ------------ | ------------------------------------------------ |
| symbol          | false    | string | Coin Code | "BTC"，"ETH"，“USDT，If default, all coins will be returned.|
| trade_partition | false    | string | Trade Partition     | "USDT"                                           |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "sub_uid": 123456789,
            "list": [
                {
                    "symbol": "USDT",
                    "margin_balance": 10,
                    "trade_partition": "USDT"
                },
                {
                    "symbol": "BTC",
                    "margin_balance": 0,
                    "trade_partition": "USDT"
                },
                {
                    "symbol": "ETH",
                    "margin_balance": 0,
                    "trade_partition": "USDT"
                }
            ]
        }
    ],
    "ts": 1604888581799
}
```

### Return parameters
 
| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------------ | -------------------------- | -------------- |
| status          | true     | string       | Request Processing Result               | "ok" , "error" |
| ts              | true     | long         | Time of Response Generation, unit: millisecond |                |
| \<data\>          | true     | object array |                            |                |
| sub_uid         | true     | long         | Sub-account UID                 |                |
| \<list\>          | true     | object array |                            |                |
| symbol          | true     | string       | Coin Code               | "BTC","ETH"... |
| trade_partition | true     | string       | Trade Partition                   | "USDT"         |
| margin_balance  | true     | decimal      | Account Equity                   |                |
| \</list\>         |          |              |                            |                |
| \</data\>         |          |              |                            |                |


### Note

 - Only data of sub-accounts with contract trading opened will be returned.



## Query a Batch of Sub-Account's Assets Information

 - POST `/option-api/v1/option_sub_account_info_list`

### Request Parameter
| Parameter Name   | Mandatory  | Type     | Description   |  Value Range       |
| ------ | ----- | ------ |  ---- | ------------------------------ |
| symbol   | false    | string | symbol | "BTC"，"ETH"，“USDT”，if not filled in return all       |
| trade_partition | false  | string | trade partition, if not filled in as ”USDT“ | "USDT"                                 |
| page_index  | false | int    | page index, if not filled in as 1st            |                                          |
| page_size   | false | int    | if not filled in as 20，50 at most          |                                          |

#### Note:
- Only return data of sub-accounts that have agreed to access the contract market.
- By default, the list of sub-accounts is in ascending order according to the time when agree to access the contract market, and the earlier the agreed time, the first the position

> Response:

```json
{
    "status": "ok",
    "data": {
        "total_page": 1,
        "current_page": 1,
        "total_size": 1,
        "sub_list": [
            {
                "sub_uid": 123456789,
                "account_info_list": [
                    {
                        "symbol": "BTC",
                        "margin_balance": 0,
                        "trade_partition": "USDT"
                    }
                ]
            }
        ]
    },
    "ts": 1612509268854
}
  
```

### Returning Parameter

| Parameter Name  | Mandatory | Type      | Description     | Value Range           |
| ----------------- | ---- | ------- | ------------- | -------------- |
| status                | true | string  | the result of server handling to request        | "ok" , "error"                           |
| ts                    | true | long    | Time of Respond Generation，Unit：Millisecond |                                          |
| \<data\>              | true    |  object       |           |                                          |
| \<sub_list\>  | true     |  object array       |               |                                          |
| sub_uid           | true | long    | sub uid        |                |
| \<account_info_list\>          |   true   |  object array       |               |                |
| symbol            | true     | string       | symbol                   | "BTC","ETH","USDT"... |
| trade_partition   | true     | string       | trade partition                   | "USDT"         |
| margin_balance    | true     | decimal      | margin balance                   |                |
| \</account_info_list\>         |      |         |               |                |
| \</sub_list\> |     |         |               |                                          |
| current_page          | true | int     | current page           |                                          |
| total_page            | true | int     | total page           |                                          |
| total_size            | true | int     | total size           |                                          |
| \</data\>             |      |         |      |     |


## Query a single sub-account's assets information

- POST `/option-api/v1/option_sub_account_info`

> Request:

```json
{
  "sub_uid": "123456789",
  "symbol": "BTC",
  "trade_partition": "USDT"
}
```

### Request Parameters

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------ | ------------ | ---------------------------------------------- |
| symbol          | false    | string | Coin Code | "BTC","ETH","USDT"，If default, all coins will be returned.|
| trade_partition | false    | string | Trade Partition     | "USDT"                                         |
| sub_uid         | true     | string | Sub-account UID  |                                                |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "USDT",
            "margin_balance": 10,
            "margin_position": 0,
            "margin_frozen": 0,
            "margin_available": 10,
            "profit_real": 0,
            "profit_unreal": 0,
            "withdraw_available": 10,
            "margin_static": 10,
            "premium_frozen": 0,
            "fee_frozen": 0,
            "premium_in": 0,
            "premium_out": 0,
            "delta": null,
            "gamma": null,
            "theta": null,
            "vega": null,
            "option_value": 0,
            "trade_partition": "USDT",
            "fee_asset": "USDT",
            "margin_asset": "USDT"
        }
    ],
    "ts": 1604888673495
}
```

### Return parameters

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------------ | -------- | ------------ | -------------------------- | -------------- |
| status             | true     | string       | Request Processing Result               | "ok" , "error" |
| ts                 | true     | long         | Time of Response Generation, unit: millisecond |                |
| \<data\>             | true     | object array |                            |                |
| symbol             | true     | string       | Coin Code               | "BTC","ETH"... |
| trade_partition    | true     | string       | Trade Partition                   | "USDT"         |
| margin_balance     | true     | decimal      | Account Equity                   |                |
| margin_position    | true     | decimal      | Performance Margin                 |                |
| margin_frozen      | true     | decimal      | Frozen Margin              |                |
| margin_available   | true     | decimal      | Available Margin                 |                |
| profit_real        | true     | decimal      | Realized PnL                 |                |
| profit_unreal      | true     | decimal      | Unrealized PnL                 |                |
| withdraw_available | true     | decimal      | Transferable Amount                 |                |
| margin_static      | true     | decimal      | Static Equity                   |                |
| premium_frozen     | true     | decimal      | Frozen Premium                |                |
| fee_frozen         | true     | decimal      | Frozen Transaction Fee                 |                |
| fee_asset          | true     | string       | Transaction Fee Coin                 |                |
| premium_in         | true     | decimal      | Current week premium income             |                |
| premium_out        | true     | decimal      | Current week premium expense            |                |
| delta              | true     | decimal      | DELTA                      |                |
| gamma              | true     | decimal      | GAMMA                      |                |
| theta              | true     | decimal      | THETA                      |                |
| vega               | true     | decimal      | VEGA                       |                |
| option_value       | true     | decimal      | Option Market Value(unit:"USDT")                  |                |
| margin_asset       | true     | decimal      | Margin Coin."BTC"                   |                |
| \</data\>            |          |              |                            |                |

### Notice

  - Can only query information of sub-accounts with contract trading opened;

  - The corresponding data will not be returned if the sub-account has visited the contract system but has not opened contract trading.


## Query a single sub-account's position information

- POST `/option-api/v1/option_sub_position_info`

> Request:

```json
{
  "sub_uid": "123456789",
  "symbol": "BTC",
  "trade_partition": "USDT",
  "contract_code": "BTC-USDT-201225-C-13000"
}
```

### Request Parameters

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------ | ----------- | --------------------------------------- |
| symbol          | false    | string | Coin Code    | "BTC","ETH"，If default, all coins will be returned.|
| trade_partition | false    | string | Trade Partition    | "USDT"                                  |
| contract_code   | false    | string | Contract Code    | eg"BTC-USDT-201225-C-13000" ...          |
| sub_uid         | true     | string | Sub-account UID |                                         |

> Response:

```json

{
    "data":[
        {
            "symbol":"BTC",
            "trade_partition":"USDT",
            "contract_code":"BTC-USDT-201225-C-13000",
            "contract_type":"quarter",
            "volume":1,
            "available":1,
            "frozen":0,
            "cost_open":7503,
            "cost_hold":7503,
            "profit_unreal":-4.442,
            "profit_rate":-0.00666622225185016,
            "profit":-4.442,
            "margin_position":0.000666622225184987,
            "position_value":5.49,
            "direction":"buy",
            "last_price":7500.5,
            "delivery_date":"20200508",
            "option_right_type":"C",
            "exercise_price":3500,
            "quote_asset":"USDT",
            "margin_asset":"BTC"
        }
    ],
    "status":"ok",
    "ts":1590047279305
}
```

### Return parameters

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------------ | -------------------------- | -------------------------------------------------- |
| status            | true     | string       | Request Processing Result               | "ok" , "error"                                     |
| ts                | true     | long         | Time of Response Generation, unit: millisecond |                                                    |
| \<data\>            | true     | object array |                            |                                                    |
| symbol            | true     | string       | Coin Code                   | "BTC","ETH"...                                     |
| trade_partition   | true     | string       | Trade Partition                   | "USDT"                                             |
| contract_code     | true     | string       | Contract Code                   | "BTC-USDT-201225-C-13000" ...                       |
| contract_type     | true     | string       | Contract Type                   | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| volume            | true     | decimal      | Position Quantity                     |                                                    |
| available         | true     | decimal      | Available Close Quantity                 |                                                    |
| frozen            | true     | decimal      | Frozen Quantity                   |                                                    |
| cost_open         | true     | decimal      | Average open price                   |                                                    |
| cost_hold         | true     | decimal      | Average position price                   |                                                    |
| profit_unreal     | true     | decimal      | Unrealized PnL                 |                                                    |
| profit_rate       | true     | decimal      | Profit Rate                     |                                                    |
| profit            | true     | decimal      | Profit                       |                                                    |
| margin_position   | true     | decimal      | Performance Margin                 |                                                    |
| position_value    | true     | decimal      | Position Value                   |                                                    |
| direction         | true     | string       | Position Direction                   | "buy": long "sell": sell                                 |
| last_price        | true     | decimal      | Latest Price                     |                                                    |
| delivery_date     | true     | string       | Delivery Date                     | eg"20200508"                                       |
| option_right_type | true     | string       | Options Type              | C: Call options P: Put options                              |
| exercise_price    | true     | decimal      | Strike Price                    |                                                    |
| quote_asset       | true     | string       | Quote Coin                   | "USDT"...                                          |
| margin_asset      | true     | string       | Margin Coin                | "BTC"...                                           |
| \</data\>           |          |              |                            |                                                    |


## Query account financial records

- POST `/option-api/v1/option_financial_record`

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT"
}
```

### Request Parameters

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------ | ------------------------------------------- | ------------------------------------------------------------ |
| symbol          | true     | string | Coin Code  <img width=1000/>                     | "BTC","ETH"...                                               |
| trade_partition | false    | string | Trade Partition                                    | "USDT"                                                       |
| type            | false    | string | Query all type if not filled,【Separate with commas if querying multiple types】 | 1:open long; 2:open short; 3:close long; 4:close short; 5:fees for open positions-taker; 6:fees for open positions-maker; 7:fees for close positions-taker; 8:fees for close positions-maker; 9:close long for delivery; 10:close short for delivery; 11:delivery fee; 12:close long for liquidation; 13:lose short for liquidation; 14:transfer from spot exchange to contract exchange; 15:tranfer from contract exchange to spot exchange; 16:settle unrealized PnL-long positions; 17:settle unrealized PnL-short positions; 19:clawback; 26:system; 28:activity prize rewards; 29:rebate; 34:transfer to sub; 35:transfer from sub; 36:transfer to master; 37:transfer from master; |
| create_date     | false    | int    | Enter a positive integer; if the parameter exceeds 90, a default 90 days' data will be queried.    |                                                              |
| page_index      | false    | int    | Page number. Default page 1 if not filled                       |                                                              |
| page_size       | false    | int    | default 20 if not filled; no more than 50                     |                                                              |

> Response:

```json

{
    "status": "ok",
    "data": {
        "total_page": 1,
        "current_page": 1,
        "total_size": 9,
        "financial_record": [
            {
                "id": 321223,
                "symbol": "USDT",
                "contract_code": "",
                "type": 34,
                "amount": -10,
                "ts": 1604888539807,
                "trade_partition": "USDT"
            },
            {
                "id": 321222,
                "symbol": "USDT",
                "contract_code": "",
                "type": 14,
                "amount": 10,
                "ts": 1604888516515,
                "trade_partition": "USDT"
            }
        ]
    },
    "ts": 1604888841800
}
```


### Return parameters

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------------- | -------- | ------------ | -------------------------- | ------------------------------------------------------------ |
| status              | true     | string       | Request Processing Result              | "ok" , "error"                                               |
| ts                  | true     | long         | Time of Response Generation, unit: millisecond |                                                              |
| \<data\>              | true     | object       | Dictionary Type                   |                                                              |
| \<financial_record\>  | true     | object array |                            |                                                              |
| id                  | true     | long         | Financial record ID (contract code unqiue)         |                                                              |
| ts                  | true     | long         | Create Time                   |                                                              |
| symbol              | true     | string       | Coin Code                   | "BTC","ETH"...                                               |
| trade_partition     | true     | string       | Trade Partition                   | "USDT"                                                       |
| contract_code       | true     | string       | Contract Code                   | "BTC-USDT-201225-C-13000"， ...                               |
| type                | true     | int          | TradeType                   |  1:open long; 2:open short; 3:close long; 4:close short; 5:fees for open positions-taker; 6:fees for open positions-maker; 7:fees for close positions-taker; 8:fees for close positions-maker; 9:close long for delivery; 10:close short for delivery; 11:delivery fee; 12:close long for liquidation; 13:lose short for liquidation; 14:transfer from spot exchange to contract exchange; 15:tranfer from contract exchange to spot exchange; 16:settle unrealized PnL-long positions; 17:settle unrealized PnL-short positions; 19:clawback; 26:system; 28:activity prize rewards; 29:rebate; 34:transfer to sub; 35:transfer from sub; 36:transfer to master; 37:transfer from master; |
| amount              | true     | decimal      | Amount                       |                                                              |
| \</financial_record\> |          |              |                            |                                                              |
| current_page        | true     | int          | Current Page                     |                                                              |
| total_page          | true     | int          | Total Pages                    |                                                              |
| total_size          | true     | int          | Total Size                    |                                                              |
| \</data\>             |          |              |                            |                                                              |

## Query Option information on order limit

- POST `/option-api/v1/option_order_limit`

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "order_price_type": "ioc"
}
```

### Request Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ---------------- | -------- | ------ | ------------ | ------------------------------------------------------------ |
| symbol           | false    | string | Coin Code  <img width=1000/>   | "BTC","ETH"，If default, all coins will be returned.                     |
| trade_partition  | false    | string | Trade Partition     | "USDT"                                                       |
| order_price_type | true     | string | Order Type | "limit":Limit，"opponent": BBO，"lightning": Flash close，"optimal_5": Optimal 5，"optimal_10": Optimal 10，"optimal_20": Optimal 20，"fok": FOK Order，"ioc": IOC Order, "opponent_ioc": BBO-IOC，"lightning_ioc": Flash close-IOC，"optimal_5_ioc": Optimal 5-IOC，"optimal_10_ioc": Optimal 10-IOC，"optimal_20_ioc": Optimal 20-IOC，"opponent_fok":  FOK order using BBO price，"lightning_fok": Flash close-FOK，"optimal_5_fok": Optimal 5-FOK，"optimal_10_fok": Optimal 10-FOK，"optimal_20_fok": Optimal 20-FOK |

> Response:

```json

{
    "status": "ok",
    "data": {
        "order_price_type": "limit",
        "list": [
            {
                "symbol": "BTC",
                "types": [
                    {
                        "contract_type": "this_week",
                        "option_right_type": "C",
                        "open_limit": 100000,
                        "close_limit": 200000
                    },
                    {
                        "contract_type": "this_week",
                        "option_right_type": "P",
                        "open_limit": 100000,
                        "close_limit": 200000
                    },
                    {
                        "contract_type": "next_week",
                        "option_right_type": "C",
                        "open_limit": 100000,
                        "close_limit": 200000
                    },
                    {
                        "contract_type": "next_week",
                        "option_right_type": "P",
                        "open_limit": 100000,
                        "close_limit": 200000
                    },
                    {
                        "contract_type": "quarter",
                        "option_right_type": "C",
                        "open_limit": 100000,
                        "close_limit": 200000
                    },
                    {
                        "contract_type": "quarter",
                        "option_right_type": "P",
                        "open_limit": 100000,
                        "close_limit": 200000
                    }
                ],
                "trade_partition": "USDT"
            }
        ]
    },
    "ts": 1604888933651
}
```

### Returning Parameter 

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------------ | -------------------------- | ------------------------------------------------------------ |
| status            | true     | string       | Request Processing Result   <img width=1000/>        | "ok" , "error"                                               |
| ts                | true     | long         | Time of Response Generation, unit: millisecond |                                                              |
| \<data\>            | true     | object       |                            |                                                              |
| order_price_type  | true     | string       | OrderType               | "limit": Limit Order，"opponent": BBO，"lightning": Flash close，"optimal_5": Optimal 5，"optimal_10": Optimal 10，"optimal_20": Optimal 20，"fok": FOKOrder，"ioc": IOC Order, "opponent_ioc": BBO-IOC，"lightning_ioc": Flash close-IOC，"optimal_5_ioc": Optimal 5-IOC，"optimal_10_ioc": Optimal 10-IOC，"optimal_20_ioc": Optimal 20-IOC，"opponent_fok":  FOK order using BBO price，"lightning_fok": Flash close-FOK，"optimal_5_fok": Optimal 5-FOK，"optimal_10_fok": Optimal 10-FOK，"optimal_20_fok": Optimal 20-FOK |
| \<list\>            | true     | object array |                            |                                                              |
| symbol            | true     | string       | Coin Code                   | "BTC","ETH"...                                               |
| trade_partition   | true     | string       | Trade Partition                   | "USDT"                                                       |
| \<types\>           | true     | object array |                            |                                                              |
| contract_type     | true     | string       | Contract Type                   | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter"           |
| option_right_type | true     | string       | Options Type               | C: Call options P: Put options                                        |
| open_limit        | true     | long         | Max positions to open for a single order   |                                                              |
| close_limit       | true     | long         | Max positions to close for a single order  |                                                              |
| \</types\>          |          |              |                            |                                                              |
| \</list\>           |          |              |                            |                                                              |
| \</data\>           |          |              |                            |                                                              |


## Query information on option trading fee

- POST `/option-api/v1/option_fee`

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT"
}
```

### Request Parameter 

| Parameter Name        | Mandatory | Type   | Desc     | Value Range                                |
| --------------- | -------- | ------ | -------- | --------------------------------------- |
| symbol          | false    | string | Coin Code | "BTC","ETH"，If default, all coins will be returned.|
| trade_partition | false    | string | Trade Partition | "USDT"                                  |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "open_maker_fee": "0.002",
            "open_taker_fee": "0.005",
            "close_maker_fee": "0.002",
            "close_taker_fee": "0.005",
            "fee_rate_type": 2,
            "max_trade_in_fee_rate": "0.125",
            "max_trade_out_fee_rate": "0.08",
            "call_delivery_fee": "0.002",
            "put_delivery_fee": "0.002",
            "max_delivery_fee_rate": "0.125",
            "trade_partition": "USDT",
            "fee_asset": "USDT"
        }
    ],
    "ts": 1604888987136
}
```

### Returning Parameter 

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ---------------------- | -------- | ------------ | ------------------------------------------------------------ | -------------- |
| status                 | true     | string       | Request Processing Result                                                 | "ok" , "error" |
| ts                     | true     | long         | Time of Response Generation, unit: millisecond                                   |                |
| \<data\>                 | true     | object array |                                                              |                |
| symbol                 | true     | string       | Asset variety                                                    | "BTC","ETH"，"USDT"... |
| trade_partition        | true     | string       | Trade Partition                                                     | "USDT"         |
| fee_asset              | true     | string       | Transaction Fee coin                                                   |                |
| open_maker_fee         | true     | string       | Maker Transaction Fee/Fee Rate for opening positions, decimal format                          |                |
| open_taker_fee         | true     | string       | Taker Transaction Fee/Fee Rate for opening positions, decimal format                         |                |
| close_maker_fee        | true     | string       | Close Maker Transaction Fee/Fee Rate for closing positions, decimal format                         |                |
| close_taker_fee        | true     | string       | Close Taker Transaction Fee/Fee Rate for closing positions, decimal format                         |                |
| call_delivery_fee      | true     | string       | Call Option Delivery Transaction Fee/Fee Rate, decimal format                      |                |
| put_delivery_fee       | true     | string       | Put Option Delivery Transaction Fee/Fee Rate, decimal format                      |                |
| fee_rate_type          | true     | int          | Fee rate type 1: relative fee, 2: absolute fee（relative fee uses transaction fee rate; absolute fee uses transaction fee, unit: USDT） |                |
| max_trade_in_fee_rate  | true     | string       | Platform transaction fee charging upper limit (ratio), decimal format                       |                |
| max_trade_out_fee_rate | true     | string       | Platform transaction fee expense upper limit (ratio), decimal format                       |                |
| max_deliv_fee_rate     | true     | string       | Delivery transaction fee upper limit (ratio), decimal format                            |                |
| \</data\>                |          |              |                                                              |                |


## Query information on Transfer Limit

- POST `/option-api/v1/option_transfer_limit`

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT"
}
```

### Request Parameter 

| Parameter Name        | Mandatory | Type   | Desc     | Value Range                                |
| --------------- | -------- | ------ | -------- | --------------------------------------- |
| symbol          | false    | string | Coin Code | "BTC","ETH"，If default, all coins will be returned.|
| trade_partition | false    | string | Trade Partition | "USDT"                                  |


> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "transfer_in_max_each": 8000,
            "transfer_in_min_each": 0.0001,
            "transfer_out_max_each": 800,
            "transfer_out_min_each": 0.000001,
            "transfer_in_max_daily": 80000,
            "transfer_out_max_daily": 16000,
            "net_transfer_in_max_daily": 40000,
            "net_transfer_out_max_daily": 8000,
            "trade_partition": "USDT"
        }
    ],
    "ts": 1604889046636
}
```

### Returning Parameter 

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| -------------------------- | -------- | ------------ | -------------------------- | -------------- |
| status                     | true     | string       | Request Processing Result               | "ok" , "error" |
| ts                         | true     | long         | Time of Response Generation, unit: millisecond |                |
| \<data\>                     | true     | object array |                            |                |
| symbol                     | true     | string       | Coin Code                   | "BTC","ETH"... |
| trade_partition            | true     | string       | Trade Partition                   | "USDT"         |
| transfer_in_max_each       | true     | decimal      | Max amount of a single transfer_in             |                |
| transfer_in_min_each       | true     | decimal      | Min amount of a single transfer_in          |                |
| transfer_out_max_each      | true     | decimal      | Max amount of a single transfer_out          |                |
| transfer_out_min_each      | true     | decimal      | Min amount of a single transfer_out         |                |
| transfer_in_max_daily      | true     | decimal      | Max amount of daily cumulative transfer_in        |                |
| transfer_out_max_daily     | true     | decimal      | Max amount of daily cumulative transfer_out        |                |
| net_transfer_in_max_daily  | true     | decimal      | Max amount of daily cumulative net transfer_in      |                |
| net_transfer_out_max_daily | true     | decimal      | Max amount of daily cumulative net transfer_out     |                |
| \</data\>                    |          |              |                            |                |

##  Query information on position limit

- POST `/option-api/v1/option_position_limit`

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT"
}
```

### Request Parameter 

| Parameter Name        | Mandatory | Type   | Desc     | Value Range                                |
| --------------- | -------- | ------ | -------- | --------------------------------------- |
| symbol          | false    | string | Coin Code | "BTC","ETH"，If default, all coins will be returned.|
| trade_partition | false    | string | Trade Partition | "USDT"                                  |

> Response:


```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "list": [
                {
                    "contract_type": "this_week",
                    "option_right_type": "C",
                    "buy_limit": 1000000,
                    "sell_limit": 1000000
                },
                {
                    "contract_type": "this_week",
                    "option_right_type": "P",
                    "buy_limit": 1000000,
                    "sell_limit": 1000000
                },
                {
                    "contract_type": "next_week",
                    "option_right_type": "C",
                    "buy_limit": 1000000,
                    "sell_limit": 1000000
                },
                {
                    "contract_type": "next_week",
                    "option_right_type": "P",
                    "buy_limit": 1000000,
                    "sell_limit": 1000000
                },
                {
                    "contract_type": "quarter",
                    "option_right_type": "C",
                    "buy_limit": 1000000,
                    "sell_limit": 1000000
                },
                {
                    "contract_type": "quarter",
                    "option_right_type": "P",
                    "buy_limit": 1000000,
                    "sell_limit": 1000000
                },
                {
                    "contract_type": "all",
                    "option_right_type": "C",
                    "buy_limit": 3000000,
                    "sell_limit": 3000000
                },
                {
                    "contract_type": "all",
                    "option_right_type": "P",
                    "buy_limit": 3000000,
                    "sell_limit": 3000000
                }
            ],
            "trade_partition": "USDT"
        }
    ],
    "ts": 1604889079265
}
```

### Returning Parameter 

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------------ | ------------------------------ | ------------------------------------------------------------ |
| status            | true     | string       | Request Processing Result                   | "ok" , "error"                                               |
| ts                | true     | long         | Time of Response Generation, unit: millisecond     |                                                              |
| \<data\>            | true     | object array |                                |                                                              |
| symbol            | true     | string       | Coin Code                       | "BTC","ETH"...                                               |
| trade_partition   | true     | string       | Trade Partition                       | "USDT"                                                       |
| \<list\>            | true     | object array |                                |                                                              |
| option_right_type | true     | string       | Options Type                   | C-Call，P-Put                                    |
| contract_type     | true     | string       | Contract Type                       | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter"，All Contracts:“all” |
| buy_limit         | true     | decimal      | Max long position limit, unit: cont |                                                              |
| sell_limit        | true     | decimal      | Max short position limit, unit: cont |                                                              |
| \</list\>           |          |              |                                |                                                              |
| \</data\>           |          |              |                                |                                                              |



## Query account and position info

- post `option-api/v1/option_account_position_info`

>Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT"
}
```

### Request Parameter 

| Parameter Name        | Mandatory | Type   | Desc         | Value Range       |
| --------------- | -------- | ------ | ------------ | -------------- |
| symbol          | true     | string | Coin Code | "BTC","ETH"... |
| trade_partition | false    | string | Trade Partition     | "USDT"         |


### Note：
  -  If request BTC asset, BTC asset info and all positions info of BTC options will be returned; if request USDT asset, only USDT asset info will be returned and no positions info will be returned. 
  

>Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "USDT",
            "margin_balance": 10.44982,
            "margin_position": 0,
            "margin_frozen": 0,
            "margin_available": 7.55257,
            "profit_real": -0.005,
            "profit_unreal": 0,
            "withdraw_available": 7.55257,
            "margin_static": 7.55257,
            "premium_frozen": 0,
            "fee_frozen": 0,
            "premium_in": 0,
            "premium_out": 2.89725,
            "delta": null,
            "gamma": null,
            "theta": null,
            "vega": null,
            "option_value": 2.89725,
            "trade_partition": "USDT",
            "fee_asset": "USDT",
            "margin_asset": "USDT",
            "positions": [
                {
                    "symbol": "BTC",
                    "contract_code": "BTC-USDT-201225-C-13000",
                    "contract_type": "quarter",
                    "volume": 1,
                    "available": 1,
                    "frozen": 0,
                    "cost_open": 2897.25,
                    "cost_hold": 2897.25,
                    "profit_unreal": 0,
                    "profit_rate": 0,
                    "margin_position": 0,
                    "position_value": 2.89725,
                    "direction": "buy",
                    "profit": -0.005,
                    "last_price": 2897.25,
                    "delivery_date": "20201225",
                    "option_right_type": "C",
                    "exercise_price": 13000,
                    "quote_asset": "USDT",
                    "trade_partition": "USDT",
                    "margin_asset": "BTC"
                }
            ]
        }
    ],
    "ts": 1604889122270
}
```

### Returning Parameter 

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------------ | -------- | ------------ | -------------------------- | -------------------------------------------------- |
| status             | true     | string       | Request Processing Result               | "ok" , "error"                                     |
| ts                 | long     | long         | Time of Response Generation, unit: millisecond |                                                    |
| \<data\>             | true     | object array |                            |                                                    |
| symbol             | true     | string       | Coin Code               | "BTC","ETH"...                                     |
| trade_partition    | true     | string       | Trade Partition                   | "USDT"                                             |
| margin_balance     | true     | decimal      | Account Equity                   |                                                    |
| margin_position    | true     | decimal      | Performance Margin                 |                                                    |
| margin_frozen      | true     | decimal      | Frozen Margin              |                                                    |
| margin_asset      | true     | decimal      | Margin Asset              |                                                    |
| margin_available   | true     | decimal      | Available Margin                 |                                                    |
| profit_real        | true     | decimal      | Realized PnL                 |                                                    |
| profit_unreal      | true     | decimal      | Unrealized PnL                 |                                                    |
| withdraw_available | true     | decimal      | Transferable Amount                 |                                                    |
| margin_static      | true     | decimal      | Static Equity                   |                                                    |
| premium_frozen     | true     | decimal      | Frozen Premium                |                                                    |
| fee_frozen         | true     | decimal      | Frozen Transaction Fee                 |                                                    |
| fee_asset          | true     | string       | Transaction Fee coin                 |                                                    |
| premium_in         | true     | decimal      | Current week premium income            |                                                    |
| premium_out        | true     | decimal      |Current week premium expense            |                                                    |
| delta              | true     | decimal      | DELTA                      |                                                    |
| gamma              | true     | decimal      | GAMMA                      |                                                    |
| theta              | true     | decimal      | THETA                      |                                                    |
| vega               | true     | decimal      | VEGA                       |                                                    |
| option_value       | true     | decimal      | Option Market Value(unit:"USDT")          |                                                    |
| \<positions\>        | true     | object array |                            |                                                    |
| symbol             | true     | string       | Coin Code                   | "BTC","ETH"...                                     |
| trade_partition    | true     | string       | Trade Partition                   | "USDT"                                             |
| contract_code      | true     | string       | Contract Code                   | "BTC-USDT-201225-C-13000"                           |
| contract_type      | true     | string       | Contract Type                   | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| volume             | true     | decimal      | Position Quantity                     |                                                    |
| available          | true     | decimal      | Available Close Quantity                 |                                                    |
| frozen             | true     | decimal      | Frozen Quantity                   |                                                    |
| cost_open          | true     | decimal      | Average open price                   |                                                    |
| cost_hold          | true     | decimal      | Average position price                   |                                                    |
| profit_unreal      | true     | decimal      | Unrealized PnL                 |                                                    |
| profit_rate        | true     | decimal      | Profit Rate                     |                                                    |
| profit             | true     | decimal      | Profit                       |                                                    |
| margin_position    | true     | decimal      | Performance Margin                 |                                                    |
| position_value     | true     | decimal      | Position Value                   |                                                    |
| direction          | true     | string       | "buy":Buy "sell":Sell         |                                                    |
| last_price         | true     | decimal      | Latest Price                     |                                                    |
| delivery_date      | true     | string       | Delivery Date                     | eg"20200508"                                       |
| option_right_type  | true     | string       | Options Type              | C:Call options P:Put options                              |
| exercise_price     | true     | decimal      | Strike Price                    |                                                    |
| quote_asset        | true     | string       | Quote Coin                   | "USDT"...                                          |
| margin_asset       | true     | string       | Margin Coin                | "BTC"...                                           |
| \</positions\>       |          |              |                            |                                                    |
| \</data\>            |          |              |                            |                                                    |

### Note：

- The market value of options under USDT assets is the value of all options held in the USDT partition;the market value of options under BTC assets is the value of positions of BTC options;the market value of options under ETH assets is the value of positions of ETH options.


## Transfer between master and sub account

- post `/option-api/v1/option_master_sub_transfer`

> Request:

```json
{
  "sub_uid": "123456789",
  "symbol": "BTC",
  "trade_partition": "USDT",
  "amount": "123",
  "type": "master_to_sub"
}
```

### 请求参数

| Parameter Name        | Mandatory | Type    | Desc      | Value Range                                                     |
| --------------- | -------- | ------- | --------- | ------------------------------------------------------------ |
| sub_uid         | true     | long    | Sub-accountuid |                                                              |
| symbol          | true     | string  | Coin Code  | "BTC","ETH"...                                               |
| trade_partition | true     | string  | Trade Partition  | "USDT"                                                       |
| amount          | true     | decimal | Transfer Amount  |                                                              |
| type            | true     | string  | Transfer Type  | master_to_sub: transfer from master account to sub-account， sub_to_master: transfer from sub-account to master account |
| client_order_id | false | long | Clients fill and maintain themselves. | must be Less or Equal than 9223372036854775807 |

### Note：
 - the rate limit between the master account and each subaccount is 10 times/ minute
 - The client_order_id is valid in 8 hours only, that is the user cannot use the same client_order_id beyonds one times for the same transfer path (for example, transfer currency from master account to sub-account using client_order_id=1, and you can't do that transfe currency from master account to sub-account using client_order_id=1 in the next time; but you can 
   transfer currency from sub-account to  master account using client_order_id=1).

> Response:

```json


{
    "status": "ok",
    "data": {
        "order_id": "775309101143093248"
    },
    "ts": 1604889694272
}
```

### response

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| -------- | -------- | ------ | -------------------------- | -------------- |
| status   | true     | string | Request Processing Result               | "ok" , "error" |
| ts       | true     | long   | Time of Response Generation, unit: millisecond |                |
| \<data\>   | true     | object |                            |                |
| order_id | true     | long   | Transfer Order ID                 |                |
| client_order_id | false | long | the client ID that is filled in when the order is placed, if it’s not filled, it won’t be returned		| 
| \</data\>  |          |        |                            |                |

## Query transfer records between master and sub account

- post `/option-api/v1/option_master_sub_transfer_record`

> Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "transfer_type": "34",
  "create_date": 7
}
```

### Request Parameter

| Parameter Name        | Mandatory | Type   | Desc                                                  | Value Range                                             |
| --------------- | -------- | ------ | ----------------------------------------------------- | ---------------------------------------------------- |
| symbol          | true     | string | Coin Code                                          | "BTC","ETH"...                                       |
| trade_partition | false    | string | Trade Partition                                              | "USDT"                                               |
| transfer_type   | false    | string | Transfer Type. Query all types if not filled【seperate with comma if querying several types】 | 34: Transfer out to sub-account derivative account 35: Transfer in from sub-account derivative account     |
| create_date     | true     | int    | Date                                                  | Enter a positive integer; if the parameter exceeds 90, query 90 days' data by default. |
| page_index      | false    | int    | Page number, default page 1 if not filled                                   | 1                                                    |
| page_size       | false    | int    |  Default 20 if not filled; no more than 50                              | 20                                                   |

> Response:

```json


{
    "status":"ok",
    "data":{
        "total_page":1,
        "current_page":1,
        "total_size":4,
        "transfer_record":[
            {
                "id":321255,
                "symbol":"USDT",
                "amount":10,
                "transfer_type":35,
                "ts":1604889694258,
                "sub_uid":"123456789",
                "sub_account_name":"tom",
                "trade_partition":"USDT"
            },
            {
                "id":321224,
                "symbol":"USDT",
                "amount":-10,
                "transfer_type":34,
                "ts":1604888539807,
                "sub_uid":"123456789",
                "sub_account_name":"tom",
                "trade_partition":"USDT"
            }
        ]
    },
    "ts":1604889988776
}
```

### response

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------------ | -------- | ------------ | -------------------------- | ------------------------------------------------- |
| status             | true     | string       | Request Processing Result               | "ok" , "error"                                    |
| ts                 | true     | long         | Time of Response Generation, unit: millisecond |                                                   |
| \<data\>             | true     | object       |                            |                                                   |
| \<transfer_record\>  | true     | object array |                            |                                                   |
| id                 | true     | long         | Tranfer Order ID                 |                                                   |
| ts                 | true     | long         | Create Time                   |                                                   |
| symbol             | true     | string       | Coin Code               | "BTC","ETH"...                                    |
| trade_partition    | true     | string       | Trade Partition                   | "USDT"                                            |
| sub_uid            | true     | string       | Sub-account UID                 |                                                   |
| sub_account_name   | true     | string       | Sub-account Login Name               |                                                   |
| transfer_type      | true     | int          | Transfer Type                   |  35:Transfer in from contract sub-account;  34:Transfer out to contract sub-account; |
| amount             | true     | decimal      | Amount                       |                                                   |
| \</transfer_record\> |          |              |                            |                                                   |
| total_page         | true     | int          | Total Pages                    |                                                   |
| current_page       | true     | int          | Current Page                     |                                                   |
| total_size         | true     | int          | Total Size                    |                                                   |
| \</data\>            |          |              |                            |                                                   |


## Query user's API indicator disable information

- get `/option-api/v1/option_api_trading_status`


### request body

 null

> Response:

```json

{
    "status":"ok",
    "data":[
        {
            "is_disable":1,
            "order_price_types":"limit,post_only,FOK,IOC",
            "disable_reason":"COR",
            "disable_interval":5,
            "recovery_time":1,
            "COR":{
                "orders_threshold":150,
                "orders":150,
                "invalid_cancel_orders":150,
                "cancel_ratio_threshold":0.98,
                "cancel_ratio":0.98,
                "is_trigger":1,
                "is_active":1
            },
            "TDN":{
                "disables_threshold":3,
                "disables":3,
                "is_trigger":1,
                "is_active":1
            }
        }
    ],
    "ts":159007866555
}
```

### Response:

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ---------------------- | -------- | ------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status                 | true     | string  | Request Processing Result                                                 | "ok" , "error"                                               |
| ts                     | true     | long    | Time of Response Generation, unit: millisecond                                   |                                                              |
| \<data\>                 | true     | object  |                                                              |                                                              |
| is_disable             | true     | int     | Disabled or not                                                  | 1: Disabled，0: Not disabled                                   |
| order_price_types      | true     | string  | Order types that trigger DISABLE; separate multiple order types by commas. eg:“limit,post_only,FOK,IOC” |                                                              |
| disable_reason         | true     | string  | The reason for DISABLE triggered, indicating current DISABLE is triggered by which indicator.               | "COR": Cancel order ratio（Cancel Order Ratio），“TDN”: Total disable number（Total Disable Number） |
| disable_interval       | true     | long    | Disable time interval, unit: millisecond                                  |                                                              |
| recovery_time          | true     | long    | Estimated recovery time, unit: millisecond                                    |                                                              |
| \<COR\>                  | true     | object  | Indicator of cancel order ratio                       |                                                              |
| orders_threshold       | true     | long    | Threshold of orders that can be placed                                             |                                                              |
| orders                 | true     | long    | User's actual number of orders                                       |                                                              |
| invalid_cancel_orders  | true     | long    | Number of user's invalid order cancellation                                 |                                                              |
| cancel_ratio_threshold | true     | decimal | Theshold of cancel order ratio                                                 |                                                              |
| cancel_ratio           | true     | decimal | User's actual cancel order ratio           |                                                              |
| is_trigger             | true     | int     | User triggered the indicator or not                                          | 1: triggered，0: not triggered                                     |
| is_active              | true     | int     | Indicator enabled or not                                             |                                                              |
| \</COR\>                 |          |         |                                                              |                                                              |
| \<TDN\>                  | true     | object  | Indicator of total disable number（Total Disable Number）                 |                                                              |
| disables_threshold     | true     | long    | Threshold of total distable number                                          |                                                              |
| disables               | true     | long    | Acutal disable number                                           |                                                              |
| is_trigger             | true     | int     | User triggered the indicator or not                                          | 1: triggered，0: not triggered                                     |
| is_active              | true     | int     | Indicator enabled or not                                              |                                                              |
| \</TDN\>                 |          |         |                                                              |                                                              |
| \</data\>                |          |         |                                                              |                                                              |


# Option Trade Interface

##  Place an Order 

###  Example  

- POST `/option-api/v1/option_order`


>Request:

```json
{
  "contract_code": "BTC-USDT-201225-C-13000",
  "price": 4.4,
  "volume": 5,
  "direction": "buy",
  "offset": "open",
  "order_price_type": "limit"
}
```

###  Request Parameter  

| Parameter Name           | Parameter Type | Mandatory  | Desc                           | Value Range                                                     |
| ---------------- | -------- | ----- | ------------------------------ | ------------------------------------------------------------ |
| contract_code    | string   | true  | Contract Code     <img width=1000/>                  | BTC-USDT-201225-C-13000                                       |
| client_order_id  | long     | false | Shall be filled out and maintained by the client; must be numbers |                                                              |
| price            | decimal  | false | Price                           |                                                              |
| volume           | long     | true  | Order Quantity (volume)                   |                                                              |
| direction        | string   | true  | Position Direction                       | "buy":Buy "sell":Sell                                           |
| offset           | string   | true  | Open/Close Direction                      | "open": open "close": close                                         |
| order_price_type | string   | true  | Order Type                   | "limit": Limit Order "opponent": BBO "post_only": Post-only Order, placing a Post-only order is only limited by user's position quantity. optimal_5: Optimal 5, optimal_10: Optimal 10, optimal_20: Optimal 20，ioc: IOC Order，fok: FOK Order, "opponent_ioc": BBO-IOC，"optimal_5_ioc": Optimal 5-IOC，"optimal_10_ioc": Optimal 10-IOC，"optimal_20_ioc": Optimal 20-IOC，"opponent_fok":  BBO-FOK，"optimal_5_fok": Optimal 5-FOK，"optimal_10_fok": Optimal 10-FOK，"optimal_20_fok": Optimal 20-FOK |

###  Note ： 

"limit": Limit Order, "post_only": Maker Order Only, ioc: IOC Order, fok: FOK Order, only these four types of orders require price parameter, others do not.

Description of post_only: assure that the maker order remains as maker order, it will not be filled immediately with the use of post_only, for the match system will automatically check whether the price of the maker order is higher/lower than the opponent first price, i.e. higher than bid price 1 or lower than the ask price 1. If yes, the maker order will placed on the orderbook, if not, the maker order will be cancelled.

open long: Buy to open long(direction uses buy, offset uses open)

close long: Sell to close long(direction uses sell, offset uses close)

Open short: Sell to open short (direction uses sell, offset uses open)

close short: Buy to close short (direction uses buy, offset uses close)

No need to transfer BBO order price(ask 1and bid 1) parameter, optimal_5: top 5 optimal BBO price, optimal_10：top 10 optimal BBO price, optimal_20：top 20 optimal BBO price (No need to transfer price data) ，limit": limit order, "post_only": maker order only (price data transfer is needed),IOC :Immediate-Or-Cancel Order,FOK:Fill-Or-Kill Order.

> Response:

```json

{
    "status": "ok",
    "data": {
        "order_id": 775311792237785088,
        "order_id_str": "775311792237785088",
        "client_order_id": 563829342342342
    },
    "ts": 1604890335869
}
```


###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------ | ------------------------------------------ | -------------- |
| status          | true     | string | Request Processing Result                               | "ok" , "error" |
| \<data\>          | true     | object |                                            |                |
| order_id        | true     | long   | Order ID                                     |                |
| order_id_str    | true     | string | StringType Order ID                           |                |
| client_order_id | false    | long   | Order ID filled in by the user when placing an order; no return if not filled |                |
| \</data\>         |          |        |                                            |                |
| ts              | true     | long   | Time of Response Generation, unit: millisecond                 |                |

### Note

 - order_id returns 18 digits.  nodejs and javascript cannot parse 18 digits by default. In nodejs and javascript, JSON.parse defaults to int, and numbers with more than 18 digits are parsed using the json-bigint package. 

##  Place a Batch of Orders

###  Example  

- POST `/option-api/v1/option_batchorder`

> Request:

```json
{
  "orders_data": [
    {
      "contract_code": "BTC-USDT-201225-C-13000",
      "price": 1120,
      "volume": 1,
      "direction": "buy",
      "offset": "open",
      "order_price_type": "post_only",
      "client_order_id":563829342342343
    },
     {
      "contract_code": "BTC-USDT-201225-C-13000",
      "price": 1150,
      "volume": 1,
      "direction": "buy",
      "offset": "open",
      "order_price_type": "post_only",
      "client_order_id":563829342342345
    }
  ]
}
```

###  Request Parameter  

| Parameter Name         | Mandatory | Type         | Desc                           | Value Range                                                     |
| ---------------- | -------- | ------------ | ------------------------------ | ------------------------------------------------------------ |
| \<orders_data\>    | true     | object array |      <img width=1000/>                          |                                                              |
| contract_code    | true     | string       | Contract Code                       | BTC-USDT-201225-C-13000                                       |
| client_order_id  | false    | long         | Shall be filled out and maintained by the client; must be numbers |                                                              |
| price            | false    | decimal      | Price                         |                                                              |
| volume           | true     | long         | Order Quantity(volume)                   |                                                              |
| direction        | true     | string       | Position Direction                       | "buy":Buy "sell":Sell                                           |
| offset           | true     | string       | Open/Close Direction                      | "open":open "close":close                                         |
| order_price_type | true     | string       | Order Type                   | "limit":Limit Order "opponent":BBO "post_only":Post-only Order, placing a Post-only order is only limited by user's position quantity, optimal_5: Optimal 5, optimal_10: Optimal 10, optimal_20: Optimal 20，ioc: IOCOrder，fok: FOK Order,"opponent_ioc": BBO-IOC，"optimal_5_ioc": Optimal 5-IOC，"optimal_10_ioc": Optimal 10-IOC，"optimal_20_ioc": Optimal 20-IOC，"opponent_fok":  FOK order using BBO price，"optimal_5_fok": Optimal 5-FOK，"optimal_10_fok": Optimal 10-FOK，"optimal_20_fok": Optimal 20-FOK |
| \</orders_data\>   |          |              |                                |                                                              |

###  Note  ：

 - "limit": Limit Order, "post_only": Maker Order Only, ioc: IOC Order, fok: FOK Order, only these four types of orders require price parameter, others do not.

 - Description of post_only: assure that the maker order remains as maker order, it will not be filled immediately with the use of post_only, for the match system will automatically check whether the price of the maker order is higher/lower than the opponent first price, i.e. higher than bid price 1 or lower than the ask price 1. If yes, the maker order will placed on the orderbook, if not, the maker order will be cancelled.

 - No need to transfer BBO order price(ask 1and bid 1) parameter, optimal_5: top 5 optimal BBO price, optimal_10：top 10 optimal BBO price, optimal_20：top 20 optimal BBO price (No need to transfer price data) ，limit": limit order, "post_only": maker order only (price data transfer is needed),IOC :Immediate-Or-Cancel Order,FOK:Fill-Or-Kill Order.



> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "index": 1,
                "err_code": 1050,
                "err_msg": "Customer's order number is repeated. Please try again later.",
                "errorParams": null
            }
        ],
        "success": [
            {
                "order_id": 775312478778372096,
                "order_id_str": "775312478778372096",
                "client_order_id": 563829342342345,
                "index": 2
            }
        ]
    },
    "ts": 1604890499553
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------------ | ------------------------------------------ | -------------- |
| status          | true     | string       | Request Processing Result                               | "ok" , "error" |
| \<data\>        | true     | object array |                                            |                |
| \<errors\>        | true     | object array |                                            |                |
| index           | true     | int          | Order Index                                   |                |
| err_code        | true     | int          | Error Code                                     |                |
| err_msg         | true     | string       | Error Info                                   |                |
| \</errors\>       |          |              |                                            |                |
| \<success\>       |          |              |                                            |                |
| index           | true     | int          | Order Index                                   |                |
| order_id        | true     | long         | Order ID                                     |                |
| order_id_str    | true     | string       | Order ID in string format                         |                |
| client_order_id | true     | long         | Order ID filled in by the user when placing an order; no return if not filled |                |
| \</success\>      |          |              |                                            |                |
| \</data\>      |          |              |                                            |                |
| ts              | true     | long         | Time of Response Generation, unit: millisecond                 |                |

### Note

 - order_id returns 18 digits.  nodejs and javascript cannot parse 18 digits by default. In nodejs and javascript, JSON.parse defaults to int, and numbers with more than 18 digits are parsed using the json-bigint package. 

## Cancel an Order 

###  Example   

- POST  `/option-api/v1/option_cancel`


> Request:

```json
{
  "order_id": "675016139515973632,675016139515973632,675016172537729024",
  "trade_partition": "USDT"
}
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type   | Desc                                                         | Value Range       |
| --------------- | -------- | ------ | ------------------------------------------------------------ | -------------- |
| order_id        | false(more detail see note) | string | Order ID (Seperate multiple Order IDs with commas; allow to cancel at most 10 orders at a time)     |                |
| client_order_id | false(more detail see note) | string | Client Order ID (Seperate multiple IDs with commas; allow to cancel at most 10 orders at a time) |                |
| trade_partition | false    | string | Trade Partition                                                     | "USDT"         |

###  Note：

 - Both order_id and client_order_id can be used for order withdrawl，one of them needed at one time，if both of them are set，the default will be order id。

 - The return data from Cancel An Order Interface only means that order cancelation designation is executed successfully. To check cancelation result, please check your order status at Get Information Of An Order interface.

 - client_order_id, order status query is available for orders placed within 24 hours; Otherwise, clients cannot check orders placed beyond 24 hours.

> Response: result of multiple order withdrawls (successful withdrew order ID, failed withdrew order ID)

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "order_id": "771757367472893952",
                "err_code": 1061,
                "err_msg": "This order doesn't exist."
            }
        ],
        "successes": "775312478778372096"
    },
    "ts": 1604890627676
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------- | -------- | ------------ | --------------------------------------------- | -------------- |
| status    | true     | string       | Request Processing Result                                  | "ok" , "error" |
| \<data\>  | true     | object array |                                               |                |
| \<errors\>  | true     | object array |                                               |                |
| order_id  | true     | string       | Order ID                                        |                |
| err_code  | true     | int          | Error Code                                        |                |
| err_msg   | true     | string       | Error Info                                      |                |
| \</errors\> |          |              |                                               |                |
| successes | true     | string       |  order_id or client_order_id list of successfully canceled orders |                |
| \</data\> |          |              |                                               |                |
| ts        | true     | long         | Time of Response Generation, unit: millisecond                    |                |


## Cancel All Orders 

###  Example  

- POST `/option-api/v1/option_cancelall`

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT"
}
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type   | Desc     | Value Range                                   |
| --------------- | -------- | ------ | -------- | ------------------------------------------ |
| symbol            | true     | string       | Coin Code                         | "BTC","ETH"...                                               |
| trade_partition | false    | string | Trade Partition | "USDT"                                     |
| contract_type   | false    | string | Contract Type | this_week: Weekly next_week: Bi-weekly quarter: Quarterly |
| contract_code   | false    | string | Contract Code | BTC-USDT-201225-C-13000                    |
| direction | false  | string | Transaction direction(if not filled in means all)  |  ["buy" , "sell"] |
| offset | false  | string | offset direction（if not filled in means all）|  ["open" , "close"] |

#### Note 

- If there is "contract_code" parameter, canceling all contracts under this code.
- You can fill in only one of direction and offset to cancel the orders. (such as direction=buy, all buy orders will be cancelled, including "open" and "close" offset)


> Response:result of multiple order withdrawls (successful withdrew order ID, failed withdrew order ID)

```json

{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "775311573278339072,775311792237785088,775312389775110144,775312389800275968"
    },
    "ts": 1604890694946
}
```


###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------- | -------- | ------------ | -------------------------- | -------------- |
| status    | true     | string       | Request Processing Result               | "ok" , "error" |
| \<data\>  | true     | object array |                            |                |
| \<errors\>  | true     | object array |                            |                |
| order_id  | true     | string       | Order ID                     |                |
| err_code  | true     | int          | Order Failed Error Code             |                |
| err_msg   | true     | string       | Order Failed Info               |                |
| \</errors\> |          |              |                            |                |
| successes | true     | string       | Successful Orders                 |                |
| \</data\> |          |              |                            |                |
| ts        | true     | long         | Time of Response Generation, unit: millisecond |                |

## Place Lightning Close Order

- POST ` /option-api/v1/option_lightning_close_position`

> Request:

```json
{
  "contract_code": "BTC-USDT-201225-C-13000",
  "volume": 1,
  "direction": "sell"
}
```

### Request Parameter 

| Parameter Name         | Mandatory | Type    | Desc                                    | Value Range                                                     |
| ---------------- | -------- | ------- | --------------------------------------- | ------------------------------------------------------------ |
| contract_code    | true     | string  | Contract Code                                | BTC-USDT-201225-C-13000                                       |
| volume           | true     | long | Order Quantity (volume)                          |                                                              |
| direction        | true     | string  | Buy/Sell Direction                                | "buy": Buy，"sell": Sell                                          |
| client_order_id  | false    | long    | （API）shall be filled in and maintained by the client; shall be unique. |                                                              |
| order_price_type | false    | string  | Order Type                            | if not filled, default"Flash close"，"lightning": Lightning close，"lightning_ioc": Lightning close-IOC，"lightning_fok": Lightning close-FOK |

#### Note:

 - Lightning close means that the order can be filled instantly at the price within BBO-Optimal30, and the unfilled part will be converted to a limit order automatically. 

 - The closing price of flash close orders has a predictable effect, which can avoid users' loss due to the orders cannot be filled when the market fluctuates violently. 

 - client_order_id, order status query is available for orders placed within 24 hours; Otherwise, clients cannot check orders placed beyond 24 hours.

> Response:

```json

{
    "status":"ok",
    "ts":1590024939929,
    "data":{
        "order_id":663049584884322304,
        "order_id_str":"663049584884322304"
    }
}
```

### Returning Parameter 

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------ | ---------------------------------------------- | ------------------------- |
| status          | true     | string | Request Processing Result                                   | "ok" : successful, "error": failed |
| ts              | true     | long   | Time of Response Generation, unit: millisecond                     |                           |
| \<data\>          | true     | object |                                                |                           |
| order_id        | true     | long   | Order ID [at the user level, different users may have the same order_id.] |                           |
| order_id_str    | true     | string | String Type Order ID                               |                           |
| client_order_id | false    | int    | User's own Order ID                               |                           |
| \</data\>         |          |        |                                                |                           |

> Error：

```json

{
    "status": "error",
    "err_code": 1048,
    "err_msg": "Insufficient close amount available.",
    "ts": 1604891439021
}
```


## Query Order Information

###  Example   

- POST `/option-api/v1/option_order_info`

> Request:

```json
{
  "order_id": "663044581377445880",
  "symbol": "BTC",
  "trade_partition": "USDT",
  "client_order_id": "663044581377445888"
}
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type   | Desc                                                         | Value Range       |
| --------------- | -------- | ------ | ------------------------------------------------------------ | -------------- |
| order_id        | false(Please see the notes)    | string | Order ID (Seperate multiple Order IDs with commas; allow to query at most 50 orders at a time.)     |                |
| client_order_id | false(Please see the notes)    | string | Client Order ID (Seperate multiple IDs with commas; allow to query at most 50 orders at a time.) |                |
| symbol          | true     | string | Coin Code                                                     | "BTC","ETH"... |
| trade_partition | false    | string | Trade Partition                                                     | "USDT"         |

###  Note：
 - At least one of order_id and client_order_id must be filled in

 - Either order_id or client_order_id can be used for querying. Only one of them and at least one of them is required at a time. If both of them are set, the order_id is used for querying by default. After the delivery on Friday, orders with status ended will be deleted. (5: partial filled orders have been deleted 6: all filled 7: deleted)

 - The client_order_id is valid for 24 hours. Orders cannot be queried according to client_order_id if exceeding 24 hours.

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "contract_code": "BTC-USDT-201225-C-13000",
            "contract_type": "quarter",
            "volume": 1,
            "price": 2897.25,
            "order_price_type": "opponent",
            "order_type": 1,
            "direction": "buy",
            "offset": "open",
            "order_id": 775303174474293248,
            "order_id_str": "775303174474293248",
            "client_order_id": null,
            "created_at": 1604888281225,
            "trade_volume": 1,
            "trade_turnover": 2.89725,
            "fee": -0.005,
            "trade_avg_price": 2897.25,
            "margin_frozen": 0,
            "profit": 0,
            "status": 6,
            "order_source": "web",
            "delivery_date": "20201225",
            "option_right_type": "C",
            "exercise_price": 13000,
            "quote_asset": "USDT",
            "premium_frozen": 0,
            "fee_frozen": 0,
            "trade_partition": "USDT",
            "fee_asset": "USDT",
            "margin_asset": "BTC"
        }
    ],
    "ts": 1604890904670
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------- | ------------------------------------ | ------------------------------------------------------------ |
| status            | true     | string  | Request Processing Result  <img width=1000/>               | "ok" , "error"                                               |
| \<data\>            | true     | object  |                                      |                                                              |
| symbol            | true     | string  | Coin Code                             | "BTC","ETH"...                                               |
| trade_partition   | true     | string  | Trade Partition                             | "USDT"                                                       |
| contract_type     | true     | string  | Contract Type                             | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter"           |
| contract_code     | true     | string  | Contract Code                             | "BTC-USDT-201225-C-13000"                                     |
| volume            | true     | decimal | Order Quantity                             |                                                              |
| price             | true     | decimal | Order Price                             |                                                              |
| order_price_type  | true     | string  | Order Type                         | "limit":Limit Order, "opponent":BBO, "post_only":Post-only Order, placing a Post-only order is only limited by user's position quantity, optimal_5: Optimal 5, optimal_10: Optimal 10, optimal_20: Optimal 20, ioc: IOC Order，fok: FOKOrder, "opponent_ioc": BBO-IOC，"optimal_5_ioc": Optimal 5-IOC，"optimal_10_ioc": Optimal 10-IOC，"optimal_20_ioc": Optimal 20-IOC，"opponent_fok": BBO-FOK，"optimal_5_fok": Optimal 5-FOK，"optimal_10_fok": Optimal 10-FOK，"optimal_20_fok": Optimal 20-FOK |
| order_type        | true     | int     | Order Type，1:Place an order, 2: Cancel an order,  4:Delivery |                                                              |
| direction         | true     | string  | "buy": Buy "sell": Sell                   |                                                              |
| offset            | true     | string  | "open": open "close": close                 |                                                              |
| order_id          | true     | long    | Order ID                               |                                                              |
| order_id_str      | true     | string  | Order ID in string format                   |                                                              |
| client_order_id   | true     | long    | Client Order ID                           |                                                              |
| created_at        | true     | long    | Order Creation Time                         |                                                              |
| trade_volume      | true     | decimal | Trading Volume                             |                                                              |
| trade_turnover    | true     | decimal | Total trading amount                           |                                                              |
| fee               | true     | decimal | Transaction Fee                               |                                                              |
| fee_asset         | true     | string  | Transaction Fee coin                           |                                                              |
| trade_avg_price   | true     | decimal | AverageTransaction Price                             |                                                              |
| margin_frozen     | true     | decimal | Frozen Margin                        |                                                              |
| margin_asset     | true     | decimal | Margin Coin                        |    "BTC"                                                        |
| profit            | true     | decimal | Profit                                 |                                                              |
| status            | true     | int     | Order Status                             | (3 unfilled 4 partial filled 5partial filled and unfilled orders are cancelled 6 all filled 7 cancelled)        |
| order_source      | true     | string  | Order Source                             |                                                              |
| delivery_date     | true     | string  | Delivery Date                               | eg"20200508"                                                 |
| option_right_type | true     | string  | Options Type                         | C:Call options P:Put options                                        |
| exercise_price    | true     | decimal | Strike Price                              |                                                              |
| quote_asset       | true     | string  | Quote Coin                             | eg"USDT"                                                     |
| premium_frozen    | true     | decimal | Frozen Premium                          |                                                              |
| fee_frozen        | true     | decimal | Frozen Transaction Fee                           |                                                              |
| \</data\>           |          |         |                                      |                                                              |
| ts                | true     | long    | Timestamp                             |                                                              |



## Query Order detail

###  Example   

- POST `/option-api/v1/option_order_detail`


>Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "order_id": 663681892062679040,
  "order_type": 1
}
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type   | Desc                   | Value Range                  |
| --------------- | -------- | ------ | ---------------------- | ------------------------- |
| symbol          | true     | string | Coin Code              | "BTC","ETH"...            |
| trade_partition | false    | string | Trade Partition               | "USDT"                    |
| order_id        | true     | long   | Order ID                 |                           |
| created_at      | false    | long   | Order Create Timestamp           |                           |
| order_type      | false    | int    | Order Type               | 1:Place an order, 2: cancel an order, 4:Delivery |
| page_index      | false    | int    | Page Number, default page 1 if not filled   |                           |
| page_size       | false    | int    | Default 20 if not filled; no more than 50 |                           |

### Note

 - When querying order cancellation data from Order Details Acquisition interface, if there are parameters created_at and order_type, only 90 days data can be queried. If there are not parameters created_at or order_type, only 24 hours data can be queried. 

 - order_id returns 18 digits.  nodejs and javascript cannot parse 18 digits by default. In nodejs and javascript, JSON.parse defaults to int, and numbers with more than 18 digits are parsed using the json-bigint package. 

 - created_at uses a 13-digit long type timestamp (including milliseconds). If an accurate timestamp is entered, query performance will improve. For example, "2019/10/18 10:26:22" is converted to timestamp 1571365582123. You can also get the timestamp directly from the TS returned by the contract_order Place an Order interface to query the corresponding order.

 - The parameter of create_at cannot be 0.

> Response:

```json

{
    "status": "ok",
    "data": {
        "symbol": "BTC",
        "trade_partition": "USDT",
        "contract_code": "BTC-USDT-201225-C-13000",
        "contract_type": "quarter",
        "direction": "buy",
        "offset": "open",
        "volume": 1,
        "price": 2897.25,
        "created_at": 1604888281225,
        "canceled_at": 0,
        "order_source": "web",
        "order_price_type": "opponent",
        "margin_frozen": 0,
        "profit": 0,
        "option_right_type": "C",
        "exercise_price": 13000,
        "quote_asset": "USDT",
        "premium_frozen": 0,
        "fee_frozen": 0,
        "fee_asset": "USDT",
        "order_type": 1,
        "order_id": 775303174474293248,
        "order_id_str": "775303174474293248",
        "client_order_id": null,
        "trade_volume": 1,
        "trade_turnover": 2.89725,
        "fee": -0.005,
        "trade_avg_price": 2897.25,
        "status": 6,
        "delivery_date": "20201225",
        "margin_asset": "BTC",
        "trades": [
            {
                "trade_id": 125344032,
                "trade_price": 2897.25,
                "trade_volume": 1,
                "trade_turnover": 2.89725,
                "trade_fee": -0.005,
                "created_at": 1604888281258,
                "role": "taker",
                "id": "125344032-775303174474293248-1",
                "fee_asset": "USDT"
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1
    },
    "ts": 1604890985365
}
```


###  Returning Parameter 

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ---------------- | -------- | ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status           | true     | string       | Request Processing Result                                                 | "ok" , "error"                                               |
| \<data\>           | true     | object       |                                                              |                                                              |
| symbol           | true     | string       | Coin Code                                                     | "BTC","ETH"...                                               |
| trade_partition  | true     | string       | Trade Partition                                                     | "USDT"                                                       |
| contract_type    | true     | string       | Contract Type                                                     | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter"           |
| contract_code    | true     | string       | Contract Code                                                     | "BTC-USDT-201225-C-13000"                                     |
| direction        | true     | string       | Buy/Sell Direction                                                     | "buy":Buy "sell":Sell                                           |
| offset           | true     | string       | Open/Close Direction                                                    | "open": open "close": close                                         |
| volume           | true     | decimal      | Order Quantity                                                     |                                                              |
| price            | true     | decimal      | Order Price                                                     |                                                              |
| created_at       | true     | long         | Creation Time                                                     |                                                              |
| canceled_at      | true     | long         | Cancel Time                                                     |                                                              |
| order_source     | true     | string       | Order Source                                                     |                                                              |
| order_price_type | true     | string       | Order Type                                                 | "limit": Limit Order "opponent": BBO "post_only": Post-only Order, placing a Post-only order is only limited by user's position quantity, optimal_5: Optimal 5、optimal_10: Optimal 10、optimal_20: Optimal 20，ioc: IOCOrder，fok: FOKOrder,"opponent_ioc": BBO-IOC，"optimal_5_ioc": Optimal 5-IOC，"optimal_10_ioc": Optimal 10-IOC，"optimal_20_ioc": Optimal 20-IOC，"opponent_fok":  BBO-FOK，"optimal_5_fok": Optimal 5-FOK，"optimal_10_fok": Optimal 10-FOK，"optimal_20_fok": Optimal 20-FOK |
| margin_frozen    | true     | decimal      | Frozen Margin                                                |                                                              |
| margin_asset     | true     | decimal | Margin Coin                       |                                                              |
| profit           | true     | decimal      | Profit                                                         |                                                              |
| order_type        | true     | int     | Order Type，1:Place an order, 2: Cancel an order,  4:Delivery |                                                              |
| order_id          | true     | long    | Order ID                               |                                                              |
| order_id_str      | true     | string  | Order ID in string format                   |                                                              |
| client_order_id   | true     | long    | Client Order ID                           |                                                              |
| trade_volume      | true     | decimal | Trading Volume                             |                                                              |
| trade_turnover    | true     | decimal | Total trading amount                           |                                                              |
| fee               | true     | decimal | Transaction Fee                               |                                                              |
| fee_asset         | true     | string  | Transaction Fee coin                           |                                                              |
| trade_avg_price   | true     | decimal | AverageTransaction Price                             |                                                              |
| status            | true     | int     | Order Status                             | (3 unfilled 4 partial filled 5partial filled and unfilled orders are cancelled 6 all filled 7 cancelled)        |
| delivery_date     | true     | string  | Delivery Date                               | eg"20200508"                                                 |
| option_right_type | true     | string  | Options Type                         | C:Call options P:Put options                                        |
| exercise_price    | true     | decimal | Strike Price                              |                                                              |
| quote_asset       | true     | string  | Quote Coin                             | eg"USDT"                                                     |
| premium_frozen    | true     | decimal | Frozen Premium                          |                                                              |
| fee_frozen        | true     | decimal | Frozen Transaction Fee                           |                                                              |
| total_page       | true     | int          | Total Pages                                                     |                                                              |
| current_page     | true     | int          | Current Page                                                     |                                                              |
| total_size       | true     | int          | Total Size                                                      |                                                              |
| \<trades\>         | true     | object array |                                                              |                                                              |
| id               | true     | string       |  Unique transaction id. Because trade_id is not unique, the specific method is to use trade_id and id as joint primary key and splice it into a unqiue transaction ID.  |                                                              |
| trade_id         | true     | long         | Match result id. Because trade_id is not unique, the specific method is to use trade_id and id as joint primary key and splice it into a unqiue transaction ID. |                                                              |
| trade_price      | true     | decimal      | Match Price                                                    |                                                              |
| trade_volume     | true     | decimal      | Trading Volume                                                       |                                                              |
| trade_turnover   | true     | decimal      | Trading Amount                                                     |                                                              |
| trade_fee        | true     | decimal      | Transaction Fee                                                   |                                                              |
| fee_asset        | true     | string       | Transaction Fee coin                                                   |                                                              |
| role             | true     | string       | taker or maker                                                 |                                                              |
| created_at       | true     | long         | Creation Time                                                     |                                                              |
| \</trades\>        |          |              |                                                              |                                                              |
| \</data\>         |          |              |                                                              |                                                              |
| ts               | true     | long         | Timestamp                                                     |                                                              |


## Query Open Orders

###  Example  

- POST  `/option-api/v1/option_openorders`

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "contract_code": "BTC-USDT-201225-C-13000",
  "page_index": 1,
  "page_size": 20
}
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type   | Desc                         | Value Range                                |
| --------------- | -------- | ------ | ---------------------------- | --------------------------------------- |
| symbol          | false    | string | Coin Code                     | "BTC","ETH"，If default, all coins will be returned.|
| trade_partition | false    | string | Trade Partition                     | "USDT"                                  |
| contract_code   | false    | string | Contract Code                     | "BTC-USDT-201225-C-13000" ...            |
| page_index      | false    | int    | Page number, default page1 if not filled      |                                         |
| page_size       | false    | int    | Page size, default 20 if not filled; no more than 50|                                         |
| sort_by         | false | string    |  sort fields(Default: “created_at” descending order)    |   “created_at”: descending order by order created at, "update_time": descending order by order update time   |
| trade_type      | false | int    |  trade type(Default:all)    |  0:all,1: buy long,2: sell short,3: buy short,4: sell  long   |

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "BTC",
                "contract_code": "BTC-USDT-201225-C-13000",
                "contract_type": "quarter",
                "volume": 1,
                "price": 1204.79,
                "order_price_type": "post_only",
                "order_type": 1,
                "direction": "buy",
                "offset": "open",
                "order_id": 775314891945996288,
                "order_id_str": "775314891945996288",
                "client_order_id": 563829342342349,
                "created_at": 1604891074887,
                "update_time": 1604891074887,
                "trade_volume": 0,
                "trade_turnover": 0,
                "fee": 0,
                "trade_avg_price": 0,
                "margin_frozen": 0,
                "profit": 0,
                "status": 3,
                "order_source": "api",
                "delivery_date": "20201225",
                "option_right_type": "C",
                "exercise_price": 13000,
                "quote_asset": "USDT",
                "premium_frozen": 1.20479,
                "fee_frozen": 0.005,
                "trade_partition": "USDT",
                "fee_asset": "USDT",
                "margin_asset": "BTC"
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1
    },
    "ts": 1604891079443
}
```

###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------- | ----------------------------------- | ------------------------------------------------------------ |
| status            | true     | string  | Request Processing Result  <img width=1000/>                      |                                                              |
| \<data\>            | true     | object  |                                     |                                                              |
| \<orders\>        | true     | object  |                                     |                                                              |
| symbol            | true     | string  | Coin Code                            | "BTC","ETH"...                                               |
| trade_partition   | true     | string  | Trade Partition                            | "USDT"                                                       |
| contract_type     | true     | string  | Contract Type                            | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter"           |
| contract_code     | true     | string  | Contract Code                            | "BTC-USDT-201225-C-13000"                                     |
| volume            | true     | decimal | Order Quantity                            |                                                              |
| price             | true     | decimal | Order Price                            |                                                              |
| order_price_type  | true     | string  | Order Type                        | "limit": Limit Order "opponent": BBO "post_only":Post-only Order, placing a Post-only order is only limited by user's position quantity, optimal_5: Optimal 5、optimal_10: Optimal 10, optimal_20: Optimal 20，ioc: IOC Order，fok: FOK Order,"opponent_ioc": BBO-IOC，"optimal_5_ioc": Optimal 5-IOC，"optimal_10_ioc": Optimal 10-IOC，"optimal_20_ioc": Optimal 20-IOC，"opponent_fok":  BBO-FOK，"optimal_5_fok": Optimal 5-FOK，"optimal_10_fok": Optimal 10-FOK，"optimal_20_fok": Optimal 20-FOK |
| order_type        | true     | int     | Order Type，1: Place an order,  2: Cancel an order, 4: Delivery |                                                              |
| direction         | true     | string  | "buy": Buy "sell": Sell                  |                                                              |
| offset            | true     | string  | "open": open "close": close                |                                                              |
| order_id          | true     | long    | Order ID                              |                                                              |
| order_id_str      | true     | string  | Order ID in string format                  |                                                              |
| client_order_id   | true     | long    | Client Order ID                          |                                                              |
| created_at        | true     | long    | Order Creation Time                        |                                                              |
| trade_volume      | true     | decimal | Trading Volume                            |                                                              |
| trade_turnover    | true     | decimal | Total Trading Amount                          |                                                              |
| fee               | true     | decimal | Transaction Fee                              |                                                              |
| trade_avg_price   | true     | decimal | Average Transaction Price                            |                                                              |
| margin_frozen     | true     | decimal | Frozen Margin                       |                                                              |
| margin_asset     | true     | decimal | Margin Coin                       |                                                              |
| profit            | true     | decimal | Profit                                |                                                              |
| status            | true     | int     | Order Status                            | (3: unfilled 4: partial filled 5: partial filled orders have been deleted 6: all filled 7:deleted)        |
| order_source      | true     | string  | Order Source                            |                                                              |
| delivery_date     | true     | string  | Delivery Date                              | eg"20200508"                                                 |
| option_right_type | true     | string  | Options Type                        | C: Call options P: Put options                                        |
| exercise_price    | true     | decimal | Strike Price                             |                                                              |
| quote_asset       | true     | string  | Quote Coin                            | eg"USDT"                                                     |
| premium_frozen    | true     | decimal | Frozen Premium                         |                                                              |
| fee_frozen        | true     | decimal | Frozen Transaction Fee                          |                                                              |
| fee_asset         | true     | string  | Transaction Fee coin                          |                                                              |
| update_time       | true     | Long    | order update time ，millesecond timestamp | |
| \</orders\>       |          |         |                                     |                                                              |
| total_page        | true     | int     | Total Pages                             |                                                              |
| current_page      | true     | int     | Current Page                              |                                                              |
| total_size        | true     | int     | Total Size                             |                                                              |
| \</data\>           |          |         |                                     |                                                              |
| ts                | true     | long    | Timestamp                            |                                                              |

## Query History Orders

###  Example  

- POST `/option-api/v1/option_hisorders`

>Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "trade_type": 0,
  "type": 2,
  "status": 0,
  "create_date": 7
}
```

###  Request Parameter  

| Parameter Name        | Mandatory | Type   | Desc                 | Value Range                                                     |
| --------------- | -------- | ------ | -------------------- | ------------------------------------------------------------ |
| symbol          | true     | string | Coin Code             | "BTC","ETH"...                                               |
| trade_partition | false    | string | Trade Partition             | "USDT"                                                       |
| trade_type      | true     | int    | Trade Type             | 0: all, 1:Buy to open long, 2: Sell to open short, 3: Buy to close short, 4: Sell to close long, 7:Delivery to close long, 8: Delivery to close short |
| type            | true     | int    | Type                 | 1:all orders, 2:orders with status ended                                |
| status          | true     | int    | Order Status             | 0:all, 3:unfilled, 4: partial filled, 5: partial filled and unfilled orders are cancelled, 6: all filled, 7:cancelled |
| create_date     | true     | int    | Date                 | Enter a positive integer; if the parameter exceeds 90, a default 90 days'data will be queried.         |
| page_index      | false    | int    | Page number, default page 1 if not filled |                                                              |
| page_size       | false    | int    | page size, default 20 | no more than 50                                                |
| contract_code   | false    | string | Contract Code             | BTC-USDT-201225-C-13000                                      |
| sort_by         | false  | string | sort fields(Default: “create_date” descending order) |  "create_date"：descending order by order create date , "update_time": descending order by order update time |

### Note: 

 - The records of cancelled and unfilled limit orders are only kept for 24 hours.

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "order_id": 775314891945996288,
                "order_id_str": "775314891945996288",
                "contract_code": "BTC-USDT-201225-C-13000",
                "symbol": "BTC",
                "direction": "buy",
                "offset": "open",
                "volume": 1,
                "price": 1204.79,
                "create_date": 1604891074887,
                "update_time": 1604891074887,
                "order_source": "api",
                "order_price_type": "post_only",
                "order_type": 1,
                "margin_frozen": 0,
                "profit": 0,
                "contract_type": "quarter",
                "trade_volume": 0,
                "trade_turnover": 0,
                "fee": 0,
                "trade_avg_price": 0,
                "status": 3,
                "delivery_date": "20201225",
                "option_right_type": "C",
                "exercise_price": 13000,
                "quote_asset": "USDT",
                "trade_partition": "USDT",
                "fee_asset": "USDT",
                "margin_asset": "BTC"
            }
        ],
        "total_page": 22,
        "current_page": 1,
        "total_size": 22
    },
    "ts": 1604891148311
}
```


###  Returning Parameter  

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------------ | ------------------ | -------------------------------------------------- |
| status  <img width=250/>  | true <img width=250/> | string <img width=250/> | Request Processing Result <img width=1000/> |                                                    |
| \<data\>            | true     | object       |                    |                                                    |
| \<orders\>          | true     | object array |                    |                                                    |
| order_id          | true     | long         | Order ID             |                                                    |
| order_id_str      | true     | string       | Order ID in string format |                                                    |
| symbol            | true     | string       | Coin Code           | "BTC","ETH"...                                     |
| trade_partition   | true     | string       | Trade Partition           | "USDT"                                             |
| contract_type     | true     | string       | Contract Type           | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| contract_code     | true     | string       | Contract Code           | "BTC-USDT-201225-C-13000"                           |
| direction         | true     | string       | Buy/Sell Direction           | "buy":Buy "sell":Sell                                 |
| offset            | true     | string       | Open/Close Direction          | "open": open "close": close                               |
| volume            | true     | decimal      | Order Quantity           |                                                    |
| price             | true     | decimal      | Order Price           |                                                    |
| create_date       | true     | long         | Creation Time           |                                                    |
| update_time       |  true         |  long    |  order update time，millesecond timestamp	  |    | 
| order_source      | true     | string       | Order Source           |                                                    |
| order_price_type  | true     | string       | Order Type       | "limit”: Limit Order "opponent":BBO "post_only": Post-Only Order, No order limit but position limit for post-only orders.,optimal_5： Optimal , optimal_10： Optimal 10, optimal_20：Optimal 20，ioc: IOC Order,，fok：FOK Order, "opponent_ioc"：IOC order using the BBO price，"optimal_5_ioc"：optimal_5 IOC，"optimal_10_ioc"：optimal_10 IOC，"optimal_20_ioc"：optimal_20 IOC, "opponent_fok"：FOK order using the BBO price，"optimal_5_fok"：optimal_5 FOK，"optimal_10_fok"：optimal_10 FOK，"optimal_20_fok"：optimal_20 FOK |
| margin_frozen     | true     | decimal      | Frozen Margin      |                                                    |
| margin_asset     | true     | decimal | Margin Coin                       |                                                              |
| profit            | true     | decimal      | Profit               |                                                    |
| trade_volume      | true     | decimal      | Trading Volume           |                                                    |
| trade_turnover    | true     | decimal      | Total Trading Amount         |                                                    |
| fee               | true     | decimal      | Transaction Fee             |                                                    |
| fee_asset         | true     | string       | Transaction Fee coin         |                                                    |
| trade_avg_price   | true     | decimal      | Average Transaction Price           |                                                    |
| status            | true     | int          | Order Status           |                                                    |
| order_type        | true     | int          | Order Type           | 1: Place an order,  2: Cancel an order, 4: Delivery                          |
| delivery_date     | true     | string       | Delivery Date             | eg"20200508"                                       |
| option_right_type | true     | string       | Options Type      | C: Call options P: Put options                              |
| exercise_price    | true     | decimal      | Strike Price            |                                                    |
| quote_asset       | true     | string       | Quote Coin           | eg"USDT"                                           |
| \</orders\>         |          |              |                    |                                                    |
| current_page      | true     | int          | Current Page             |                                                    |
| total_page        | true     | int          | Total Pages            |                                                    |
| total_size        | true     | int          | Total Size            |                                                    |
| \</data\>           |          |              |                    |                                                    |
| ts                | true     | long         | Time Stamp           |                                                    |

### Note

 - order_id returns 18 digits.  nodejs and javascript cannot parse 18 digits by default. In nodejs and javascript, JSON.parse defaults to int, and numbers with more than 18 digits are parsed using the json-bigint package. 

## Query History Match Results

###  Example 

- POST `/option-api/v1/option_matchresults`

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "trade_type": 1,
  "create_date": 7
}
```

### Request Parameter

| Parameter Name        | Mandatory | Type   | Desc                   | Value Range                                              |
| --------------- | -------- | ------ | ---------------------- | ----------------------------------------------------- |
| symbol          | true     | string | Coin Code               | "BTC","ETH"，If default, all coins will be returned.              |
| trade_partition | false    | string | Trade Partition               | "USDT"                                                |
| trade_type      | true     | int    | Trade Type               | 0: all,1: Buy to open long, 2: Sell to open short, 3: Buy to close short, 4: Sell to close long |
| create_date     | true     | int    | Date                   | Enter a positive integer; if the parameter exceeds 90, 90 days' data will be queried.  |
| contract_code   | false    | string | Contract Code               | BTC-USDT-201225-C-13000                                |
| role            | false    | string | taker or maker           |                                                       |
| page_index      | false    | int    | Page number, default page 1   |                                                       |
| page_size       | false    | int    | Default 20 if not filled; no more than 50 |                                                       |

#### Note:
 - Request parameter“create_date”changes from "can only enter 7 or 90" to " Enter a positive integer; if the parameter exceeds 90, 90 days' data will be queried."

> Response:

```json

{
    "status": "ok",
    "data": {
        "trades": [
            {
                "match_id": 125344032,
                "order_id": 775303174474293248,
                "order_id_str": "775303174474293248",
                "symbol": "BTC",
                "contract_type": "quarter",
                "contract_code": "BTC-USDT-201225-C-13000",
                "direction": "buy",
                "offset": "open",
                "trade_volume": 1,
                "trade_price": 2897.25,
                "trade_turnover": 2.89725,
                "trade_fee": -0.005,
                "offset_profitloss": 0,
                "create_date": 1604888281258,
                "role": "Taker",
                "order_source": "web",
                "id": "125344032-775303174474293248-1",
                "quote_asset": "USDT",
                "delivery_date": "20201225",
                "option_right_type": "C",
                "exercise_price": 13000,
                "trade_partition": "USDT",
                "fee_asset": "USDT"
            }
        ],
        "total_page": 7,
        "current_page": 1,
        "total_size": 7
    },
    "ts": 1604891293936
}  
```

### Returning Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------------ | ------------------------------------------------------------ | -------------------------------------------------- |
| status            | true     | string       | Request Processing Result                                                 |                                                    |
| \<data\>            | true     | object       |                                                              |                                                    |
| \<trades\>          | true     | object array |                                                              |                                                    |
| id                | true     | string       |  Unique transaction id. Because trade_id is not unique, the specific method is to use trade_id and id as joint primary key and splice it into a unqiue transaction ID.  |                                                    |
| match_id          | true     | long         | Transaction ID, not unique                                     |                                                    |
| order_id          | true     | long         | OrderID                                                       |                                                    |
| order_id_str      | true     | string       | Order ID in string format                                           |                                                    |
| symbol            | true     | string       | Coin Code                                                     | "BTC","ETH"...                                     |
| trade_partition   | true     | string       | Trade Partition                                                     | "USDT"                                             |
| contract_type     | true     | string       | Contract Type                                                     | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| contract_code     | true     | string       | Contract Code                                                     | "BTC-USDT-201225-C-13000"                           |
| direction         | true     | string       | Buy/Sell Direction                                                     | "buy":Buy "sell":Sell                                 |
| offset            | true     | string       | Open/Close Direction                                                    | "open": open "close": close                               |
| trade_volume      | true     | decimal      | Trading Volume                                                     |                                                    |
| trade_price       | true     | decimal      | Transaction Price                                                    |                                                    |
| trade_turnover    | true     | decimal      | Transaction Amount                                                     |                                                    |
| create_date       | true     | long         | Transaction Time                                                   |                                                    |
| offset_profitloss | true     | decimal      | PnL after closing positions                                                     |                                                    |
| trade_fee        | true     | decimal      | Transaction Fee                                                   |                                                    |
| fee_asset         | true     | string       | Transaction Fee Coin                                                   |                                                    |
| role              | true     | string       | Transaction type                                                |   taker、maker、Otm delivery records、Itm delivery records           |
| order_source      | true     | string       | Order Source                                                     |                                                    |
| delivery_date     | true     | string       | Delivery Date                                                       | eg"20200508"                                       |
| option_right_type | true     | string       | Options Type                                                | C: Call options P: Put options                              |
| exercise_price    | true     | decimal      | Strike Price                                                      |                                                    |
| quote_asset       | true     | string       | Denomination Coin                                                     | eg"USDT"                                           |
| \</trades\>         |          |              |                                                              |                                                    |
| current_page      | true     | int          | Current Page                                                       |                                                    |
| total_page        | true     | int          | Total Pages                                                      |                                                    |
| total_size        | true     | int          | Total Size                                                      |                                                    |
| \</data\>           |          |              |                                                              |                                                    |
| ts                | true     | long         | Timestamp                                                     |                                                    |

### Notice

- If there are not parameters page_index and page_size, the system will query the top 20 data on the first page by default. For more details, plese check parameters illustration. 

- order_id returns 18 digits.  nodejs and javascript cannot parse 18 digits by default. In nodejs and javascript, JSON.parse defaults to int, and numbers with more than 18 digits are parsed using the json-bigint package. 


## Place Trigger Order

- POST `option-api/v1/option_trigger_order`

> Request:

```json
{
  "contract_code": "BTC-USDT-201225-C-13000",
  "trigger_type": "le",
  "trigger_price": "7900",
  "order_price": "7900",
  "order_price_type": "limit",
  "volume": "1",
  "direction": "buy",
  "offset": "close"
}
```

### body

| Parameter Name         | Mandatory | Type    | Desc                                                         | Value Range                                                     |
| ---------------- | -------- | ------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| contract_code    | true     | string  | Contract Code                                                     | BTC-USDT-201225-C-13000                                       |
| trigger_type     | true     | string  | Trigger Type:  ge equal to or greater than (Trigger Price is higher than Latest Price)；le less than (Trigger Price is lower than Latest Price) |                                                              |
| trigger_price    | true     | decimal | Trigger Price，if the precision exceeds the minimum variation unit, an error will be reported                           |                                                              |
| order_price      | false    | decimal | Order Price，if the precision exceeds the minimum variation unit, an error will be reported                           |                                                              |
| order_price_type | false    | string  | Order Type:  default limit if not filled;                                  | Limit Order: limit ，Optimal 5: optimal_5，Optimal 10: optimal_10，Optimal 20: optimal_20 |
| volume           | true     | long | Order Quantity(volume)                                                 |                                                              |
| direction        | true     | string  | Buy/Sell Direction                                                     | buy: Buy sell: Sell                                               |
| offset           | true     | string  | Open/Close Direction                                                    | open: open close: close                                             |

### Note
  
  - optimal_5: Optimal 5、optimal_10: Optimal 10、optimal_20: Optimal 20 order_price isn't required to be filled，"limit":Limit Order requires filling price。
 

> Return:

```json

{
    "status": "ok",
    "data": {
        "order_id": 775316559685038080,
        "order_id_str": "775316559685038080"
    },
    "ts": 1604891472516
}

```

### Response Desc

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------ | -------- | ------ | ---------------------------------------------- | ------------------------- |
| status       | true     | string | Request Processing Result                                   | "ok" :successful, "error": failed |
| ts           | true     | long   | Time of Response Generation, unit: millisecond                     |                           |
| err_code     | long     | false  | error code    |                           |
| err_msg      | string   | false  | error message     |                           |
| \<data\>       | true     | object |                                                | Dictionary                      |
| order_id     | true     | long   | Order ID[at the user level, different users may have the same order_id.] |                           |
| order_id_str | true     | string | String Type Order ID                               |                           |
| \</data\>      |          |        |                                                |                           |


> Error：

```json

{
    "status": "error",
    "err_code": 1014,
    "err_msg": "This contract doesn't exist.",
    "ts": 1604891496965
}
```

## Cancel Trigger Order

- POST `/option-api/v1/option_trigger_cancel`

> Request:

```json
{
  "symbol":"BTC",
  "trade_partition": "USDT",
  "order_id": "161251,161256,1344567"
}
```

### request params

| Parameter Name        | Mandatory | Type   | Desc                                                         | Value Range       |
| --------------- | -------- | ------ | ------------------------------------------------------------ | -------------- |
| symbol          | true     | string | Coin Code               | "BTC","ETH" ...              |
| trade_partition | false    | string | Trade Partition                                                     | "USDT"         |
| order_id        | true     | string | User Order ID（Seperate multiple Order IDs with commas; allow to cancel at most 20 orders at a time. ） |                |

> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "order_id": "775316816045150201",
                "err_code": 1061,
                "err_msg": "This order doesn't exist."
            }
        ],
        "successes": "775316816045150208"
    },
    "ts": 1604891550756
}

```

### response

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------- | -------- | ------ | ---------------------------------------------- | ------------------------- |
| status    | true     | string | Request Processing Result                                   | "ok": successful, "error": failed |
| \<data\>  | true     | object |                                                |                       |
| \<errors\>  | true     | object |                                                | Dictionary                      |
| order_id  | true     | string | Order ID [at the user level, different users may have the same order_id.] |                           |
| err_code  | false    | long   | Error Code                                         |                           |
| err_msg   | false    | string | Error Info                                       |                           |
| \</errors\> |          |        |                                                |                           |
| successes | true     | string | Successful Orders                                     |                           |
| \</data\> |          |        |                                                |                           |
| ts        | true     | long   | Time of Response Generation, unit: millisecond                     |                           |


## Cancel All Trigger Orders

- POST `/option-api/v1/option_trigger_cancelall`

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT"
}
```

### Params

| Parameter Name        | Mandatory | Type   | Desc     | Value Range                                           |
| --------------- | -------- | ------ | -------- | -------------------------------------------------- |
| symbol            | true     | string       | Coin Code                         | "BTC","ETH"...                                               |
| trade_partition | false    | string | Trade Partition | "USDT"                                             |
| contract_code   | false    | string | Contract Code | "BTC-USDT-201225-C-13000"                           |
| contract_type   | false    | string | Contract Type | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| direction | false  | string | Transaction direction(if not filled in means all)  |  ["buy" , "sell"] |
| offset | false  | string | offset direction（if not filled in means all）|  ["open" , "close"] |

#### Note

- You can fill in only one of direction and offset to cancel the orders. (such as direction=buy, all buy orders will be cancelled, including "open" and "close" offset)
- If there is "contract_code" parameter, canceling all contracts under this code.

> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "775316559685038080"
    },
    "ts": 1604891729726
}
```

### response params

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------- | -------- | ------ | ---------------------------------------------- | ------------------------- |
| status    | true     | string | Request Processing Result                                   | "ok": succesfful, "error": failed |
| \<data\>  | true     | object |                                                |                       |
| \<errors\>  | true     | object |                                                | Dictionary                      |
| order_id  | true     | string | Order ID [at the user level, different users may have the same order_id.] |                           |
| err_code  | false    | long   | Error Code                                         |                           |
| err_msg   | false    | string | Error Info                                       |                           |
| \</errors\> |          |        |                                                |                           |
| successes | true     | string | Successful Orders                                    |                           |
| \</data\> |          |        |                                                |                           |
| ts        | true     | long   | Time of Response Generation, unit: millisecond                     |                           |


## Query Trigger Order Open Orders

- POST `option-api/v1/option_trigger_openorders`

> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "page_index": "1",
  "page_size": "50"
}
```

### Request Parameter
 
| Parameter Name        | Mandatory | Type   | Desc                   | Value Range                 |
| --------------- | -------- | ------ | ---------------------- | ------------------------ |
| symbol          | true     | string | Coin Code               | "BTC","ETH"...           |
| trade_partition | false    | string | Trade Partition               | "USDT"                   |
| contract_code   | false    | string | Contract Code               | "BTC-USDT-201225-C-13000" |
| page_index      | false    | int    | Page number. Default page1 if not filled |                          |
| page_size       | false    | int    | Default 20 if not filled; no more than 50 |                          |
| trade_type  | false | int    |  trade type(Default:all)    |   0:all,1: buy long,2: sell short,3: buy short,4: sell  long   |

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "BTC",
                "contract_code": "BTC-USDT-201225-C-13000",
                "contract_type": "quarter",
                "trigger_type": "le",
                "volume": 1,
                "order_type": 1,
                "direction": "buy",
                "offset": "open",
                "order_id": 775317966815424512,
                "order_id_str": "775317966815424512",
                "status": 2,
                "order_source": "api",
                "trigger_price": 100,
                "order_price": 100,
                "order_price_type": "limit",
                "created_at": 1604891807992,
                "trade_partition": "USDT"
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1
    },
    "ts": 1604891813788
}
```

### Returning Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ---------------- | -------- | ------------ | --------------------------------- | ------------------------------------------------------------ |
| status           | true     | string       | Request Processing Result                      | "ok": successful, "error": failed                                    |
| \<data\>           | true     | object       |                                   | Dictionary                                                         |
| total_page       | true     | int          | Total Pages                           |                                                              |
| total_size       | true     | int          | Total Size                           |                                                              |
| current_page     | true     | int          | Current Page                            |                                                              |
| \<orders\>         | true     | object array |                                   |                                                              |
| symbol           | true     | string       | Coin Code                          | "BTC","ETH"...                                               |
| trade_partition  | true     | string       | Trade Partition                          | "USDT"                                                       |
| contract_type    | true     | string       | Contract Type                          | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter"           |
| contract_code    | true     | string       | Contract Code                          | "BTC-USDT-201225-C-13000"                                     |
| trigger_type     | true     | string       | Trigger Type:  ge equals to or greater than；le eaquals to or less than |                                                              |
| volume           | true     | decimal      | Order Quantity                          |                                                              |
| order_type       | true     | int          | Order Type: 1, place an order 2, cancel an order         |                                                              |
| direction        | true     | string       | Buy/Sell Direction                          | Buy: "buy",Sell: "sell"                                         |
| offset           | true     | string       | Open/Close Direction                         | open: "open", close: "close"                                       |
| order_id         | true     | long         | Trigger Order ID                  |                                                              |
| order_id_str     | true     | string       | String Type Order ID                |                                                              |
| order_source     | true     | string       | Source                              |     r                                                         |
| trigger_price    | true     | decimal      | Trigger Price                            |                                                              |
| order_price      | true     | decimal      | Order Price                            |                                                              |
| created_at       | true     | long         | Order Creation Time                      |                                                              |
| order_price_type | true     | string       | Order Type                      | "limit":Limit Order，"optimal_5":Optimal 5，"optimal_10":Optimal 10，"optimal_20":Optimal 20 |
| status           | true     | int          | Order Status:                         | 1:To submit，2: Submitted, 3:Order placing in progress, 7:Wrong orders, 8: Cannot find the canceled orders, 9: Orders cancelling in progress, 10: Failed |
| \</orders\>        |          |              |                                   |                                                              |
| \</data\>          |          |              |                                   |                                                              |
| ts               | true     | long         | Time of Response Generation, unit: millisecond        |                                                              |


## Query Trigger Order History

- POST `/option-api/v1/option_trigger_hisorders`


> Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "trade_type": "0",
  "status": "0",
  "create_date": "100"
}
```

### Request Parameter

| Parameter Name        | Mandatory | Type   | Desc                   | Value Range                                                     |
| --------------- | -------- | ------ | ---------------------- | ------------------------------------------------------------ |
| symbol          | true     | string | Coin Code               | "BTC","ETH"...                                               |
| trade_partition | false    | string | Trade Partition               | "USDT"                                                       |
| contract_code   | false    | string | Contract Code               | "BTC-USDT-201225-C-13000"                                     |
| trade_type      | true     | int    | TradeType               | 0: all,1: Buy to open long,2: Sell to open short, 3: Buy to close short, 4: Sell to close long；the backstage queries by converting the value to offset and direction; cannot query by other values. |
| status          | true     | string | Order Status               | Seperate multiple status with commas. Trigger order status: 0: all（represents all orders with status ended）, 4: trigger orders successfully submitted, 5: trigger orders failed being submitted、6: order canceled |
| create_date     | true     | long   | Date                   | Enter a positive integer; if the parameter exceeds 90, a default 90 days' data will be queried.         |
| page_index      | false    | int    | Page number. Default page 1 if not filled |                                                              |
| page_size       | false    | int    | Default 20 if not filled; no more than 50 |                                                              |
| sort_by | false  | string | sort fields(Default: “created_at” descending order) | "created_at"：descending order by order creation time, "update_time": descending order by order update time |

### NOTE

- Querying the filled trigger orders by default (type corresponds to the status 4,5,6) ；

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "BTC",
                "contract_code": "BTC-USDT-201225-C-13000",
                "contract_type": "quarter",
                "trigger_type": "le",
                "volume": 1,
                "order_type": 1,
                "direction": "buy",
                "offset": "open",
                "order_id": 775316816045150208,
                "order_id_str": "775316816045150208",
                "relation_order_id": null,
                "status": 6,
                "order_source": "api",
                "trigger_price": 100,
                "triggered_price": null,
                "order_price": 100,
                "order_price_type": "limit",
                "created_at": 1604891533629,
                "update_time": 1604891533629,
                "triggered_at": null,
                "order_insert_at": 0,
                "canceled_at": 1604891551047,
                "fail_code": null,
                "fail_reason": null,
                "trade_partition": "USDT"
            }
        ],
        "total_page": 7,
        "current_page": 1,
        "total_size": 7
    },
    "ts": 1604891892449
}
```

### Returning Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status            | true     | string       | Request Processing Result                                                 | "ok" :successful, "error": failed                                    |
| \<data\>            | true     | object       |                                                              | Dictionary                                                         |
| total_page        | true     | int          | Total Pages                                                      |                                                              |
| current_page      | true     | int          | Current Page                                                       |                                                              |
| total_size        | true     | int          | Total Size                                                      |                                                              |
| \<orders\>          | true     | object array |                                                              |                                                              |
| symbol            | true     | string       | Coin Code                                                     | "BTC","ETH"...                                               |
| trade_partition   | true     | string       | Trade Partition                                                     | "USDT"                                                       |
| contract_type     | true     | string       | Contract Type                                                     | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter"           |
| contract_code     | true     | string       | Contract Code                                                     | "BTC-USDT-201225-C-13000"                                     |
| trigger_type      | true     | string       | Trigger Type                                           |    ge equals to or greater than；le equals to or lower than                  |
| volume            | true     | decimal      | Order Quantity                                                     |                                                              |
| order_type        | true     | int          | Order Type                                                     | 1: place an order 2: cancel an order                                              |
| direction         | true     | string       | Buy/Sell Direction                                                     | Buy: "buy",Sell: "sell"                                         |
| offset            | true     | string       | Open/Close Direction                                                    | open: "open", close: "close"                                       |
| order_id          | true     | decimal      | Trigger Order ID                                             |                                                              |
| order_id_str      | true     | string       | String Type Order ID                                           |                                                              |
| relation_order_id | true     | string       | The field is the related field of the related limit orders. the value is -1 before the order is trigged. |                                                              |
| order_price_type  | true     | string       | OrderType                                                 | "limit":Limit Order，"optimal_5":Optimal 5，"optimal_10":Optimal 10，"optimal_20":Optimal 20 |
| status            | true     | int          | Order Status                                                     | 4: order successfully placed, 5: order failed to be placed, 6: order cancelled                             |
| order_source      | true     | string       | Source                                                         |                                                              |
| trigger_price     | true     | decimal      | Trigger Price                                                       |                                                              |
| triggered_price   | true     | decimal      | Price at the triggering                                               |                                                              |
| order_price       | true     | decimal      | Order Price                                                       |                                                              |
| created_at        | true     | long         | Order Creation Time                                                 |                                                              |
| update_time       |true      | long         | order update time，millesecond timestamp	| |
| triggered_at      | true     | long         | Trigger Time                                                     |                                                              |
| order_insert_at   | true     | long         | Order Placing Time                                              |                                                              |
| canceled_at       | true     | long         | Cancel Time                                                     |                                                              |
| fail_code         | true     | int          | Error Code for failed to placing an order when triggered                                |                                                              |
| fail_reason       | true     | string       | The reason for failed to placing an order when triggered                                    |                                                              |
| \</orders\>         |          |              |                                                              |                                                              |
| \</data\>           |          |              |                                                              |                                                              |
| ts                | true     | long         | Time of Response Generation, unit: millisecond                                   |                                                              |


# Option Transferring Interface

##  Transfer margin between Spot account and Option account 

### Example

- POST `https://api.huobi.pro/v2/account/transfer`

### Notice

This interface is used to transfer assets between Spot account and Option account.


API rate limit for this interface is 1 times/second.

Transferring margin between Spot account and Option account Interface, sets 8 decimal places for transferring amount of all coins.

### Request Parameter

| Parameter Name  |  Mandatory  |  Type  |  Desc                    |  Default   |  Value Range  |  
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
|from  |    true  |  string  |  source，value：spot、option  |   e.g. spot  |
|to  |    true  |  string  |  destination，value：spot、option |   e.g. option  |
| currency      | true     | string | currency.Both uppercase and lowercase are supported.          |         | e.g. btc                          |
| amount  | true     | Decimal    | Transferring amount         |         |   |
| tradePartition  | true     | string    | Trade Partition (Currently only USDT available）   |  e.g. usdt       |   |

> Response:

```json

{
    "code": 200,
    "data": 182408686,
    "message": "Succeed",
    "success": true
}
	Error response

{
    "code": 1301,
    "data": null,
    "message": "Insufficient amount available.",
    "success": false
}
	
 ```

### Returning Parameter

|  Parameter Name                |  Mandatory  |  Type  |  Desc         |  Value Range                    |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
code  |  true  |   long  | response code  |    |  
success  |    true  |   boolean    |    true/false  |  |
message  |    true  |   string    |     response messsage  |  |
data  |    true  |   long    |    Transfer ID ,If status="error", data will be null.|  |


## Response Code Table

Response Code | Desc in Chinese |  Desc in English  | 
------------------------------------  |  --------------------------------  |  ------------------------- |
|200 | 成功 | Succeed |
|403| 拒绝访问 | Access denied |
|404|访问的资源不存在 | The resource being accessed does not exist|
|429|太多的请求 | too many requests|
|500|系统错误 | System error |
|501|无效请求 |Invalid request|
|502|无效参数 | Invalid parameter | 
|504|缺少参数 | Lack of parameter |
|512|拒绝匿名请求 | Reject anonymous requests |
|513|无效的签名 | Invalid signature | 
|10000|币种不存在 | Currency does not exist |
|10001|不支持同业务划转 | Does not support  transfer within single business|
|10002|不支持此划转业务 | This transfer is not supported| 
|10003|from方check校验不通过 | check rejected by the from party|
|10004|to方check校验不通过 |to check rejected by the to party|
|10005|个人账户平账检查不通过  | Personal account balance check failed |
|10006|系统账户检查失败 | System account check failed|
|10008|黑名单校验不通过 | Blacklist check failed|
|10009|用户有未安全上账资产，禁止划转 | No transfer is allowed if the user has any asset that has not been charged to the account safely |
|10010|用户被锁定 | User locked
|10011|24小时内修改过安全策略 | Security policy has been modified within 24 hours
|20001|OTC 人脸识别   | OTC Face Recognition 
|1030 | 服务异常，请稍后再试 | Abnormal service. Please try again later.
|1010 | 用户不存在 | Abnormal service. Please try again later.
| 1012 | 账户不存在 | Abnormal service. Please contact customer service.
| 1013 | 合约品种不存在 | This contract type doesn't exist.
| 1018 | 主账号不存在 | Main account doesn't exist.
| 1089 | {0}合约暂时限制划转,请联系客服  | {0} contract is restricted of transfer.  Please contact customer service.
| 1102 | 您没有转入权限,请联系客服 |  Unable to transfer in currently. Please contact customer service.
| 1103 | 您没有转出权限,请联系客服 | Unable to transfer out currently. Please contact customer service.
| 1106 | 合约状态异常,暂时无法划转 | Abnormal contracts status. Can’t transfer.
| 1111 | 子账号没有转入权限,请联系客服 | Sub-account doesn't own the permissions to transfer in. Please contact customer service.
| 1112 | 子账号没有转出权限,请联系客服 |  sub-account doesn't own the permissions to transfer out. Please contact customer service.
| 1114 | 子账号没有划转权限,请登录主账号授权 | The sub-account does not have transfer permissions. Please login main account to authorize.
| 1300 | 划转失败 | Transfer failed.
| 1301 | 可划转余额不足 | Insufficient amount available.
| 1302 | 系统划转错误 | Transfer failed.
| 1303 | 单笔转出的数量不能低于{0}{1} | The single transfer-out amount must be no less than {0}{1}.
| 1304 | 单笔转出的数量不能高于{0}{1} | The single transfer-out amount must be no more than {0}{1}.
| 1305 | 单笔转入的数量不能低于{0}{1} | The single transfer-in amount must be no less than {0}{1}.
| 1306 | 单笔转入的数量不能高于{0}{1}  | The single transfer-in amount must be no more than {0}{1}.
| 1307 | 您当日累计转出量超过{0}{1}, 暂无法转出 | Your accumulative transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.
| 1308 | 您当日累计转入量超过{0}{1}, 暂无法转入 | Your accumulative transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.
| 1309 | 您当日累计净转出量超过{0}{1}, 暂无法转出  | Your accumulative net transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being.
| 1310 | 您当日累计净转入量超过{0}{1}, 暂无法转入 | Your accumulative net transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being.
| 1311 | 超过平台当日累计最大转出量限制, 暂无法转出 | The platform's accumulative transfer-out amount is over the daily maximum. You can't transfer out for the time being.
| 1312 | 超过平台当日累计最大转入量限制, 暂无法转入 | The platform's accumulative transfer-in amount is over the daily maximum. You can't transfer in for the time being.
| 1313 | 超过平台当日累计最大净转出量限制, 暂无法转出 | The platform's accumulative net transfer-out amount is over the daily maximum. You can't transfer out for the time being.
| 1314 | 超过平台当日累计最大净转入量限制, 暂无法转入 | The platform's accumulative net transfer-in amount is over the daily maximum. You can't transfer in for the time being.
| 1315 | 划转类型错误 | Wrong transfer type.
| 1316 | 划转冻结失败 | Failed to freeze the transfer.
| 1317 | 划转解冻失败 | Failed to unfreeze the transfer.
| 1318 | 划转确认失败 | Failed to confirm the transfer.
| 1319 | 查询可划转金额失败 | Failed to acquire the available transfer amount.
| 1320 | 此合约在非交易状态中, 无法进行系统划 | The contract status is abnormal. Transfer is unavailable temporarily.
| 1321 | 划转失败, 请稍后重试或联系客服 | Transfer failed. Please try again later or contact customer service.
| 1322 | 划转金额必须大于0 | Invalid amount. Must be more than 0.
| 1323 | 服务异常, 划转失败, 请稍后再试 | Abnormal service, transfer failed. Please try again later.
| 1327 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1328 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1329 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1330 | 无划转权限, 划转失败, 请联系客服 | No transfer permission, transfer failed, please contact customer service.
| 1331 | 超出划转精度限制(8位), 请修改后操作 | Exceeds limit of transfer accuracy (8 digits). Please modify it.




# Option WebSocket Reference 

## API List

  Permission |   Content Type   | Request Method |  Type  |  Description                 |  Authentication Required      |                                                                                                                                            
----------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |---------- |---------------------------- |--------------|
 Read  |  Market Data Interface |         market.$contract_code.kline.$period  |      sub        |    Subscribe KLine data           |  No |
 Read  |  Market Data Interface |           market.$contract_code.kline.$period  |              req        |     Request Kline Data|  No  |
 Read  |     Market Data Interface      |  market.$contract_code.depth.$type  |               sub        |       Subscribe Market Depth Data | No | 
 Read  |     Market Data Interface      |  market.$contract_code.depth.size_${size}.high_freq  |               sub        |       Subscribe Incremental Market Depth Data | No | 
 Read  |      Market Data Interface       |  market.$contract_code.detail  |               sub        |    Subscribe Market Detail Data    |   No  |
 Read   |     Market Data Interface        |  market.$contract_code.trade.detail  |               req        |    Request Trade Detail Data |  No|
 Read  |    Market Data Interface         |  market.$contract_code.trade.detail  |        sub |  Subscribe Trade Detail Data | No  | 
 Read   |  System Status Interface         |  public.$service.heartbeat  |    sub  |Subscribe system status updates   | No  | 
 Read|        Trade Interface      |  orders.$symbol-$partition   | sub| Subscribe Order Data  | Yes | 
 Read|        Trade Interface      |  matchOrders.$symbol-$partition   | sub| Subscribe Match Order Data  | Yes | 
 Read |     Account Interface        |  accounts.$symbol-$partition |        sub  |  Subscribe asset change Information of a given coin  | Yes  | 
 Read |      Account Interface      |  positions.$symbol-$partition |        sub  |  Subscribe position change Information of a given coin  | Yes | 

## WebSocket Subscription Address

Market Data Request and Subscription: wss://api.hbdm.com/option-ws 

Order Push Subscription: wss://api.hbdm.com/option-notification

System status updates subscription ：wss://api.hbdm.com/center-notification

If the url: api.hbdm.com can't be accessed, please use the url below:

Market Data Request and Subscription Address: wss://api.btcgateway.pro/option-ws;

Order Push Subscription：wss://api.btcgateway.pro/option-notification

System status updates subscription ：wss://api.btcgateway.pro/center-notification

#### Note: 

- If you have further queries about Huobi Option order push subscription, please refer to [Demo](https://docs.huobigroup.com/docs/option/v1/en/#code-demo)

- If you can't connect "https://api.hbdm.com", please use "https://api.btcgateway.pro" for debug purpose. If your server is deployed in AWS, we recommend using "https://api.hbdm.vn".

## API Rate Limit Illustration

There is rate limit for both public and private interfaces. More details are laid out as below:

- Generally, the private interface rate limit of API key is at most 48 times every 3 seconds for each UID (Trade Interface: at most 24 times every 3 seconds. Read Interface: at most 24 times every 3 seconds) (this rate limit is shared by all the altcoins contracts delivered by different date).

- For public interfaces used to get information of non-market data (such as request information of index, price limit, delivery and settlement, positions, etc.), the rate limit for each IP is 60 times every 3 seconds. (Please note that the 60 times/3s rate limit is shared by all the requests for non-market data under this UID)

- For public interface to get market data such as  Get kline data, Get Market Data Overview, Get Contract Information, Get the last Trade of a Contract and so on：

   (1) For restful interfaces：all products(futures, coin margined swap, usdt margined swap and option) 800 times/second for one IP at most

   (2)  The rate limit for “req” request is 50 times/s at most. No limit for “sub” request as the data will be pushed by server voluntarily. 

- The order push private WebSocket interface requires API Key for authentication.

    Each UID can create 30 WS connections at most for private order push at the same time. The user under this UID only need to subscribe one WS order push for the contracts of the same underlying coins. For example, users only need to create one WS order push connection for BTC Contract, which our system will automatically push orders of BTC weekly, BTC biweekly and BTC quarterly contracts via this connection.

Note: The rate limit of WS order push and RESTFUL private interface are separated from each other with no relations.

- 40 subscriptions at most can be sent in one second in websocket connections.

Response the following strings for “Header” via API

- ratelimit-limit： the upper request limit per time, unit: time

- ratelimit-interval： reset interval(reset the number of request ), unit: ms

- ratelimit-remaining： available request number left in this round, unit: time

- ratelimit-reset： upper limit of reset time used to request number， unit: ms

# Websocket Heartbeat and Authentication Interface

## Market Heartbeat
WebSocket API supports two-way heartbeat. Both Server and Client can send ping message, which the opposite side can return with pong message.

- WebSocket Server sends heartbeat：

`{"ping": 18212558000}`

- WebSocket Client should respond:：

`{"pong": 18212558000}`

Note: Once the WebSocket Client and WebSocket Server get connected, the server will send a heartbeat every 5 seconds (the frequency might change). The connection will get disconnected automatically if the WebSocket Client ignores the heartbeat message for 2 times. The server will remain connection if the WebSocket Client responds one “ping” value within the latest 2 heartbeat messages.

## Order Push Heartbeat

### WebSocket API supports one-way heartbeat. The Server initiates ping message and the Client will return pong message. The Server sends back a heartbeat:

`{`

  `"op": "ping",`
  
  `"ts": "1492420473058"`
  
`}`

- WebSocket Client should return:

`{`

  `"op": "pong",`
  
  `"ts": "1492420473058"`
  
`}`

### Note

- "ts" value in the return "pong" message is the "ts" value from "ping" push Once the WebSocket Client and WebSocket Server connected, Websocket Server will send a heartbeat every 5 seconds (the frequency might change) to Wesocket Client. If WebSocket Client ignores the heartbeat message for 3 times, it will get disconnected with Websocket Sever automatically. Under abnormal conditions, WebSocket Server will return error message like:

`{`

  `"op": "pong"`

  `"ts": "1492420473027",`
  
  `"err-code": 2011,`
  
  `"err-msg": “detailed error message”`

`}`

- Websocket Server disconnects automatically During period of building connection and authentication, Websocket Server will disconnect automatically if there is any error. The data structure before closing pushing are as below:

`{`

  `"op": "close", // indicate Websocket Server disconnected automatically`
   
  `"ts": long   // The local timestamp of Server push`
  
`}`

- Server return error but remain connection After successful authentication, Server will return error but not disconnect if Client provides illegal Op or there is any internal error.

`{`

  `"op": "error", // indicate that receive illegal Op or internal error`
  
  `"ts": long// The local timestamp of Server push`
  
`}`

## Order Push Address

- Huobi Option uses one official address:

  `wss://api.hbdm.com/option-notification`

#### Note: 

- If you can't connect "https://api.hbdm.com", please use "https://api.btcgateway.pro" for debug purpose. If your server is deployed in AWS, we recommend using "https://api.hbdm.vn".

- Please note that the WS request connection should not go over 30 normally.

### Data Compression

All response data from WebSocket server are compressed into GZIP format. Clients have to decompress them for further use.

### Illustration of Request(req and rep) Data

- Character Encoding：UTF-8

- Case sensitive，including parameter name and return parameter

- Data type： use JSON to transmit data

- All request data has fixed format. Please note that Huobi Option API document will only focus on data illustration in non-fixed format.

> Request data format is laid out as below:

```

  {
  "op": string, // Required; Client requests operator name (Server will returns the same value), For detailed operator name list, please refer to the appendix
  "cid": string, // Optional;Request unique ID( Client generate a unique ID which server will return the same value)
  // Others required/ Optional string
  }

```

> All responses push data will be returned in fixed format，Huobi Option API document will only focus on data illustration， Response data format is laid out as below；

```
   
  {
  "op": string, // Required; Clients request operator name
  "cid": string, // optional; Client requests unique ID
  "ts": long, // required; Server responds local timestamp
  "err-code": integer, // required; return error code, “0” means successfully responded, others means error. For detailed return error code list, please refer to appendix
  "err-msg": string, only responds error message when error occurs, detailed error information. 
  "data": object // optional; return data object， request valid data after error removed 
  }
  
 ```

>  Push Data Format is laid out as below:

```

  {
  "op": "string", // required;Server pushes operator name, For detailed operator type list, please refer to appendix
  "ts": long, // required; Server pushes local timestamp
  "data": object // required;返return data object
  }
  
```

## Server voluntarily disconnects connection

During making connection and authentication, server will disconnect connection automatically when error occurs. Before disconnecting, server will send notification below,

`{`

  `"op": "close", // represents server disconnect connection voluntarily
   
  `"ts": long   // Server pushes local timestamp
  
`}`


## Server return error code but remain connection

After authentication, if clients encountered internal error or request data out from Operator List, WebSocket server will return error message. But server will remain connection

`{`

  `"op": "error", // means server receive data out from Operator List or clients got internal error `
  
  `"ts": long// Server pushes local timestamp`
  
`}`

## Authentication

Clients can create Access Key and Secret Key on Huobi which Access Key is the API access key kept by the client.  The Secret Key is used to sign the request (available only for request). To apply/change API key, please go to “Account-API Management” on Huobi Option. Make name for the API Key and click “create” to finish. It’s optional to bind IP address to the API Key.

For the Trade WebSocket interface, server have to do authentication for topics require authentication before making connection. 

Note: These two keys are closely related to account security and should not be disclosed to others at any time.

### Authentication Format Example:

`{`

  `"op": "auth",`
  
  `"type": "api",`
  
  `"AccessKeyId": "e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx",`
  
  `"SignatureMethod": "HmacSHA256",`
  
  `"SignatureVersion": "2",`
  
  `"Timestamp": "2017-05-11T15:19:30",`
  
  `"Signature": "4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=",`
  
`}`


### Illustration on Authentication Format Data

| Field        | type  | Description                                                         |
| --------------- | ----- | ----------------------------------------------------------- |
| op               | string | required； Operator type， Requested authentication operator type is auth                             |
| type             | string | required； Signature method  sign via API means API interface signature, sign via ticket means terminal signature        |
| cid              | string | Optional； Client requests the unique ID                                      |
| AccessKeyId      | string |required if users use API signature； API Access key is the API AccessKey you applied. |
| SignatureMethod  | string | required if users use API signature； Signature method, user computes signature basing on the protocol of hash ,the API uses HmacSHA256 |
| SignatureVersion | string | required if the users use API signature； the signature protocol version, the API uses 2           |
| Timestamp        | string | required if users use API signature； timestamp, the time you request(UTC timezone)  this value can help to avoid request data interception by the third party for example ：2017-05-11T16:22:06 (UTC time zone)
|  Signature        | string | required if the users use API signature； signature, the value computed is ensure valid authentication without being tampered |
| ticket           | string | required if users use ticket signature ； return when logged in                            |

#### Notice：

- To decrease API access rate, the WebSocket server uses the same signature algorithm with that on REST API 

- All data is case sensitive;

- When type is api, In API authentication, parameter op, type, cid, Signature do not participate in operation.

- The request method in signature's method is GET, the other parameter please refer to REST api document

#### Signature Illustration：

Example on Signature Computing Process:，

- Request code requirement for signature computing. Because it can return to total different data with different content when using HMAC for signature computing; Before signature computing, clients need to sign by following the standard format.


- Request Method (GET or POST), add newline character `\n` after URL

  `GET\n`

- add visit address with lowercase letters, add newline characters `\n` after URL

  `api.hbdm.com\n`

- Access path, adding newline character `\n` after URL

  `/option-notification\n`

- Sequence the parameter name according to ASCII code (use UTF-8 and transfer into URI encoding, capital letters for hexadecimal characters. E.G.: ‘:’ will be encoded into '%3A', blank will be encoded into '%20'). Here is an encoding example below for request parameters

  `AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`
  

- Connect all parameters with ’&’ according to the sequence above.
 
- The final strings for signature computing created by following the steps as below:
  
 Signature Computing, transmit the two parameters below into cryptographic hash: strings needed to be computed, API SecretKey. Get the signature computing result and get it encoded with Base 64 code standard. 

Add computed value into the Signature parameter in API request. Please note  the computed value SHOULD NOT be encoded into URL cdoe.
  
  

### Authentication Response Format Illustration

| Field    | type    | description                                                |
| ------- | ------ | --------------------------------------------------- |
| op       | string  | required； Operator type， Authentication response type is auth                    |
| type     | string  | required； Return data according to the requested parameters                       |
| cid      | string  | optional； Return data when “cid” string requested                          |
| err-code | integer | 0 means successfully response, others means response failure  return 0 if success , For detailed Response code（Err-Code）, please refer to appendix  |
| err-msg  | string  | optional， response detailed error code when error occurs                         |
| ts       | long    |  server responds timestamp                                |
| user-id  | string    |  client ID                                           |

> Example of A Success Authentication Response

```json
 
{
  "op": "auth",
  "type":"api",
  "ts": 1489474081631,
  "err-code": 0,
  "data": {
    "user-id": "123456789"
  }
}

```

> Example of Authentication Response with Error

```

{
"op": "auth",
"type":"api",
"ts": 1489474081631, 
"err-code": xxxx， 
"err-msg": ”Error details “
}

```
 
 
#  WebSocket Market Interface

## Subscribe Kline data

### To subscribe Kline data, clients have to connect WebSocket API server and send subscribe request with the format below：

`{`

  `"sub": "market.$contract_code.kline.$period",`

  `"id": "id generate by client"`

`}`

> Example of a successful subscription request：

```json

    {
    "sub": "market.BTC-USDT-201225-C-13000.kline.1min",
    "id": "id1"
    }

```

###  Request Parameter

| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| sub      | true     | string | the themes that need to be subscribed; the interface is fixed at: market.$contract_code.kline.$period，For parameter details please check sub Subscribe Parameter Rules|          |
| id       | false    | string | id automatically generated by the business party                                           |          |

####  subSubscribeParameter Rules

| Parameter Name      | Mandatory | Type   | Desc     | Value Range                                               |
| ------------- | -------- | ------ | -------- | ------------------------------------------------------ |
| contract_code | true     | string | Contract Code | "BTC-USDT-201225-C-13000" ...                           |
| period        | true     | string | kline Type  | 1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon |

> After subscription, clients can receive updates upon any change. Example:

 Example for returning data after subscription successful

```json
    {
    "id": "id1",
    "status": "ok",
    "subbed": "market.BTC-USDT-201225-C-13000.kline.1min",
    "ts": 1489474081631
    }
```

 Then everytime when kline is updated, clients will receive data. Example:

```json

{
    "ch":"market.BTC-USDT-201225-C-13000.kline.15min",
    "ts":1604900702590,
    "tick":{
        "id":1604900700,
        "mrid":125344032,
        "open":2897.25,
        "close":2897.25,
        "high":2897.25,
        "low":2897.25,
        "amount":0,
        "vol":0,
        "trade_turnover":0,
        "count":0
    }
}
```

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| -------------- | -------- | ------- | ----------------------------------------------------- | -------------------- |
| ch             | true     | string  | Data belonged channel                                    | Format:  market.period |
| ts             | true     | long    | Time of Response Generation, unit: millisecond                            |                      |
| \<tick\>         | true     | object  |                                                       |                      |
| id             | true     | long    | kline id,the same as kline timestamp, kline start timestamp               |                      |
| mrid           | true     | long    | Order ID                                                |                      |
| vol            | true     | decimal | Trading Volume(cont)                                            |                      |
| count          | true     | decimal | Filled orders quantity                                              |                      |
| open           | true     | decimal | Opening Price                                                |                      |
| close          | true     | decimal | Closing price, the price in the last kline is the latest price              |                      |
| low            | true     | decimal | Lowest Price                                                |                      |
| high           | true     | decimal | Highest Price                                                |                      |
| amount         | true     | decimal | Trading Amount(cont), that is (Trading Volume(cont)* contract face value)               |                      |
| trade_turnover | true     | decimal | Trading amount，that is the sum of (Filled conts of a single order *Contract Face value *Transaction Price) |                      |
| \</tick\>        |          |         |                                                       |                      |




## Request Kline data

### To request Kline data, clients have to make connection to WebSocket API Server and send subscribe request in the format below：


`{`
   
  `"req": "market.$contract_code.kline.$period",`
        
  `"id": "id generated by client",`

  `"from": " type: long, point-in-time from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00，unit: second",`
        
  `"to": "type: long, point-in-time from 2017-07-28T00:00:00+08:00 to 2050-01-01T00:00:00+08:00，unit: second，shall greater than from"`

`}`

> Example of Kline Data Subscription Request：

`>Request kline Data & Request Parameter

```json
{
  "id": "id1",
  "req": "market.BTC-USDT-201225-C-13000.kline.60min",
  "from": 1579247342,
  "to": 1579247342
}
```

###  Request Parameter

| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| req      | true     | string | Theme for Requesting Data; the interface is fixed at: market.$contract_code.kline.$period; for details of Parameter please check req Request Parameter Rules |          |
| id       | false    | string | id generated automatically by the business party                                       |          |
| from     | true     | long   | Start Time                                                     |          |
| to       | true     | long   | End Time                                                     |          |

####  req Request Parameter Rules

| Parameter Name      | Mandatory | Type   | Desc     | Value Range                                               |
| ------------- | -------- | ------ | -------- | ------------------------------------------------------ |
| contract_code | true     | string | Contract Code | "BTC-USDT-201225-C-13000" ...                           |
| period        | true     | string | kline Type  | 1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon |

#### Note
[t1, t5] assume there is kline from t1 to t5: 

from: t1, to: t5, return [t1, t5].

from: t5, to: t1, which t5 > t1, return [].

from: t5, return [t5].

from: t3, return [t3, t5].

to: t5, return [t1, t5].

from: t which t3 < t <t4, return [t4, t5].

to: t which t3 < t <t4, return [t1, t3].

from: t1 and to: t2, should satisfy 1325347200 < t1 < t2 < 2524579200.

At most 2000 at a time.

Return data as below:

```json

{
    "id":"id1",
    "rep":"market.BTC-USDT-201225-C-13000.kline.60min",
    "wsid":4203781398,
    "status":"ok",
    "data":[
        {
            "id":1602691200,
            "open":630,
            "close":630,
            "low":630,
            "high":630,
            "amount":0,
            "vol":0,
            "trade_turnover":0,
            "count":0
        },
        {
            "id":1602694800,
            "open":630,
            "close":630,
            "low":630,
            "high":630,
            "amount":0,
            "vol":0,
            "trade_turnover":0,
            "count":0
        }
    ]
}
```

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| -------------- | -------- | ------------ | ----------------------------------------------------- | -------- |
| id             | true     | string       | Request ID                                                |          |
| rep            | true     | string       | Request Parameter                                              |          |
| status         | true     | string       | Status                                                  |          |
| wsid           | true     | long         | wsid                                                  |          |
| \<data\>         | true     | object array |                                                       |          |
| id             | true     | long         | kline id,the same as kline timestamp, kline start timestamp             |          |
| open           | true     | decimal      | Opening Price                                                |          |
| close          | true     | decimal      | Closing price, the price in the last kline is the latest price              |          |
| low            | true     | decimal      | Lowest Price                                                |          |
| high           | true     | decimal      | Highest Price                                                |          |
| amount         | true     | decimal      | Trading Amount (coin), that is (Trading Amount(cont)* contract face value)               |          |
| trade_turnover | true     | decimal      |  Trading amount，that is the sum of（Filled conts of a single order *Contract Face value *Transaction Price） |          |
| vol            | true     | decimal      | Trading Volume (cont)                                            |          |
| count          | true     | decimal      |  Filled order quantity                                               |          |
| \</data\>        |          |              |                                                       |          |

## Subscribe Market Depth Data

### To subscribe market depth data, clients have to make connection to WebSocket API Server and send subscribe request in the format below：

`{`

  `"sub": "market.$contract_code.depth.$type",`

  `"id": "id generated by client"`

`}`

>Example of Subscribe Request Parameter: 

```json
{
  "sub": "market.BTC-USDT-201225-C-13000.depth.step0",
  "id": "id5"
}
```

###  Request Parameter
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| sub      | true     | string | Theme for Requesting Data; the interface is fixed at: market.$contract_code.depth.$type; for details of Parameter please check subSubscribe Parameter Rules |          |
| id       | false    | string | id generated automatically by the business party                                       |          |

####  SubscribeParameter Rules
| Parameter Name      | Mandatory | Type   | Desc       | Value Range                                                     |
| ------------- | -------- | ------ | ---------- | ------------------------------------------------------------ |
| contract_code | true     | string | Contract Code   | "BTC-USDT-201225-C-13000" ...                                 |
| type          | true     | string | Depth Type | Get depth data within Step 150 using step0, step1, step2, step3, step4, step5，step14，step15（step1 to step5 and step14, step15 are the depth after depth merging），When the step is 0, get step150 data without depth merged; Get step 20 data using step6, step7, step8, step9, step10, step11, step12, step13（step7 to step13 are the depth after merging)，when using step 6，get step 20 data without depth merged|

#### Note

 - When users select "Merge Depth", open orders of a certain precision will be merged and displayed. "Merge Depth" only affects the display mode, not the actual transaction price. 

 - the precisions correspond to the Depth type fields are as below:

| Step  | Depth Type    | Precision       | 
| ----- | ------------- | ---------- |
| Step 150 | step0         | Depth not merged |
| Step 150 | step1  | 0.00001    |
| Step 150 | step2  | 0.0001     |
| Step 150 | step3  | 0.001      |
| Step 150 | step4 | 0.01       |
| Step 150 | step5 | 0.1        |
| Step 150 | step14        | 1          |
| Step 150 | step15        | 10         |
| Step 20  | step6         | Depth not merged |
| Step 20  | step7         | 0.00001    |
| Step 20  | step8         | 0.0001     |
| Step 20  | step9         | 0.001      |
| Step 20  | step10        | 0.01       |
| Step 20  | step11        | 0.1        |
| Step 20  | step12        | 1          |
| Step 20  | step13        | 10         |


> Whenever depth is updated, the clients will receive data as following: 

```json

{
    "ch":"market.BTC-USDT-201225-C-13000.depth.step0",
    "ts":1604901962322,
    "tick":{
        "mrid":125686472,
        "id":1604901962,
        "bids":[
            [
                2746.4,
                535
            ],
            [
                2723.89,
                520
            ]
        ],
        "asks":[
            [
                2881.38,
                498
            ],
            [
                2911.03,
                499
            ]
        ],
        "ts":1604901962321,
        "version":1604901962,
        "ch":"market.BTC-USDT-201225-C-13000.depth.step0"
    }
}
```

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| -------- | -------- | ------ | ------------------------------------------------------ | -------------------- |
| ch       | true     | string | Data belonged channel                                     | Format:  market.period |
| ts       | true     | long   | Time of Respond Generation, unit: millisecond                             |                      |
| \<tick\>   | true     | object |                                                        |                      |
| mrid     | true     | long   | OrderID                                                 |                      |
| id       | true     | long   | ID                                                     |                      |
| asks     | true     | array  | Sell order book,[price( maker price), vol (conts of open orders at this price)], price in ascending order|                      |
| bids     | true     | array  | Buy order book,[price( maker price), vol( conts of open orders at this price)], price in descending order |                      |
| ts       | true     | long   | Time of Respond Generation, unit: millisecond                             |                      |
| version  | true     | long   | Version Number                                                 |                      |
| ch       | true     | string | Data belonged channel                                     | Format:  market.period |
| \</tick\>  |          |        |                                                        |                      |



## Subscribe Incremental Market Depth Data

### To subscribe incremental market depth data, clients have to make connection to WebSocket API Server and send subscribe request in the format below：

{

"sub": "market.$contract_code.depth.size_${size}.high_freq",

"data_type":"incremental",

"id": "id generated by client"

}


>Example for subscribing Request Parameter::

```json
{
  "data_type": "incremental",
  "sub": "market.BTC-USDT-201225-C-13000.depth.size_150.high_freq",
  "id": "id1"
}
```

###  Request Parameter
| Parameter Name  | Mandatory | Type   | Desc                                                         | Value Range                                                     |
| --------- | -------- | ------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| sub       | true     | string | Theme for Requesting Data，the interface is fixed at: market.$contract_code.depth.size_${size}.high_freq, for details of Parameter please check subSubscribe Parameter Rules |                                                              |
| id        | false    | string | id generated automatically by the business party                                       |                                                              |
| data_type | false    | string | Data Type                                                     | Default full data if not filled，"incremental": Incremental Data，"snapshot": Full Data |

### Subscribe Parameter Rules
| Parameter Name       | Mandatory | Type   | Desc     | Value Range                                           |
| -------------- | -------- | ------ | -------- | -------------------------------------------------- |
| $contract_code | true     | string | Contract Code | eg"BTC-USDT-201225-C-13000"。              |
| size           | true     | string | step   | 20: represents depth within step 20 without merging,  150: represents depth within step 150 without merging,   |

#### Note
When users select "Merge Depth", open orders of a certain precision will be merged and displayed. "Merge Depth" only affects the display mode, not the actual transaction price. 


> Whenever depth has incremental updates, clients will receive data as below:

```json

{
    "ch":"market.BTC-USDT-201225-C-13000.depth.size_20.high_freq",
    "tick":{
        "asks":[
            [
                2891.92,
                509
            ],
            [
                2922.58,
                499
            ]
        ],
        "bids":[
            [
                2732.53,
                535
            ],
            [
                2710.12,
                520
            ]
        ],
        "ch":"market.BTC-USDT-201225-C-13000.depth.size_20.high_freq",
        "event":"snapshot",
        "id":125696596,
        "mrid":125696596,
        "ts":1604902337523,
        "version":1511997
    },
    "ts":1604902337523
}
```

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| -------- | -------- | ------ | ------------------------------------------------------ | ------------------------------------------------------------ |
| ch       | true     | string | Data belonged channel                                     | Format:  market.period                                         |
| ts       | true     | long   | Time of Respond Generation, unit: millisecond                             |                                                              |
| \<tick>   | true     | object |                                                        |                                                              |
| mrid     | true     | long   | OrderID                                                 |                                                              |
| id       | true     | long   | ID                                                     |                                                              |
| asks     | true     | array  | Sell order book,[price( maker price), vol( conts of open orders at this price)], price in ascending order|                                                              |
| bids     | true     | array  | Buy order book,[price( maker price), vol(conts of open order at this price)], price in descending order |                                                              |
| ts       | true     | long   | Time of Respond Generation, unit: millisecond                             |                                                              |
| version  | true     | long   | Version Number                                                 |                                                              |
| ch       | true     | string | Data belonged channel                                     | Format:  market.period                                         |
| event    | true     | string | Event Type；                                             | "update": update,  push incremental data within step 20 or step 150 of Buy and sell order book respectively without depth merging; "snapshot": snapshot，push full data within step 20 or step 150 of Buy and sell order book respectively without merging; |
| \</tick>  |          |        |                                                        |                                                              |

#### Note

1. when "data_type" is incremental, the "event" that first pushed is the data of "snapshot". And when resend subscription request, the data returned at the first time is "snapshot" data;

2. version（Version number）. It is a serial number in ascending order, which increases by 1 every time. No matter incremental data or full data, every connection is unique. The version connected may be different for multiple websocket.

3. Order book will be checked every 30 ms. If there is an update, the system will push to you; if not, you will not receive any push data.

4. If it is incremental data, you have to maintain local orderbook bids/ asks data.


## Subscribe Market Detail Data

### To subscribe market details, the clients have to make connection to WebSocket Server and send subscribe request in the format below:

`{`

`"sub": "market.$contract_code.detail",`

`"id": "id generated by client"`

`}`

> Example for subscribing Request Parameter:

```json

{
  "id": "111",
  "sub": "market.BTC-USDT-201225-C-13000.detail"
}
```

###  Request Parameter
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| sub      | true     | string | Theme for requesting data, the interface is fixed at: market.$contract_code.detail，for details of Parameter please check subSubscribe Parameter Rules|          |
| id       | false    | string | id generated automatically by the business party                                       |          |

#### subSubscribe Parameter Rules
| Parameter Name      | Mandatory | Type   | Desc     | Value Range                                           |
| ------------- | -------- | ------ | -------- | -------------------------------------------------- |
| contract_code | true     | string | Contract Code | eg"BTC-USDT-201225-C-13000". |

> Whenever Market Detail updates, clients will receive data as below: 

```json

{
    "ch":"market.BTC-USDT-201225-C-13000.detail",
    "ts":1604902200630,
    "tick":{
        "id":1604902200,
        "mrid":125693341,
        "open":2897.25,
        "close":2897.25,
        "high":2897.25,
        "low":2897.25,
        "amount":0.176,
        "vol":176,
        "trade_turnover":439.20704,
        "count":3,
        "bid":[
            13684.5,
            10615
        ],
        "ask":[
            13684.6,
            3440
        ]
    }
}
```

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| -------------- | -------- | ------- | ----------------------------------------------------- | -------------------- |
| ch             | true     | string  | Data belonged channel                                    | Format:  market.period |
| ts             | true     | long    | Time of Respond Generation, unit: millisecond                            |                      |
| \<tick>         | true     | object  |                                                       |                      |
| id             | true     | long    | ID                                                    |                      |
| mrid           | true     | long    | Order ID                                                |                      |
| open           | true     | decimal | Opening Price                                                |                      |
| close          | true     | decimal | Closing price, the price in the last kline is the latest price              |                      |
| high           | true     | decimal | Highest Price                                                |                      |
| low            | true     | decimal | Lowest Price                                                |                      |
| amount         | true     | decimal | Trading Amount(coin)，that is (Trading Amount(conts)*Contract face value)               |                      |
| vol            | true     | decimal | Trading Volume (conts)，the sum of bilateral trading volume.                      |                      |
| trade_turnover | true     | decimal | Trading amount, that is the sum（Filled conts of a single order*Contract face value*Transaction Price） |                      |
| count          | true     | decimal |  Filled orders quantity                                               |                      |
| ask  | true | array |Sell,[price(Ask price), vol(Ask orders (cont.) )] | | 
| bid  | true| array | Buy,[price(Bid price), vol(Bid orders(Cont.))] | |   
| \</tick>        |          |         |                                                       |                      |

#### Note:
 - Bid price(p1) and ask price(p1) are not updated in real time, there will be some delay (about 500ms).


## Request Trade Detail Data

### To request Trade detail data, Clients have to make connection to the WebSocket Server and send request data in the format below：

`{`
     
   `"req": "market.$contract_code.trade.detail",`
    
   `"id": "id generated by client"`  // “id” string is optional currently. Server will return with null because client ID is not necessary
    
`}`

Return to the current trade detail data only

> Example for subscribing Request Parameter:

```json
{
  "id": "160943040012341",
  "size": 50,
  "req": "market.BTC-USDT-201225-C-13000.trade.detail"
}
```

###  Request Parameter
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| req      | true     | string | Theme for requesting data, the interface is fixed at:market.$contract_code.trade.detail，for details of parameter please check reqRequest Parameter Rules |          |
| id       | false    | string | id generated automatically by the business party                                       |          |
| size     | false    | int    | number of data; no more than 50; default 50 if not filled                                      |          |

####  Request Parameter
| Parameter Name      | Mandatory | Type   | Desc     | Value Range                                           |
| ------------- | -------- | ------ | -------- | -------------------------------------------------- |
| contract_code | true     | string | Contract Code | eg"BTC-USDT-201225-C-13000". |

### Note
 - Only return current Trade Detail.

>Return data as below:

```json

{
    "data":[
        {
            "amount":"6",
            "ts":1603869385244,
            "id":991487430000,
            "price":"1542.78",
            "direction":"sell",
            "quantity":"0.006",
            "trade_turnover": "9.032"
        },
        {
            "amount":"40",
            "ts":1603889690205,
            "id":996663430000,
            "price":"1300",
            "direction":"sell",
            "quantity":"0.04",
            "trade_turnover": "52.32"
        }
    ],
    "id":"160943040012341",
    "rep":"market.BTC-USDT-201225-C-13000.trade.detail",
    "status":"ok",
    "ts":1604902521584
}
```

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------- | -------- | ------------ | ------------------ | ----------------------------------------- |
| rep       | true     | string       | Data belonged channel | Format:  market.$contract_code.trade.detail |
| status    | true     | string       | Return Statu           |                                           |
| id        | true     | string       | Return ID                 |                                           |
| \<data>    | true     | object array |                    |                                           |
| id        | true     | long         | Unique Transaction Id(symbol level)              |                                           |
| price     | true     | string       | Price               |                                           |
| amount    | true     | string       | Quantity (cont)         |                                           |
| direction | true     | string       | The direction to buy or sell is the direction of the taker (active transaction)   |                                           |
| ts        | true     | long         | OrderTransaction Time     |                                           |
| quantity     | true | string | trading quantity(coin)       |      |
| trade_turnover     | true | string | trading amount(quoted currency)    |      |
| \</data>   |          |              |                    |                                           |
| ts        | true     | long         | server response time     |                                           |

#### Notice
- There are "quantity" parameter in return data only after 21:00:00 on February 3, 2021


## Subscribe Trade Detail Data 

### To subscribe trade detail data, the Client has to make connection to the Server and send subscribe request in the format below：

`{`
 
  `"sub": "market.$contract_code.trade.detail",`
    
  `"id": "id generated by client"`
    
`}`

>Example for subscribing Request Parameter:

```json
{
  "id": "160943040012341",
  "Sub": "market.BTC-USDT-201225-C-13000.trade.detail"
}
```

###  Request Parameter
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| sub      | true     | string | Theme for requesting data, the interface is fixed at:market.$contract_code.trade.detail，for details of Parameter please check subSubscribe Parameter Rules|          |
| id       | false    | string | id generated automatically by the business party                                       |          |

####  subSubscribeParameter Rules
| Parameter Name      | Mandatory | Type   | Desc     | Value Range                                           |
| ------------- | -------- | ------ | -------- | -------------------------------------------------- |
| contract_code | true     | string | Contract Code | eg"BTC-USDT-201225-C-13000". |

>Whenever trade detail is updated, clients will receive data as below:

```json

{
    "ch":"market.BTC-USDT-201225-C-13000.trade.detail",
    "ts":1604888281270,
    "tick":{
        "id":125344032,
        "ts":1604888281258,
        "data":[
            {
                "amount":2,
                "ts":1604888281258,
                "id":1253440320000,
                "price":2897.25,
                "direction":"buy",
                "quantity":0.002,
                "trade_turnover": 5.632
            }
        ]
    }
}
```

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------- | -------- | ------------ | -------------------------- | -------------------- |
| ch        | true     | string       | Data belonged channel         | Form:  market.period |
| ts        | true     | long         | Time of Respond Generation, unit: millisecond |                      |
| \<tick>    | true     | object       |                            |                      |
| id        | true     | long         | Unique Order Id(symbol level)                   |                      |
| ts        | true     | long         | Server response time                  |                      |
| \<data>    | true     | object array |                            |                      |
| amount    | true     | decimal      | Quantity (cont)                 |                      |
| ts        | true     | long         | Server response time                  |                      |
| id        | true     | long         | Unique Transaction Id(symbol level)                 |                      |
| price     | true     | decimal      | Price                      |                      |
| direction | true     | string       | The direction to buy or sell is the direction of the taker (active transaction)     |                      |
| quantity     | true | decimal | trading quantity(coin)       |      |
| trade_turnover     | true | decimal | trading amount(quoted currency)    |      |
| \</data>   |          |              |                            |                      |
| \</tick>   |          |              |                            |                      |


# Orders and Accounts WebSocket Interfaces

## Subscribe Order Data(sub)

#### After successfully connected with the WebSocket API, send the data in following format to the server to subscribe data:

###  Example
 
`{`
 
  `"op": "sub",`
  
  `"topic": "orders.$symbol-$partition",`
    
  `"cid": "id generated by client"`
    
`}`


> Example of Subscribe Request Parameter:

```json
{
    "op": "sub",
    "topic": "orders.btc-usdt",
    "cid": "40sG903yz80oDFWr"
}
```

###  Request Parameter
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string |Fixed value of subscription is sub                                            |          |
| cid      | false    | string | Client Request Unique ID                                           |          |
| topic    | true     | string | Subscribe Theme Name; must fill in (orders.$symbol-$partition) subscription, cancel order filled info subscription of a certian coin;  $symbol-$partition is “Coin Code-Trade Partition”（BTC-USDT, ETH-USDT...），If the value is * , all options contracts will be subscribed; |          |


> Whenever there is an order filled, clients will receive data as below:

```json

{
    "op":"notify",
    "topic":"orders.btc-usdt",
    "uid":"123456789",
    "ts":1604903121972,
    "symbol":"BTC",
    "contract_type":"quarter",
    "contract_code":"BTC-USDT-201225-C-13000",
    "volume":1,
    "price":2752.58,
    "order_price_type":"opponent",
    "direction":"sell",
    "offset":"close",
    "status":6,
    "order_id":775365420395126784,
    "order_id_str":"775365420395126784",
    "client_order_id":null,
    "order_source":"web",
    "order_type":1,
    "created_at":1604903121809,
    "canceled_at":0,
    "trade_volume":1,
    "trade_turnover":2.75258,
    "fee":-0.005,
    "trade_avg_price":2752.58,
    "margin_frozen":0,
    "profit":-0.14467,
    "trade_partition":"USDT",
    "delivery_date":"20201225",
    "option_right_type":"C",
    "exercise_price":13000,
    "quote_asset":"USDT",
    "premium_frozen":0,
    "fee_frozen":0,
    "fee_asset":"USDT",
    "margin_asset":"BTC",
    "trade":[
        {
            "id":"125715777-775365420395126784-1",
            "trade_id":125715777,
            "trade_volume":1,
            "trade_price":2752.58,
            "trade_fee":-0.005,
            "trade_turnover":2.75258,
            "created_at":1604903121857,
            "role":"taker",
            "fee_asset":"USDT"
        }
    ]
}
```

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ---------------- | -------- | ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| op               | true     | string       | Operation Name, fixed push value is notify;                               |                                                              |
| topic            | true     | string       | Push Theme                                                  |                                                              |
| ts               | true     | long         | Server responses timestamp                                           |                                                              |
| uid              | true     | string       | User uid                                                      |                                                              |
| symbol           | true     | string       | Coin Code                                                     | "BTC","ETH"...                                               |
| trade_partition  | true     | string       | Trade Partition                                                     | "USDT"                                                       |
| contract_type    | true     | string       | ContractType                                                     |                                                              |
| contract_code    | true     | string       | Contract Code                                                     | BTC-USDT-201225-C-13000                                       |
| volume           | true     | decimal      | Order Quantity                                                     |                                                              |
| price            | true     | decimal      | Order Price                                                     |                                                              |
| order_price_type | true     | string       | Order Type                                                 | "limit":Limit Order，"opponent":BBO，"lightning":Flash close，"optimal_5":Optimal 5，"optimal_10":Optimal 10，"optimal_20":Optimal 20，"fok": FOK Order，"ioc": IOC Order, "opponent_ioc": BBO-IOC，"lightning_ioc": Flash close-IOC，"optimal_5_ioc": Optimal 5-IOC，"optimal_10_ioc": Optimal 10-IOC，"optimal_20_ioc": Optimal 20-IOC，"opponent_fok":  FOK order using BBO price，"lightning_fok": Flash close-FOK，"optimal_5_fok": Optimal 5-FOK，"optimal_10_fok": Optimal 10-FOK，"optimal_20_fok": Optimal 20-FOK |
| direction        | true     | string       | Buy/Sell Direction                                                     | "buy":Buy "sell":Sell                                           |
| offset           | true     | string       |Open/Close Direction                                                    | "open":open "close": close                                         |
| status           | true     | int          | Order Status                                                     | 1:To submit 2:To submit 3:Submitted 4:Partial filled 5:Partial filled orders have been deleted 6:All filled 7:Deleted |
| order_id         | true     | long         | Order ID                                                       |                                                              |
| order_id_str     | true     | string       | Order ID in string format                                           |                                                              |
| client_order_id  | true     | long         | User OrderID                                                   |                                                              |
| order_source     | true     | string       | Order Source                                                     | system、web、api、m、risk、settlement、ios、android、windows、mac、trigger |
| order_type       | true     | int          | Order Type                                                     | 1:Place an order,  2:Cancel an order, 4:Delivery                                    |
| created_at       | true     | long         | Order Create Time                                                 |                                                              |
| trade_volume     | true     | decimal      | Trading Volume                                                     |                                                              |
| trade_turnover   | true     | decimal      | Total Trading Amount                                                   |                                                              |
| fee              | true     | decimal      | Transaction Fee                                                       |                                                              |
| trade_avg_price  | true     | decimal      | Transaction Average Price                                                     |                                                              |
| margin_frozen    | true     | decimal      | Frozen Margin                                                |                                                              |
| margin_asset     | true     | decimal | Margin Coin                       |                                                              |
| profit           | true     | decimal      | Profit                                                         |                                                              |
| canceled_at      | true     | long         | Cancel Time                                                     |                                                              |
| delivery_date     | true     | string  | Delivery Date                               | eg"20200508"                                                 |
| option_right_type | true     | string  | Options Type                         | C:Call options P:Put options                                        |
| exercise_price    | true     | decimal | Strike Price                              |                                                              |
| quote_asset       | true     | string  | Quote Coin                             | eg"USDT"                                                     |
| premium_frozen    | true     | decimal | Frozen Premium                          |                                                              |
| fee_frozen        | true     | decimal | Frozen Transaction Fee                           |                                                              |
| fee_asset        | true     | string       | Transaction Fee coin                                                   |                                                              |
| \<trade\>        | true     | object array |                                                              |                                                              |
| id               | true     | string       |  Unique transaction id, because match_id is not unique, the specific method is to use trade_id and id as joint primary key and splice it into a unqiue transaction ID. |                                                              |
| trade_id         | true     | long         | trade_id is not unique, note: a trade_id includes all transaction records of a taker order and N maker orders. If a taker order matches with N maker orders, the N transactions will share tha same trade_id.  |                                                              |
| trade_volume     | true     | decimal      | Trading Volume                                                       |                                                              |
| trade_price      | true     | decimal      | Match Price                                                    |                                                              |
| trade_fee        | true     | decimal      | Transaction Fee                                                   |                                                              |
| trade_turnover   | true     | decimal      | Transaction Amount                                                     |                                                              |
| created_at       | true     | long         | Trade Creation Time                                                 |                                                              |
| role             | true     | string       | taker or maker                                                 |                                                              |
| fee_asset        | true     | string       | Transaction Fee coin                                                   |                                                              |
| \</trade\>       |          |              |                                                              |                         

## Unsubscribe Order Data（unsub）

#### After successfully connected with the WebSocket API, sending the data in following format to the server to cancel data subscription:

###  Example

`{`
 
  `"op": "unsub",`
  
  `"topic": "orders.$symbol-$partition",`
    
  `"cid": "id generated by client"`
    
`}`


> Example for subscribing Request Parameter:

```json
{
  "op": "unsub",
  "topic": "orders.btc-usdt",
  "cid": "40sG903yz80oDFWr"
}
```

###  Cancel SubscriptionRequest Parameter
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string | Fixed value of cancel subscription is unsub                                    |          |
| cid      | false    | string | Client Request Unique ID                                           |          |
| topic    | true     | string | Subscribe Theme Name; must fill in (orders.$symbol-$partition) subscription, cancel order filled info subscription of a certian coin; $symbol-$partition is “Coin Code-Trade Partition”（BTC-USDT、ETH-USDT...），If the value is * , all options contracts will be subscribed; |          |


###  Subscribe & Cancel Subscription Rules

| Subscribe(sub)               | Cancel Subscription(ubsub)         | Rule   |
| ----------------------- | ----------------------- | ------ |
| orders.*                | orders.*                | Allowed   |
| orders.symbol1-partion1 | orders.*                | Allowed   |
| orders.symbol1-partion1 | orders.symbol1-partion1 | Allowed   |
| orders.symbol1-partion1 | orders.symbol2-partion1 | Not Allowed |
| orders.*                | orders.symbol1-partion1 | Not Allowed |



## Subscribe Match Order Data（sub)


#### After successfully connected with the WebSocket API, sending the data in following format to the server to subscribe data:

###  Example

`{`
 
  `"op": "sub",`
  
  `"topic": "matchOrders.$symbol-$partition",`
    
  `"cid": "id generated by client"`
    
`}`


> Example for subscribing request parameter:

```json
{
    "op": "sub",
    "topic": "matchOrders.btc-usdt",
    "cid": "40sG903yz80oDFWr"
}
```

###  Request Parameter
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string |Fixed value of subscription is sub                                            |          |
| cid      | false    | string | Client Request Unique ID                                           |          |
| topic    | true     | string | Subscribe Theme Name; must fill in (matchOrders.$symbol-$partition) Subscription, cancel match order filled info subscription for a certain coin;$symbol-$partition is “Coin Code-Trade Partition”（BTC-USDT、ETH-USDT...），If the value is * , all options contracts will be subscribed; |          |


> Whenever filled orders change, the clients will receive the data as below:

```json

{
    "op":"notify",
    "topic":"matchOrders.btc-usdt",
    "ts":1604903121879,
    "uid":"123456789",
    "symbol":"BTC",
    "trade_partition":"USDT",
    "contract_type":"quarter",
    "contract_code":"BTC-USDT-201225-C-13000",
    "status":6,
    "order_id":775365420395126784,
    "order_id_str":"775365420395126784",
    "order_type":1,
    "trade_volume":1,
    "volume":1,
    "trade":[
        {
            "id":"125715777-775365420395126784-1",
            "trade_id":125715777,
            "trade_volume":1,
            "trade_price":2752.58,
            "trade_turnover":2.75258,
            "created_at":1604903121857,
            "role":"taker"
        }
    ]
}
```

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| --------------- | -------- | ------------ | ------------------------------------------------------------ | -------------------------------------------------- |
| op              | true     | string       | Operator Name, fixed push value is notify;                               |                                                    |
| topic           | true     | string       | Push Theme                                                  |                                                    |
| ts              | true     | long         | Server responses Timestamp                                            |                                                    |
| uid             | true     | string       | Useruid                                                      |                                                    |
| symbol          | true     | string       | Coin Code                                                     | "BTC","ETH"...                                     |
| trade_partition | true     | string       | Trade Partition                                                     | "USDT"                                             |
| contract_type   | true     | string       | ContractType                                                     | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter" |
| contract_code   | true     | string       | Contract Code                                                     | BTC-USDT-201225-C-13000                            |
| status          | true     | int          | OrderStatus (3unfilled 4partial filled 5partial filled orders have been deleted 6all filled7deleted) |                                                    |
| order_id        | true     | long         | Order ID, the field stored in the system is user_order_id                      |                                                    |
| order_id_str    | true     | string       | Order ID, String Type                                           |                                                    |
| order_type      | true     | int          | Order Type                                                     | 1:Place an order,  2:Cancel an order                  |
| trade_volume    | true     | decimal      | quantity of order filled                                               |                  |
| volume          | true     | decimal      | quantity of order placed                                          |                  |
| \<trade\>       | true     | object array |                                                              |                                                    |
| id              | true     | string       | Unique transaction ID                                                   |                                                    |
| trade_id        | true     | long         | match result id                                                   |                                                    |
| trade_price     | true     | decimal      | Match Price                                                    |                                                    |
| trade_volume    | true     | decimal      | Trading Volume                                                       |                                                    |
| trade_turnover  | true     | decimal      | Trading Amount                                                     |                                                    |
| created_at      | true     | long         | Creation Time                                                     |                                                    |
| role            | true     | string       | taker or maker                                                 |                                                    |
| \</trade\>      |          |              |                                                              |                                                    |




## Unsubscribe Match Order Data（unsub）

#### After successfully connected with the WebSocket API, sending the data in following format to the server to cancel data subscription:

###  Example

`{`
 
  `"op": "unsub",`
  
  `"topic": "matchOrders.$symbol-$partition",`
    
  `"cid": "id generated by client"`
    
`}`

> Example for subscribing Request Parameter:

```json
{
  "op": "unsub",
  "topic": "matchOrders.btc-usdt",
  "cid": "40sG903yz80oDFWr"
}
```

###  Cancel Subscription Request Parameter
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string | Fixed value of cancel subscription is unsub                                    |          |
| cid      | false    | string | Client Request Unique ID                                           |          |
| topic    | true     | string | Subscription Theme Name, must fill in(matchOrders.$symbol-$partition) subscription, cancel match order filled info subscription for a certain coin;$symbol-$partition is“Coin Code-Trade Partition”（BTC-USDT、ETH-USDT...）, If the value is * , all options contracts will be subscribed; |          |
| ts       | true     | long   | Time of Respond Generation, unit: millisecond                                   |          |


###  Subscribe and Cancel Subscription Rules

| Subscribe(sub)                    | Cancel Subscription(ubsub)              | Rule   |
| ---------------------------- | ---------------------------- | ------ |
| matchOrders.*                | matchOrders.*                | Allowed   |
| matchOrders.symbol1-partion1 | matchOrders.*                | Allowed   |
| matchOrders.symbol1-partion1 | matchOrders.symbol1-partion1 | Allowed   |
| matchOrders.symbol1-partion1 | matchOrders.symbol2-partion1 |  Not Allowed |
| matchOrders.*                | matchOrders.symbol1-partion1 |  Not Allowed |


## Subscribe Account Equity Updates Data(sub)

#### After successfully connected with the WebSocket API, sending the data in following format to the server to subscribe data:

###  Example

`{`
 
  `"op": "sub",`
  
  `"topic": "accounts.$symbol-$partition",`
    
  `"cid": "id generated by client"`
    
`}`


> Example for subscribing Request Parameter:

```json
{
    "op": "sub",
    "topic": "accounts.btc-usdt",
    "cid": "40sG903yz80oDFWr"
}
```

###  Request Parameter
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string |Fixed value of subscription is sub                                            |          |
| cid      | false    | string | Client Request Unique ID                                           |          |
| topic    | true     | string | Subscribe Theme Name; must fill in (accounts.$symbol-$partition) subscription, cancel asset change info subscription of a certain coin; $symbol-$partition is “Coin Code-Trade Partition”（BTC-USDT、ETH-USDT...）, If the value is * , all options contracts will be subscribed; |          |


> Whenever asset changes, clients will receive data as below: 

```json

{
    "op":"notify",
    "topic":"accounts",
    "ts":1604903471303,
    "uid":"123456789",
    "event":"init",
    "data":[
        {
            "symbol":"USDT",
            "margin_balance":10.30015,
            "margin_static":10.30015,
            "margin_position":0,
            "margin_frozen":0,
            "margin_available":9.09036,
            "profit_real":-0.15467,
            "profit_unreal":0,
            "withdraw_available":9.09036,
            "option_value":0,
            "premium_frozen":1.20479,
            "fee_frozen":0.005,
            "premium_in":2.75258,
            "premium_out":2.89725,
            "fee_asset":"USDT",
            "delta":null,
            "gamma":null,
            "theta":null,
            "vega":null,
            "margin_asset":"USDT",
            "trade_partition":"USDT"
        }
    ]
}
```

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ------------------ | -------- | ------------ | ------------------------------ | ------------------------------------------------------------ |
| op                 | true     | string       | Operator Name, push value is fixed at notify; |                                                              |
| topic              | true     | string       | Push Theme                    |                                                              |
| ts                 | true     | long         | Server responses Timestamp              |                                                              |
| uid                | true     | string       | User UID                        |                                                              |
| event              | true     | string       | Asset change notification related events illustration     | for example, order created to open positions(order.open) , order filled(order.match)（excluding liquidation, settlement and delivery）, settlement and delivery (settlement), cancel orders (order.cancel) , close orders(order.close), contract account transfer（contract.transfer)（including deposits and withdrawals), system（contract.system), other assets change(other), initial assets(init), triggered by system regular push (snapshot） |
| \<data\>           | true     | object array |                                |                                                              |
| symbol             | true     | string       | Coin Code                       | "BTC","ETH"...                                               |
| trade_partition    | true     | string       | Trade Partition                       | "USDT"                                                       |
| margin_balance     | true     | decimal      | Account Equity                       |                                                              |
| margin_static      | true     | decimal      | Static Equity                       |                                                              |
| margin_position    | true     | decimal      | Performance Margin                     |                                                              |
| margin_frozen      | true     | decimal      | Frozen Margin                  |                                                              |
| margin_asset     | true     | decimal | Margin Coin                       |                                                              |
| margin_available   | true     | decimal      | Available Margin                     |                                                              |
| profit_real        | true     | decimal      | Realized PnL                     |                                                              |
| profit_unreal      | true     | decimal      | Unrealized PnL                     |                                                              |
| withdraw_available | true     | decimal      | Transferable Quantity                     |                                                              |
| premium_frozen     | true     | decimal      | Frozen Premium                    |                                                              |
| fee_frozen         | true     | decimal      | Frozen Transaction Fee                     |                                                              |
| fee_asset          | true     | string       | Transaction Fee coin                     |                                                              |
| premium_in         | true     | decimal      | Current week premium income                |                                                              |
| premium_out        | true     | decimal      |Current week premium expense                |                                                              |
| delta              | true     | decimal      | DELTA                          |                                                              |
| gamma              | true     | decimal      | GAMMA                          |                                                              |
| theta              | true     | decimal      | THETA                          |                                                              |
| vega               | true     | decimal      | VEGA                           |                                                              |
| option_value       | true     | decimal      | Option Market Value(unit:"USDT")          |                                                              |
| \</data\>          |          |              |                                |                                                              |




## Unsubscribe Account Equity Updates Data (unsub)

#### After successfully connected with the WebSocket API, sending the data in following format to the server to cancel data subscription:

###  Example

`{`
 
  `"op": "unsub",`
  
  `"topic": "accounts.$symbol-$partition",`
    
  `"cid": "id generated by client"`
    
`}`

> Example for subscribing Request Parameter:

```json
{
  "op": "unsub",
  "topic": "accounts.btc-usdt",
  "cid": "40sG903yz80oDFWr"
}
```
 
###  Cancel Request Parameter Subscription 
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string | Fixed value of cancel subscription is unsub                                    |          |
| cid      | false    | string | Client Request Unique ID                                           |          |
| topic    | true     | string | Subscribe Theme Name; must fill in (accounts.$symbol-$partition) Subscription, cancel asset change info subscription of a certain coin; $symbol-$partition is “Coin Code-Trade Partition”（BTC-USDT、ETH-USDT...），If the value is * , all options contracts will be subscribed; |          |


### Subscribe & cancel Subscription Rules

| Subscribe(sub)                 | Cancel Subscription(ubsub)           | Rule   |
| ------------------------- | ------------------------- | ------ |
| accounts.*                | accounts.*                | Allowed   |
| accounts.symbol1-partion1 | accounts.*                | Allowed   |
| accounts.symbol1-partion1 | accounts.symbol1-partion1 | Allowed   |
| accounts.symbol1-partion1 | accounts.symbol2-partion1 | Not Allowed |
| accounts.*                | accounts.symbol1-partion1 | Not Allowed |


## Subscribe Position Updates(sub)

#### After successfully connected with the WebSocket API, sending the data in following format to the server to subscribe data:

###  Example

`{`
 
  `"op": "sub",`
  
  `"topic": "positions.$symbol-$partition",`
    
  `"cid": "id generated by client"`
    
`}`

> Example for subscribing Request Parameter:

```json
{
    "op": "sub",
    "topic": "positions.*",
    "cid": "40sG903yz80oDFWr"
}
```

###  Request Parameter
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string |Fixed value of subscription is sub                                            |          |
| cid      | false    | string | Client Request Unique ID                                           |          |
| topic    | true     | string | Subscription Theme Name, must fill in(positions.$symbol-$partition) subscription, cancel position change info subscription if a certain coin, $symbol-$partition is “Coin Code-Trade Partition”（BTC-USDT、ETH-USDT...），If the value is * , all options contracts will be subscribed; |          |


> Whenever position changes, clients will receive data as below: 

```json

{
    "op":"notify",
    "topic":"positions",
    "ts":1604903117918,
    "uid":"123456789",
    "event":"snapshot",
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC-USDT-201225-C-13000",
            "contract_type":"quarter",
            "volume":1,
            "available":1,
            "frozen":0,
            "cost_open":2897.25,
            "cost_hold":2897.25,
            "profit_unreal":0,
            "profit_rate":0,
            "profit":0,
            "margin_position":0,
            "direction":"buy",
            "last_price":2897.25,
            "trade_partition":"USDT",
            "delivery_date":"20201225",
            "option_right_type":"C",
            "exercise_price":13000,
            "quote_asset":"USDT",
            "margin_asset":"BTC",
            "position_value":2.89725
        }
    ]
}
```

###  Return Parameter

| Parameter Name        | Mandatory | Type         | Desc                       | Value Range       |
| ----------------- | -------- | ------------ | ------------------------------ | ------------------------------------------------------------ |
| op                | true     | string       | Operator Name,  fixed push value isnotify; |                                                              |
| topic             | true     | string       | Push Theme                    |                                                              |
| ts                | true     | long         | Server responses Timestamp              |                                                              |
| uid               | true     | string       | User uid                        |                                                              |
| event             | true     | string       | Related events illustration on position change notification        | for example, create an order to close positions(order.close) 、order filled(order.match), settlement and delivery(settlement)、order liquidation filled (order.liquidation), cancel orders(order.cancel) , initial positions（init）, triggered by system regular push（snapshot） |
| \<data\>          | true     | object array |                                |                                                              |
| symbol            | true     | string       | Coin Code                       | "BTC","ETH"...                                               |
| trade_partition   | true     | string       | Trade Partition                       | "USDT"                                                       |
| contract_code     | true     | string       | Contract Code                       | BTC-USDT-201225-C-13000                                      |
| contract_type     | true     | string       | ContractType                       | Weekly:"this_week", Bi-weekly:"next_week", Quarterly:"quarter"           |
| volume            | true     | decimal      | Position Quantity                         |                                                              |
| available         | true     | decimal      | Available Close Amount                     |                                                              |
| frozen            | true     | decimal      | Frozen Quantity                       |                                                              |
| cost_open         | true     | decimal      | Average open price                       |                                                              |
| cost_hold         | true     | decimal      | Average position price                       |                                                              |
| profit_unreal     | true     | decimal      | Unrealized PnL                     |                                                              |
| profit_rate       | true     | decimal      | Profit Rate                         |                                                              |
| profit            | true     | decimal      | Profit                           |                                                              |
| margin_position   | true     | decimal      | Performance Margin                     |                                                              |
| position_value    | true     | decimal      | Position Value                       |                                                              |
| direction         | true     | string       | Position Direction                       | "buy":Buy "sell":Sell                                           |
| last_price        | true     | decimal      | Latest Price                     |                                                              |
| delivery_date     | true     | string       | Delivery Date                         | eg"20200508"                                                 |
| option_right_type | true     | string       | Options ExcerciseType                   | C:Call options P:Put options                                        |
| exercise_price    | true     | decimal      | Strike Price                        |                                                              |
| quote_asset       | true     | string       | Denomination Coin                       | "USDT"...                                                    |
| margin_asset      | true     | string       | Margin Coin                    | "BTC"...                                                     |
| \</data\>         |          |              |                                |                                                              |




## Unsubscribe Position Change Data 

#### After successfully connected with the WebSocket API, sending the data in following format to the server to cancel data subscription:

###  Example

`{`
 
  `"op": "unsub",`
  
  `"topic": "positions.$symbol-$partition",`
    
  `"cid": "id generated by client"`
    
`}`

> Example for subscribing Request Parameter:

```json
{
  "op": "unsub",
  "topic": "positions.btc-usdt",
  "cid": "40sG903yz80oDFWr"
}
```

###  Cancel SubscriptionRequest Parameter
| Parameter Name | Mandatory | Type   | Desc                                                         | Value Range |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string | Fixed value of cancel subscription is unsub                                        |          |
| cid      | false    | string | Client Request Unique ID                                           |          |
| topic    | true     | string | Subscribe Theme Name, must fill in (positions.$symbol-$partition) Subscription、Cancel asset change info subscription of a certain coin; $symbol-$partition is “Coin Code-Trade Partition”（BTC-USDT、ETH-USDT...），If the value is * , all options contracts will be subscribed; |          |


###  Subscribe & Cancel Subscription Rules

| Subscribe(sub)                  | Cancel Subscription(ubsub)            | Rule   |
| -------------------------- | -------------------------- | ------ |
| positions.*                | positions.*                | Allowed   |
| positions.symbol1-partion1 | positions.*                | Allowed   |
| positions.symbol1-partion1 | positions.symbol1-partion1 | Allowed   |
| positions.symbol1-partion1 | positions.symbol2-partion1 | Not Allowed |
| positions.*                | positions.symbol1-partion1 | Not Allowed |

# WebSocket interface for system status updates 

 - The websocket url of system status updates is : wss://api.hbdm.com/center-notification

##  Subscribe system status updates 

### After successfully establishing a connection with the WebSocket API, users could send data in the following format to the server to request data:

  `{`
  
      `"op": "sub",`
  
      `"cid": "id generated by client",`
  
      `"topic": "public.$service.heartbeat"`
  
  `} `

> Example on using parameters to request data: 

```json

{
	"op": "sub",
	"cid": "id generated by client",
	"topic": "public.option.heartbeat"
}
```

### **Request Parameter**:
| Name   |Mandatory | Type     | Desc   | Value Range           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | The fixed value of subscription is sub	 |  |
| cid | false| string | Client requests a unique ID	 | |
| topic | true| string | Subscription topic name is required (public.$service.heartbeat), Subscribe system status information of a certain business | |

### **Subscription parameter description**:
| Name   |Mandatory | Type     | Desc   | Value Range           |
| ------ | ---- | ------ | -------- | -------------- |
| service | true | string |Business Code	 | option |


> **Return Parameter Example**:

```json

{
    "op": "notify",
    "topic": "public.option.heartbeat",
    "event": "init",
    "ts":1580815422403,
    "data":{
        "heartbeat": 0,
        "estimated_recovery_time": 1408076414000
    }
}

```

### **Return Parameter Rules**：
| Name   |Mandatory | Type     | Desc   | Value Range           |
| -------- | -------- | -------- |  --------------------------------------- | -------------- | 
| op   | true | string  | Operation name, the fixed value of push is notify;  |   |
| topic   | true | string  | Push topic   |   |
| event   | true | string  | Description on notification related event | The initial system status information returned by a successful subscription (init), triggered by system status change (update) |
| ts   | true | long  | Server response timestamp   |   |
| \<data\> |  |  |  | |
| heartbeat | true | int | System Status	 |  1 is available, 0 is not available(maintenance with service suspended) |
| estimated_recovery_time | true | long |  Estimated system recovery time, unit: millisecond	 |  When the system status is available, return NULL |
| \</data\> | | |  | |

### Note
- Since this push is a poll query status, there may be a delay of 1-2 seconds.

# Appendix

## Operator Type(OP)

| Type  |    Description            |
| ------ | -------------------- |
| ping   |  Server sends heatbeat with a Ping   |
| pong   |  Clients responds heatbeat   with a Pong        |
| auth   |  Authentication              |
| sub    |  Subscribe Message           |
| unsub  | Unsubscribe Message       |
| notify | Server pushes subscribe message |

## Topic Type

| Type          | applicative operator type | Description                                                         |
| -------------- | ------------ | ------------------------------------------------------------ |
| orders.$contract_code | sub,ubsub    | Subscribe/unsubscribe the order data of a given pair; when the $contract_code value is *, it stands for subscribing/unsubscribing the data of all pairs |

## Response code（Err-Code）

| Return Error Code | Return description                                |
| ------ | ---------------------------------------- |
| 0      | Request successfully.                    |
| 2001   | Invalid authentication.                  |
| 2002   | Authentication required.                 |
| 2003   | Authentication failed.                   |
| 2004   | Number of visits exceeds limit.          |
| 2005   | Connection has been authenticated.       |
| 2007 | You don’t have access permission as you have not opened contracts trading.| 
| 2010   | Topic error.                             |
| 2011   | Contract doesn't exist.                  |
| 2012   | Topic not subscribed.                    |
| 2013   | Authentication type doesn't exist.       |
| 2014   | Repeated subscription.                   |
| 2020 | This contract does not support cross margin mode.| 
| 2021 | Illegal parameter margin_account.| 
| 2030   | Exceeds connection limit of single user. |
| 2040   | Missing required parameter.              |


<br>
<br>
<br>
<br>
<br>
