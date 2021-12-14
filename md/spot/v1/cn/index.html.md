---
title: 火币 API 文档

language_tabs: # must be one of https://git.io/vQNgJ
  - json

toc_footers:
  - <a href='https://www.hbg.com/zh-cn/apikey/'>创建 API Key </a>
includes:

search: true
---

# 更新日志

<style>
table {
    max-width:100%
}
table th {
    white-space: nowrap; /*表头内容强制在一行显示*/
}
</style>



| 生效时间<br>(UTC +8) | 接口     | 变化      | 摘要         |
| ---------- | --------- | --------- | --------------- |
| 2021.11.30 | `POST /v1/dw/withdraw/api/create` | 优化 | 新增请求参数"client-order-id" |
| 2021.11.30 | `GET /v1/query/withdraw/client-order-id` | 新增 | 通过clientOrderId查询提币订单 |
| 2021.8.19 | `accounts.update#${mode}` | 优化 | 增加“账户变更的序号”参数“seqNum” |
| 2021.8.19 | `GET /v1/account/accounts/{account-id}/balance` | 优化 | 增加“账户变更的序号”参数“seq-num” |
| 2021.8.12 | `market.$symbol.ticker` | 新增 | 增加聚合行情（Ticker）数据 |
| 2021.8.12 | `market.$symbol.mbp.$levels` | 优化 | 增加400档深度数据|
| 2021.7.23 | `GET /v1/account/history`<br/>| 优化 | 账户流水接口中的变动类型，即“transact-types”增加分类明细，如注3. |
| 2021.6.12 | `GET/v2/account/valuation` | 新增 | 获取平台资产总估值 |
| 2021.5.26 | `GET /v1/order/orders/getClientOrder`<br/>`POST /v1/order/orders/place`<br/>`POST /v1/order/orders/submitCancelClientOrder` | 优化 | clientOrderId的有效期从原订单创建8小时内有效改为：对于已完结状态订单，2小时内有效。<br/>对于用户下单时传入的clientOrderId 的唯一性将不再进行校验 |
| 2021.5.12 | GET `/v2/etp/transactions` | 优化 | "etpNames"和"transactTypes"变更为"必填"且“只能填一个” |
| 2021.3.1   | `POST /v2/sub-user/deduct-mode`   | 新增  | 新增“设置母子用户手续费抵扣（HT或点卡）”接口  |
| 2021.3.1             | `GET /v2/sub-user/account-list`                              | 优化      | 新增“母子用户手续费抵扣”参数                                 |
| 2021.2.28            | Account and order Websocket v1                               | 删除      | 资产和订单WebSocket v1接口关闭                               |
| 2021.2.1             | `POST /v2/account/repayment`                                 | 优化      | 通用还币接口支持逐仓杠杆还币                                 |
| 2021.1.19 19:00      | `GET /v1/order/matchresults`                                 | 优化      | 增加start-time/end-time参数，支持用户指定“时间范围“查询订单  |
| 2021.1.19 19:00      | `GET /v2/etp/limit`                                          | 新增      | 新增ETP持仓限额接口                                          |
| 2021.1.5 19:00       | `POST/v2/algo-orders/cancel-all-after`                       | 新增      | 新增自动撤单接口                                             |
| 2021.1.5 19:00       | accounts.update#${mode}                                      | 优化      | 增加mode=2：  <br/>accounts.update#2<br/>在账户余额发生变动或可用余额发生变动时均推送且一起推送。 |
| 2020.12.16 19:00     | `GET /v1/order/matchresults`,<br>`GET /v1/order/orders/{order-id}/matchresults` | 优化      | 新增参数抵扣状态：fee-deduct-state（ 抵扣中：ongoing/ 抵扣完成：done），来代表手续费抵扣中和抵扣完成的状态 |
| 2020.12.14 19:00     | `POST /v2/etp/{transactId}/cancel` <br/> `POST /v2/etp/batch-cancel` | 新增      | 新增杠杆ETP单个撤单接口和杠杆ETP批量撤单接口                 |
| 2020.11.26 19:00     | `GET /v2/user/uid`                                           | 新增      | 新增获取用户UID接口                                          |
| 2020.10.16 19:00     | `orders#${symbol}`                                           | 优化      | 订单创建事件新增accountId                                    |
| 2020.10.10 19:00     | `POST /v2/account/repayment`,<br>`GET /v2/account/repayment` | 新增      | 新增通用还币接口及还币交易记录查询接口                       |
| 2020.8.28 19:00      | `GET /v1/common/symbols`                                     | 优化      | 新增API交易使能标记                                          |
| 2020.8.21 19:00      | `accounts.update#${mode}`, <br>`accounts`                    | 优化      | 新增账户变更事件类型deposit，withdraw                        |
| 2020.8.11 19:00      | `GET /v1/common/symbols`,<br> `GET /market/etp`, <br>`market.$symbol.etp`,<br> `GET /market/history/kline`, <br>`market.$symbol$.kline.$period$`,<br> `GET /v2/etp/reference`, <br>`POST /v2/etp/creation`,<br> `POST /v2/etp/redemption`,<br> `GET /v2/etp/transactions`,<br> `GET /v2/etp/transaction`, <br>`GET /v2/etp/rebalance` | 新增+优化 | 新增/优化相关接口支持杠杆ETP                                 |
| 2020.8.10 19:00      | `GET v1/stable-coin/quote`, <br>`POST v1/stable-coin/exchange` | 优化      | 新增稳定币兑换手续费字段                                     |
| 2020.8.4 19:00       | `GET /v1/account/history`                                    | 优化      | 新增返回字段“next-id”                                        |
| 2020.8.3 19:00       | `POST /v2/algo-orders`, <br>`GET /v2/algo-orders/opening`, <br>`GET /v2/algo-orders/history`, <br>`GET /v2/algo-orders/specific` | 优化      | 新增追踪委托                                                 |
| 2020.7.24 19:00      | `trade.clearing#${symbol}#${mode}`                           | 优化      | 新增撤单推送                                                 |
| 2020.7.17 19:00      | `GET /v2/account/asset-valuation`                            | 新增      | 新增账户资产估值查询节点                                     |
| 2020.7.16 19:00      | `GET /v1/common/symbols`                                     | 优化      | 新增返回字段                                                 |
| 2020.7.10 19:00      | `GET /v2/point/account`,<br> `POST /v2/point/transfer`       | 新增      | 新增点卡余额查询节点及点卡划转节点                           |
| 2020.7.10 19:00      | `POST /v1/order/batch-orders`                                | 优化      | 限频值调整                                                   |
| 2020.7.8 19:00       | `orders#{symbol}`                                            | 优化      | 新增两个事件类型                                             |
| 2020.6.27 19:00      | `GET /v2/market-status`                                      | 新增      | 新增市场状态查询节点                                         |
| 2020.6.27 19:00      | `market.$symbol.mbp.$levels`                                 | 优化      | 新增五档MBP逐笔增量订阅                                      |
| 2020.6.27 19:00      | 若干新增节点                                                 | 新增      | 新增策略委托相关节点                                         |
| 2020.6.24 19:00      | `GET /v1/order/orders/{order-id}/matchresults` <br> `GET /v1/order/matchresults` | 优化      | 增加fee-currency字段                                         |
| 2020.6.24 19:00      | `GET /v2/account/withdraw/address`                           | 新增      | 提币地址查询                                                 |
| 2020.6.23 19:00      | 若干新增节点                                                 | 新增      | 新增C2C杠借币相关节点                                        |
| 2020.6.16 10:00      | `GET /v2/sub-user/user-list`,<br> `GET /v2/sub-user/user-state`, <br>`GET /v2/sub-user/account-list` | 新增      | 新增子用户列表查询、子用户状态查询、子用户账户查询接口       |
| 2020.6.15 19:00      | `POST /v2/sub-user/api-key-generation`,<br>`POST /v2/sub-user/api-key-modification` | 优化      | 增加单用户可创建API Key数量以及增加单个API Key可绑定IP地址数量 |
| 2020.6.11 19:00      | `POST /v1/account/transfer`                                  | 优化      | 新增币币账户与逐仓杠杠账户的划转，逐仓杠杠账户内部的划转     |
| 2020.6.11 19:00      | `GET /v1/query/deposit-withdraw`                             | 优化      | 新增返回提币失败原因                                         |
| 2020.6.5 19:00       | `POST /v2/sub-user/api-key-generation`,<br> `GET /v2/user/api-key`, <br>`POST /v2/sub-user/api-key-modification`,<br> `POST /v2/sub-user/api-key-deletion` | 新增      | 新增母子用户API key管理接口                                  |
| 2020.6.4 19:00       | 若干私有REST接口                                             | 优化      | 变更限频值                                                   |
| 2020.6.1 19:00       | `orders#${symbol}`                                           | 优化      | Taker订单成交前首推创建事件                                  |
| 2020.6.1 19:00       | `GET /v2/reference/transact-fee-rate`, <br>`GET /v1/order/orders/{order-id}/matchresults`,<br> `GET /v1/order/matchresults`, <br>`trade.clearing#${symbol}`, <br>`GET /v1/account/history`, <br>`accounts`, `accounts.update#${mode}` | 优化      | 支持交易手续费返佣相关字段                                   |
| 2020.5.29 19:00      | `POST /v2/sub-user/tradable-market`                          | 新增      | 新增母用户设置子用户交易权限接口                             |
| 2020.5.29 19:00      | `POST /v2/sub-user/transferability`                          | 新增      | 新增母用户设置子用户资产转出权限接口                         |
| 2020.5.29 19:00      | `POST /v2/sub-user/creation`                                 | 新增      | 新增子用户创建接口                                           |
| 2020.5.29 19:00      | `POST /v1/account/transfer`                                  | 新增      | 新增通用资产划转接口                                         |
| 2020.4.28 11:00      | `market.$symbol.mbp.$levels` & `market.$symbol.mbp.refresh.$levels` | 优化      | 支持所有交易对                                               |
| 2020.4.27 11:00      | `orders#${symbol}`                                           | 优化      | 更改IOC订单的更新行为                                        |
| 2020.4.17 11:00      | `GET /v2/account/deposit/address`,<br>`GET /v2/sub-user/deposit-address`,<br>`GET /v1/query/deposit-withdraw`,<br>`GET /v2/sub-user/query-deposit` | 新增      | 支持子用户充值                                               |
| 2020.4.3 11:00       | `orders#${symbol}`                                           | 新增      | 新增v2版本订单更新推送主题                                   |
| 2020.3.31 21:00      | `accounts.update#${mode}`                                    | 优化      | 订阅成功后首推各账户初始值                                   |
| 2020.3.31 11:00      | `GET /v2/account/ledger`                                     | 新增      | 新增财务流水查询接口                                         |
| 2020.3.30 19:00      | `market.$symbol.mbp.refresh.$levels`                         | 新增      | 新增MBP全量推送接口                                          |
| 2020.3.30 19:00      | `POST /v1/order/orders/place`,<br>`POST /v1/order/batch-orders`,<br>`GET /v1/order/openOrders`,<br>`GET /v1/order/orders/{order-id}`,<br>`GET /v1/order/orders/getClientOrder`,<br>`GET /v1/order/orders/`<br>`{order-id}/matchresults`,<br>`GET /v1/order/orders`,<br>`GET /v1/order/history`,<br>`GET /v1/order/matchresults`,<br>`orders.$symbol`,<br>`trade.clearing#${symbol}`,<br>`orders.$symbol.update` | 优化      | 增加FOK订单类型                                              |
| 2020.3.27 19:00      | `GET /v1/order/orders`<br>`GET /v1/order/history`            | 优化      | 已完全撤销订单的可查询范围缩短为2小时                        |
| 2020.3.24 19:00      | `market.$symbol.mbp.$levels`                                 | 优化      | 增加可请求交易代码                                           |
| 2020.3.17 19:00      | `GET /v1/order/matchresults`                                 | 优化      | size取值上限由100上调至500                                   |
| 2020.3.12 19:00      | `GET /market/tickers`                                        | 优化      | 增加买一卖一字段                                             |
| 2020.3.5 19:00       | `GET /v1/fee/fee-rate/get`                                   | 删除      | 移除旧版费率查询接口                                         |
| 2020.3.2 11:00       | `GET https://status.huobigroup.com`<br>`/api/v2/summary.json` | 新增      | 新增获取当前系统状态接口                                     |
| 2020.2.28 11:00      | 母子用户相关接口                                             | 优化      | 将文档中“母子账号”的称谓更改为“母子用户”                     |
| 2020.2.28 11:00      | `GET /v1/cross-margin/loan-orders`,<br>`GET /v1/cross-margin/accounts/balance` | 优化      | 新增可选请求参数                                             |
| 2020.2.28 11:00      | `GET /v1/subuser/aggregate-balance`,<br>`GET /v1/account/accounts/{sub-uid}` | 优化      | 新增账户类型字段枚举值                                       |
| 2020.2.28 11:00      | `POST /v1/cross-margin/transfer-in`,<br>`POST /v1/cross-margin/transfer-out`,<br>`GET /v1/cross-margin/loan-info`,<br>`POST /v1/cross-margin/orders`,<br>`POST /v1/cross-margin/orders/`<br>`{order-id}/repay`,<br>`GET /v1/cross-margin/loan-orders`,<br>`GET /v1/cross-margin/accounts/balance` | 优化      | 允许授权子用户调用该接口                                     |
| 2020.2.5 19:00       | `GET /v1/order/orders/{order-id}`,<br>`GET /v1/order/orders/getClientOrder`,<br>`GET /v1/order/openOrders`,<br>`GET /v1/order/orders`,<br>`GET /v1/order/history` | 优化      | 新增client-order-id字段                                      |
| 2020.2.5 19:00       | `GET /v1/order/orders`                                       | 优化      | 新增start-time/end-time请求参数                              |
| 2020.2.3 19:00       | `GET /v2/reference/transact-fee-rate`                        | 新增      | 新增交易手续费率查询节点                                     |
| 2020.2.3 19:00       | `GET /v2/reference/currencies`                               | 优化      | 增加底层链字段                                               |
| 2020.2.3 19:00       | `GET /v1/margin/loan-info`                                   | 优化      | 增加抵扣后实际币息率字段                                     |
| 2020.1.10 19:00      | `GET /v1/cross-margin/loan-info`                             | 优化      | 增加抵扣后实际币息率字段                                     |
| 2020.1.7 19:00       | `GET /v1/account/history`                                    | 优化      | 允许子用户调用此节点                                         |
| 2019.12.27 19:00     | `POST /v2/sub-user/management`                               | 新增      | 新增冻结/解冻子用户接口                                      |
| 2019.12.27 19:00     | `POST /v1/order/orders/batchcancel`                          | 优化      | 允许以client order ID为请求参数批量撤单                      |
| 2019.12.27 19:00     | `POST /v1/order/batch-orders`                                | 新增      | 新增批量下单节点                                             |
| 2019.12.23 15:00     | `market.$symbol.mbp.$levels`                                 | 新增      | 新增深度行情增量推送订阅主题                                 |
| 2019.12.05 11:00     | `trade.clearing#${symbol}` & `accounts.update#${mode}`       | 新增      | 新增v2版本资产及订单推送订阅主题                             |
| 2019.11.22 15:00     | `GET /v1/order/orders`<br />`GET /v1/order/history`          | 优化      | 已完全撤销的历史订单可查询时间范围缩短为最近1天              |
| 2019.11.13 19:00     | `GET /v1/margin/loan-info`<br />`GET /v1/cross-margin/loan-info` | 新增      | 新增借币币息及额度查询节点                                   |
| 2019.11.08 19:45     | `GET /v1/order/orders/{order-id}/matchresult`<br />`GET /v1/order/matchresults` | 新增      | 新增返回字段trade-id                                         |
| 2019.10.18 19:00     | `GET /v1/account/history`                                    | 新增      | 新增账户流水查询节点                                         |
| 2019.10.12 11:00     | `POST /v1/dw/withdraw/api/create`                            | 优化      | 设置ERC20为USDT的默认链                                      |
| 2019.10.11 10:00     | 支持全仓杠杆资产划转、借币、还币、查询借币订单、查询账户余额等相关节点 | 新增      | 新增全仓杠杆相关节点                                         |
| 2019.10.09 20:00     | `GET /market/trade`<br />`GET /market/history/trade`<br />`market.$symbol.trade.detail` | 优化      | 新增返回字段trade id                                         |
| 2019.09.25 20:00     | `GET /v2/account/withdraw/quota`                             | 新增      | 新增提币额度查询节点                                         |
| 2019.09.23 15:00     | `POST /v1/order/orders/`<br>`{order-id}/submitcancel` <br />`POST /v1/order/orders/batchcancel` | 优化      | 优化错误码返回                                               |
| 2019.09.20 10:00     | `GET /v2/reference/currencies`                               | 新增      | 新增币链参考信息节点                                         |
| 2019.09.19 16:00     | `market.$symbol.bbo`                                         | 新增      | 新增买一卖一逐笔推送                                         |
| 2019.09.18 20:00     | `GET /v1/subuser/aggregate-balance`<br />`GET /v1/account/accounts/{sub-uid}`<br />`GET /v1/margin/loan-orders`<br />`GET /v1/margin/accounts/balance` | 新增      | 支持子用户逐仓杠杆交易                                       |
| 2019.09.16 15:00     | `GET /v2/account/deposit/address`                            | 新增      | 新增APIv2节点 - 充币地址查询                                 |
| 2019.09.11 17:00     | `GET /v1/stable-coin/quote`<br />`POST /v1/stable-coin/exchange` | 新增      | 新增稳定币兑换节点                                           |
| 2019.09.11 16:00     | 删除部分代码示例                                             | 删除      | 删除部分代码示例                                             |
| 2019.09.10 10:00     | 除了`POST /v1/order/orders/submitCancelClientOrder` <br> `GET /v1/order/openOrders`<br>之外其他订单相关API | 修改      | 除节点"POST /v1/order/orders/submitCancelClientOrder" & "GET /v1/order/openOrders"以外，去除了其它节点中订单状态取值submitting以及cancelling |
| 2019.09.09 11:00     | `POST /v1/order/orders/submitCancelClientOrder`              | 修改      | 修改返回数据描述                                             |
| 2019.09.09 10:00     | `GET /v1/order/orders`<br />`GET /v1/order/matchresults`     | 修改      | 修改请求字段start-date与end-date的默认值及取值范围的描述     |
| 2019.09.02 18:00     | `POST /v1/order/orders/batchCancelOpenOrders`                | 优化      | 更改请求字段"symbol"的描述                                   |
| 2019.09.02 16:00     | 删除稳定币兑换相关节点。                                     | 删除      |                                                              |
| 2019.08.29 21:00     | 下单、查询、订阅接口                                         | 新增      | 支持止盈止损订单类型。                                       |
| 2019.08.21 18:00     | `GET /v1/order/openOrders`                                   | 优化      | 修改请求字段列表。                                           |
| 2019.08.05 18:00     | `orders.$symbol.update`                                      | 新增      | 新增字段"client-order-id"和"order-type"。                    |
| 2019.08.02 18:00     | `orders.$symbol.update`                                      | 优化      | 修改对字段"unfilled-amount"的描述。                          |
| 2019.07.23 21:00     | `GET /v1/order/orders/{order-id}/matchresult`<br>`GET /v1/order/matchresults` | 新增      | 新增手续费抵扣详情字段。                                     |
| 2019.07.23 20:00     | `GET /v1/fee/fee-rate/get`                                   | 新增      | 新增费率查询接口。                                           |
| 2019.07.22 12:00     | `GET /v1/order/orders/{order-id}/matchresults`<br/>`GET /v1/order/matchresults` | 新增      | 新增成交角色"role"字段以标识每笔成交角色是"taker"还是"maker"。 |
| 2019.07.11 20:00     | `POST /v1/order/orders/place`<br/>`POST /v1/order/orders/submitCancelClientOrder`<br/>`GET /v1/order/orders/getClientOrder` | 优化/新增 | 下单/撤单/查询可基于client order ID。                        |
| 2019.07.08 12:00     | Websocket 订单资产推送接口                                   | 优化      | 优化Websocket 订单资产推送接口[心跳和限频](#5ea2e0cde2-3)。  |
| 2019.06.14 16:00     | `POST /v1/dw/withdraw/api/create`                            | 优化      | 支持快速提币                                                 |
| 2019.06.17 16:00     | `GET /v1/stable_coin/exchange_rate`<br/>`POST /v1/stable_coin/exchange` | 新增      | 新增接口支持用户随时获取最新的稳定币兑换汇率信息，并对稳定币执行兑入或兑出。 |
| 2019.06.12 16:00     | `GET /v1/common/symbols`                                     | 优化      | 对交易对基础信息接口返回的内容进行优化，该优化向后兼容       |
| 2019.06.06 18:00     | `GET /v1/query/deposit-withdraw`                             | 优化      | 对充提记录查询接口的请求参数进行优化，该优化向后兼容         |
| 2019.06.05 20:00     | 所有需要验签的接口                                           | 优化      | 访问验签接口时，API Key需要有适当的权限，现有的API Key都默认有全部权限。权限分为3类：读取，交易和提币。每个接口相应的权限类别均已更新在各接口说明中 |
| 2019.06.10 00:00     | `GET /v1/order/orders`<br/>`GET /v1/order/matchresults`      | 修改      | 查询窗口调整为48小时，可查询整体时间范围不变                 |
| 2019.05.15 10:00     | `POST /v1/futures/transfer`                                  | 新增      | 提供币币与合约账户间的资产划转                               |
| 2019.04.29 19:00     | `GET /v1/order/history`                                      | 新增      | 新增最近48小时内历史订单查询节点。新节点的上线后，现有订单查询节点“GET /v1/order/orders”仍将被保留。然而，新节点“GET /v1/order/history”被赋予更高服务等级。极端情况下，当服务荷载超过系统既定阈值时，节点“GET /v1/order/orders”的服务可能会不可用，而新节点“GET /v1/order/history”仍将继续提供服务。另外，火币正在计划支持另一个新节点专门用于用户48小时外的历史订单查询。此新节点上线的同时，现有节点“GET /v1/order/orders”将被弃用。火币将及时告知用户这一变更，一旦变更时间确定。 |
| 2019.04.17 10:00     | `GET /v1/order/orders`                                       | 修改      | 文档优化，增加Start-date限制说明                             |
| 2019.04.16 10:00     | `GET /v1/order/openOrders`                                   | 修改      | 文档错误，参数account-id和symbol都是必填参数                 |
| 2019.01.17 07:00     | Websocket accounts                                           | 修改      | 增加订阅参数 model；<br>订阅返回的内容中不再推送交易子账户冻结余额的变化。 |
| 2018.07.10 11:00     | `GET /market/history/kline`                                  | 修改      | `size` 取值范围由 [1-1000] 修改为 [1-2000]。                 |
| 2018.07.06 16:00     | `POST /v1/order/orders/place`                                | 修改      | 添加 `buy-limit-maker`，`sell-limit-maker` 两种下单类型支持；<br>新增获取某个帐号下指定交易对或者所有交易对的所有尚未成交订单接口: `/v1/order/openOrders`。 |
| 2018.07.06 16:00     | `GET /v1/order/openOrders`<br/>`POST /v1/order/orders/batchCancelOpenOrders` | 新增      | 新增获取某个帐号下指定交易对或者所有交易对的所有尚未成交订单接口；<br>新增批量取消某个帐号下指定的订单列表中所有订单接口。 |
| 2018.07.02 16:00     | ETF 相关接口                                                 | 新增      | 本次接口变更主要是支持 HB10 ETF 的换入和换出。               |
| 2018.06.20 16:00     | `GET /market/tickers`                                        | 新增      | 新增 Tickers 接口，Tickers 为当前所有交易对行情数据。        |

# 简介

欢迎使用火币 API！  

此文档是火币API的唯一官方文档，火币API提供的功能和服务会在此文档持续更新，并会发布公告进行通知，建议您关注和订阅我们的公告，及时获取相关信息。

您可以点击 <a href='https://www.huobi.bo/support/zh-cn/list/360000070201'>这里</a> 查看公告。如果想订阅公告，请在“API公告”页右上角点击“关注”按钮，会弹出登录窗口，用账号登录成功后，再次点击“关注”按钮，并选择需要关注的内容类型，按钮变为“正在关注”，即表示订阅成功。若无账号，可以点击登录窗口中的“注册”按钮，进行注册。

**如何阅读本文档**

文档上方导航栏是不同业务的API；右上方的语言按钮可以切换文档语言，目前支持中文和英文。
文档下方是某个业务的API文档，其中左侧是目录，中间是正文，右侧是请求参数和响应结果的示例。

以下是现货API文档各章节主要内容

第一部分是概要介绍：

- **快速入门**：该章节对火币API做了简单且全方位的介绍，适合第一次使用火币API的用户。
- **在线演示**：该章节介绍了现货API在线演示工具，方便用户直接调用和观察线上API环境。
- **常见问题**：该章节列举了使用火币API时常见的、和具体API无关的通用问题。
- **联系我们**：该章节介绍了针对不同问题，如何联系我们。

第二部分是每个接口类的详细介绍，每个接口类一个章节，每个章节分为如下内容：

- **简介**：对该接口类进行简单介绍，包括一些注意事项和说明。
- ***具体接口***：介绍每个接口的用途、限频、请求、参数、返回等详细信息。
- **常见错误码**：介绍该接口类下常见的错误码及其说明。
- **常见问题**：介绍该接口类下常见问题和解答。

# 快速入门

## 接入准备

如需使用API ，请先登录网页端，完成API key的申请和权限配置，再据此文档详情进行开发和交易。  

您可以点击 <a href='https://www.hbg.com/zh-cn/apikey/'>这里 </a> 创建 API Key。

每个母用户可创建20组Api Key，每个Api Key可对应设置读取、交易、提币三种权限。  

权限说明如下：

- 读取权限：读取权限用于对数据的查询接口，例如：订单查询、成交查询等。
- 交易权限：交易权限用于下单、撤单、划转类接口。
- 提币权限：提币权限用于创建提币订单、取消提币订单操作。

创建成功后请务必记住以下信息：

- `Access Key`  API 访问密钥
  
- `Secret Key`  签名认证加密所使用的密钥（仅申请时可见）

<aside class="notice">
每个 API Key 最多可绑定 20个IP 地址(主机地址或网络地址)，未绑定 IP 地址的 API Key 有效期为90天。出于安全考虑，强烈建议您绑定 IP 地址。
</aside>
<aside class="warning">
<red><b>风险提示</b></red>：这两个密钥与账号安全紧密相关，无论何时都请勿将二者<b>同时</b>向其它人透露。API Key的泄露可能会造成您的资产损失（即使未开通提币权限），若发现API Key泄露请尽快删除该API Key。
</aside> 

## SDK与代码示例

**SDK（推荐）**

[Java](https://github.com/huobiapi/huobi_Java) | [Python3](https://github.com/huobiapi/huobi_Python) | [C++](https://github.com/huobiapi/huobi_Cpp) | [C#](https://github.com/HuobiRDCenter/huobi_CSharp) | [Go](https://github.com/huobirdcenter/huobi_golang)

**其它代码示例**

[https://github.com/huobiapi?tab=repositories](https://github.com/huobiapi?tab=repositories)

## 测试环境（已停止）

测试环境运行了一段时间后，因用户访问量很少，而维护成本很高，我们慎重决定后将其停止。

线上环境更稳定，流动性更好，建议您直接使用线上环境。 

## 接口类型

火币为用户提供两种接口，您可根据自己的使用场景和偏好来选择适合的方式进行查询行情、交易或提币。  

### REST API

REST，即Representational State Transfer的缩写，是目前较为流行的基于HTTP的一种通信机制，每一个URL代表一种资源。

交易或资产提币等一次性操作，建议开发者使用REST API进行操作。

### WebSocket API

WebSocket是HTML5一种新的协议（Protocol）。它实现了客户端与服务器全双工通信，通过一次简单的握手就可以建立客户端和服务器连接，服务器可以根据业务规则主动推送信息给客户端。

市场行情和买卖深度等信息，建议开发者使用WebSocket API进行获取。

**接口鉴权**

以上两种接口均包含公共接口和私有接口两种类型。

公共接口可用于获取基础信息和行情数据。公共接口无需认证即可调用。

私有接口可用于交易管理和账户管理。每个私有请求必须使用您的API Key进行签名验证。

## 接入URLs
您可以自行比较使用api.huobi.pro和api-aws.huobi.pro两个域名的延迟情况，选择延迟低的进行使用。     

其中，api-aws.huobi.pro域名对使用aws云服务的用户做了一定的链路延迟优化。  

**REST API**

**`https://api.huobi.pro`**  

**`https://api-aws.huobi.pro`**  

**Websocket Feed（行情，不包含MBP增量行情）**

**`wss://api.huobi.pro/ws`**  

**`wss://api-aws.huobi.pro/ws`**  

**Websocket Feed（行情，仅MBP增量行情）**

**`wss://api.huobi.pro/feed`**  

**`wss://api-aws.huobi.pro/feed`** 

**Websocket Feed（资产和订单）**

**`wss://api.huobi.pro/ws/v2`**  

**`wss://api-aws.huobi.pro/ws/v2`**     

<aside class="notice">
请使用中国大陆以外的 IP 访问火币 API。
</aside>
<aside class="notice">
鉴于延迟高和稳定性差等原因，不建议通过代理的方式访问火币API。
</aside>
<aside class="notice">
为保证API服务的稳定性，建议使用日本AWS云服务器进行访问。如使用中国大陆境内的客户端服务器，连接的稳定性将难以保证。 
</aside> 

## 签名认证

### 签名说明

API 请求在通过 internet 传输的过程中极有可能被篡改，为了确保请求未被更改，除公共接口（基础信息，行情数据）外的私有接口均必须使用您的 API Key 做签名认证，以校验参数或参数值在传输途中是否发生了更改。  
每一个API Key需要有适当的权限才能访问相应的接口，每个新创建的API Key都需要分配权限。在使用接口前，请查看每个接口的权限类型，并确认你的API Key有相应的权限。

一个合法的请求由以下几部分组成：

- 方法请求地址：即访问服务器地址 api.huobi.pro，比如 api.huobi.pro/v1/order/orders。
- API 访问Id（AccessKeyId）：您申请的 API Key 中的 Access Key。
- 签名方法（SignatureMethod）：用户计算签名的基于哈希的协议，此处使用 HmacSHA256。
- 签名版本（SignatureVersion）：签名协议的版本，此处使用2。
- 时间戳（Timestamp）：您发出请求的时间 (UTC 时间)  。如：2017-05-11T16:22:06。在查询请求中包含此值有助于防止第三方截取您的请求。
- 必选和可选参数：每个方法都有一组用于定义 API 调用的必需参数和可选参数。可以在每个方法的说明中查看这些参数及其含义。 
  - 对于 GET 请求，每个方法自带的参数都需要进行签名运算。
  - 对于 POST 请求，每个方法自带的参数不进行签名认证，并且需要放在 body 中。
- 签名：签名计算得出的值，用于确保签名有效和未被篡改。

### 签名步骤

规范要计算签名的请求 因为使用 HMAC 进行签名计算时，使用不同内容计算得到的结果会完全不同。所以在进行签名计算前，请先对请求进行规范化处理。下面以查询某订单详情请求为例进行说明：

查询某订单详情时完整的请求URL

`https://api.huobi.pro/v1/order/orders?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

`&order-id=1234567890`

**1. 请求方法（GET 或 POST，WebSocket用GET），后面添加换行符 “\n”**

例如：
`GET\n`

**2. 添加小写的访问域名，后面添加换行符 “\n”**

例如：
`
api.huobi.pro\n
`

**3. 访问方法的路径，后面添加换行符 “\n”**

例如查询订单：<br>
`
/v1/order/orders\n
`

例如WebSocket v2<br>
`
/ws/v2
`

**4. 对参数进行URL编码，并且按照ASCII码顺序进行排序**

例如，下面是请求参数的原始顺序，且进行URL编码后


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`order-id=1234567890`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

<aside class="notice">
使用 UTF-8 编码，且进行了 URL 编码，十六进制字符必须大写，如 “:” 会被编码为 “%3A” ，空格被编码为 “%20”。
</aside>
<aside class="notice">
时间戳（Timestamp）需要以YYYY-MM-DDThh:mm:ss格式添加并且进行 URL 编码。时间戳有效时间5分钟。
</aside>

经过排序之后

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`order-id=1234567890`

**5. 按照以上顺序，将各参数使用字符 “&” 连接**


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&order-id=1234567890`

**6. 组成最终的要进行签名计算的字符串如下**

`GET\n`

`api.huobi.pro\n`

`/v1/order/orders\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&order-id=1234567890`


**7. 用上一步里生成的 “请求字符串” 和你的密钥 (Secret Key) 生成一个数字签名**


1. 将上一步得到的请求字符串和 API 私钥作为两个参数，调用HmacSHA256哈希函数来获得哈希值。
2. 将此哈希值用base-64编码，得到的值作为此次接口调用的数字签名。

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

**8. 将生成的数字签名加入到请求里**

对于Rest接口：

1. 把所有必须的认证参数添加到接口调用的路径参数里
2. 把数字签名在URL编码后加入到路径参数里，参数名为“Signature”。

最终，发送到服务器的 API 请求应该为

`https://api.huobi.pro/v1/order/orders?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&order-id=1234567890&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`

对于WebSocket接口：

1. 按照要求的JSON格式，填入参数和签名。
2. JSON请求中的参数不需要URL编码

例如：

`
{
    "action": "req", 
    "ch": "auth",
    "params": { 
        "authType":"api",
        "accessKey": "e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx",
        "signatureMethod": "HmacSHA256",
        "signatureVersion": "2.1",
        "timestamp": "2019-09-01T18:16:16",
        "signature": "4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o="
    }
}
`

## 子用户

子用户可以用来隔离资产与交易，资产可以在母子用户之间划转；子用户只能在子用户内进行交易，并且子用户之间资产不能直接划转，只有母用户有划转权限。  

子用户拥有独立的登录账号密码和 API Key，均由母用户在网页端进行管理。 

每个母用户可创建200个子用户，每个子用户可创建20组Api Key，每个Api Key可对应设置读取、交易两种权限。

子用户的 API Key 也可绑定 IP 地址, 有效期的限制与母用户的API Key一致。

您可以点击 <a href='https://account.hbg.com/zh-cn/subaccount/management/'>这里 </a> 创建子用户并管理。  

子用户可以访问所有公共接口，包括基本信息和市场行情，子用户可以访问的私有接口如下：

| 接口                                                         | 说明                            |      |
| ------------------------------------------------------------ | ------------------------------- | ---- |
| [POST /v1/order/orders/place](#fd6ce2a756)                   | 创建并执行订单                  |      |
| [POST /v1/order/orders/{order-id}/submitcancel](#4e53c0fccd) | 撤销一个订单                    |      |
| [POST /v1/order/orders/submitCancelClientOrder](#client-order-id) | 撤销订单（基于client order ID） |      |
| [POST /v1/order/orders/batchcancel](#ad00632ed5)             | 批量撤销订单                    |      |
| [POST /v1/order/orders/batchCancelOpenOrders](#open-orders)  | 撤销当前委托订单                |      |
| [GET /v1/order/orders/{order-id}](#92d59b6aad)               | 查询一个订单详情                |      |
| [GET /v1/order/orders](#d72a5b49e7)                          | 查询当前委托、历史委托          |      |
| [GET /v1/order/openOrders](#95f2078356)                      | 查询当前委托订单                |      |
| [GET /v1/order/matchresults](#0fa6055598)                    | 查询成交                        |      |
| [GET /v1/order/orders/{order-id}/matchresults](#56c6c47284)  | 查询某个订单的成交明细          |      |
| [GET /v1/account/accounts](#bd9157656f)                      | 查询当前用户的所有账户          |      |
| [GET /v1/account/accounts/{account-id}/balance](#870c0ab88b) | 查询指定账户的余额              |      |
| [POST /v1/futures/transfer](#e227a2a3e8)                     | 币币与合约账户间的资产划转      |      |
| [POST /v1/dw/transfer-in/margin](#0d3c2e7382)                | 从币币交易账户划转至杠杆账户    |      |
| [POST /v1/dw/transfer-out/margin](#0d3c2e7382)               | 从杠杆账户划转至币币交易账户    |      |
| [POST /v1/margin/orders](#48cca1ce88)                        | 申请借币                        |      |
| [POST /v1/margin/orders/{order-id}/repay](#48aa7c8199)       | 归还借币                        |      |
| [GET /v1/margin/loan-orders](#e52396720a)                    | 查询借币记录                    |      |
| [GET /v1/margin/accounts/balance](#6e79ba8e80)               | 查询杠杆账户余额                |      |
| [GET /v1/account/history](#84f1b5486d)                       | 查询账户流水                    |      |
| [POST /v1/cross-margin/transfer-in](#0d3c2e7382-2)           | 资产划转                        |      |
| [POST /v1/cross-margin/transfer-out](#0d3c2e7382-2)          | 资产划转                        |      |
| [GET /v1/cross-margin/loan-info](#e257b9b6a0-2)              | 查询借币币息率及额度            |      |
| [POST /v1/cross-margin/orders](#0ef2de08fa-2)                | 申请借币                        |      |
| [POST /v1/cross-margin/orders/{order-id}/repay](#097277f9fc-2) | 归还借币                        |      |
| [GET /v1/cross-margin/loan-orders](#1e90599f7f-2)            | 查询借币订单                    |      |
| [GET /v1/cross-margin/accounts/balance](#bf3a643133-2)       | 借币账户详情                    |      |
| [GET /v2/account/ledger](#2f6797c498)                        | 查询财务流水                    |      |
| [POST /v1/account/transfer](#0d3c2e7382)                     | 资产划转                        |      |
| [GET /v2/point/account](#0d7f115f63)                         | 查询点卡余额                    |      |
| [POST /v2/point/transfer](#c71521e5d9)                       | 点卡划转                        |      |
| [GET /v2/etp/reference](#8bb7c6b75e)                         | 杠杆ETP基础参考信息             |      |
| [POST /v2/etp/creation](#etp-4)                              | 杠杆ETP换入                     |      |
| [POST /v2/etp/redemption](#etp-5)                            | 杠杆ETP换出                     |      |
| [GET /v2/etp/transactions](#etp-6)                           | 获取杠杆ETP换入换出记录         |      |
| [GET /v2/etp/transaction](#etp-7)                            | 获取特定杠杆ETP换入换出记录     |      |
| [GET /v2/etp/rebalance](#etp-8)                              | 获取杠杆ETP调仓记录             |      |

<aside class="notice">
其他接口子用户不可访问，如果尝试访问，系统会返回 “error-code 403”。
</aside>

## 业务字典

### 交易对

交易对由基础币种和报价币种组成。以交易对 BTC/USDT 为例，BTC 为基础币种，USDT 为报价币种。  

基础币种对应字段为 base-currency 。  

报价币种对应字段为 quote-currency 。 

### 账户

不同业务对应需要不同的账户，account-id为不同业务账户的唯一标识ID。  

account-id可通过/v1/account/accounts接口获取，并根据account-type区分具体账户。  

账户类型包括：   

* spot：现货账户  
* otc：OTC账户  
* margin：逐仓杠杆账户，该账户类型以subType区分具体币种对账户  
* super-margin（或cross-margin）：全仓杠杆账户  
* point：点卡账户  
* minepool：矿池账户  
* etf：ETF账户 
* 抵押借贷：crypto-loans

更多信息，可以点击<a href='https://www.huobi.com/zh-cn/guide/'>火币成长学院</a> 进行了解。

# 接入说明

## 接口概览

| 接口分类       | 分类链接                     | 概述                                             |
| -------------- | ---------------------------- | ------------------------------------------------ |
| 基础类         | /v1/common/*                 | 基础类接口，包括币种、币种对、时间戳等接口       |
| 行情类         | /market/*                    | 公共行情类接口，包括成交、深度、行情等           |
| 账户类         | /v1/account/*  /v1/subuser/* | 账户类接口，包括账户信息，子用户等               |
| 订单类         | /v1/order/*                  | 订单类接口，包括下单、撤单、订单查询、成交查询等 |
| 逐仓杠杆类     | /v1/margin/*                 | 逐仓杠杆类接口，包括借币、还币、查询等           |
| 全仓杠杆类接口 | /v1/cross-margin/*           | 全仓杠杆类接口，包括借币、还币、查询等           |

该分类为大类整理，部分接口未遵循此规则，请根据需求查看有关接口文档。

## 新限频规则

- 当前，新限频规则正在逐步上线中，已单独标注限频值的接口且该限频值被标注为NEW的接口适用新限频规则。

- 新限频规则采用基于UID的限频机制，即，同一UID下各API Key同时对某单个节点请求的频率不能超出单位时间内该节点最大允许访问次数的限制。

- 用户可根据Http Header中的"X-HB-RateLimit-Requests-Remain"（限频剩余次数）及"X-HB-RateLimit-Requests-Expire"（窗口过期时间）查看当前限频使用情况，以及所在时间窗口的过期时间，根据该数值动态调整您的请求频率。

## 限频规则

除已单独标注限频值为NEW的接口外 -<br>
* 每个API Key 在1秒之内限制10次<br>
* 若接口不需要API Key，则每个IP在1秒内限制10次<br>

比如：

* 资产订单类接口调用根据API Key进行限频：1秒10次
* 行情类接口调用根据IP进行限频：1秒10次

## 请求格式

所有的API请求都是restful，目前只有两种方法：GET和POST

* GET请求：所有的参数都在路径参数里
* POST请求，所有参数以JSON格式发送在请求主体（body）里

## 返回格式

所有的接口都是JSON格式。其中v1和v2接口的JSON定义略有区别。

**v1接口返回格式**：最上层有四个字段：`status`, `ch`,  `ts` 和 `data`。前三个字段表示请求状态和属性，实际的业务数据在`data`字段里。

以下是一个返回格式的样例：

```json
{
  "status": "ok",
  "ch": "market.btcusdt.kline.1day",
  "ts": 1499223904680,
  "data": // per API response data in nested JSON object
}
```

| 参数名称 | 数据类型 | 描述                                                         |
| -------- | -------- | ------------------------------------------------------------ |
| status   | string   | API接口返回状态                                              |
| ch       | string   | 接口数据对应的数据流。部分接口没有对应数据流因此不返回此字段 |
| ts       | long     | 接口返回的UTC时间的时间戳，单位毫秒                          |
| data     | object   | 接口返回数据主体                                             |

**v2接口返回格式**：最上层有三个字段：`code`, `message` 和 `data`。前两个字段表示返回码和错误消息，实际的业务数据在`data`字段里。

以下是一个返回格式的样例：

```json
{
  "code": 200,
  "message": "",
  "data": // per API response data in nested JSON object
}
```

| 参数名称 | 数据类型 | 描述               |
| -------- | -------- | ------------------ |
| code     | int      | API接口返回码      |
| message  | string   | 错误消息（如果有） |
| data     | object   | 接口返回数据主体   |

## 数据类型

本文档对JSON格式中数据类型的描述做如下约定：

- `string`: 字符串类型，用双引号（"）引用
- `int`: 32位整数，主要涉及到状态码、大小、次数等
- `long`: 64位整数，主要涉及到Id和时间戳
- `float`: 浮点数，主要涉及到金额和价格，建议程序中使用高精度浮点型
- `object`: 对象，包含一个子对象{}
- `array`: 数组，包含多个对象

## 最佳实践

###安全类
- 强烈建议：在申请API Key时，请绑定您的IP地址，以此来保证您的API Key仅能在您自己的IP上使用。另外，在API Key未绑定IP时，有效期为90天，绑定IP后，则永远不会过期。
- 强烈建议：不要将API Key暴露给任何人（包括第三方软件或机构），API Key代表了您的账户权限，API Key的暴露可能会对您的信息、资金造成损失，若API Key泄露，请尽快删除并重新创建。

###公共类
**API访问建议**

- 不建议在中国大陆境内使用临时域名以及代理的方式访问Huobi API，此类方式访问API连接的稳定性很难保证。
- 建议使用日本AWS云服务器进行访问。
- 官方域名api.huobi.pro, api-aws.huobi.pro，若您使用了AWS云服务，建议使用api-aws.huobi.pro域名，该域名为AWS用户做了链路上的优化，链路延迟相对更低。

**新限频规则**

- 当前最新限频规则正在逐步上线中，已单独标注限频值的接口适用新限频规则。

- 用户可根据Http Header中“X-HB-RateLimit-Requests-Remain（限频剩余次数）”，“X-HB-RateLimit-Requests-Expire（窗口过期时间）”查看当前限频使用情况，以及所在时间窗口的过期时间，根据该数值动态调整您的请求频率。

- 同一UID下各API Key同时对某单个节点请求的频率不能超出单位时间内该节点最大允许访问次数的限制。

###行情类
**行情类数据的获取**

- 行情类数据推荐使用WebSocket方式实时接收数据变化的推送，并在程序中进行数据的缓存，WebSocket方式实时性更高，且不受限频的影响。
- 建议用户不要在同一条WebSocket连接中订阅过多的主题和币种对，否则可能会因为上游数据量过大，导致网络阻塞，以至于连接断连。

**最新成交价格的获取**

- 推荐使用WebSocket的方式订阅`market.$symbol.trade.detail`主题，该主题为逐笔成交信息推送，该数据中成交的Price即为最新成交价格，且实时性更高。

**盘口深度的获取**

- 若对盘口数据的要求仅为买一卖一，可使用WebSocket订阅`market.$symbol.bbo`主题，该主题会在买一卖一变更时进行推送。
- 若需要多档数据，且对数据的实时性要求不高的情况下，可使用WebSocket订阅`market.$symbol.depth.$type`主题，该主题推送周期为1秒。
- 若需要多档数据，且对数据的实时性要求较高的情况下，可使用WebSocket订阅`market.$symbol.mbp.$levels`主题，并使用该主题发送req请求，构建本地深度，并增量更新，该主题增量消息推送最快周期为100ms。
- 建议使用Rest（`/market/depth`）、WebSocket全量推送（`market.$symbol.depth.$type`）获取深度时，根据version字段对数据进行去重（舍弃较小的version）；使用WebSocket增量推送（`market.$symbol.mbp.$levels`）时，根据seqNum字段进行去重（舍弃较小的seqNum）。

**最新成交的获取**

- 建议订阅WebSocket成交明细（`market.$symbol.trade.detail`）主题时，可根据tradeId字段对数据进行去重。

###订单类
**下单接口（/v1/order/orders/place）**

- 建议用户下单前根据`/v1/common/symbols`接口中返回的币种对参数数据对下单价格、下单数量等参进行校验，避免产生无效的下单请求。
- 推荐下单时携带`client-order-id`参数，且建议用户保证该参数的唯一性（每次发送请求时都不同，且唯一），该参数能够防止在发起下单请求时由于网络或其他原因造成接口超时或没有返回的情况，在此情况下，可根据`client-order-id`对WebSocket中推送过来的数据进行验证，或使用`/v1/order/orders/getClientOrder`接口查询该订单信息。 （对于用户下单时传入的clientOrderId 的唯一性不进行校验，若发生多笔订单使用同一clientOrderId的情况，查询/撤单时将返回该clientOrderId对映的最近一笔订单。）

**搜索历史订单（/v1/order/orders）**

- 推荐使用`start-time`、`end-time`参数进行查询，该参数传入值为13位时间戳（精确至毫秒），使用该参数查询时最大查询窗口为48小时（2天），推荐按照小时进行查询，您搜索的时间范围越小，时间戳准确性越高，查询的效率会更高，可以根据上次查询的时间戳进行迭代查询。

**订单状态变化的通知**

- 建议使用WebSocket订阅`orders.$symbol.update`主题，该主题拥有更低的数据延迟以及更准确的消息顺序。
- 不建议使用WebSocket订阅`orders.$symbol`主题，该主题已由`orders.$symbol.update`取代，会在后续停止服务，请尽早更换使用。

###账户类
**资产变更**

- 使用WebSocket的方式，同时订阅`orders.$symbol.update`、`accounts.update#${mode}`主题，`orders.$symbol.update`用于接收订单的状态变化（创建、成交、撤销以及相关成交价格、数量信息），由于该主题在推送数据时，未经过清算，所以时效性更快，可根据`accounts.update#${mode}`主题接收相关资产的变更信息，以此来维护账户内的资金情况。
- 不建议WebSocket订阅`accounts`主题，该主题已由`accounts.update#${mode}`取代，会在后续停止服务，请尽早更换使用。

# 在线演示

API[在线演示](https://open.huobigroup.com/)可以让用户不需要写任何一行代码，只要鼠标点击就可以直接调用线上每个API，并可以观察到调用API的请求和返回结果。该调试工具界面和API文档类似，提供了参数输入框和返回字段的说明，用户可以快速上手，几乎不需要额外的使用手册。

该工具封装了共享的API Key，并且在调用私有接口后会将详细的签名过程和参数展示出来。如果您的程序遇到签名问题无法解决，可以将在其用到的API Key和时间戳复制到您的程序中
，将两者进行对比，发现签名失败的原因。

# 在线提问

用户可以在线提问与搜索相关问题

[在线问答知识库系统](https://open.huobigroup.com/cms) 


# 常见问题

本章列举了和具体API无关的通用常见问题，如网络、签名或通用错误等。

针对某类或某个API的问题，请查看每章API的错误码和常见问题。

### Q1：什么是UID和account-id？
A：UID是用户ID，是标示每个用户的唯一ID（包括母用户和子用户），UID可以在Web或App界面的个人信息里查看到，也可以通过接口 `GET /v2/user/uid`获得。

account-id则是该用户下不同业务账户的ID，需要通过`GET /v1/account/accounts`接口获取，并根据account-type区分具体账户。如果需要开通某个账户，需要首先通过Web或App开通并向该账户进行转账。

账户类型包括但不限于如下账户（合约账户不包括在内）：

- spot 现货账户  
- otc OTC账户  
- margin 逐仓杠杆账户，该账户类型以subType区分具体币种对账户  
- super-margin（或cross-margin） 全仓杠杆账户 
- investment C2C杠杆借出账户
- borrow C2C杠杆借入账户
- point 点卡账户  
- minepool 矿池账户 
- etf ETF账户  

### Q2：一个用户可以申请多少个API Key？

每个母用户可创建20组API Key，每个API Key可对应设置读取、交易、提币三种权限。 
每个母用户还可创建200个子用户，每个子用户可创建20组API Key，每个API Key可对应设置读取、交易两种权限。   

以下是三种权限的说明：  

- 读取权限：读取权限用于对数据的查询接口，例如：订单查询、成交查询等。  
- 交易权限：交易权限用于下单、撤单、划转类接口。  
- 提币权限：提币权限用于创建提币订单、取消提币订单操作。  

### Q3：为什么经常出现断线、超时的情况？

请检查是否属于以下情况：

1. 客户端服务器如在中国大陆境内，连接的稳定性很难保证，建议使用日本AWS云服务器进行访问。 
2. 域名建议使用api.huobi.pro或api-aws.huobi.pro，其他不建议使用。

### Q4：为什么WebSocket总是断开连接？

常见原因有：

1. 未回复Pong，WebSocket连接需在接收到服务端发送的Ping信息后回复Pong，保证连接的稳定。
2. 网络原因造成客户端发送了Pong消息，但服务端并未接收到。
3. 网络原因造成连接断开。
4. 建议用户做好WebSocket连接断连重连机制，在确保心跳（Ping/Pong）消息正确回复后若连接意外断开，程序能够自动进行重新连接。

### Q5：api.huobi.pro 与 api-aws.huobi.pro有什么区别？

api-aws.huobi.pro域名对使用aws云服务的用户做了链路延迟优化，请求时延更低。

### Q6：为什么签名认证总返回失败？

请检查如下可能的原因：

1、签名参数应该按照ASCII码排序。比如下面是原始的参数：

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`order-id=1234567890`

`SignatureMethod=HmacSHA256` 

`SignatureVersion=2`  

`Timestamp=2017-05-11T15%3A19%3A30` 

排序之后应该为：

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

`order-id=1234567890`

2、签名串需进行URL编码。比如：

- 冒号 `:`会被编码为`%3A`，空格会被编码为 `%20`
- 时间戳需要格式化为 `YYYY-MM-DDThh:mm:ss` ，经过URL编码之后为 `2017-05-11T15%3A19%3A30`  

3、签名需进行 base64 编码

4、Get请求参数需在签名串中

5、时间为UTC时间转换为YYYY-MM-DDTHH:mm:ss

6、检查本机时间与标准时间是否存在偏差（偏差应小于1分钟）

7、WebSocket发送验签认证消息时，消息体不需要URL编码

8、签名时所带Host应与请求接口时Host相同

如果您使用了代理，代理可能会改变请求Host，可以尝试去掉代理；

或者，您使用的网络连接库可能会把端口包含在Host内，可以尝试在签名用到的Host中包含端口，如“api.huobi.pro:443"

9、Access Key 与 Secret Key中是否存在隐藏特殊字符，影响签名

10、检查生成 HmacSHA256 签名结果后是否直接将byte[] 转 Base64 编码，而不是使用其签名结果转换16进制字符串的内容再进行 Base64 编码。

当前官方已支持多种语言的[SDK](https://github.com/HuobiRDCenter)，可以参考SDK的签名实现，或者以下三种语言的签名样例代码

<a href='https://github.com/HuobiRDCenter/huobi_Java/blob/master/java_signature_demo.md'>JAVA签名样例代码</a> | <a href='https://github.com/HuobiRDCenter/huobi_Python/blob/master/example/python_signature_demo.md'>Python签名样例代码</a>   | <a href='https://github.com/HuobiRDCenter/huobi_Cpp/blob/master/examples/cpp_signature_demo.md'>C++签名样例代码 </a>  

### Q7：调用接口返回Incorrect Access Key 错误是什么原因？

请检查URL请求中Access Key是否传递准确，例如：

1. Access Key没有传递
2. Access Key位数不准确
3. Access Key已经被删除
4. URL请求中参数拼接错误或者特殊字符没有进行编码导致服务端对AccessKey解析不正确

### Q8：调用接口返回 gateway-internal-error 错误是什么原因？

请检查是否属于以下情况：

1. 可能为网络原因或服务内部错误，请稍后进行重试。
2. 发送数据格式是否正确（需要标准JSON格式）。
3. POST请求头header需要声明为`Content-Type:application/json` 。

### Q9：调用接口返回 login-required 错误是什么原因？

请检查是否属于以下情况：

1. 未将AccessKey参数带入URL中。
2. 未将Signature参数带入URL中。

### Q10: 调用Rest接口返回HTTP 405错误 method-not-allowed 是什么原因？

该错误表明调用了不存在的Rest接口，请检查Rest接口路径是否准确。由于Nginx的设置，请求路径(Path)是大小写敏感的，请严格按照文档声明的大小写。

# 联系我们

## 做市商项目

欢迎有优秀 maker 策略且交易量大的用户参与长期做市商项目。如果您的火币现货账户或者合约账户中有折合大于10BTC资产（币币和合约账户分开统计），请提供以下信息发送邮件至：

- [Vip@global-hgroup.com](mailto:Vip@global-hgroup.com) Huobi Global（现货 / 杠杆）做市商申请；
- [Vip@global-hgroup.com](mailto:Vip@global-hgroup.com) HBDM（合约）做市商申请。

1. 提供 UID （需不存在返佣关系的 UID）；
2. 提供其他交易平台 maker 交易量截图证明（比如30天内成交量，或者 VIP 等级等）；
3. 请简要阐述做市方法，不需要细节。 

<aside class="notice">
做市商项目不支持点卡抵扣、VIP、交易量相关活动以及任何形式的返佣活动。
</aside>

## 技术支持

使用过程中如有问题或者建议，您可选择以下任一方式联系我们：

- 加入官方QQ群（Huobi Global Spot API交流群 1160839820），入群申请请注明UID和编程语言。
- 通过官网的“帮助中心”或者发送邮件至support@huobigroup.com联系客服。

如您遇到API错误，请按照如下模板向我们反馈问题。

`1. 问题描述`  
`2. 问题发生的用户Id(UID)，账户Id和订单Id(如果和账户、订单有关系)`  
`3. 完整的URL请求`  
`4. 完整的JSON格式的请求参数（如果有）`  
`5. 完整的JSON格式的返回结果`  
`6. 问题出现时间和频率（如何时开始出现，是否可以重现）`  
`7. 签名前字符串（如果是签名认证错误）`  

下方是一个应用了模版的例子：

`1. 问题简要说明：签名错误`   
`2. UID：123456`  
`3. 完整的URL请求：GET https://api.huobi.pro/v1/account/accounts?&SignatureVersion=2&SignatureMethod=HmacSHA256&Timestamp=2019-11-06T03%3A25%3A39&AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&Signature=HhJwApXKpaLPewiYLczwfLkoTPnFPHgyF61iq0iTFF8%3D`  
`4. 完整的JSON格式的参数：无`     
`5. 完整的JSON格式的返回：{"status":"error","err-code":"api-signature-not-valid","err-msg":"Signature not valid: Incorrect Access key [Access key错误]","data":null}`  
`6. 问题出现频率：每次都会出现`  
`7. 签名前字符串`    
`GET\n`  
`api.huobi.pro\n`  
`/v1/account/accounts\n`   
`AccessKeyId=rfhxxxxx-950000847-boooooo3-432c0&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2019-11-06T03%3A26%3A13`   

注意：Access Key仅能证明您的身份，不会影响您账户的安全。切记**不**要将Secret Key信息分享给任何人，若您不小心将Secret Key暴露，请尽快[删除](https://www.hbg.com/zh-cn/apikey/)其对应的API Key，以免造成您的账户损失。

# 基础信息

## 简介

基础信息Rest接口提供了系统状态、市场状态、交易对信息、币种信息、币链信息、服务器时间戳等公共参考信息。

## 获取当前系统状态

此接口返回当前的系统状态，包含当前系统维护计划和故障进度等。

如您需要通过邮件、短信、Webhook、RSS/Atom feed接收以上信息，可点击<a href='https://status.huobigroup.com/'>这里</a>进入页面进行订阅。当前订阅依赖Google服务，订阅前请确保您可正常访问Google的服务，否则将订阅失败。

```shell
curl "https://status.huobigroup.com/api/v2/summary.json"
```

### HTTP 请求

- GET `https://status.huobigroup.com/api/v2/summary.json`

### 请求参数

此接口不接受任何参数。

> Response:

```json
{
  "page": {  // 火币现货页面基本信息
    "id": "p0qjfl24znv5",  // 页面id
    "name": "Huobi",  // 页面名称
    "url": "https://status.huobigroup.com", // 页面地址
    "time_zone": "Etc/UTC", // 时区
    "updated_at": "2020-02-07T10:25:14.717Z" // 页面最新一次更新时间
  },
  "components": [  // 系统组件及状态
    {
      "id": "h028tnzw1n5l",  // 组件id
      "name": "Deposit", // 组件名称
      "status": "operational", // 组件状态
      "created_at": "2019-12-05T02:07:12.372Z",  // 组件创建时间
      "updated_at": "2020-02-07T09:27:15.563Z", // 组件更新时间
      "position": 1,
      "description": null,
      "showcase": true,
      "group_id": "gtd0nyr3pf0k",  
      "page_id": "p0qjfl24znv5", 
      "group": false,
      "only_show_if_degraded": false
    }
  ],
  "incidents": [ // 系统故障事件及状态
        {
            "id": "rclfxz2g21ly",  // 事件id
            "name": "Market data is delayed",  // 事件名称
            "status": "investigating",  // 事件状态
            "created_at": "2020-02-11T03:15:01.913Z",  // 事件创建时间
            "updated_at": "2020-02-11T03:15:02.003Z",   // 事件更新时间
            "monitoring_at": null,
            "resolved_at": null,
            "impact": "minor",  // 事件影响程度
            "shortlink": "http://stspg.io/pkvbwp8jppf9",
            "started_at": "2020-02-11T03:15:01.906Z",
            "page_id": "p0qjfl24znv5",
            "incident_updates": [ 
                {
                    "id": "dwfsk5ttyvtb",  
                    "status": "investigating",  
                    "body": "Market data is delayed",  
                    "incident_id": "rclfxz2g21ly",   
                    "created_at": "2020-02-11T03:15:02.000Z",    
                    "updated_at": "2020-02-11T03:15:02.000Z",   
                    "display_at": "2020-02-11T03:15:02.000Z",    
                    "affected_components": [  
                        {
                            "code": "nctwm9tghxh6",  
                            "name": "Market data",  
                            "old_status": "operational",  
                            "new_status": "degraded_performance"   
                        }
                    ],
                    "deliver_notifications": true,
                    "custom_tweet": null,
                    "tweet_id": null
                }
            ],
            "components": [  
                {
                    "id": "nctwm9tghxh6",    
                    "name": "Market data", 
                    "status": "degraded_performance", 
                    "created_at": "2020-01-13T09:34:48.284Z", 
                    "updated_at": "2020-02-11T03:15:01.951Z", 
                    "position": 8,
                    "description": null,
                    "showcase": false,
                    "group_id": null,
                    "page_id": "p0qjfl24znv5",
                    "group": false,
                    "only_show_if_degraded": false
                }
            ]
        }
    ],
      "scheduled_maintenances": [  // 系统计划维护事件及状态
        {
            "id": "k7g299zl765l", // 事件id
            "name": "Schedule maintenance", // 事件名称
            "status": "scheduled", // 事件状态
            "created_at": "2020-02-11T03:16:31.481Z",  // 事件创建时间
            "updated_at": "2020-02-11T03:16:31.530Z",  // 事件更新时间
            "monitoring_at": null,
            "resolved_at": null,
            "impact": "maintenance", // 事件影响
            "shortlink": "http://stspg.io/md4t4ym7nytd",
            "started_at": "2020-02-11T03:16:31.474Z",
            "page_id": "p0qjfl24znv5",
            "incident_updates": [  
                {
                    "id": "8whgr3rlbld8",  
                    "status": "scheduled", 
                    "body": "We will be undergoing scheduled maintenance during this time.", 
                    "incident_id": "k7g299zl765l", 
                    "created_at": "2020-02-11T03:16:31.527Z",  
                    "updated_at": "2020-02-11T03:16:31.527Z",  
                    "display_at": "2020-02-11T03:16:31.527Z",  
                    "affected_components": [  
                        {
                            "code": "h028tnzw1n5l",  
                            "name": "Deposit And Withdraw - Deposit",  
                            "old_status": "operational",  
                            "new_status": "operational"  
                        }
                    ],
                    "deliver_notifications": true,
                    "custom_tweet": null,
                    "tweet_id": null
                }
            ],
            "components": [ 
                {
                    "id": "h028tnzw1n5l",  
                    "name": "Deposit", 
                    "status": "operational", 
                    "created_at": "2019-12-05T02:07:12.372Z",  
                    "updated_at": "2020-02-10T12:34:52.970Z",  
                    "position": 1,
                    "description": null,
                    "showcase": false,
                    "group_id": "gtd0nyr3pf0k",
                    "page_id": "p0qjfl24znv5",
                    "group": false,
                    "only_show_if_degraded": false
                }
            ],
            "scheduled_for": "2020-02-15T00:00:00.000Z",  // 计划维护开始时间
            "scheduled_until": "2020-02-15T01:00:00.000Z"  // 计划维护结束时间
        }
    ],
    "status": {  // 系统整体状态
        "indicator": "minor",   // 系统状态指标
        "description": "Partially Degraded Service"  // 系统状态描述
    }
}
```

### 返回字段

|字段名称 | 数据类型 | 描述
|--------- |  -----------|  -----------
|page    |                     | 火币现货status page页面基本信息
|{id        |  string                   | 页面id
|name      |      string                | 页面名称
|url     |    string                  | 页面地址
|time_zone     |     string                 | 时区
|updated_at}     |    string                  | 页面更新时间
|components  |                      | 系统组件及状态
|[{id        |  string                    | 组件id
|name        |    string                  | 组件名称，如Order submission、Order cancellation、Deposit等
|status        |    string                  | 组件状态，取值范围为：operational，degraded_performance，partial_outage，major_outage，under maintenance
|created_at        |    string                  | 组件创建时间
|updated_at        |    string                  | 组件更新时间
|.......}]        |                     | 其他字段明细，请参考返回示例
|incidents  |           | 系统故障事件及状态，若当前无故障则返回为空
|[{id        |       string               | 事件id
|name        |      string                | 事件名称
|status        |     string                 | 事件状态，取值范围为：investigating，identified，monitoring，resolved
|created_at        |       string               | 事件创建时间
|updated_at        |      string                | 事件更新时间
|.......}]        |                     | 其他字段明细，请参考返回示例
|scheduled_maintenances|                     | 系统计划维护事件及状态，若当前无计划维护则返回为空
|[{id        |     string                 | 事件id
|name        |      string                | 事件名称
|status        |       string               | 事件状态，取值范围为：scheduled，in progress，verifying，completed
|created_at        |     string                 | 事件创建时间
|updated_at        |     string                 | 事件更新时间
|scheduled_for       |      string                | 计划维护开始时间
|scheduled_until       |     string                 | 计划维护结束时间
|.......}]        |                     | 其他字段明细，请参考返回示例
|status   |                       | 系统整体状态
|{indicator        |    string                  | 系统状态指标，取值范围为：none，minor，major，critical，maintenance
|description}     |      string                | 系统状态描述，取值范围为：All Systems Operational，Minor Service Outager，Partial System Outage，Partially Degraded Service，Service Under Maintenance

## 获取当前市场状态

此节点返回当前最新市场状态。<br>
状态枚举值包括: 1 - 正常（可下单可撤单），2 - 挂起（不可下单不可撤单），3 - 仅撤单（不可下单可撤单）。<br>
挂起原因枚举值包括: 2 - 紧急维护，3 - 计划维护。<br>

```shell
curl "https://api.huobi.pro/v2/market-status"
```


### HTTP 请求

- GET `/v2/market-status`

### 请求参数

此接口不接受任何参数。

> Responds:

```json
{
    "code": 200,
    "message": "success",
    "data": {
        "marketStatus": 1
    }
}
```

### 返回字段

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	---------	|	--------	|	-----------	|
|	code	|	integer	|	TRUE	|	状态码	|
|	message	|	string	|	FALSE	|	错误描述（如有）	|
|	\<data\>	|	object	|	TRUE	|		|
|	marketStatus	|	integer	|	TRUE	|	市场状态（1=normal, 2=halted, 3=cancel-only）	|
|	haltStartTime	|	long	|	FALSE	|	市场暂停开始时间（unix time in millisecond），仅对marketStatus=halted或cancel-only有效	|
|	haltEndTime	|	long	|	FALSE	|	市场暂停预计结束时间（unix time in millisecond），仅对marketStatus=halted或cancel-only有效；如在marketStatus=halted或cancel-only时未返回此字段，意味着市场暂停结束时间暂时无法预计	|
|	haltReason	|	integer	|	FALSE	|	市场暂停原因（2=emergency-maintenance, 3=scheduled-maintenance），仅对marketStatus=halted或cancel-only有效	|
|	affectedSymbols	|	string	|	FALSE	|	市场暂停影响的交易对列表，以逗号分隔，如影响所有交易对返回"all"，仅对marketStatus=halted或cancel-only有效	|
|	\</data\>	|	 	|	 	|		|

## 获取所有交易对

此接口返回所有火币全球站支持的交易对。

```shell
curl "https://api.huobi.pro/v1/common/symbols"
```


### HTTP 请求

- GET `/v1/common/symbols`

### 请求参数

此接口不接受任何参数。

> Responds:

```json
{
    "status": "ok",
    "data": [
        {
            "base-currency": "ekt",
            "quote-currency": "usdt",
            "price-precision": 6,
            "amount-precision": 2,
            "symbol-partition": "innovation",
            "symbol": "ektusdt",
            "state": "online",
            "value-precision": 8,
            "min-order-amt": 0.1,
            "max-order-amt": 10000000,
            "min-order-value": 5,
            "limit-order-min-order-amt": 0.1,
            "limit-order-max-order-amt": 10000000,
            "limit-order-max-buy-amt": 10000000,
            "limit-order-max-sell-amt": 10000000,
            "sell-market-min-order-amt": 0.1,
            "sell-market-max-order-amt": 1000000,
            "buy-market-max-order-value": 200000,
            "api-trading": "enabled"
        },
        {
            "base-currency": "snx",
            "quote-currency": "husd",
            "price-precision": 4,
            "amount-precision": 2,
            "symbol-partition": "innovation",
            "symbol": "snxhusd",
            "state": "online",
            "value-precision": 8,
            "min-order-amt": 0.01,
            "max-order-amt": 250000,
            "min-order-value": 5,
            "limit-order-min-order-amt": 0.01,
            "limit-order-max-order-amt": 250000,
            "limit-order-max-buy-amt": 250000,
            "limit-order-max-sell-amt": 250000,
            "sell-market-min-order-amt": 0.01,
            "sell-market-max-order-amt": 25000,
            "buy-market-max-order-value": 100000,
            "api-trading": "enabled"
        }
    ]
}
```

### 返回字段

| 字段名称                   | 是否必须 | 数据类型 | 描述                                                         |
| -------------------------- | -------- | -------- | ------------------------------------------------------------ |
| status             | true     | string   | 请求返回的结果（"ok","error"）                                          |
| \<data\>             | true     | object   |                                         |
| base-currency              | true     | string   | 交易对中的基础币种                                           |
| quote-currency             | true     | string   | 交易对中的报价币种                                           |
| price-precision            | true     | integer  | 交易对报价的精度（小数点后位数），限价买入与限价卖出价格使用 |
| amount-precision           | true     | integer  | 交易对基础币种计数精度（小数点后位数），限价买入、限价卖出、市价卖出数量使用 |
| symbol-partition           | true     | string   | 交易区，可能值: [main，innovation]                           |
| symbol                     | true     | string   | 交易对                                                       |
| state                      | true     | string   | 交易对状态；可能值: [online，offline,suspend] online - 已上线；offline - 交易对已下线，不可交易；suspend -- 交易暂停；pre-online - 即将上线 |
| value-precision            | true     | integer  | 交易对交易金额的精度（小数点后位数），市价买入金额使用       |
| min-order-amt              | true     | float    | 交易对限价单最小下单量 ，以基础币种为单位（即将废弃）        |
| max-order-amt              | true     | float    | 交易对限价单最大下单量 ，以基础币种为单位（即将废弃）        |
| limit-order-min-order-amt  | true     | float    | 交易对限价单最小下单量 ，以基础币种为单位（NEW）             |
| limit-order-max-order-amt  | true     | float    | 交易对限价单最大下单量 ，以基础币种为单位（NEW）             |
| sell-market-min-order-amt  | true     | float    | 交易对市价卖单最小下单量，以基础币种为单位（NEW）            |
| sell-market-max-order-amt  | true     | float    | 交易对市价卖单最大下单量，以基础币种为单位（NEW）            |
| buy-market-max-order-value | true     | float    | 交易对市价买单最大下单金额，以计价币种为单位（NEW）          |
| min-order-value            | true     | float    | 交易对限价单和市价买单最小下单金额 ，以计价币种为单位        |
| max-order-value            | false    | float    | 交易对限价单和市价买单最大下单金额 ，以折算后的USDT为单位（NEW） |
| leverage-ratio             | true     | float    | 交易对杠杆最大倍数(仅对逐仓杠杆交易对、全仓杠杆交易对、杠杆ETP交易对有效） |
| underlying                 | false    | string   | 标的交易代码 (仅对杠杆ETP交易对有效)                         |
| mgmt-fee-rate              | false    | float    | 持仓管理费费率 (仅对杠杆ETP交易对有效)                       |
| charge-time                | false    | string   | 持仓管理费收取时间 (24小时制，GMT+8，格式：HH:MM:SS，仅对杠杆ETP交易对有效) |
| rebal-time                 | false    | string   | 每日调仓时间 (24小时制，GMT+8，格式：HH:MM:SS，仅对杠杆ETP交易对有效) |
| rebal-threshold            | false    | float    | 临时调仓阈值 (以实际杠杆率计，仅对杠杆ETP交易对有效)         |
| init-nav                   | false    | float    | 初始净值（仅对杠杆ETP交易对有效）                            |
| api-trading                | true     | string   | API交易使能标记（有效值：enabled, disabled）                 |
| \</data\>             |      |    |                                         |


## 获取所有币种

此接口返回所有火币全球站支持的币种。


```shell
curl "https://api.huobi.pro/v1/common/currencys"
```

### HTTP 请求

- GET `/v1/common/currencys`


### 请求参数

此接口不接受任何参数。


> Response:

```json
{
    "status": "ok",
    "data": [
        "usdt",
        "btc",
        "bch",
        "eth",
        "xrp",
        "ltc",
        "ht",
        "ada"
    ]
}
```

### 返回字段

<aside class="notice">返回的“data”对象是一个字符串数组，每一个字符串代表一个支持的币种。</aside>

| 字段名称       | 是否必需 | 类型    | 字段描述   |
| -------------- | -------- | ------- | ---------- |
| status         | true     | string   | 接口请求返回的结果（"ok","error"）               |
| data         | true     | array   |  每一个字符串代表一个支持的币种              |


## APIv2 币链参考信息

此节点用于查询各币种及其所在区块链的静态参考信息（公共数据）

### HTTP 请求

- GET `/v2/reference/currencies`

```shell
curl "https://api.huobi.pro/v2/reference/currencies?currency=usdt"
```

### 请求参数

| 字段名称       | 是否必需 | 类型    | 字段描述   | 取值范围                                                     |
| -------------- | -------- | ------- | ---------- | ------------------------------------------------------------ |
| currency       | false    | string  | 币种       | btc, ltc, bch, eth, etc ...(取值参考`GET /v1/common/currencys`) |
| authorizedUser | false    | boolean | 已认证用户 | true or false (如不填，缺省为true)                           |

> Response:

```json
{
    "code":200,
    "data":[
        {
            "chains":[
                {
                    "chain":"trc20usdt",
                    "displayName":"",
                    "baseChain": "TRX",
                    "baseChainProtocol": "TRC20",
                    "isDynamic": false,
                    "depositStatus":"allowed",
                    "maxTransactFeeWithdraw":"1.00000000",
                    "maxWithdrawAmt":"280000.00000000",
                    "minDepositAmt":"100",
                    "minTransactFeeWithdraw":"0.10000000",
                    "minWithdrawAmt":"0.01",
                    "numOfConfirmations":999,
                    "numOfFastConfirmations":999,
                    "withdrawFeeType":"circulated",
                    "withdrawPrecision":5,
                    "withdrawQuotaPerDay":"280000.00000000",
                    "withdrawQuotaPerYear":"2800000.00000000",
                    "withdrawQuotaTotal":"2800000.00000000",
                    "withdrawStatus":"allowed"
                },
                {
                    "chain":"usdt",
                    "displayName":"",
                    "baseChain": "BTC",
                    "baseChainProtocol": "OMNI",
                    "isDynamic": false,
                    "depositStatus":"allowed",
                    "maxWithdrawAmt":"19000.00000000",
                    "minDepositAmt":"0.0001",
                    "minWithdrawAmt":"2",
                    "numOfConfirmations":30,
                    "numOfFastConfirmations":15,
                    "transactFeeRateWithdraw":"0.00100000",
                    "withdrawFeeType":"ratio",
                    "withdrawPrecision":7,
                    "withdrawQuotaPerDay":"90000.00000000",
                    "withdrawQuotaPerYear":"111000.00000000",
                    "withdrawQuotaTotal":"1110000.00000000",
                    "withdrawStatus":"allowed"
                },
                {
                    "chain":"usdterc20",
                    "displayName":"",
                    "baseChain": "ETH",
                    "baseChainProtocol": "ERC20",
                    "isDynamic": false,
                    "depositStatus":"allowed",
                    "maxWithdrawAmt":"18000.00000000",
                    "minDepositAmt":"100",
                    "minWithdrawAmt":"1",
                    "numOfConfirmations":999,
                    "numOfFastConfirmations":999,
                    "transactFeeWithdraw":"0.10000000",
                    "withdrawFeeType":"fixed",
                    "withdrawPrecision":6,
                    "withdrawQuotaPerDay":"180000.00000000",
                    "withdrawQuotaPerYear":"200000.00000000",
                    "withdrawQuotaTotal":"300000.00000000",
                    "withdrawStatus":"allowed"
                }
            ],
            "currency":"usdt",
            "instStatus":"normal"
        }
    ]
}

```

### 响应数据


| 字段名称                | 是否必需 | 数据类型 | 字段描述                                                     | 取值范围               |
| ----------------------- | -------- | -------- | ------------------------------------------------------------ | ---------------------- |
| code                    | true     | int      | 状态码                                                       |                        |
| message                 | false    | string   | 错误描述（如有）                                             |                        |
| \<data\>                | true     | object   |                                                              |                        |
| currency                | true     | string   | 币种                                                         |                        |
| \<chains\>                | true     | object   |                                                              |                        |
| chain                   | true     | string   | 链名称                                                       |                        |
| displayName             | true     | string   | 链显示名称                                                   |                        |
| baseChain               | false    | string   | 底层链名称                                                   |                        |
| baseChainProtocol       | false    | string   | 底层链协议                                                   |                        |
| isDynamic               | false    | boolean  | 是否动态手续费（仅对固定类型有效，withdrawFeeType=fixed）    | true,false             |
| numOfConfirmations      | true     | int      | 安全上账所需确认次数（达到确认次数后允许提币）               |                        |
| numOfFastConfirmations  | true     | int      | 快速上账所需确认次数（达到确认次数后允许交易但不允许提币）   |                        |
| minDepositAmt           | true     | string   | 单次最小充币金额                                             |                        |
| depositStatus           | true     | string   | 充币状态                                                     | allowed,prohibited     |
| minWithdrawAmt          | true     | string   | 单次最小提币金额                                             |                        |
| maxWithdrawAmt          | true     | string   | 单次最大提币金额                                             |                        |
| withdrawQuotaPerDay     | true     | string   | 当日提币额度（新加坡时区）                                   |                        |
| withdrawQuotaPerYear    | true     | string   | 当年提币额度                                                 |                        |
| withdrawQuotaTotal      | true     | string   | 总提币额度                                                   |                        |
| withdrawPrecision       | true     | int      | 提币精度                                                     |                        |
| withdrawFeeType         | true     | string   | 提币手续费类型（特定币种在特定链上的提币手续费类型唯一）     | fixed,circulated,ratio |
| transactFeeWithdraw     | false    | string   | 单次提币手续费（仅对固定类型有效，withdrawFeeType=fixed）    |                        |
| minTransactFeeWithdraw  | false    | string   | 最小单次提币手续费（仅对区间类型和有下限的比例类型有效，withdrawFeeType=circulated or ratio） |                        |
| maxTransactFeeWithdraw  | false    | string   | 最大单次提币手续费（仅对区间类型和有上限的比例类型有效，withdrawFeeType=circulated or ratio） |                        |
| transactFeeRateWithdraw | false    | string   | 单次提币手续费率（仅对比例类型有效，withdrawFeeType=ratio）  |                        |
| withdrawStatus          | true     | string   | 提币状态                                                     | allowed,prohibited     |
| \</data\>               |      |    |                                                              |                        |
| instStatus              | true     | string   | 币种状态                                                     | normal,delisted        |
| \</chains\>             |      |    |                                                              |                        |


### 状态码

| 状态码 | 错误信息                            | 错误场景描述 |
| ------ | ----------------------------------- | ------------ |
| 200    | success                             | 请求成功     |
| 500    | error                               | 系统错误     |
| 2002   | invalid field value in "field name" | 非法字段取值 |

## 获取当前系统时间戳

此接口返回当前的系统时间戳，即从 **UTC** 1970年1月1日0时0分0秒0毫秒到现在的总**毫秒**数。

```shell
curl "https://api.huobi.pro/v1/common/timestamp"
```

### HTTP 请求

- GET `/v1/common/timestamp`

### 请求参数

此接口不接受任何参数。

> Response:

```json
{
    "status":"ok",
    "data":1629715504949
}
```

### 返回参数

| 参数名称 | 	是否必须 | 	类型 | 	描述 | 	取值范围 |
| ------ | ------ | ------ | ------ | ------|
| status | 	true  |	string  |	请求处理结果	|
| data | 	true | 	long | 	当前系统时间戳	 |

# 行情数据

## 简介

行情数据接口提供了多种K线、深度以及最新成交记录等行情数据。

行情接口提供的数据每1分钟更新一次


## K 线数据（蜡烛图）

此接口返回历史K线数据。K线周期以新加坡时间为基准开始计算，例如日K线的起始周期为新加坡时间0时至新加坡时间次日0时。

<aside class="notice">当前 REST API 不支持自定义时间区间，如需要历史固定时间范围的数据，请参考 Websocket API 中的 K 线接口。</aside>
<aside class="notice">获取 hb10 净值时， symbol 请填写 “hb10”。</aside>

```shell
curl "https://api.huobi.pro/market/history/kline?period=1day&size=200&symbol=btcusdt"
```

### HTTP 请求

- GET `/market/history/kline`

### 请求参数

| 参数   | 数据类型 | 是否必须 | 默认值 | 描述                                       | 取值范围                                                     |
| ------ | -------- | -------- | ------ | ------------------------------------------ | ------------------------------------------------------------ |
| symbol | string   | true     | NA     | 交易对                                     | btcusdt, ethbtc等（如需获取杠杆ETP净值K线，净值symbol = 杠杆ETP交易对symbol + 后缀‘nav’，例如：btc3lusdtnav） |
| period | string   | true     | NA     | 返回数据时间粒度，也就是每根蜡烛的时间区间 | 1min, 5min, 15min, 30min, 60min, 4hour, 1day, 1mon, 1week, 1year |
| size   | integer  | false    | 150    | 返回 K 线数据条数                          | [1-2000]                                                    |

> Response:

```json
{
    "ch": "market.btcusdt.kline.5min",
    "status": "ok",
    "ts": 1629769247172,
    "data": [
        {
            "id": 1629769200,
            "open": 49056.37,
            "close": 49025.51,
            "low": 49022.86,
            "high": 49056.38,
            "amount": 3.946281917950917,
            "vol": 193489.67275732,
            "count": 196
        },
        {
            "id": 1629768900,
            "open": 48994.61,
            "close": 49056.37,
            "low": 48966.72,
            "high": 49072.46,
            "amount": 30.72223099519689,
            "vol": 1505870.732227976,
            "count": 1504
        }
    ]
}
```

### 响应数据

| 字段名称 | 数据类型 | 描述                                                    |
| -------- | -------- | ------------------------------------------------------- |
| status       | string     | 请求处理结果  "ok","error" |
| ch       | string     | 数据所属的 channel，格式：market.$symbol.kline.$period |
| ts       | long     |  响应生成时间点，单位：毫秒         |
| \<data\>   | object     |    |
| id       | long     | 调整为新加坡时间的时间戳，单位秒，并以此作为此K线柱的id |
| amount   | float    | 以基础币种计量的交易量                                  |
| count    | integer  | 交易次数                                                |
| open     | float    | 本阶段开盘价                                            |
| close    | float    | 本阶段收盘价                                            |
| low      | float    | 本阶段最低价                                            |
| high     | float    | 本阶段最高价                                            |
| vol      | float    | 以报价币种计量的交易量                                  |
| \</data\>   |      |    |


## 聚合行情（Ticker）

此接口获取ticker信息同时提供最近24小时的交易聚合信息。

```shell
curl "https://api.huobi.pro/market/detail/merged?symbol=ethusdt"
```
### HTTP 请求

- GET `/market/detail/merged`

### 请求参数

| 参数   | 数据类型 | 是否必须 | 默认值 | 描述   | 取值范围                                               |
| ------ | -------- | -------- | ------ | ------ | ------------------------------------------------------ |
| symbol | string   | true     | NA     | 交易对 | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |

> Response:

```json
{
    "ch": "market.btcusdt.detail.merged",
    "status": "ok",
    "ts": 1629788763750,
    "tick": {
        "id": 272156789143,
        "version": 272156789143,
        "open": 50080.0,
        "close": 49820.92,
        "low": 48767.0,
        "high": 50500.0,
        "amount": 12055.365781937457,
        "vol": 5.985618685709001E8,
        "count": 420573,
        "bid": [
            49819.48,
            2.58112
        ],
        "ask": [
            49819.49,
            0.002411
        ]
    }
}
```

### 响应数据

| 字段名称 | 数据类型 | 描述                                     |
| -------- | -------- | ---------------------------------------- |
| status   | string     | 请求处理结果  "ok","error"                 |
| ch       | string     | 数据所属的 channel，格式：market.$symbol.detail.merged    |
| ts       | long       | 响应生成时间点，单位：毫秒          |
| \<tick\> | object     |                                  |
| id       | long     | NA                                       |
| amount   | float    | 以基础币种计量的交易量（以滚动24小时计） |
| count    | integer  | 交易次数（以滚动24小时计）               |
| open     | float    | 本阶段开盘价（以滚动24小时计）           |
| close    | float    | 本阶段最新价（以滚动24小时计）           |
| low      | float    | 本阶段最低价（以滚动24小时计）           |
| high     | float    | 本阶段最高价（以滚动24小时计）           |
| vol      | float    | 以报价币种计量的交易量（以滚动24小时计） |
| bid      | object   | 当前的最高买价 [price, size]             |
| ask      | object   | 当前的最低卖价 [price, size]             |
| \</tick\> |      |                                        |


## 所有交易对的最新 Tickers

获得所有交易对的 tickers。

```shell
curl "https://api.huobi.pro/market/tickers"
```
<aside class="notice">此接口返回所有交易对的 ticker，因此数据量较大。</aside>

### HTTP 请求

- GET `/market/tickers`

### 请求参数

此接口不接受任何参数。

> Response:

```json

{
    "status":"ok",
    "ts":1629789355531,
    "data":[
        {
            "symbol":"smtusdt",
            "open":0.004659,    // 开盘价
            "high":0.004696,    // 最高价
            "low":0.0046,       // 最低价
            "close":0.00468,    // 收盘价
            "amount":36551302.17544405,
            "vol":170526.0643855023,
            "count":1709,
            "bid":0.004651,
            "bidSize":54300.341,
            "ask":0.004679,
            "askSize":1923.4879
        },
        {
            "symbol":"ltcht",
            "open":12.795626,
            "high":12.918053,
            "low":12.568926,
            "close":12.918053,
            "amount":1131.801675005825,
            "vol":14506.9381937385,
            "count":923,
            "bid":12.912687,
            "bidSize":0.1068,
            "ask":12.927032,
            "askSize":5.3228
        }
    ]
}

```

### 响应数据

核心响应数据为一个对象列，每个对象包含下面的字段

| 字段名称 | 数据类型 | 描述                                     |
| -------- | -------- | ---------------------------------------- |
| status   | string   | 请求处理结果  "ok","error"    |
| ts       | long     | 响应生成时间点，单位：毫秒      |
| \<data\> | object   |          |
| amount   | float    | 以基础币种计量的交易量（以滚动24小时计） |
| count    | integer  | 交易笔数（以滚动24小时计）               |
| open     | float    | 开盘价（以新加坡时间自然日计）           |
| close    | float    | 最新价（以新加坡时间自然日计）           |
| low      | float    | 最低价（以新加坡时间自然日计）           |
| high     | float    | 最高价（以新加坡时间自然日计）           |
| vol      | float    | 以报价币种计量的交易量（以滚动24小时计） |
| symbol   | string   | 交易对，例如btcusdt, ethbtc              |
| bid      | float    | 买一价                                   |
| bidSize  | float    | 买一量                                   |
| ask      | float    | 卖一价                                   |
| askSize  | float    | 卖一量                                   |
| \</data\> |     |          |


## 市场深度数据

此接口返回指定交易对的当前市场深度数据。

```shell
curl "https://api.huobi.pro/market/depth?symbol=btcusdt&depth=5&type=step0"
```

### HTTP 请求

- GET `/market/depth`

### 请求参数

| 参数   | 数据类型 | 必须  | 默认值 | 描述                             | 取值范围                                               |      |
| ------ | -------- | ----- | ------ | -------------------------------- | ------------------------------------------------------ | ---- |
| symbol | string   | true  | NA     | 交易对                           | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |      |
| depth  | integer  | false | 20     | 返回深度的数量                   | 5，10，20                                              |      |
| type   | string   | true  | step0  | 深度的价格聚合度，具体说明见下方 | step0，step1，step2，step3，step4，step5               |      |

<aside class="notice">当type值为‘step0’时，‘depth’的默认值为150而非20。 </aside>
**参数type的各值说明**

| 取值  | 说明                    |
| ----- | ----------------------- |
| step0 | 无聚合                  |
| step1 | 聚合度为报价精度*10     |
| step2 | 聚合度为报价精度*100    |
| step3 | 聚合度为报价精度*1000   |
| step4 | 聚合度为报价精度*10000  |
| step5 | 聚合度为报价精度*100000 |

> Response:

```json
{
    "ch": "market.btcusdt.depth.step0",
    "status": "ok",
    "ts": 1629790438801,
    "tick": {
        "ts": 1629790438215,
        "version": 136107114472,
        "bids": [
            [
                49790.87,
                0.779876
            ],
            [
                49785.9,
                1.82E-4
            ],
            [
                49784.48,
                0.002758
            ],
            [
                49784.29,
                0.05
            ],
            [
                49783.06,
                0.005038
            ]
        ],
        "asks": [
            [
                49790.88,
                2.980472
            ],
            [
                49790.89,
                0.006613
            ],
            [
                49792.16,
                0.080302
            ],
            [
                49792.67,
                0.030112
            ],
            [
                49793.23,
                0.043103
            ]
        ]
    }
}
```

### 响应数据

| 字段名称 | 数据类型 | 描述                               |
| -------- | -------- | ---------------------------------- |
| status   | string | 请求处理结果  "ok","error" |
| ch       | string | 数据所属的 channel，格式： market.$symbol.depth.$type |
| ts       | long   | 响应生成时间点，单位：毫秒      |
| \<tick\> | object |   |
| ts       | integer  | 调整为新加坡时间的时间戳，单位毫秒 |
| version  | integer  | 内部字段                           |
| bids     | object   | 当前的所有买单 [price, size]       |
| asks     | object   | 当前的所有卖单 [price, size]       |
| \</tick\> |   |   |


## 最近市场成交记录

此接口返回指定交易对最新的一个交易记录。

```shell
curl "https://api.huobi.pro/market/trade?symbol=btcusdt"
```
### HTTP 请求

- GET `/market/trade`

### 请求参数

| 参数   | 数据类型 | 是否必须 | 默认值 | 描述                                                   |
| ------ | -------- | -------- | ------ | ------------------------------------------------------ |
| symbol | string   | true     | NA     | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |

> Response:

```json
{
    "ch": "market.btcusdt.trade.detail",
    "status": "ok",
    "ts": 1629792192037,
    "tick": {
        "id": 136107843051,
        "ts": 1629792191928,
        "data": [
            {
                "id": 136107843051348400221001656,
                "ts": 1629792191928,
                "trade-id": 102517374388,
                "amount": 0.028416,
                "price": 49806.0,
                "direction": "buy"
            },
            {
                "id": 136107843051348400229813302,
                "ts": 1629792191928,
                "trade-id": 102517374387,
                "amount": 0.025794,
                "price": 49806.0,
                "direction": "buy"
            }
        ]
    }
}
```

### 响应数据

| 字段名称  | 数据类型 | 描述                                               |
| --------- | -------- | -------------------------------------------------- |
| status    | string | 请求处理结果  "ok","error" |
| ch        | string | 数据所属的 channel，格式：market.$symbol.trade.detail |
| ts        | long   | 响应生成时间点，单位：毫秒 |
| \<tick\>  | object |    |
| id        | long |  全局成交ID   |
| ts        | long |  最新成交时间   |
| \<data\>  | object |    |
| id        | integer  | 唯一交易id（将被废弃）                             |
| trade-id  | integer  | 唯一成交ID（NEW）                                  |
| amount    | float    | 以基础币种为单位的交易量                           |
| price     | float    | 以报价币种为单位的成交价格                         |
| ts        | integer  | 调整为新加坡时间的时间戳，单位毫秒                 |
| direction | string   | 交易方向：“buy” 或 “sell”, “buy” 即买，“sell” 即卖 |
| \</data\> |  |    |
| \</tick\> |   |  |


## 获得近期交易记录

此接口返回指定交易对近期的所有交易记录。

```shell
curl "https://api.huobi.pro/market/history/trade?symbol=btcusdt&size=2"
```
### HTTP 请求

- GET `/market/history/trade`

### 请求参数

| 参数   | 数据类型 | 是否必须 | 默认值 | 描述                                                   |
| ------ | -------- | -------- | ------ | ------------------------------------------------------ |
| symbol | string   | true     | NA     | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |
| size   | integer  | false    | 1      | 返回的交易记录数量，最大值2000                         |

> Response:

```json
{
    "ch": "market.btcusdt.trade.detail",
    "status": "ok",
    "ts": 1629793657842,
    "data": [
        {
            "id": 136108764379,
            "ts": 1629793656939,
            "data": [
                {
                    "id": 136108764379348400430265987,
                    "ts": 1629793656939,
                    "trade-id": 102517381182,
                    "amount": 1.24E-4,
                    "price": 49656.4,
                    "direction": "buy"
                }
            ]
        },
        {
            "id": 136108763320,
            "ts": 1629793656198,
            "data": [
                {
                    "id": 136108763320348400439066863,
                    "ts": 1629793656198,
                    "trade-id": 102517381181,
                    "amount": 0.01125,
                    "price": 49655.0,
                    "direction": "buy"
                },
                {
                    "id": 136108763320348400429773626,
                    "ts": 1629793656198,
                    "trade-id": 102517381180,
                    "amount": 8.3E-4,
                    "price": 49651.35,
                    "direction": "buy"
                }
            ]
        }
    ]
}
```

### 响应数据

<aside class="notice">返回的数据对象是一个对象数组，每个数组元素为一个调整为新加坡时间的时间戳（单位毫秒）下的所有交易记录，这些交易记录以数组形式呈现。</aside>

| 参数      | 数据类型 | 描述                                               |
| --------- | -------- | -------------------------------------------------- |
| status    | string  | 请求处理结果  "ok","error"      |
| ch        | string  | 数据所属的 channel，格式： market.$symbol.trade.detail   |
| ts        | long    | 响应生成时间点，单位：毫秒              |
| \<data\>  | object  |                              |
| id        | long    |   全局成交ID                           |
| ts        | long    |   最新成交时间        |
| \<data\>  | object   |                              |
| id        | integer  | 唯一交易id（将被废弃）                             |
| trade-id  | integer  | 唯一成交ID（NEW）                                  |
| amount    | float    | 以基础币种为单位的交易量                           |
| price     | float    | 以报价币种为单位的成交价格                         |
| ts        | integer  | 调整为新加坡时间的时间戳，单位毫秒                 |
| direction | string   | 交易方向：“buy” 或 “sell”, “buy” 即买，“sell” 即卖 |
| \</data\>  |   |                              |
| \</data\>  |   |                              |


## 最近24小时行情数据

此接口返回最近24小时的行情数据汇总。

<aside class="notice">此接口返回的成交量、成交金额为24小时滚动数据（平移窗口大小24小时），有可能会出现后一个窗口内的累计成交量、累计成交额小于前一窗口的情况。</aside>

```shell
curl "https://api.huobi.pro/market/detail?symbol=ethusdt"
```

### HTTP 请求

- GET `/market/detail`

### 请求参数

| 参数   | 数据类型 | 是否必须 | 默认值 | 描述                                                   |
| ------ | -------- | -------- | ------ | ------------------------------------------------------ |
| symbol | string   | true     | NA     | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |

> Response:

```json
{
    "ch": "market.btcusdt.detail",
    "status": "ok",
    "ts": 1629795484817,
    "tick": {
        "id": 272164011416,
        "low": 48767.0,
        "high": 50500.0,
        "open": 50266.89,
        "close": 49728.71,
        "vol": 6.010379336834868E8,
        "amount": 12110.642402972368,
        "version": 272164011416,
        "count": 420452
    }
}
```

### 响应数据

| 字段名称 | 数据类型 | 描述                                     |
| -------- | -------- | ---------------------------------------- |
| status   | string  | 请求处理结果  "ok","error"           |
| ch       | string  | 数据所属的 channel，格式： market.$symbol.detail      |
| ts       | long  | 响应生成时间点，单位：毫秒                             |
| \<tick\>       | object  |                                    |
| id       | integer  | 响应id                                   |
| amount   | float    | 以基础币种计量的交易量（以滚动24小时计） |
| count    | integer  | 交易次数（以滚动24小时计）               |
| open     | float    | 本阶段开盘价（以滚动24小时计）           |
| close    | float    | 本阶段收盘价（以滚动24小时计）           |
| low      | float    | 本阶段最低价（以滚动24小时计）           |
| high     | float    | 本阶段最高价（以滚动24小时计）           |
| vol      | float    | 以报价币种计量的交易量（以滚动24小时计） |
| version  | integer  | 内部数据                                 |
| \</tick\>       |   |                                    |


## 获取杠杆ETP实时净值

此接口返回杠杆ETP的最新净值。

```shell
curl "https://api.huobi.pro/market/etp?symbol=btc3lusdt"
```

### HTTP 请求

- GET `/market/etp`

### 请求参数

| 参数   | 数据类型 | 是否必须 | 默认值 | 描述          |
| ------ | -------- | -------- | ------ | ------------- |
| symbol | string   | true     | NA     | 杠杆ETP交易对 |

> Response

```json
{
    "ch": "market.btc3lusdt.etp",
    "status": "ok",
    "ts": 1629796049407,
    "tick": {
        "actualLeverage": 2.9786519048429554,
        "nav": 49.85797296654798,
        "outstanding": 314552.45966545,
        "symbol": "btc3lusdt",
        "navTime": 1629796049274,
        "basket": [
            {
                "amount": 0.002987392928931709,
                "currency": "btc"
            },
            {
                "amount": -98.65157318186874,
                "currency": "usdt"
            }
        ]
    }
}
```

### 响应数据

| 字段名称       | 数据类型 | 描述                                        |
| -------------- | -------- | ------------------------------------------- |
| status    | string | 请求处理结果  "ok","error" |
| ch        | string | 数据所属的 channel，格式：market.$symbol.etp  |
| ts        | long | 响应生成时间点，单位：毫秒   |
| \<tick\>  | object |  |
| symbol         | string   | 杠杆ETP交易代码                             |
| nav            | float    | 最新净值                                    |
| navTime        | long     | 最新净值更新时间 (unix time in millisecond) |
| outstanding    | float    | ETP总份额                                   |
| \<basket\>     | object   | 篮子                                        |
| currency     | float    | 币种                                        |
| amount       | float    | 金额                                        |
| \</basket\>     |    |                                         |
| actualLeverage | float    | 实际杠杆率                                  |
| \</tick\>  |  |  |


## 常见错误码

以下是行情数据接口返回的错误码、错误消息以及说明。

| 错误码            | 错误消息                            | 说明                    |
| ----------------- | ----------------------------------- | ----------------------- |
| invalid-parameter | invalid symbol                      | 无效的交易对            |
| invalid-parameter | invalid period                      | 请求K线，period参数错误 |
| invalid-parameter | invalid depth                       | 深度depth参数错误       |
| invalid-parameter | invalid type                        | 深度type 参数错误       |
| invalid-parameter | invalid size                        | size参数错误            |
| invalid-parameter | invalid size,valid range: [1, 2000] | size参数错误            |
| invalid-parameter | request timeout                     | 请求超时                |


# 账户相关

## 简介

账户相关接口提供了账户、余额、历史、点卡等查询以及资产划转等功能。

<aside class="notice">访问账户相关的接口需要进行签名认证。</aside>

## 账户信息 

API Key 权限：读取<br>
限频值（NEW）：100次/2s

查询当前用户的所有账户 ID `account-id` 及其相关信息

### HTTP 请求

- GET `/v1/account/accounts`

### 请求参数

无

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "id": 10000001,
            "type": "spot",
            "subtype": "",
            "state": "working"
        },
        {
            "id": 10000002,
            "type": "otc",
            "subtype": "",
            "state": "working"
        },
        {
            "id": 10000003,
            "type": "point",
            "subtype": "",
            "state": "working"
        }
    ]
}
```

### 响应数据

| 参数名称 | 是否必须 | 数据类型 | 描述                               | 取值范围                                                     |
| -------- | -------- | -------- | ---------------------------------- | ------------------------------------------------------------ |
| status   | true     | string   | 请求处理结果          |            "ok","error"                                  |
| \<data\> | true     | object   |                          |                                                              |
| id       | true     | long     | account-id                         |                                                              |
| state    | true     | string   | 账户状态                           | working：正常, lock：账户被锁定                              |
| type     | true     | string   | 账户类型                           | spot：现货账户, margin：逐仓杠杆账户, otc：OTC 账户, point：点卡账户, super-margin：全仓杠杆账户, investment: C2C杠杆借出账户, borrow: C2C杠杆借入账户，矿池账户: minepool, ETF账户: etf, 抵押借贷账户: crypto-loans |
| subtype  | false    | string   | 子账户类型（仅对逐仓杠杆账户有效） | 逐仓杠杆交易标的，例如btcusdt                                |
| \</data\> | true     | object   |                          |                                                              |

<aside class="notice">逐仓/全仓/C2C杠杆账户（margin/super-margin/borrow）会在第一次划转资产时创建，如果未划转过资产则不会有杠杆账户。</aside>


## 账户余额

API Key 权限：读取<br>
限频值（NEW）：100次/2s

查询指定账户的余额，支持以下账户：

spot：现货账户， margin：逐仓杠杆账户，otc：OTC 账户，point：点卡账户，super-margin：全仓杠杆账户, investment: C2C杠杆借出账户, borrow: C2C杠杆借入账户

### HTTP 请求

- GET `/v1/account/accounts/{account-id}/balance`

### 请求参数

| 参数名称   | 是否必须 | 类型   | 描述                                                         | 默认值 | 取值范围 |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| account-id | true     | string | account-id，填在 path 中，取值参考 `GET /v1/account/accounts` |        |          |

> Response:

```json
{
    "status": "ok",
    "data": {
        "id": 1000001,
        "type": "spot",
        "state": "working",
        "list": [
            {
                "currency": "usdt",
                "type": "trade",
                "balance": "91.850043797676510303",
                "seq-num": "477"
            },
            {
                "currency": "usdt",
                "type": "frozen",
                "balance": "5.160000000000000015",
                "seq-num": "477"
            },
            {
                "currency": "poly",
                "type": "trade",
                "balance": "147.928994082840236",
                "seq-num": "2"
            }
        ]
    }
}
```

### 响应数据

| 参数名称 | 是否必须 | 数据类型 | 描述     | 取值范围                                                     |
| -------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| status   | true     | string   | 请求处理结果  |        "ok","error"                                              |
| \<data\> | true     | object   |    |                                                              |
| id       | true     | long     | 账户 ID  |                                                              |
| state    | true     | string   | 账户状态 | working：正常  lock：账户被锁定                              |
| type     | true     | string   | 账户类型 | spot：现货账户, margin：逐仓杠杆账户, otc：OTC 账户, point：点卡账户, super-margin：全仓杠杆账户, investment: C2C杠杆借出账户, borrow: C2C杠杆借入账户，矿池账户: minepool, ETF账户: etf, 抵押借贷账户: crypto-loans |
| \<list\>     | false    | Array    |          |                                                              |
| balance  | true     | string   | 余额           |                                                              |
| currency | true     | string   | 币种           |                                                              |
| type     | true     | string   | 类型           | trade: 交易余额，frozen: 冻结余额, loan: 待还借贷本金, interest: 待还借贷利息, lock: 锁仓, bank: 储蓄 |
| seq-num  | true     | string   | 账户变更的序号 |                                                              |
| \</list\>     |     |     |          |                                                              |
| \</data\>      |     |    |    |                                                              |


## 获取平台资产总估值

API Key 权限：读取

限频值（NEW）：3次/1s

按照BTC或法币计价单位，获取平台账户的总资产估值。

### HTTP 请求

- GET `/v2/account/valuation`

### 请求参数

|参数|	是否必填|	数据类型|	描述|	 取值范围|
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ |
|accountType	|false	|string|	账户类型，详见账户类型数据字典	 |
|valuationCurrency 	|false	|string| 不填默认为btc估值（目前暂只支持BTC估值，参数值需大写）  |

> Responds:

```json
{
    "code": 200,
    "data": {
        "updated": {
            "success": true,
            "time": 1629916724000
        },
        "todayProfitRate": "0.004638293764657609",
        "totalBalance": "0.06276321",
        "todayProfit": "0.00028977",
        "profitAccountBalanceList": [
            {
                "distributionType": "11",
                "balance": 0.05728808,
                "success": true,
                "accountBalance": "0.05728808"
            }
        ]
    },
    "success": true
}
```

### 响应数据

| 参数名称            | 是否必须 | 数据类型 | 描述         |
| --------          | -------- | -------- | -------- |
| code              | TRUE | int | 状态码 |
| \<data\>          | TRUE | object |      |
| totalBalance      | TRUE | string |总账户资产，按估值参数计价|
| todayProfit       | TRUE | string | 今日总收益，按估值参数计价 |
| todayProfitRate   | TRUE | string | 今日收益率 |
| \<profitAccountBalanceList\> | TRUE | list |  |
| distributionType  | TRUE | string | 查询账户类型 |
| balance           | TRUE | float | 查询账户资产，按估值参数计价 |
| success           | TRUE | boolean | 查询账户资产是否成功 失败时accountBalance和balance为0 |
| accountBalance    | TRUE | string | 查询账户资产，按估值参数计价 |
| \</profitAccountBalanceList\> |  |  |  |
| \<updated\>       | TRUE | list |  |
| success           | TRUE | boolean | 今日收益是否已更新 |
| time              | TRUE | long | 收益更新日期 |
| \</updated\>      |  |  |  |
| \</data\>         |  |  |  |
| success           | TRUE | boolean |  |


### 账户类型数据字典
|code| 说明
|-----|-----|
| 1 | 币币账户 |
| 2 | 逐仓杠杆账户 |
| 3 | 全仓杠杆账户 |
| 4 | 交割合约账户 |
| 5 | 法币账户 |
| 6 | 矿池账户 |
| 7 | 永续合约账户 |
| 8 | C2C出借账户 |
| 9 | C2C借款账户 |
| 10 | 存币宝账户 |
| 11 | 正向合约账户 |
| 12 | 期权合约账户 |
| 13 | 场外期权账户 |
| 14 | 抵押借贷账户 |
| 15 | 网格交易账户 |
| 16 | 挖矿宝账户 |



## 获取指定账户资产估值（现货、杠杆、OTC）

API Key 权限：读取

限频值（NEW）：100次/2s

按照BTC或法币计价单位，获取指定账户的总资产估值。

### HTTP 请求

- GET `/v2/account/asset-valuation`

### 请求参数

| 参数              | 是否必填 | 数据类型 | 描述                                                      | 默认值 | 取值范围                                                     |
| ----------------- | -------- | -------- | --------------------------------------------------------- | ------ | ------------------------------------------------------------ |
| accountType       | true     | string   | 账户类型                                                  | NA     | spot：现货账户， margin：逐仓杠杆账户，otc：OTC 账户，super-margin：全仓杠杆账户 |
| valuationCurrency | false    | string   | 资产估值法币，即资产按哪个法币为单位进行估值。            | BTC    | 可选法币有：BTC、CNY、USD、JPY、KRW、GBP、TRY、EUR、RUB、VND、HKD、TWD、MYR、SGD、AED、SAR （大小写敏感） |
| subUid            | false    | long     | 子用户的 UID，若不填，则返回API key所属用户的账户资产估值 | NA     |                                                              |

> Responds:

```json
{
    "code": 200,
    "data": {
        "balance": "34.75",
        "timestamp": 1594901254363
    },
    "ok": true
}
```

### 返回字段
| 参数      | 是否必须 | 数据类型 | 说明                                     |
| --------- | -------- | -------- | ---------------------------------------- |
| code      | true     | string   |   状态码	   |
| ok        | true     | string   |   请求结果       |
| \<data\>  | true     | object   |          |
| balance   | true     | string   | 按照某一个法币为单位的总资产估值         |
| timestamp | true     | long     | 数据返回时间，为unix time in millisecond |
| \</data\>  |      |    |          |


## 资产划转

API Key 权限：交易<br>

该节点为母用户和子用户进行资产划转的通用接口。<br>

母用户和子用户均支持的功能包括：<br>
1、币币账户与逐仓杠杠账户之间的划转；<br>
2、逐仓杠杠不同账户间相同币种的直接划转，如逐仓杠杠BTC/USDT账户和ETH/USDT账户，相同币种USDT可直接划转；<br>

仅母用户支持的功能包括：<br>
1、母用户币币账户与子用户币币账户间的划转；<br>
2、不同子用户币币账户间划转；<br>

仅子用户支持的功能包括：<br>
1、子用户币币账户向母用户下的其他子用户币币账户划转，此权限默认关闭，需母用户授权。授权接口为 `POST /v2/sub-user/transferability`；<br>
2、子用户币币账户向母用户币币账户划转；<br>

其他划转功能将逐步上线，敬请期待。<br>

### HTTP 请求

- POST `/v1/account/transfer`

### 请求参数

| 参数              | 是否必填 | 数据类型 | 说明                                | 取值范围                         |
| ----------------- | -------- | -------- | ----------------------------------- | -------------------------------- |
| from-user         | true     | long     | 转出用户uid                         | 母用户uid,子用户uid              |
| from-account-type | true     | string   | 转出账户类型                        | spot,margin                      |
| from-account      | true     | long     | 转出账户id                          |                                  |
| to-user           | true     | long     | 转入用户uid                         | 母用户uid,子用户uid              |
| to-account-type   | true     | string   | 转入账户类型                        | spot,margin                      |
| to-account        | true     | long     | 转入账户id                          |                                  |
| currency          | true     | string   | 币种，即btc, ltc, bch, eth, etc ... | 取值参考GET /v1/common/currencys |
| amount            | true     | string   | 划转金额                            |                                  |


> Response:

```json
{
    "status": "ok",
    "data": {
        "transact-id": 220521190,
        "transact-time": 1590662591832
    }
}
```

### 响应数据
| 参数            | 是否必须 | 数据类型 | 说明       | 取值范围        |
| --------------- | -------- | -------- | ---------- | --------------- |
| status          | true     | string   | 状态       | "ok" or "error" |
| \<data\>        | true     | list     |            |                 |
| transact-id    | true     | int      | 交易流水号 |                 |
| transact-time  | true     | long     | 交易时间   |                 |
| \</data\>        |      |      |            |                 |


## 账户流水

API Key 权限：读取<br>
限频值（NEW）：5次/2s

该节点基于用户账户ID返回账户流水。

### HTTP Request

- GET `/v1/account/history`

### 请求参数

| 参数名称       | 是否必需 | 数据类型 | 描述                 | 缺省值               | 取值范围                                                     |
| -------------- | -------- | -------- | ------------------------------ | -------------------- | --------------------------------- |
| account-id     | true     | string   | 账户编号,取值参考 `GET /v1/account/accounts`                 |         |                                      |
| currency       | false    | string   | 币种,即btc, ltc, bch, eth, etc ...(取值参考`GET /v1/common/currencys`) |                 |          |
| transact-types | false    | string   | 变动类型，可多选，以逗号分隔，包含动账类型列表详见注3                                 | all                  | trade (交易),etf（ETF申购）, transact-fee（交易手续费）, fee-deduction（手续费抵扣）, transfer（划转）, credit（借币）, liquidation（清仓）, interest（币息）, deposit（充币），withdraw（提币）, withdraw-fee（提币手续费）, exchange（兑换）, other-types（其他）,rebate（交易返佣） |
| start-time     | false    | long     | 远点时间 unix time in millisecond. 以transact-time为key进行检索. 查询窗口最大为1小时. 窗口平移范围为最近30天. | ((end-time) – 1hour) | [((end-time) – 1hour), (end-time)]                           |
| end-time       | false    | long     | 近点时间unix time in millisecond. 以transact-time为key进行检索. 查询窗口最大为1小时. 窗口平移范围为最近30天. | current-time         | [(current-time) – 29days,(current-time)]                     |
| sort           | false    | string   | 检索方向                                                     | asc                  | asc or desc                |
| size           | false    | int      | 最大条目数量                                                 | 100                  | [1-500]                       |
| from-id        | false    | long     | 起始编号（仅在下页查询时有效，见注2）                        |                      |                                                              |

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "account-id": 10000001,
            "currency": "usdt",
            "record-id": 359044707902783794,
            "transact-amt": "-10.000000000000000000",
            "transact-type": "other-types",
            "avail-balance": "81.850043797676510303",
            "acct-balance": "97.010043797676510318",
            "transact-time": 1629882096557
        },
        {
            "account-id": 10000001,
            "currency": "usdt",
            "record-id": 359044690723242123,
            "transact-amt": "-10.000000000000000000",
            "transact-type": "transfer",
            "avail-balance": "81.850043797676510303",
            "acct-balance": "87.010043797676510318",
            "transact-time": 1629882096569
        }
    ],
    "next-id": 47996522235
}
```

### 响应数据

| 字段名称      | 数据类型 | 描述                                                        | 取值范围 |
| ------------- | -------- | ----------------------------------------------------------- | -------- |
| status        | string   | 状态码                                                  |  "ok","error"    |
| \<data\>      | object   |                                                             |          |
| account-id  | long     | 账户编号                                                    |          |
| currency      | string   | 币种                                                        |          |
| transact-amt  | string   | 变动金额（入账为正 or 出账为负）                            |          |
| transact-type | string   | 变动类型                                                    |          |
| avail-balance | string   | 可用余额                                                    |          |
| acct-balance  | string   | 账户余额                                                    |          |
| transact-time | long     | 交易时间（数据库记录时间）                                  |          |
| record-id     | long     | 数据库记录编号（全局唯一）                                  |          |
| \</data\>      |          |                                                             |          |
| next-id       | long     | 下页起始编号（仅在查询结果需要分页返回时包含此字段，见注2） |          |

注1：<br>
账户流水中返回的交易返佣为到账金额，多笔成交产生的多笔返佣可能会合并到帐，成为一笔流水。<br>

注2：<br>
仅当用户请求查询的时间范围内的数据条目超出单页限制（由“size“字段设定）时,服务器才返回”next-id“字段。用户收到服务器返
回的”next-id“后 <br>
1） 须知晓后续仍有数据未能在本页返回；<br>
2） 如需继续查询下页数据，应再次请求查询并将服务器返回的“next-id”作为“from-id“，其它请求参数不变。<br>
3） 作为数据库记录ID，“next-id”和“from-id”除了用来翻页查询外，无其它业务含义。<br>

注3：<br>
变动类型包含动账类型明细列表：

| 变动类型      | 动账类型 | 描述 |
| ------------- | -------- | ------- |
| trade | match-income | 撮合成交收入 |
| trade | match-payout | 撮合成交支付 |
| trade | otc-trade | OTC交易资产同步 |
| trade | point-purchased | 购买点卡 |
| trade | point-purchased-pay | 购买点卡支付 |
| trade | member-purchase | 会员购买 |
| trade | matching-transfer-frozen-to-clearing-v2 | 撮合成交转账冻结子账户到清算子帐户 |
| trade | matching-transfer-clearing-to-trade-v2 | 撮合成交转账清算子账户到交易子帐户 |
| trade | otc-options-user-to-principal-clct-v2 | 用户涡轮业务账户到涡轮本金归集账户 |
| trade | otc-options-income-to-user-v2 | 涡轮收益归集账户到用户涡轮账户 |
| etf | etf-subscription-apply-transfer | 用户冻结账户转到系统ETF账户 |
| etf | etf-subscription-apply-cancel | 系统ETF账户转到用户trade账户 |
| etf | etf-subscription-settle-transfer | 系统ETF账户转到用户trade账户 |
| etf | etf-subscription-apply-receivable | 系统ETF应付账户转到用户的ETF账户，用于认购申请平账 |
| etf | etf-subscription-settle-receivable | 用户的ETF账户转到系统ETF应付账户，用于认购结算平账 |
| etf | etf-subscription-open-position-todo | 系统ETF账户转到建仓的普通账户 |
| etf | etf-subscription-open-position-done | 建仓的普通账户转到系统ETF账户 |
| etf | etf-purchase-cancel | 系统ETF账户转到用户trade账户 |
| etf | etf-purchase-apply-transfer | 用户冻结账户转到系统ETF账户 |
| etf | etf-purchase-settle-transfer | 系统ETF账户转到用户trade账户 |
| etf | etf-redemption-cancel | 系统ETF账户转到用户币币账户 |
| etf | etf-redemption-apply-transfer | 用户冻结账户转到系统ETF账户 |
| etf | etf-redemption-settle-transfer | 系统ETF账户转到用户币币账户 |
| transact-fee | matching-transfer-fee-v2 | 撮合成交手续费转账清算子账户到系统子账户 |
| transact-fee | otc-trade-fee | OTC交易手续费同步 |
| transact-fee | point-etf-fee-deduction | 抵扣ETF手续费返还币 |
| transact-fee | otc-charge-in | OTC收费 |
| transact-fee | otc-charge-out | OTC退费 |
| transact-fee | etf-subscription-charge-receivable | 用户的ETF账户转到系统ETF应付账户，用于认购手续费平账 |
| transact-fee | matching-transfer-fee-v3 | 撮合成交手续费转账清算子账户到系统子账户 |
| fee-deduction | point-fee-deduction-v3 | 抵扣手续费 |
| fee-deduction | point-fee-deduction-pay-v2 | 抵扣手续费支付 |
| fee-deduction | point-fee-deduction-pay-v3 | 抵扣手续费支付 |
| fee-deduction | revert-point-fee-deduction-pay | 抵扣手续费的点卡返还用户 |
| fee-deduction | point-interest-deduction-pay | 抵扣借贷利息支付点卡 |
| fee-deduction | point-etf-fee-deduction-pay | 抵扣ETF手续费支付点卡 |
| fee-deduction | trade-fee-deduction | 抵扣手续费 |
| fee-deduction | otc-point-pay | OTC点卡支付费用 |
| fee-deduction | trade-fee-deduction-pay-user-trade-to-match | 抵扣手续费支付-用户交易账户划转到清算账户 |
| fee-deduction | trade-fee-deduction-user-trade-to-match | 新版抵扣手续费支付-用户交易账户划转到清算账户 |
| fee-deduction | revert-point-fee-deduction | 抵扣手续费归还系统账户 |
| fee-deduction | super-margin-interest-deduct-repay | 利息抵扣：用户交易账户转到系统利息账户 |
| transfer | user-account-transfer-inner-in | 用户内部转账转入 |
| transfer | user-account-transfer-inner-out | 用户内部转账转出消账 |
| transfer | mine-account-to-user-account | 矿池账户转用户 |
| transfer | user-account-to-mine-account | 用户转矿池账户 |
| transfer | otc-transfer-in | 转账划入OTC |
| transfer | otc-transfer-in-v2 | 转账划入OTC |
| transfer | otc-transfer-out | 转账划出OTC |
| transfer | otc-transfer-out-v2 | 转账划出OTC |
| transfer | margin-transfer-in | 借贷划转: 现货交易账户转到借贷交易账户 |
| transfer | margin-transfer-out | 借贷划转: 借贷交易账户转到现货交易账户 |
| transfer | point-transfer | 点卡转让 |
| transfer | point-transfer-pay | 点卡转让支付 |
| transfer | mine-pool-transfer-in | 矿池账户转入 |
| transfer | mine-pool-transfer-out | 矿池账户转出 |
| transfer | chat-transfer-in | 转账划入chat |
| transfer | chat-transfer-in-v2 | 转账划入chat |
| transfer | chat-transfer-out | 转账划出chat |
| transfer | chat-transfer-out-v2 | 转账划出chat |
| transfer | chat-to-otc | chat划转至OTC |
| transfer | otc-to-chat | OTC划转至chat |
| transfer | master-transfer-in | 子账户转到母账户 |
| transfer | master-transfer-out | 母账户转到子账户 |
| transfer | margin-to-margin | 借贷划转: 逐仓杠杆交易账户转到逐仓杠杆交易账户 |
| transfer | master-point-transfer-in | 子账户转到母账户，点卡 |
| transfer | master-point-transfer-out | 母账户转到子账户，点卡 |
| transfer | sub-transfer | 子子划转 |
| transfer | sub-point-transfer | 子子点卡划转 |
| transfer | futures-transfer-in | 转账划入合约账户 |
| transfer | futures-transfer-in-v2 | 转账划入合约账户V2|
| transfer | futures-transfer-out | 转账划出合约账户 |
| transfer | futures-transfer-out-v2 | 转账划出合约账户V2 |
| transfer | institution-transfer-in | 转账划入机构 |
| transfer | institution-transfer-in-v2 | 转账划入机构 |
| transfer | institution-transfer-out | 转账划出机构 |
| transfer | institution-transfer-out-v2 | 转账划出机构 |
| transfer | swap-transfer-in | 转账划入合约账户 |
| transfer | swap-transfer-out | 转账划出合约账户 |
| transfer | dm-swap-transfer-in | 转账划入反向永续合约账户 |
| transfer | dm-swap-transfer-out | 转账划出反向永续合约账户 |
| transfer | option-transfer-in | 转账划入期权账户 |
| transfer | option-transfer-out | 转账划出期权账户 |
| transfer | cfd-transfer-in | 转账划入CFD账户 |
| transfer | cfd-transfer-out | 转账划出CFD账户 |
| transfer | super-margin-transfer-out | 全仓杠杆交易账户转入 |
| transfer | super-margin-transfer-in | 全仓杠杆交易账户转出 |
| transfer | japan-donations-operation-to-system | 运营账户到捐款系统账户 |
| transfer | japan-donations-system-to-operation | 捐款系统账户到运营账户 |
| transfer | japan-donations-system-to-user | 日本首里城火灾捐款付款:捐款系统账户 到 普通用户账户 |
| transfer | japan-donations-user-to-system | 日本首里城火灾捐款收款:普通用户账户 到 捐款系统账户 |
| transfer | japan-discount-user-to-system | 币币账户 到 折扣抢购系统账户 |
| transfer | japan-discount-system-to-user | 折扣抢购系统账户 到 币币账户 |
| transfer | japan-discount-operation-to-system | 运营账户 到 折扣抢购系统账户 |
| transfer | japan-discount-system-to-operation | 折扣抢购系统账户 到 运营账户 |
| transfer | directed-card-system-to-operation | 系统定向点卡专项转款账户到运营账户 |
| transfer | directed-card-operation-to-system | 运营账户到系统定向点卡专项转款账户 |
| transfer | system-to-user-account | 土耳其兑换系统账户到用户账户 |
| transfer | user-account-to-system | 用户账户到土耳其兑换系统账户 |
| transfer | liquidity-account-to-system | 香港流动性运营账户到土耳其兑换系统账户 |
| transfer | system-to-liquidity-account | 土耳其兑换系统账户到香港流动性运营账户 |
| transfer | linear-swap-transfer-in | 转账划入正向永续账户 |
| transfer | linear-swap-transfer-out | 转账划出正向永续账户 |
| transfer | custody-transfer-in | 转账划入香港站资金账户 |
| transfer | custody-transfer-out | 转账划出香港站资金账户 |
| transfer | operation-to-margin-trade | 运营账户到逐仓杠杆账户 |
| transfer | margin-trade-to-operation | 逐仓杠杆账户到运营账户 |
| transfer | grid-transfer-in | 网格划转: 现货交易账户转到网格交易账户 |
| transfer | grid-transfer-out | 网格划转: 网格交易账户转到现货交易账户 |
| transfer | otc-generic-transfer-in | OTC账户 通用划转划入 |
| transfer | otc-generic-transfer-out | OTC账户 通用划转转出 |
| transfer | spot-generic-transfer-in | 币币账户 通用划转划入 |
| transfer | spot-generic-transfer-out | 币币账户 通用划转转出 |
| transfer | margin-generic-transfer-in | 逐仓杠杆 通用划转划入 |
| transfer | margin-generic-transfer-out | 逐仓杠杆 通用划转转出 |
| transfer | point-generic-transfer-in | 点卡 通用划转划入 |
| transfer | point-generic-transfer-out | 点卡 通用划转转出 |
| transfer | minepool-generic-transfer-in | 矿池 通用划转划入 |
| transfer | minepool-generic-transfer-out | 矿池 通用划转转出 |
| transfer | super-margin-generic-transfer-in | 全仓杠杆 通用划转划入 |
| transfer | super-margin-generic-transfer-out | 全仓杠杆 通用划转转出 |
| transfer | investment-generic-transfer-in | C2C出借账户 通用划转划入 |
| transfer | investment-generic-transfer-out | C2C出借账户 通用划转转出 |
| transfer | borrow-generic-transfer-in | C2C借款账户 通用划转划入 |
| transfer | borrow-generic-transfer-out | C2C借款账户 通用划转转出 |
| transfer | deposit-earning-generic-transfer-in | Savings理财账户 通用划转划入 |
| transfer | deposit-earning-generic-transfer-out | Savings理财账户 通用划转转出 |
| transfer | crypto-loans-generic-transfer-in | 质押借贷 通用划转划入 |
| transfer | crypto-loans-generic-transfer-out | 质押借贷 通用划转转出 |
| transfer | grid-trading-generic-transfer-in | 网格交易账户 通用划转划入 |
| transfer | grid-trading-generic-transfer-out | 网格交易账户 通用划转转出 |
| transfer | mine-pool-mall-lease-spot-to-settlement-system | 商城算力租赁收款UID划转到商城算力租赁结算系统账户 |
| transfer | mine-pool-mall-lease-settlement-system-to-spot | 商城算力租赁结算系统账户划转到用户UID币币账户 |
| transfer | kr-savings-spot-to-clct | 用户币币账户到系统理财归集账户 |
| transfer | kr-savings-clct-to-transition-spot | 系统理财归集账户到指定财务中转账户（用户账户） |
| transfer | kr-savings-transition-spot-to-intermediate | 指定财务中转账户（用户账户）到系统理财中间账户 |
| transfer | kr-savings-return-to-spot | 系统理财归还账户到用户币币账户 |
| transfer | kr-savings-income-to-spot | 系统理财收益账户到用户币币账户 |
| transfer | kr-savings-transition-spot-to-clct | 指定财务中转账户（用户账户）到系统理财归集账户 |
| transfer | jp-coupon-ops-to-sys | 运营账户 到 优惠券系统账户 |
| transfer | jp-coupon-sys-to-spot | 优惠券系统账户 到 用户币币 |
| transfer | otc-options-master-transfer-in | 涡轮业务专用：子账户转到母账户 |
| transfer | otc-options-master-transfer-in-manual | 手工涡轮业务专用：子账户转到母账户 |
| transfer | otc-options-master-transfer-out | 涡轮业务专用：母账户转到子账户 |
| transfer | otc-options-master-transfer-out-manual | 手工涡轮业务专用：母账户转到子账户 |
| transfer | mine-pool-staking-lock | 用户币币转到用户锁仓 |
| transfer | mine-pool-staking-unlock | 用户锁仓转到用户币币 |
| transfer | mine-pool-staking-reward-system-to-spot | 系统账户-备付金账户转到用户币币 |
| transfer | airdrop-user-spot-oneside-in | 空投用户账户入账 |
| transfer | project-airdrop-user-spot-oneside-in | 项目方空投用户账户入账 |
| credit | margin-loan-transfer | 申请借贷: 系统现金池转到用户交易账户 |
| credit | margin-loan-transfer-v2 | 申请借贷: 系统现金池转到用户交易账户 |
| credit | margin-repay-loan-transfer | 归还借贷本金: 用户交易冻结账户转到系统现金池 |
| credit | margin-repay-loan-transfer-v2 | 归还借贷本金: 用户交易账户转到系统现金池 |
| credit | super-margin-loan-transfer | 申请借贷: 系统现金池转到用户交易账户 |
| credit | super-margin-repay | 还款: 用户交易账户转到系统借贷资金池 |
| credit | auto-super-margin-repay | 自动还款: 用户交易账户转到系统借贷资金池 |
| credit | operations-account-recycling-user-trade-principal | 运营账户回收用户交易子账户借款本金转账 |
| credit | operations-account-to-outside-loan-account | 运营账户->场外借贷用户 |
| credit | outside-loan-account-to-operations-account | 场外借贷用户->运营账户 |
| credit | pledged-loan-lending | 质押借贷-借出 |
| credit | pledged-loan-receiving | 质押借贷-收款 |
| credit | super-margin-loan-receivable | 申请借贷: 用户应付本金转到系统应收本金 |
| credit | super-margin-interest-accrued | 借贷计息: 用户应付利息转到系统应收利息 |
| credit | super-margin-interest-deduct-refund | 利息抵扣: 系统应收利息转到用户应付利息 |
| credit | super-margin-refund | 还款: 系统应收本金转到用户应付本金 |
| credit | margin-repay-loan-receivable | 归还借贷本金: 系统应收本金转到用户应付本金 |
| credit | margin-repay-loan-receivable-v2 | 归还借贷本金: 系统应收本金转到用户应付本金 |
| credit | otc-options-user-asset-ops-borrow | 财务运营账户到涡轮运营子账户（现货账户）- 借款 |
| credit | otc-options-user-asset-ops-borrow-debt | 财务运营账户到涡轮运营子账户（涡轮应收本金账户）- 借款 |
| credit | otc-options-user-asset-ops-repay | 涡轮运营子账户到财务运营账户（现货账户）-还款 |
| credit | otc-options-user-asset-ops-repay-debt | 涡轮运营子账户到财务运营账户（涡轮应还本金账户）- 还款 |
| liquidation | margin-auto-repay-interest-transfer | 归还借贷利息: 用户交易账户转到系统实收本金 |
| liquidation | margin-auto-repay-interest-transfer-v2 | 归还借贷利息: 用户交易账户转到系统实收本金 |
| liquidation | margin-auto-repay-loan-transfer | 归还借贷本金: 用户交易账户转到系统现金池 |
| liquidation | margin-auto-repay-loan-transfer-v2 | 归还借贷本金: 用户交易账户转到系统现金池 |
| interest | margin-repay-interest-transfer | 归还借贷利息: 用户交易冻结账户转到系统实收本金 |
| interest | margin-repay-interest-transfer-v2 | 归还借贷利息: 用户交易账户转到系统实收本金 |
| interest | point-interest-deduction | 抵扣借贷利息返还币 |
| interest | super-margin-interest-repay | 还息：用户交易账户转到系统已收利息 |
| interest | auto-super-margin-interest-repay | 自动还息：用户交易账户转到系统已收利息 |
| interest | margin-repay-interest-receivable | 归还借贷利息: 系统应收利息转到用户应付利息 |
| interest | margin-repay-interest-receivable-v2 | 归还借贷利息: 系统应收利息转到用户应付利息 |
| interest | margin-interest-accrued | 借贷计息: 用户应付利息转到系统应收利息 |
| interest | margin-interest-accrued-v2 | 借贷计息: 用户应付利息转到系统应收利息 |
| deposit | user-account-deposit | 用户账户充值转账 |
| deposit | user-account-fast-deposit | 用户账户快速充值转账 |
| deposit | user-credit-loan-to-system | 用户撤销充值，欠费币币账户转账到系统账户 |
| deposit | user-account-mgt-special-deposit | 用户账户MGT异常充值 |
| deposit | operations-account-deposit-compensate-expenditure | 充币业务补偿支出 |
| deposit | operations-account-deposit-compensate-earning | 充币业务补偿收入 |
| withdraw | user-apply-withdraw | 用户申请提现冻结 |
| withdraw | user-apply-fiat-withdraw | 用户申请法币Fiat提现冻结 |
| withdraw | user-account-withdraw | 用户账户提现转账 |
| withdraw | user-account-fast-withdraw | 用户账户快速提现转账 |
| withdraw | operations-account-withdraw-compensate-expenditure | 提币业务补偿支出 |
| withdraw | operations-account-withdraw-compensate-earning | 提币业务补偿收入 |
| withdraw-fee | system-withdraw-fee-in | 扣用户提现手续费 |
| withdraw-fee | system-withdraw-fee-out | 返还用户提现手续费 |
| exchange | stable-currency-transfer-in-v2 | 系统稳定币转给用户 |
| exchange | stable-currency-transfer-out-v2 | 用户稳定币转给系统 |
| rebate | negative-maker-sys-oneside-out | 负maker系统账户出账 |
| rebate | negative-maker-user-oneside-in | 负maker用户账户入账 |
| etp | etp-purchase-transfer | 申购的USDT: 用户账户转到杠杆代币申购赎回系统账户 |
| etp | etp-purchase-receivable | 申购的杠杆代币: 杠杆代币申购赎回系统账户-杠杆代币转到用户账户 |
| etp | etp-purchase-charge | 申购手续费: 用户账户转到杠杆代币收入系统账户 |
| etp | etp-redemption-transfer | 赎回的杠杆代币: 用户账户转到杠杆代币申购赎回系统账户 |
| etp | etp-redemption-settle-transfer | 给赎回的USDT: 杠杆代币申购赎回系统账户转到用户账户 |
| etp | etp-redemption-charge | 赎回手续费: 杠杆代币申购赎回系统账户转到杠杆代币收入系统账户 |
| etp | etp-management-charge | 划转管理费: 用户账户转到杠杆代币收入系统账户 |
| etp | etp-cash-concentration | 收入归集: 杠杆代币收入系统账户转到收入归集系统账户 |
| etp | etp-usdt-hedge-sys-to-user | USDT对冲: 杠杆代币申购赎回系统账户转到用户账户 |
| etp | etp-usdt-hedge-user-to-sys | USDT对冲: 用户账户转到杠杆代币申购赎回系统账户 |
| etp | etp-futures-hedge-sys-to-user | 合约对冲: 杠杆代币申购赎回系统账户转到用户账户 |
| etp | etp-futures-hedge-user-to-sys | 合约对冲: 用户账户转到杠杆代币申购赎回系统账户 |
| etp | etp-usdt-spot-sys-to-user | 杠杆代币申购赎回系统账户转到用户杠杆代币现货管理账户 |
| etp | etp-usdt-spot-user-to-sys | 用户杠杆代币现货管理账户转到杠杆代币申购赎回系统账户 |
| savings | deposit-earning-to-spot | 理财账户转到币币账户 |
| savings | spot-to-deposit-earning | 币币账户转到理财账户 |
| savings | deposit-earning-to-collect | 理财账户转到资金归集账户 |
| savings | collect-to-deposit-earning | 资金归集账户转到理财账户 |
| savings | operation-to-collect | 运营账户转到资金归集账户 |
| savings | collect-to-operation | 资金归集账户转到运营账户 |
| savings | operation-to-interest | 运营账户转到利息支付账户 |
| savings | interest-to-operation | 利息支付账户转到运营账户 |
| savings | interest-to-deposit-earning | 利息支付账户转到理财账户 |
| savings | deposit-earning-to-interest | 理财账户转到利息支付账户 |
| savings | collect-to-expend | 资金归集账户转到资金支出账户 |
| savings | expend-to-collect | 资金支出账户转到资金归集账户 |
| savings | expend-to-operation | 资金支出账户转到运营账户 |
| savings | operation-to-expend | 运营账户转到资金支出账户 |
| other-types | operations-account-transfer-in | 运营账户转入转账 |
| other-types | operations-account-transfer-out | 运营账户转出转账 |
| other-types | operations-account-user-event-in | 运营账户活动策划转入 |
| other-types | operations-account-user-event-out | 运营账户活动策划转出 |
| other-types | operations-account-loan-to-user-trade | 运营账户借款给用户交易子账户转账 |
| other-types | operations-account-expenditure | 运营账户支出转账 |
| other-types | inspire-account-to-user-account | 激励账户到用户 |
| other-types | user-account-to-inspire-account | 用户账户到激励账户 |
| other-types | activity-account-to-user-account | 活动账户转用户 |
| other-types | user-account-to-activity-account | 用户转活动账户 |
| other-types | brokerage-account-to-user-account | 返佣账户转用户 |
| other-types | user-account-to-brokerage-account | 用户转返佣账户 |
| other-types | exchange-operation-to-user | 交易所运营账户转到用户trade账户:拨款 |
| other-types | operations-account-earning | 运营账户收入转账 |
| other-types | market-account-to-user-account | 市场账户转用户 |
| other-types | user-account-to-market-account | 用户转市场账户 |
| other-types | trade-account-to-user-account | 交易账户转用户 |
| other-types | user-account-to-trade-account | 用户转交易账户 |
| other-types | backup-account-to-user-account | 备用转用户 |
| other-types | user-account-to-backup-account | 用户转备用 |
| other-types | fork-transfer-in | 分叉币转换生成 |
| other-types | fork-transfer-out | 分叉币转换消耗 |
| other-types | point-purchased-gift | 购买点卡赠币 |
| other-types | matching-fee-brokerage | 手续费返佣金 |
| other-types | matching-fee-brokerage-point | 手续费返佣点卡 |
| other-types | api-matching-fee-brokerage | 渠道返佣金 |
| other-types | api-matching-fee-brokerage-point | 渠道返佣点卡 |
| other-types | matching-fee-cashback | 手续费返现金 |
| other-types | matching-fee-cashback-point | 手续费返现点卡 |
| other-types | exchange-fee-to-user | 交易所手续费账户转到邀请人账户 |
| other-types | otc-adjust-account-in | OTC手动给用户充值 |
| other-types | otc-adjust-account-out | OTC手动给用户扣款 |
| other-types | otc-adjust-transfer-in | OTC强制增加用户欠费 |
| other-types | otc-adjust-transfer-out | OTC强制增加用户资产 |
| other-types | option-liquidity-borrow | 期权流动性借出 |
| other-types | option-liquidity-refund | 期权流动性还款 |
| other-types | option-liquidity-other-borrow | 期权其他借出 |
| other-types | option-liquidity-other-refund | 期权其他还款 |
| other-types | linear-swap-liquidity-borrow | 正向永续合约流动性借出 |
| other-types | linear-swap-liquidity-refund | 正向永续合约流动性还款 |
| other-types | linear-swap-liquidity-other-borrow | 正向永续合约其他借出 |
| other-types | linear-swap-liquidity-other-refund | 正向永续合约其他还款 |
| other-types | otc-options-principal-clct-to-user-asset-ops-v3 | 手工涡轮本金归集账户到涡轮运营母账户 |
| other-types | otc-options-income-to-user-asset-ops-manual | 手工涡轮收益归集账户到涡轮运营母账户 |
| other-types | otc-options-user-asset-ops-to-income-manual | 手工涡轮运营母账户到涡轮收益归集账户 |
| other-types | finance-clear-spot-to-sys-usa-jp | 美/日籍用户清退资产返还收款 |
| other-types | finance-clear-sys-to-spot-usa-jp | 美/日籍用户清退资产返还借出 |
| other-types | change-coin-chain-spot-to-sys | 换币换链收入 |
| other-types | change-coin-chain-sys-to-spot | 换币换链支出 |
| other-types | huoban-fund-spot-to-sys | 火伴基金收款 |
| other-types | huoban-fund-sys-to-spot | 火伴基金借出 |
| other-types | huoban-fund-interest-spot-to-sys | 火伴基金利息收入 |
| other-types | head-hunting-sys-to-spot | 猎头费支出 |
| other-types | project-activity-spot-to-sys | 项目方出资活动收入 |
| other-types | project-activity-sys-to-spot | 项目方出资活动支出 |
| other-types | operation-to-super-margin-trade | 运营账户转到用户账户-全仓杠杆账户 |
| other-types | super-margin-trade-to-operation | 用户账户-全仓杠杆账户转到运营账户 |


## 财务流水

API Key 权限：读取

该节点基于用户账户ID返回财务流水。<br>
一期上线暂时仅支持划转流水的查询（“transactType” = “transfer”）。<br>
通过“startTime”/“endTime”框定的查询窗口最大为10天，意即，通过单次查询可检索的范围最大为10天。<br>
该查询窗口可在最近180天范围内平移，意即，通过多次平移窗口查询，最多可检索到过往180天的记录。<br>

### HTTP Request

- GET `/v2/account/ledger`

### 请求参数

| 参数名称      | 数据类型 | 是否必需 | 描述                                                |
| ------------- | -------- | -------- | --------------------------------------------------- |
| accountId     | string   | TRUE     | 账户编号                                            |
| currency      | string   | FALSE    | 币种 （缺省值所有币种）                             |
| transactTypes | string   | FALSE    | 变动类型，可多填 （缺省值all） 枚举值： transfer    |
| startTime     | long     | FALSE    | 远点时间（取值范围及缺省值见注1）                   |
| endTime       | long     | FALSE    | 近点时间（取值范围及缺省值见注2）                   |
| sort          | string   | FALSE    | 检索方向（asc 由远及近, desc 由近及远，缺省值desc） |
| limit         | int      | FALSE    | 单页最大返回条目数量 [1-500] （缺省值100）          |
| fromId        | long     | FALSE    | 起始编号（仅在下页查询时有效，见注3）               |

注1：<br>
startTime取值范围：[(endTime - 10天), endTime], unix time in millisecond<br>
startTime缺省值：(endTime - 10天)

注2：<br>
endTime取值范围：[(当前时间 - 180天), 当前时间], unix time in millisecond<br>
endTime缺省值：当前时间

> Response:

```json
{
    "code": 200,
    "message": "success",
    "data": [
        {
            "accountId": 10000001,
            "currency": "usdt",
            "transactAmt": 10.000000000000000000,
            "transactType": "transfer",
            "transferType": "margin-transfer-out",
            "transactId": 0,
            "transactTime": 1629882331066,
            "transferer": 28483123,
            "transferee": 13496526
        },
        {
            "accountId": 10000001,
            "currency": "usdt",
            "transactAmt": -10.000000000000000000,
            "transactType": "transfer",
            "transferType": "margin-transfer-in",
            "transactId": 0,
            "transactTime": 1629882096562,
            "transferer": 13496526,
            "transferee": 28483123
        }
    ],
    "nextId": 1624316679,
    "ok": true
}
```

### 响应数据

| 字段名称     | 数据类型 | 是否必需 | 描述                                                         | 取值范围                                                     |
| ------------ | -------- | -------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| code         | integer  | TRUE     | 状态码                                                       |                                                              |
| message      | string   | FALSE    | 错误描述（如有）                                             |                                                              |
| \<data\>         | object   | TRUE     | 按用户请求参数sort中定义的顺序排列                           |                                                              |
| accountId  | integer  | TRUE     | 账户编号                                                     |                                                              |
| currency     | string   | TRUE     | 币种                                                         |                                                              |
| transactAmt  | number   | TRUE     | 变动金额（入账为正 or 出账为负）                             |                                                              |
| transactType | string   | TRUE     | 变动类型                                                     | transfer（划转）                                             |
| transferType | string   | FALSE    | 划转类型（仅对transactType=transfer有效）                    | otc-to-pro（otc到现货）, pro-to-otc（现货到otc）, futures-to-pro（交割合约到现货）, pro-to-futures（现货到交割合约）, dm-swap-to-pro（币本位永续合约到现货）, dm-pro-to-swap（现货到币本位永续合约）, margin-transfer-in（转入到逐仓杠杆）, margin-transfer-out（从逐仓杠杆转出）, pro-to-super-margin（现货到全仓杠杆）, super-margin-to-pro（全仓杠杆到现货）, master-transfer-in（转入到母用户）, master-transfer-out（从母用户转出）, sub-transfer-in（转入到子用户）, sub-transfer-out（从子用户转出） |
| transactId   | integer  | TRUE     | 交易流水号                                                   |                                                              |
| transactTime | integer  | TRUE     | 交易时间                                                     |                                                              |
| transferer   | integer  | FALSE    | 付款方账户ID                                                 |                                                              |
| transferee   | integer  | FALSE    | 收款方账户ID                                                 |                                                              |
| \</data\>         |    |      |                            |                                                              |
| nextId       | integer  | FALSE    | 下页起始编号（仅在查询结果需要分页返回时包含此字段，见注3。） |                                                              |

注3：<br>
仅当用户请求查询的时间范围内的数据条目超出单页限制（由“limit“字段设定）时，服务器才返回”nextId“字段。用户收到服务器返回的”nextId“后 –<br>
1）	须知晓后续仍有数据未能在本页返回；<br>
2）	如需继续查询下页数据，应再次请求查询并将服务器返回的“nextId”作为“fromId“，其它请求参数不变。<br>
3）	作为数据库记录ID，“nextId”和“fromId”除了用来翻页查询外，无其它业务含义。<br>


## 币币现货账户与合约账户划转

API Key 权限：交易<br>

此接口用户币币现货账户与合约账户之间的资产划转。

从现货现货账户转至合约账户，类型为`pro-to-futures`; 从合约账户转至现货账户，类型为`futures-to-pro`


### HTTP 请求

- POST `/v1/futures/transfer`

> Request

```json
{
  "currency": "btc",
  "amount": 0.001,
  "type": "pro-to-futures"
}
```

### 请求参数

|参数名称 | 数据类型 | 是否必需 | 默认值 | 描述|取值范围
|---------  | --------- | -------- | ------- | -----------|---------|
|currency     | string    | true     | NA      | 币种, e.g. btc||
|amount   | decimal    | true     | NA      | 划转数量||
|type     | string    | true     | NA      | 划转类型| 从合约账户到现货账户：“futures-to-pro”，从现货账户到合约账户： “pro-to-futures”|


> Response:

```json

请求成功的返回：
{  
  "data": 12345,
  "status": "ok"
}

请求失败的返回：
{
    "status": "error",
    "data": null,
    "err-code": "base-msg",
    "err-msg": "Insufficient amount available."
}
```

### 响应数据

| 参数名称 | 数据类型 | 描述                         |
| -------- | -------- | ---------------------------- |
| data     | Long     | Transfer id                  |
| status   | string   | "ok" or "error"              |
| err-code | string   | 错误码，具体错误码请见列表   |
| err-msg  | string   | 错误消息，具体消息内容请列表 |

### 错误码

| 错误码                                         | 错误消息(中文）                                              | 错误消息(英文）                                              |
| ---------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| base-msg                                       | （具体内容参见之后的列表说明）                               |                                                              |
| base-currency-error                            | 币种无效                                                     | The currency is invalid                                      |
| frequent-invoke                                | 操作过于频繁，请稍后重试。（如果超过1分钟10次，系统返回该error-code） | the operation is too frequent. Please try again later        |
| banned-by-blacklist                            | 黑名单限制                                                   | Blacklist restriction                                        |
| dw-insufficient-balance                        | 可划转余额不足，最大可划转 {0}。（币币账户的余额不足。）     | Insufficient balance. You can only transfer {0} at most.     |
| dw-account-transfer-unavailable                | 转账暂时不可用                                               | account transfer unavailable                                 |
| dw-account-transfer-error                      | 由于其他服务不可用导致的划转失败                             | account transfer error                                       |
| dw-account-transfer-failed                     | 划转失败。请稍后重试或联系客服                               | Failed to transfer. Please try again later.                  |
| dw-account-transfer-failed-account-abnormality | 账户异常，划转失败。请稍后重试或联系客服                     | Account abnormality, failed to transfer。Please try again later. |

### base-msg对应的err-msg列表
| 错误码   | 错误消息(中文）                              | 错误消息(英文）                                              |
| -------- | -------------------------------------------- | ------------------------------------------------------------ |
| base-msg | 用户没有入金权限                             | Unable to transfer in currently. Please contact customer service. |
| base-msg | 用户没有出金权限                             | Unable to transfer out currently. Please contact customer service. |
| base-msg | 合约状态异常，无法出入金                     | Abnormal contracts status. Can’t transfer.                   |
| base-msg | 子账号没有入金权限，请联系客服               | Sub-account doesn't own the permissions to transfer in. Please contact customer service. |
| base-msg | 子账号没有出金权限，请联系客服               | Sub-account doesn't own the permissions to transfer out. Please contact customer service. |
| base-msg | 子账号没有划转权限，请登录主账号授权         | The sub-account does not have transfer permissions. Please login main account to authorize. |
| base-msg | 可划转余额不足                               | Insufficient amount available.                               |
| base-msg | 单笔转出的数量不能低于{0}{1}                 | The single transfer-out amount must be no less than {0}{1}.  |
| base-msg | 单笔转出的数量不能高于{0}{1}                 | The single transfer-out amount must be no more than {0}{1}.  |
| base-msg | 单笔转入的数量不能低于{0}{1}                 | The single transfer-in amount must be no less than {0}{1}.   |
| base-msg | 单笔转入的数量不能高于{0}{1}                 | The single transfer-in amount must be no more than {0}{1}.   |
| base-msg | 您当日累计转出量超过{0}{1}，暂无法转出       | Your accumulative transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being. |
| base-msg | 您当日累计转入量超过{0}{1}，暂无法转入       | Your accumulative transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being. |
| base-msg | 您当日累计净转出量超过{0}{1}，暂无法转出     | Your accumulative net transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being. |
| base-msg | 您当日累计净转入量超过{0}{1}，暂无法转入     | Your accumulative net transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being. |
| base-msg | 超过平台当日累计最大转出量限制，暂无法转出   | The platform's accumulative transfer-out amount is over the daily maximum. You can't transfer out for the time being. |
| base-msg | 超过平台当日累计最大转入量限制，暂无法转入   | The platform's accumulative transfer-in amount is over the daily maximum. You can't transfer in for the time being. |
| base-msg | 超过平台当日累计最大净转出量限制，暂无法转出 | The platform's accumulative net transfer-out amount is over the daily maximum. You can't transfer out for the time being. |
| base-msg | 超过平台当日累计最大净转入量限制，暂无法转入 | The platform's accumulative net transfer-in amount is over the daily maximum. You can't transfer in for the time being. |
| base-msg | 划转失败，请稍后重试或联系客服               | Transfer failed. Please try again later or contact customer service. |
| base-msg | 服务异常，划转失败，请稍后再试               | Abnormal service, transfer failed. Please try again later.   |
| base-msg | 您尚未开通合约交易，无访问权限               | You don’t have access permission as you have not opened contracts trading. |
| base-msg | 合约品种不存在                               | This contract type doesn't exist.                            |

## 点卡余额查询

此节点既可查询到“不限时”点卡的余额，也可查询到“限时”点卡的余额、分组ID、及各组有效期。<br>
此节点仅可查询到限时/不限时点卡的余额，不可查询到其它币种余额。<br>
母用户可查询母用户或子用户点卡余额。<br>
点卡兑换仅可通过官网页面或APP完成。<br>

API Key 权限：读取<br>
限频值：2次/秒<br>
子用户可调用<br>

### HTTP 请求

- GET `/v2/point/account`

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	---------	|	-----	|
|	subUid |	string	|	FALSE	| 子用户UID（仅对母用户查询子用户点卡余额场景有效）	|

> Response:

```json
{
    "code": 200,
    "data": {
        "accountId": "14403739",
        "groupIds": [
            {
                "groupId": 26,
                "expiryDate": 1594396800000,
                "remainAmt": "0.3"
            }
        ],
        "acctBalance": "0.30000000",
        "accountStatus": "working"
    },
    "success": true
}
```

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	---------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	success	|	string	|	TRUE	|  	|
|	\<data>	|	object	|	TRUE	|	|
|   accountId	|	string	|	TRUE	|账户ID	|
|	accountStatus	|	string	|	TRUE	| 账户状态（working 正常, lock 锁定, fl-sys 系统自动爆仓, fl-mgt 手动爆仓, fl-end 爆仓结束, fl-negative 穿仓）	|
|	acctBalance	|	string	|	TRUE	|账户余额	|
|	\<groupIds\>	|	object	|	TRUE	| 点卡分组ID列表	|
|	groupId	|	long	|	TRUE	| 点卡分组ID	|
|	expiryDate	|	long	|	TRUE	| 点卡到期日（unix time in millisecond）	|
|	remainAmt  	|	string	|	TRUE	|剩余数量	|
|	\</groupIds\>	|	 	|	 	|  	|
|	\</data>	|	 	|	 	|	|

注：<br>
- 限时点卡分组ID = 母用户兑换该组限时点卡时的交易ID<br>
- 不限时点卡分组ID = 0<br>
- 不限时点卡到期日 = 空<br>

## 点卡划转

此节点既可划转“不限时”点卡，也可划转“限时”点卡。<br>
此节点仅支持不限时/限时点卡的划转，不支持其它币种的划转。<br>
此节点仅支持母子用户点卡（point）账户间划转。<br>
如果登录用户为母用户，该节点支持双向划转，即母向子划转和子向母划转。<br>
如果登录用户为子用户，该节点仅支持单向划转，即子向母划转。<br>
母用户将限时点卡从子用户转回时应先行查询子用户点卡的groupId。<br>

API Key 权限：交易<br>
限频值：2次/秒<br>
子用户可调用<br>

### HTTP 请求

- POST `/v2/point/transfer`

### 请求参数

| 名称    | 类型   | 是否必需 | 描述                          |
| ------- | ------ | -------- | ----------------------------- |
| fromUid | string | TRUE     | 转出方UID                     |
| toUid   | string | TRUE     | 转入方UID                     |
| groupId | long   | TRUE     | 点卡分组ID                    |
| amount  | string | TRUE     | 划转数量（最高精度: 8位小数） |

注：<br>
- 如传参点卡分组ID=0，意味着该笔划转为不限时点卡划转。<br>

> Response:

```json
{
    "code": 200,
    "data": {
        "transactId": "74",
        "transactTime": 1594370136458
    },
    "success": true
}
```

### 响应数据

| 名称           | 类型    | 是否必需 | 描述                                     |
| -------------- | ------- | -------- | ---------------------------------------- |
| code           | integer | TRUE     | 状态码                                   |
| message        | string  | FALSE    | 错误描述（如有）                         |
| success        | string  | TRUE    |                          |
| \<data\>           | object  | TRUE     |                                          |
| transactId   | string  | TRUE     | 划转交易ID                               |
| transactTime | long    | TRUE     | 划转交易时间（unix time in millisecond） |
| \</data\>    |         |          |                                          |


## 常见错误码

以下是账户相关接口返回的错误码、错误消息以及说明。

| 错误码 | 错误消息                                    | 说明                                                |
| ------ | ------------------------------------------- | --------------------------------------------------- |
| 500    | system error                                | 调用内部服务异常                                    |
| 1002   | forbidden                                   | 禁止操作，如用户入参中accountId与UID不一致          |
| 2002   | "invalid field value in `currency`"         | currency不符合正则规则^[a-z0-9]{2,10}$              |
| 2002   | "invalid field value in `transactTypes`"    | 变动类型transactTypes不是“transfer”                 |
| 2002   | "invalid field value in `sort`"             | 分页请求参数不是合法的"asc或desc"                   |
| 2002   | "value in `fromId` is not found in record”  | 未找到fromId                                        |
| 2002   | "invalid field value in `accountId`"        | 查询参数中accountId为空                             |
| 2002   | "value in `startTime` exceeded valid range" | 入参查询时间大于当前时间，或者距离当前时间超过180天 |
| 2002   | "value in `endTime` exceeded valid range")  | 查询结束时间小于开始时间，或者查询时间跨度大于10天  |

# 钱包（充提相关）

## 简介

充提相关接口提供了充币地址、提币地址、提币额度、充提记录等查询，以及提币、取消提币等功能。

<aside class="notice">访问充提相关的接口需要进行签名认证。</aside>

## 充币地址查询

此节点用于查询特定币种（IOTA除外）在其所在区块链中的充币地址，母子用户均可用

API Key 权限：读取<br>
限频值（NEW）：20次/2s

<aside class="notice"> 充币地址查询暂不支持IOTA币 </aside>

### HTTP 请求

- GET `/v2/account/deposit/address`

### 请求参数

| 字段名称 | 是否必需 | 类型   | 字段描述 | 取值范围                                                     |
| -------- | -------- | ------ | -------- | ------------------------------------------------------------ |
| currency | true     | string | 币种     | btc, ltc, bch, eth, etc ...(取值参考`GET /v1/common/currencys`) |

> Response:

```json
{
    "code": 200,
    "data": [
        {
            "userId": 12345678,
            "currency": "btc",
            "address": "0xd476b0d77583fbda5180039f1f513b750cb4f527",
            "addressTag": "",
            "chain": "hbtc"
        },
        {
            "userId": 12345678,
            "currency": "btc",
            "address": "16egzDeZiVDJ4D44UbWKN6snLYFjS1aEmJ",
            "addressTag": "",
            "chain": "btc"
        },
        {
            "userId": 12345678,
            "currency": "btc",
            "address": "0xd476b0d77583fbda5180039f1f513b750cb4f527",
            "addressTag": "",
            "chain": "hrc20btc"
        }
    ]
}
```

### 响应数据


| 字段名称   | 是否必需 | 数据类型 | 字段描述         | 取值范围 |
| ---------- | -------- | -------- | ---------------- | -------- |
| code       | true     | int      | 状态码           |          |
| message    | false    | string   | 错误描述（如有） |          |
| \<data\>   | true     | object   |                  |          |
| currency  | true     | string   | 币种             |          |
| address    | true     | string   | 充币地址         |          |
| addressTag | true     | string   | 充币地址标签     |          |
| chain     | true     | string   | 链名称           |          |
| \</data\>   |      |    |                  |          |


## 提币额度查询

此节点用于查询各币种提币额度，限母用户可用

API Key 权限：读取<br>
限频值（NEW）：20次/2s

### HTTP 请求

- GET `/v2/account/withdraw/quota`

### 请求参数

| 字段名称 | 是否必需 | 类型   | 字段描述 | 取值范围                                                     |
| -------- | -------- | ------ | -------- | ------------------------------------------------------------ |
| currency | true     | string | 币种     | btc, ltc, bch, eth, etc ...(取值参考`GET /v1/common/currencys`) |

> Response:

```json
{
    "code": 200,
    "data": {
        "currency": "usdt",
        "chains": [
            {
                "chain": "hrc20usdt",
                "maxWithdrawAmt": "2000000.000000000000000000",
                "withdrawQuotaPerDay": "4845303.99999991",
                "remainWithdrawQuotaPerDay": "4845303.99999991",
                "withdrawQuotaPerYear": "-1",
                "remainWithdrawQuotaPerYear": "-1",
                "withdrawQuotaTotal": "-1",
                "remainWithdrawQuotaTotal": "-1"
            },
            {
                "chain": "trc20usdt",
                "maxWithdrawAmt": "1000000.000000000000000000",
                "withdrawQuotaPerDay": "4845303.99999991",
                "remainWithdrawQuotaPerDay": "4845303.99999991",
                "withdrawQuotaPerYear": "-1",
                "remainWithdrawQuotaPerYear": "-1",
                "withdrawQuotaTotal": "-1",
                "remainWithdrawQuotaTotal": "-1"
            },
            {
                "chain": "usdt",
                "maxWithdrawAmt": "600000.000000000000000000",
                "withdrawQuotaPerDay": "4845303.99999991",
                "remainWithdrawQuotaPerDay": "4845303.99999991",
                "withdrawQuotaPerYear": "-1",
                "remainWithdrawQuotaPerYear": "-1",
                "withdrawQuotaTotal": "-1",
                "remainWithdrawQuotaTotal": "-1"
            },
            {
                "chain": "usdterc20",
                "maxWithdrawAmt": "1000000.000000000000000000",
                "withdrawQuotaPerDay": "4845303.99999991",
                "remainWithdrawQuotaPerDay": "4845303.99999991",
                "withdrawQuotaPerYear": "-1",
                "remainWithdrawQuotaPerYear": "-1",
                "withdrawQuotaTotal": "-1",
                "remainWithdrawQuotaTotal": "-1"
            }
        ]
    }
}
```

### 响应数据

| 字段名称                  | 是否必需 | 数据类型 | 字段描述         | 取值范围 |
| ------------------------- | -------- | -------- | ---------------- | -------- |
| code                      | true     | int      | 状态码           |          |
| message                   | false    | string   | 错误描述（如有） |          |
| \<data\>                  | true     | object   |                  |          |
| currency                  | true     | string   | 币种             |          |
| \<chains\>                | true     | object   |                  |          |
| chain                   | true     | string   | 链名称           |          |
| maxWithdrawAmt            | true     | string   | 单次最大提币金额 |          |
| withdrawQuotaPerDay       | true     | string   | 当日提币额度     |          |
| remainWithdrawQuotaPerDay | true     | string   | 当日提币剩余额度 |          |
| withdrawQuotaPerYear       | true     | string    | 每年最大提款金额       |
| remainWithdrawQuotaPerYear | true     | string    | 年内剩余提款额度    |
| withdrawQuotaTotal         | true     | string    | 最大提款总额       |
| remainWithdrawQuotaTotal   | true     | string    | 剩余总提款额度      |
| \</chains\>                |      |    |                  |          |
| \</data\>                  |      |    |                  |          |


## 提币地址查询

API Key 权限：读取<br>

该节点用于查询API key可用的提币地址，限母用户可用。<br>

<aside class="notice">用户需要先通过Web端添加提币地址，才可以通过接口查询到</aside>

### HTTP 请求

- GET `/v2/account/withdraw/address`

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述                                                   | 默认值                         | 取值范围                                                     |
| -------- | -------- | ------ | ------------------------------------------------------ | ------------------------------ | ------------------------------------------------------------ |
| currency | true     | string | 币种                                                   |                                | btc, ltc, bch, eth, etc ...(取值参考`GET /v1/common/currencys`) |
| chain    | false    | string | 链名称                                                 | 如不填，返回所有链的提币地址   |                                                              |
| note     | false    | string | 地址备注                                               | 如不填，返回所有备注的提币地址 |                                                              |
| limit    | false    | int    | 单页最大返回条目数量                                   | 100                            | [1-500]                                            |
| fromId   | false    | long   | 起始编号（提币地址ID，仅在下页查询时有效，详细见备注） | NA                             |                                                              |

> Response:

```json
{
    "code": 200,
    "data": [
        {
            "currency": "usdt",
            "chain": "hrc20usdt",
            "note": "tom",
            "addressTag": "",
            "address": "0x3b994f25c4c25e99d4d26364ffc014cce64600ca"
        }
    ],
    "next-id": 30137790
}
```

### 响应数据
| 参数名称   | 是否必须 | 数据类型 | 描述                                                         | 取值范围 |
| ---------- | -------- | -------- | ------------------------------------------------------------ | -------- |
| code       | true     | int      | 状态码                                                       |          |
| message    | false    | string   | 错误描述（如有）                                             |          |
| \<data\>       | true     | object   |                                                              |          |
| currency | true     | string   | 币种                                                         |          |
| chain      | true     | string   | 链名称                                                       |          |
| note       | true     | string   | 地址备注                                                     |          |
| addressTag | false    | string   | 地址标签，如有                                               |          |
| address }  | true     | string   | 地址                                                         |          |
| \</data\>       |      |    |                                                              |          |
| nextId     | false    | long     | 下页起始编号（提币地址ID，仅在查询结果需要分页返回时，包含此字段，详细见备注） |          |

备注：<br>
仅当用户请求查询的数据条目超出单页限制（由“limit“字段设定）时，服务器才返回”nextId“字段。用户收到服务器返回的”nextId“后 –<br>
1）须知晓后续仍有数据未能在本页返回；<br>
2）如需继续查询下页数据，应再次请求查询并将服务器返回的“nextId”作为“fromId“，其它请求参数不变。<br>
3）作为数据库记录ID，“nextId”和“fromId”除了用来翻页查询外，无其它业务含义。<br>


## 虚拟币提币

此节点用于将现货账户的数字币提取到区块链地址（已存在于提币地址列表）而不需要多重（短信、邮件）验证，限母用户可用

API Key 权限：提币<br>
限频值（NEW）：20次/2s

<aside class="notice">如果用户在 <a href='https://www.hbg.com/zh-cn/user_center/uc_setting/'>个人设置 </a> 里设置了优先使用快速提币，通过API发起的提币也会优先选择快速提币通道。快速提币是指当提币目标地址是火币用户地址时，提币将通过火币平台内部快速通道，不通过区块链，而由此产生的提币记录将会没有交易哈希。</aside>
<aside class="notice">API提币仅支持用户 <a href='https://www.hbg.com/zh-cn/withdraw_address/'>提币地址列表</a> 中的地址。IOTA一次性提币地址无法被设置为常用地址，因此不支持通过API方式提币IOTA。 </aside>

### HTTP 请求

- POST `/v1/dw/withdraw/api/create`

> Request:

```json
{
  "address": "0xde709f2102306220921060314715629080e2fb77",
  "amount": "0.05",
  "currency": "eth",
  "fee": "0.01"
}
```

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述                                                         | 取值范围                                                     |
| -------- | -------- | ------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| address  | true     | string | 提币地址                                                     | 仅支持在官网上相应币种[地址列表](https://www.hbg.com/zh-cn/withdraw_address/) 中的地址 |
| amount   | true     | string | 提币数量                                                     |                                                              |
| currency | true     | string | 资产类型                                                     | btc, ltc, bch, eth, etc ...(取值参考`GET /v1/common/currencys`) |
| fee      | true     | string | 转账手续费                                                   |                                                              |
| chain    | false    | string | 取值参考`GET /v2/reference/currencies`,例如提USDT至OMNI时须设置此参数为"usdt"，提USDT至TRX时须设置此参数为"trc20usdt"，其他币种提币无须设置此参数 |                                                              |
| addr-tag | false    | string | 虚拟币共享地址tag，适用于xrp，xem，bts，steem，eos，xmr      | 格式, "123"类的整数字符串                                    |
| client-order-id	 | false    | string | 客户端提币订单ID（最长32位的字符串）      |                                    |

### 备注
- client-order-id（客户端提币订单ID）如果不为空，就会做幂等校验，相同client-order-id的提币请求，后发起的会直接返回前面提交成功的提币订单ID

> Response:

```json
{
  "data": 700
}
```

### 响应数据


| 参数名称 | 是否必须 | 数据类型 | 描述    | 取值范围 |
| -------- | -------- | -------- | ------- | -------- |
| data     | false    | long     | 提币 ID |          |


## 通过clientOrderId查询提币订单

API Key 权限：读取<br>

### HTTP 请求

- GET `/v1/query/withdraw/client-order-id`

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述                                                         | 取值范围                                                     |
| -------- | -------- | ------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| clientOrderId	 | true    | string | 客户端提币订单ID（最长32位的字符串）      |                                    |

### 备注
- 用于查询api提币订单（api提币订单下单时使用了client-order-id，返回对应提币订单数据对象，如果api提币订单下单时没有传入client-order-id，返回空）

> Response:

```json

 {
    "status": "ok",
    "data": {
        "id": 101123262,
        "client-order-id": "1113",
        "type": "withdraw",
        "sub-type": "FAST",
        "currency": "usdt",
        "chain": "usdt",
        "tx-hash": "",
        "amount": 1.200000000000000000,
        "from-addr-tag": "",
        "address": "1PL24EbWrNNrnMKw1cxAHPsebUz7DdhWTx",
        "address-tag": "",
        "fee": 0E-18,
        "state": "confirmed",
        "created-at": 1637758163686,
        "updated-at": 1637758251559
    }
}
```

### 响应数据

| 参数名称 | 是否必须 | 数据类型 | 描述    | 取值范围 |
| -------- | -------- | -------- | ------- | -------- |
| status  >     | true    | stirng     | 请求返回结果  |          |
| \<data\   >     | false    | long     |   |          |
| address     | true    | string     | 地址 |          |
| client-order-id	     | true    | string     | 客户端提币订单ID |          |
| address-tag     | true    | string     | 地址tag	 |          |
| amount     | true    | decimal     | 数量 |          |
| blockchain-confirm     | false    | int     | 区块链确认次数 |          |
| chain     | false    | string     | 区块链 |          |
| created-at     | true    | long     | 创建时间 |          |
| currency     | true    | string     | 币种	 |          |
| error-code     | true    | string     | 错误码 |          |
| error-msg     | true    | string     | 错误信息 |          |
| fee     | true    | decimal     | 手续费	 |          |
| from-addr-tag     | true    | string     | 出款地址tag |          |
| from-address     | false    | string     | 出款地址 |          |
| id     | true    | long     | ID |          |
| request-id     | true    | string	     | 唯一标识ID  |          |
| state     | true    | string     | 状态 |          |
| tx-hash     | true    | string     | 交易哈希 |          |
| type     | true    | string	     | 类型 |          |
| updated-at    | true    | long     | 更新时间 |          |
| user-id     | false    | long     | 用户id |          |
| wallet-confirm     | false    | int     | 钱包确认次数 |          |
| \</data\>     | false    | long     |   |          |


## 取消提币

此节点用于取消已提交的提币请求，限母用户可用

API Key 权限：提币<br>
限频值（NEW）：20次/2s

### HTTP 请求

- POST `/v1/dw/withdraw-virtual/{withdraw-id}/cancel`

### 请求参数

| 参数名称    | 是否必须 | 类型 | 描述                  | 默认值 | 取值范围 |
| ----------- | -------- | ---- | --------------------- | ------ | -------- |
| withdraw-id | true     | long | 提币 ID，填在 path 中 |        |          |


> Response:

```json
{
  "data": 700
}
```

### 响应数据


| 参数名称 | 是否必须 | 数据类型 | 描述    | 取值范围                                         |
| -------- | -------- | -------- | ------- | ------------------------------------------------ |
| data     | false    | long     | 提币 ID | （取消成功返回提币ID，取消失败返回错误码和原因） |

## 充提记录

此节点用于查询充提记录，母子用户均可用

API Key 权限：读取<br>
限频值（NEW）：20次/2s

### HTTP 请求

- GET `/v1/query/deposit-withdraw`

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述             | 默认值                                                       | 取值范围                                                     |
| -------- | -------- | ------ | ---------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| currency | false    | string | 币种             |                                                              | btc, ltc, bch, eth, etc ...(取值参考`GET /v1/common/currencys`) |
| type     | true     | string | 充值或提币       |                                                              | deposit 或 withdraw,子用户仅可用deposit                      |
| from     | false    | string | 查询起始 ID      | 缺省时，默认值direct相关。当direct为‘prev’时，from 为1 ，从旧到新升序返回；当direct为’next‘时，from为最新的一条记录的ID，从新到旧降序返回 |                                                              |
| size     | false    | string | 查询记录大小     | 100                                                          | [1-500]                                                        |
| direct   | false    | string | 返回记录排序方向 | 缺省时，默认为“prev” （升序）                                | “prev” （升序）or “next” （降序）                            |

> Response:

```json
{
    "status":"ok",
    "data":[
        {
            "id":45182894,
            "type":"withdraw",
            "sub-type":"FAST",
            "currency":"usdt",
            "chain":"trc20usdt",
            "tx-hash":"",
            "amount":400,
            "from-addr-tag":"",
            "address":"TRwkUYHWgUh23jbKpgTcYHgE9CcBzhGno9",
            "address-tag":"",
            "fee":0,
            "state":"confirmed",
            "created-at":1612261330443,
            "updated-at":1612261389250
        },
        {
            "id":61003926,
            "type":"withdraw",
            "sub-type":"FAST",
            "currency":"usdt",
            "chain":"trc20usdt",
            "tx-hash":"",
            "amount":2,
            "from-addr-tag":"",
            "address":"TYGvZSD1duPctGaMPSP12Fy8BrQMu2KCdp",
            "address-tag":"",
            "fee":0,
            "state":"confirmed",
            "created-at":1621416907639,
            "updated-at":1621416907788
        }
    ]
}
```

### 响应数据

| 参数名称    | 是否必须 | 数据类型 | 描述                                                         | 取值范围                                 |
| ----------- | -------- | -------- | ------------------------------------------------------------ | ---------------------------------------- |
| status      | true     | string     | 请求返回状态               |      "ok" or "error"             |
| \<data\>    | true     | object     |                |                                          |
| id          | true     | long     | 充币或者提币订单id，翻页查询时from参数取自此值               |                                          |
| type        | true     | string   | 类型                                                         | 'deposit', 'withdraw', 子用户仅有deposit |
| currency    | true     | string   | 币种                                                         |                                          |
| tx-hash     | true     | string   | 交易哈希。如果是“快速提币”，则提币不通过区块链，该值为空。   |                                          |
| chain       | true     | string   | 链名称                                                       |                                          |
| amount      | true     | float    | 个数                                                         |                                          |
| address     | true     | string   | 目的地址                                                     |                                          |
| address-tag | true     | string   | 地址标签                                                     |                                          |
| fee         | true     | float    | 手续费                                                       |                                          |
| state       | true     | string   | 状态                                                         | 状态参见下表                             |
| error-code  | false    | string   | 提币失败错误码，仅type为”withdraw“，且state为”reject“、”wallet-reject“和”failed“时有。 |                                          |
| error-msg   | false    | string   | 提币失败错误描述，仅type为”withdraw“，且state为”reject“、”wallet-reject“和”failed“时有。 |                                          |
| created-at  | true     | long     | 发起时间                                                     |                                          |
| updated-at  | true     | long     | 最后更新时间                                                 |                                          |
| \</data\>    |      |      |                |                                          |

- 虚拟币充值状态定义：

| 状态       | 描述                                 |
| ---------- | ------------------------------------ |
| unknown    | 状态未知                             |
| confirming | 区块确认中                           |
| confirmed  | 区块已完成，已经上账，可以划转和交易 |
| safe       | 区块已确认，可以提币                 |
| orphan     | 区块已被孤立                         |

- 虚拟币提币状态定义：

| 状态            | 描述         |
| --------------- | ------------ |
| verifying       | 待验证       |
| failed          | 验证失败     |
| submitted       | 已提交       |
| reexamine       | 审核中       |
| canceled        | 已撤销       |
| pass            | 审批通过     |
| reject          | 审批拒绝     |
| pre-transfer    | 处理中       |
| wallet-transfer | 已汇出       |
| wallet-reject   | 钱包拒绝     |
| confirmed       | 区块已确认   |
| confirm-error   | 区块确认错误 |
| repealed        | 已撤销       |

## 常见错误码

以下是充提相关接口返回的返回码、返回消息以及说明。

| 返回码 | 返回消息                             | 说明         |
| ------ | ------------------------------------ | ------------ |
| 200    | success                              | 请求成功     |
| 500    | error                                | 系统错误     |
| 1002   | unauthorized                         | 未授权       |
| 1003   | invalid signature                    | 验签失败     |
| 2002   | invalid field value in "field name"  | 非法字段取值 |
| 2003   | missing mandatory field "field name" | 强制字段缺失 |

## 常见问题

### Q1：为什么创建提币时返回api-not-support-temp-addr错误？
A：因安全考虑，API创建提币时仅支持已在提币地址列表中的地址，暂不支持使用API添加地址至提币地址列表中，需在网页端或APP端添加地址后才可在API中进行提币操作。

### Q2：为什么USDT提币时返回Invaild-Address错误？
A：USDT币种为典型的一币多链币种， 创建提币订单时应填写chain参数对应地址类型。以下表格展示了链和chain参数的对应关系：

| 链             | chain 参数 |
| -------------- | ---------- |
| ERC20 （默认） | usdterc20  |
| OMNI           | usdt       |
| TRX            | trc20usdt  |

如果chain参数为空，则默认的链为ERC20，或者也可以显示将参数赋值为`usdterc20`。

如果要提币到OMNI或者TRX，则chain参数应该填写usdt或者trc20usdt。chain参数可使用值请参考 `GET /v2/reference/currencies` 接口。

### Q3：创建提币时fee字段应该怎么填？
A：请参考 GET /v2/reference/currencies接口返回值，返回信息中withdrawFeeType为提币手续费类型，根据类型选择对应字段设置提币手续费。 

提币手续费类型包含：  

- transactFeeWithdraw : 单次提币手续费（仅对固定类型有效，withdrawFeeType=fixed）  
- minTransactFeeWithdraw : 最小单次提币手续费（仅对区间类型有效，withdrawFeeType=circulated or ratio） 
- maxTransactFeeWithdraw : 最大单次提币手续费（仅对区间类型和有上限的比例类型有效，withdrawFeeType=circulated or ratio
- transactFeeRateWithdraw :  单次提币手续费率（仅对比例类型有效，withdrawFeeType=ratio）

### Q4：如何查看我的提币额度？
A：请参考/v2/account/withdraw/quota接口返回值，返回信息中包含您查询币种的单次、当日、当前、总提币额度以及剩余额度的信息。 

若您有大额提币需求，且提币数额超出相关限额，可联系官方客服进行沟通。  

# 子用户管理

## 简介

子用户管理接口了子用户的创建、查询、权限设置、转账，子用户API Key的创建、修改、查询、删除，子用户充提地址、余额的查询等功能。

<aside class="notice">访问子用户管理的相关接口需要进行签名认证。</aside>

## 设置子用户手续费抵扣模式

此接口用于设置子用户手续费抵扣模式（子用户抵扣或母用户抵扣）

API Key 权限：交易

### HTTP 请求

- POST `/v2/sub-user/deduct-mode`

### 请求参数

| 参数名称   | 是否必须 | 类型   | 描述                                          | 默认值 | 取值范围 |
| ---------- | -------- | ------ | --------------------------------------------- | ------ | -------- |
| subUids    | true     | long   | 子用户UID列表（支持多填，最多50个，逗号分隔） | NA     |          |
| deductMode | true     | string | 抵扣模式，母账户抵扣：master 子账户抵扣：sub  | NA     |          |

> Response:

```json
{
    "code": 200,
    "data": [
        {
            "subUid": "158069153",
            "deductMode": "master"
        },
        {
            "subUid": "1461901631",
            "deductMode": null,
            "errCode": 1002,
            "errMessage": "forbidden"
        }
    ],
    "ok": true
}
```

### 响应数据

| 参数名称    |   是否必须 | 数据类型 | 描述             | 取值范围 |
| ----------- | -------- | -------- | ---------------- | -------- |
| code        | true     | int      | 状态码           |          |
| message     | false    | string   | 错误描述（如有） |          |
| \<data\>    | true     | object   |                  |          |
| subUid     | true     | string   | 子用户UID        |          |
| deductMode  | true     | string   | 抵扣模式         |          |
| errCode    | false     | string   | 错误码           |          |
| errMessage | false    | string   | 错误信息         |          |
| \</data\>    |      |    |                  |          |


## 母子用户API key信息查询

此接口用于母用户查询自身的API key信息，以及母用户查询子用户的API key信息

API Key 权限：读取

### HTTP 请求

- GET `/v2/user/api-key`

### 请求参数
| 参数名称  | 是否必须 | 类型   | 描述                                                        | 默认值 | 取值范围 |
| --------- | -------- | ------ | ----------------------------------------------------------- | ------ | -------- |
| uid       | true     | long   | 母用户UID，子用户UID                                        | NA     |          |
| accessKey | false    | string | API key的access key，若缺省，则返回UID对应用户的所有API key | NA     |          |

> Response:

```json
{
    "code":200,
    "message":"success",
    "data":[
        {
            "accessKey":"160bb889-b7XXXXbe-e0XXXXf5-ghxertfvbf",
            "status":"normal",
            "note":"host",
            "permission":"trade,readOnly",
            "ipAddresses":"192.168.0.1,192.168.1.1",
            "validDays":-1,
            "createTime":1615192704000,
            "updateTime":1623030338000
        },
        {
            "accessKey":"5000d371-edXXXXf5tf-40XXXX8b-ab8e5",
            "status":"normal",
            "note":"host two",
            "permission":"readOnly,trade,withdraw",
            "ipAddresses":"",
            "validDays":7,
            "createTime":1623158078000,
            "updateTime":1629875976000
        }
    ],
    "ok":true
}
```

### 响应数据
| 参数名称      | 是否必须 | 数据类型 | 描述                    | 取值范围                      |
| ------------- | -------- | -------- | ----------------------- | ----------------------------- |
| code          | true     | int      | 状态码                  |                               |
| message       | false    | string   | 错误描述（如有）        |                               |
| \<data\>      | true     | object   |                         |                               |
| accessKey     | true     | string   | access key              |                               |
| note          | true     | string   | API key备注             |                               |
| permission    | true     | string   | API key权限             |                               |
| ipAddresses   | false    | string   | API key绑定的IP地址     |                               |
| validDays     | true     | int      | API key剩余有效天数     | 若为-1，则表示永久有效        |
| status        | true     | string   | API key当前状态         | normal(正常)，expired(已过期) |
| createTime    | true     | long     | API key创建时间         |                               |
| updateTime    | true     | long     | API key最近一次修改时间 |                               |
| \</data\>      |       |     |                         |                               |


## 母子用户获取用户UID

此接口用于母子用户查询本用户UID

API Key 权限：读取

### HTTP 请求

- GET `/v2/user/uid`

### 请求参数
无


> Response:

```json
{
    "code": 200,
    "data": 63628520
}
```

### 响应数据
| 参数名称 | 是否必须 | 数据类型 | 描述             | 取值范围 |
| -------- | -------- | -------- | ---------------- | -------- |
| code     | true     | int      | 状态码           |          |
| message  | false    | string   | 错误描述（如有） |          |
| data     | true     | long     | 用户UID          |          |




## 子用户创建

此接口用于母用户进行子用户创建，单次最多50个

API Key 权限：交易

### HTTP 请求

- POST `/v2/sub-user/creation`

> Request:

```json
{
    "userList":[
        {
            "userName":"test123",
            "note":"huobi"
        },
        {
            "userName":"test456",
            "note":"huobi two"
        }
    ]
}
```

### 请求参数
| 参数名称    | 是否必须 | 类型   | 描述                                               | 默认值 | 取值范围                                                     |
| ----------- | -------- | ------ | -------------------------------------------------- | ------ | ------------------------------------------------------------ |
| \<userList\>    | true     | object |                                                    |        |                                                              |
| userName | true     | string | 子用户名，子用户身份的重要标识，要求火币平台内唯一 | NA     | 6至20位字母和数字的组合，可为纯字母；若字母和数字的组合，需以字母开头；字母不区分大小写； |
| note      | false    | string | 子用户备注，无唯一性要求                           | NA     | 最多20位字符，字符类型不限                                   |
| \</userList\>    |      |  |                           |        |                                                              |

> Response:

```json
{
    "code":200,
    "data":[
        {
            "userName":"test123",
            "note":"huobi",
            "uid":123
        },
        {
            "userName":"test456",
            "note":"huobi two",
            "errCode":"2002",
            "errMessage":"value in user name duplicated with existing record"
        }
    ]
}
```

### 响应数据
| 参数名称      | 是否必须 | 数据类型 | 描述                                         | 取值范围 |
| ------------- | -------- | -------- | -------------------------------------------- | -------- |
| code          | true     | int      | 状态码                                       |          |
| message       | false    | string   | 错误描述（如有）                             |          |
| \<data\>      | true     | object   |                                              |          |
| userName      | true     | string   | 子用户名                                     |          |
| note          | false    | string   | 子用户备注（仅对有备注的子用户有效）         |          |
| uid           | false    | long     | 子用户UID（仅对创建成功的子用户有效）        |          |
| errCode       | false    | string   | 创建失败错误码（仅对创建失败的子用户有效）   |          |
| errMessage    | false    | string   | 创建失败错误原因（仅对创建失败的子用户有效） |          |
| \</data\>     |      |    |                                              |          |


## 获取子用户列表

母用户通过此接口可获取所有子用户的UID列表及各用户状态

API Key 权限：读取

### HTTP 请求

- GET `/v2/sub-user/user-list`

### 请求参数

| 参数名称 | 是否必须 | 类型 | 描述                             | 默认值 | 取值范围 |
| -------- | -------- | ---- | -------------------------------- | ------ | -------- |
| fromId   | FALSE    | long | 查询起始编号（仅对翻页查询有效） |        |          |

> Response:

```json
{
    "code": 200,
    "data": [
        {
            "uid": 63628520,
            "userState": "normal"
        },
        {
            "uid": 132208121,
            "userState": "normal"
        }
    ]
}
```

### 响应数据

| 参数名称    | 是否必须 | 数据类型 | 描述                                       | 取值范围     |
| ----------- | -------- | -------- | ------------------------------------------ | ------------ |
| code        | TRUE     | int      | 状态码                                     |              |
| message     | FALSE    | string   | 错误描述（如有）                           |              |
| \<data\>    | TRUE     | object   |                                            |              |
| uid         | TRUE     | long     | 子用户UID                                  |              |
| userState   | TRUE     | string   | 子用户状态                                 | lock, normal |
| \</data\>   |      |    |                                            |              |
| nextId      | FALSE    | long     | 下页查询起始编号（仅在存在下页数据时返回） |              |


## 冻结/解冻子用户

API Key 权限：交易<br>
限频值（NEW）：20次/2s

此接口用于母用户对其下一个子用户进行冻结和解冻操作

###HTTP 请求

- POST `/v2/sub-user/management`

### 请求参数

| 参数   | 是否必填 | 数据类型 |  说明        | 取值范围                 |
| ------ | -------- | -------- | ----------- | ------------------------ |
| subUid | true     | long     | 子用户的UID |                          |
| action | true     | string   | 操作类型    | lock(冻结)，unlock(解冻) |

> Response:

```json
{
    "code": 200,
    "data": {
        "subUid": 245686628,
        "userState": "lock"
    },
    "ok": true
}
```

### 响应数据

| 参数      | 是否必填 | 数据类型 |  说明       | 取值范围                   |
| --------- | -------- | -------- |  ---------- | -------------------------- |
| code      | true     | int      |  状态码  |                          |
| \<data\>  | true     | object   |    |                          |
| subUid    | true     | long     |  子用户UID  |                           |
| userState | true     | string   |  子用户状态 | lock(已冻结)，normal(正常) |
| \</data\>  |      |    |    |                          |


## 获取特定子用户的用户状态

母用户通过此接口可获取特定子用户的用户状态

API Key 权限：读取

### HTTP 请求

- GET `/v2/sub-user/user-state`

### 请求参数

| 参数名称 | 是否必须 | 类型 | 描述      | 默认值 | 取值范围 |
| -------- | -------- | ---- | --------- | ------ | -------- |
| subUid   | TRUE     | long | 子用户UID |        |          |

> Response:

```json
{
    "code": 200,
    "data": {
        "uid": 132208121,
        "userState": "normal"
    }
}
```

### 响应数据

| 参数名称    | 是否必须 | 数据类型 | 描述             | 取值范围     |
| ----------- | -------- | -------- | ---------------- | ------------ |
| code        | TRUE     | int      | 状态码           |              |
| message     | FALSE    | string   | 错误描述（如有） |              |
| \<data\>    | TRUE     | object   |                  |              |
| uid         | TRUE     | long     | 子用户UID        |              |
| userState   | TRUE     | string   | 子用户状态       | lock, normal |
| \</data\>    | TRUE     | object   |                  |              |


## 设置子用户交易权限

API Key 权限：交易

此接口用于母用户批量设置子用户的交易权限。
子用户的现货交易权限默认开通无须设置。

### HTTP 请求

- POST `/v2/sub-user/tradable-market`

### 请求参数

| 参数        | 是否必填 | 数据类型 | 说明                                          | 取值范围                     |
| ----------- | -------- | -------- | --------------------------------------------- | ---------------------------- |
| subUids     | true     | string   | 子用户UID列表（支持多填，最多50个，逗号分隔） |                            |
| accountType | true     | string   | 账户类型                                      | isolated-margin,cross-margin |
| activation  | true     | string   | 账户激活状态                                  | activated,deactivated        |

> Response:

```json
{
    "code": 200,
    "data": [
        {
            "subUid": "12345678",
            "accountType": "isolated-margin",
            "activation": "activated"
        },
        {
            "subUid": "123456781",
            "accountType": "isolated-margin",
            "errCode": 1002,
            "errMessage": "forbidden"
        }
    ],
    "ok": true
}
```

### 响应数据

| 参数        | 是否必填 | 数据类型 | 说明                                                       | 取值范围                     |
| ----------- | -------- | -------- | ---------------------------------------------------------- | ---------------------------- |
| code        | true     | int      | 状态码                                                     |                              |
| message     | false    | string   | 错误描述（如有）                                           |                              |
| \<data\>    | true     | object   |                                                            |                              |
| subUid      | true     | string   | 子用户UID                                                  |                             |
| accountType | true     | string   | 账户类型                                                   | isolated-margin,cross-margin |
| activation  | true     | string   | 账户激活状态                                               | activated,deactivated        |
| errCode     | false    | int      | 请求被拒错误码（仅在设置该subUid市场准入权限错误时返回）   |                              |
| errMessage  | false    | string   | 请求被拒错误消息（仅在设置该subUid市场准入权限错误时返回） |                              |
| \</data\>   |      |    |                                                            |                              |


## 设置子用户资产转出权限

API Key 权限：交易

此接口用于母用户批量设置子用户的资产转出权限。
子用户的资金转出权限包括：
-	由子用户现货（spot）账户转出至同一母用户下另一子用户的现货（spot）账户；
-	由子用户现货（spot）账户转出至母用户现货（spot）账户（无须设置，默认开通）。

###HTTP 请求

- POST `/v2/sub-user/transferability`

### 请求参数

| 参数          | 是否必填 | 数据类型 | 说明                                          | 取值范围   |
| ------------- | -------- | -------- | --------------------------------------------- | ---------- |
| subUids       | true     | string   | 子用户UID列表（支持多填，最多50个，逗号分隔） |           |
| accountType   | false    | string   | 账户类型（如不填，缺省值spot）                | spot       |
| transferrable | true     | bool     | 可划转权限                                    | true,false |

> Response:

```json
{
    "code": 200,
    "data": [
        {
            "accountType": "spot",
            "transferrable": true,
            "subUid": 245686628
        },
        {
            "accountType": "spot",
            "subUid": 2215699261,
            "errCode": 2002,
            "errMessage": "invalid field value in `2,215,699,261`"
        }
    ],
    "ok": true
}
```

### 响应数据

| 参数          | 是否必填 | 数据类型 |  说明                                                       | 取值范围   |
| ------------- | -------- | -------- | ---------------------------------------------------------- | ---------- |
| code          | true     | int      | 状态码                                                     |            |
| message       | false    | string   | 错误描述（如有）                                           |            |
| \<data\>      | true     | object   |                                                            |            |
| subUid        | true     | long     | 子用户UID                                                  |            |
| accountType   | true     | string   | 账户类型                                                   | spot       |
| transferrable | true     | bool     | 可划转权限                                                 | true,false |
| errCode       | false    | int      | 请求被拒错误码（仅在设置该subUid市场准入权限错误时返回）   |            |
| errMessage    | false    | string   | 请求被拒错误消息（仅在设置该subUid市场准入权限错误时返回） |            |
| \</data\>     |      |    |                                                            |            |


## 获取特定子用户的账户列表

母用户通过此接口可获取特定子用户的Account ID列表及各账户状态

API Key 权限：读取

### HTTP 请求

- GET `/v2/sub-user/account-list`

### 请求参数

| 参数名称 | 是否必须 | 类型 | 描述      | 默认值 | 取值范围 |
| -------- | -------- | ---- | --------- | ------ | -------- |
| subUid   | TRUE     | long | 子用户UID |        |          |

> Response:

```json
{
    "code": 200,
    "data": {
        "uid": 132208121,
        "deductMode": "sub",
        "list": [
            {
                "accountType": "isolated-margin",
                "activation": "activated"
            },
            {
                "accountType": "cross-margin",
                "activation": "deactivated"
            },
            {
                "accountType": "spot",
                "activation": "activated",
                "transferrable": true,
                "accountIds": [
                    {
                        "accountId": 12255180,
                        "accountStatus": "normal"
                    }
                ]
            }
        ]
    }
}
```

### 响应数据

| 参数名称          | 是否必须 | 数据类型 | 描述                                              | 取值范围                                          |
| ----------------- | -------- | -------- | ------------------------------------------------- | ------------------------------------------------- |
| code              | TRUE     | int      | 状态码                                            |                                                   |
| message           | FALSE    | string   | 错误描述（如有）                                  |                                                   |
| \<data\>          | TRUE     | object   |                                                   |                                                   |
| uid               | TRUE     | long     | 子用户UID                                         |                                                   |
| deductMode        | TRUE     |          |                                                   |                                                   |
| \<list\>          | TRUE     | object   |                                                   |                                                   |
| accountType       | TRUE     | string   | 账户类型                                          | spot, isolated-margin, cross-margin, futures,swap |
| activation        | TRUE     | string   | 账户激活状态                                      | activated, deactivated                            |
| transferrable     | FALSE    | bool     | 可划转权限（仅对accountType=spot有效）            | true, false                                       |
| \<accountIds\>    | FALSE    | object   |                                                   |                                                   |
| accountId         | TRUE     | string   | 账户ID                                            |                                                   |
| subType           | FALSE    | string   | 账户子类型（仅对accountType=isolated-margin有效） |                                                   |
| accountStatus     | TRUE     | string   | 账户状态                                          | normal, locked                                    |
| \</accountIds\>    |     |    |                                                   |                                                   |
| \</list\>          |      |    |                                                   |                                                   |
| \</data\>          |      |    |                                                   |                                                   |


## 子用户API key创建

此接口用于母用户创建子用户的API key

API Key 权限：交易

### HTTP 请求

- POST `/v2/sub-user/api-key-generation`

### 请求参数
| 参数名称    | 是否必须 | 类型   | 描述                                                 | 默认值 | 取值范围                                                     |
| ----------- | -------- | ------ | ---------------------------------------------------- | ------ | ------------------------------------------------------------ |
| otpToken    | true     | string | 母用户的谷歌验证码，母用户须在官网页面启用GA二次验证 | NA     | 6个字符，纯数字                                              |
| subUid      | true     | long   | 子用户UID                                            | NA     |                                                              |
| note        | ture     | string | API key备注                                          | NA     | 最多255位字符，字符类型不限                                  |
| permission  | true     | string | API key权限                                          | NA     | 取值范围：readOnly、trade，其中readOnly必传，trade选传，两个间用半角逗号分隔。 |
| ipAddresses | false    | string | API key绑定的IPv4/IPv6主机地址或IPv4网络地址         | NA     | 最多绑定20个，多个IP地址用半角逗号分隔，如：192.168.1.1,202.106.96.0/24。如果未绑定任何IP地址，API key有效期仅为90天。 |

> Response:

```json
{
    "code": 200,
    "data": {
        "accessKey": "2b55df29-vf25treb80-1535713d-8aea2",
        "secretKey": "c405c550-6fa0583b-fb4bc38e-d317e",
        "note": "62924133",
        "permission": "trade,readOnly",
        "ipAddresses": "192.168.0.1,192.168.1.1"
    }
}
```

### 响应数据
| 参数名称      | 是否必须 | 数据类型 | 描述                | 取值范围 |
| ------------- | -------- | -------- | ------------------- | -------- |
| code          | true     | int      | 状态码              |          |
| message       | false    | string   | 错误描述（如有）    |          |
| \<data\>          | true     | object   |                     |          |
| note        | true     | string   | API key备注         |          |
| accessKey     | true     | string   | access key          |          |
| secretKey     | true     | string   | secret key          |          |
| permission    | true     | string   | API key权限         |          |
| ipAddresses   | false    | string   | API key绑定的IP地址 |          |
| \</data\>          |      |    |                     |          |


## 修改子用户API key

此接口用于母用户修改子用户的API key

API Key 权限：交易

### HTTP 请求

- POST `/v2/sub-user/api-key-modification`

### 请求参数
| 参数名称    | 是否必须 | 类型   | 描述                      | 默认值 | 取值范围                                                     |
| ----------- | -------- | ------ | ------------------------- | ------ | ------------------------------------------------------------ |
| subUid      | true     | long   | 子用户的uid               | NA     |                                                              |
| accessKey   | true     | string | 子用户API key的access key | NA     |                                                              |
| note        | false    | string | API key备注               | NA     | 最多255位字符                                                |
| permission  | false    | string | API key权限               | NA     | 取值范围：readOnly、trade，其中readOnly必传，trade选传，两个间用半角逗号分隔。 |
| ipAddresses | false    | string | API key绑定的IP地址       | NA     | IPv4/IPv6主机地址或IPv4网络地址，最多绑定20个，多个IP地址用半角逗号分隔，如：192.168.1.1,202.106.96.0/24。如果未绑定任何IP地址，API key有效期仅为90天。 |

> Response:

```json
{
    "code": 200,
    "data": {
        "note": "tom",
        "permission": "trade,readOnly",
        "ipAddresses": "192.168.1.1"
    },
    "ok": true
}
```

### 响应数据
| 参数名称      | 是否必须 | 数据类型 | 描述                | 取值范围 |
| ------------- | -------- | -------- | ------------------- | -------- |
| code          | true     | int      | 状态码              |          |
| message       | false    | string   | 错误描述（如有）    |          |
| \<data\>      | true     | object   |                     |          |
| note          | false    | string   | API key备注         |          |
| permission    | false    | string   | API key权限         |          |
| ipAddresses   | false    | string   | API key绑定的IP地址 |          |
| \</data\>     |      |    |                     |          |


## 删除子用户API key

此接口用于母用户删除子用户的API key

API Key 权限：交易

### HTTP 请求

- POST `/v2/sub-user/api-key-deletion`

### 请求参数
| 参数名称  | 是否必须 | 类型   | 描述                      | 默认值 | 取值范围 |
| --------- | -------- | ------ | ------------------------- | ------ | -------- |
| subUid    | true     | long   | 子用户的uid               | NA     |          |
| accessKey | true     | string | 子用户API key的access key | NA     |          |

> Response:

```json
{
    "code": 200,
    "data": null
}
```

### 响应数据
| 参数名称 | 是否必须 | 数据类型 | 描述             | 取值范围 |
| -------- | -------- | -------- | ---------------- | -------- |
| code     | true     | int      | 状态码           |          |
| message  | false    | string   | 错误描述（如有） |          |


## 资产划转（母子用户之间）

API Key 权限：交易<br>
限频值（NEW）：2次/2s

母用户执行母子用户之间的划转

### HTTP 请求

- POST `/v1/subuser/transfer`

### 请求参数

| 参数            | 是否必填 | 数据类型 | 说明                                                         | 取值范围                                                     |      |
| --------------- | -------- | -------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ---- |
| sub-uid         | true     | long     | 子用户uid                                                    | -                                                            |      |
| currency        | true     | string   | 币种，即btc, ltc, bch, eth, etc ...(取值参考`GET /v1/common/currencys`) | -                                                            |      |
| amount          | true     | decimal  | 划转金额                                                     | -                                                            |      |
| client-order-id | false    | string   | 用户自编订单号（幂等使用，长度10个字符）                     |                                                              |      |
| type            | true     | string   | 划转类型                                                     | master-transfer-in（子用户划转给母用户虚拟币）/ master-transfer-out （母用户划转给子用户虚拟币）/master-point-transfer-in （子用户划转给母用户点卡）/master-point-transfer-out（母用户划转给子用户点卡） |      |

> Response:

```json
{
  "data":123456,
  "status":"ok"
}
```

### 响应数据

| 参数   | 是否必填 | 数据类型 | 说明       | 取值范围        |      |
| ------ | -------- | -------- | ---------- | --------------- | ---- |
| data   | true     | int      |  划转订单id | -               |      |
| status | true     | string   |  状态       | "ok" or "error" |      |

### 错误码

| error_code                                  | 说明                             | 类型   |      |
| ------------------------------------------- | -------------------------------- | ------ | ---- |
| account-transfer-balance-insufficient-error | 账户余额不足                     | string |      |
| base-operation-forbidden                    | 禁止操作（母子用户关系错误时报） | string |      |

## 子用户充币地址查询

此节点用于母用户查询子用户特定币种（IOTA除外）在其所在区块链中的充币地址，限母用户可用

API Key 权限：读取

### HTTP 请求

- GET  `/v2/sub-user/deposit-address`

### 请求参数

| 字段名称 | 是否必需 | 类型   | 描述      | 默认值 | 取值范围                                                     |
| -------- | -------- | ------ | --------- | ------ | ------------------------------------------------------------ |
| subUid   | true     | long   | 子用户UID | NA     | 限填1个                                                      |
| currency | true     | string | 币种      | NA     | btc, ltc, bch, eth, etc ...(取值参考`GET /v1/common/currencys`) |

> Response:

```json
{
    "code": 200,
    "data": [
        {
            "userId": 12345678,
            "currency": "btc",
            "address": "0x4efee1ca7fc887d921f4bbcc444fbc12c464d87f",
            "addressTag": "",
            "chain": "hbtc"
        },
        {
            "userId": 12345678,
            "currency": "btc",
            "address": "1C4o8WmACM8yHBbJjbdzLbc9ei7WFLFoMk",
            "addressTag": "",
            "chain": "btc"
        },
        {
            "userId": 12345678,
            "currency": "btc",
            "address": "0x4efee1ca7fc887d921f4bbcc444fbc12c464d87f",
            "addressTag": "",
            "chain": "hrc20btc"
        }
    ]
}
```

### 响应数据

| 字段名称   | 是否必需 | 数据类型 | 字段描述         | 取值范围 |
| ---------- | -------- | -------- | ---------------- | -------- |
| code       | true     | int      | 状态码           |          |
| message    | false    | string   | 错误描述（如有） |          |
| \<data\>   | true     | object   |                  |          |
| currency   | true     | string   | 币种             |          |
| address    | true     | string   | 充币地址         |          |
| addressTag | true     | string   | 充币地址标签     |          |
| chain      | true     | string   | 链名称           |          |
| \</data\>  |      |    |                  |          |


## 子用户充币记录查询

此节点用于母用户查询子用户充值记录，限母用户可用

API Key 权限：读取

### HTTP 请求

- GET `/v2/sub-user/query-deposit`

### 请求参数

| 参数名称  | 数据类型 | 是否必需 | 描述                                                  |
| --------- | -------- | -------- | ----------------------------------------------------- |
| subUid    | long     | TRUE     | 子用户UID，限填1个                                    |
| currency  | string   | FALSE    | 币种，缺省值所有币种                                  |
| startTime | long     | FALSE    | 远点时间，以createTime进行检索，取值范围及缺省值见注1 |
| endTime   | long     | FALSE    | 近点时间，以createTime进行检索，取值范围及缺省值见注2 |
| sort      | string   | FALSE    | 检索方向，asc 由远及近, desc 由近及远，缺省值desc     |
| limit     | int      | FALSE    | 单页最大返回条目数量 [1-500] （缺省值100）            |
| fromId    | long     | FALSE    | 起始充币订单ID，仅在下页查询时有效见注3               |

注1：<br>
startTime取值范围：[(endTime - 30天), endTime]<br>
startTime缺省值：(endTime - 30天)<br>

注2：<br>
endTime取值范围：不限<br>
endTime缺省值：当前时间<br>

注3：<br>
仅当用户请求查询的时间范围内的数据条目超出单页限制（由“limit“字段设定）时，服务器才返回”nextId“字段。用户收到服务器返回的”nextId“后 –<br>
1）须知晓后续仍有数据未能在本页返回；<br>
2）如需继续查询下页数据，应再次请求查询并将服务器返回的“nextId”作为“fromId“，其它请求参数不变。<br>
3）作为数据库记录ID，“nextId”和“fromId”除了用来翻页查询外，无其它业务含义。<br>


> Response:

```json
{
    "code": 200,
    "data": [
        {
            "id": 33419472,
            "currency": "ltc",
            "chain": "ltc",
            "amount": 0.001000000000000000,
            "address": "LUuuPs5C5Ph3cZz76ZLN1AMLSstqG5PbAz",
            "state": "safe",
            "txHash": "847601d249861da56022323514870ddb96456ec9579526233d53e690264605a7",
            "addressTag": "",
            "createTime": 1587033225787,
            "updateTime": 1587033716616
        }
    ]
}
```

### 响应数据

| 参数名称     | 是否必须 | 数据类型   | 描述                                                         | 取值范围     |
| ------------ | -------- | ---------- | ------------------------------------------------------------ | ------------ |
| code         | true     | int        | 状态码                                                       |              |
| message      | false    | string     | 错误描述（如有）                                             |              |
| \<data\>     | true     | object     |                                                              |              |
| id           | true     | long       | 充币订单id                                                   |              |
| currency     | true     | string     | 币种                                                         |              |
| txHash       | true     | string     | 交易哈希                                                     |              |
| chain        | true     | string     | 链名称                                                       |              |
| amount       | true     | bigdecimal | 个数                                                         |              |
| address      | true     | string     | 地址                                                         |              |
| addressTag   | true     | string     | 地址标签                                                     |              |
| state        | true     | string     | 状态                                                         | 状态参见下表 |
| createTime   | true     | long       | 发起时间                                                     |              |
| updateTime   | true     | long       | 最后更新时间                                                 |              |
| \</data\>    |      |      |                                                              |              |
| nextId       | false    | long       | 下页起始编号（充币订单ID，仅在查询结果需要分页返回时，包含此字段） |              |

- 虚拟币充值状态定义：

| 状态       | 描述     |
| ---------- | -------- |
| unknown    | 状态未知 |
| confirming | 确认中   |
| confirmed  | 已确认   |
| safe       | 已完成   |
| orphan     | 待确认   |

## 子用户余额（汇总）

API Key 权限：读取<br>
限频值（NEW）：2次/2s

母用户查询其下所有子用户的各币种汇总余额

### HTTP 请求

- GET `/v1/subuser/aggregate-balance`

### 请求参数

无

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "currency": "hbpoint",
            "balance": "10",
            "type": "point"
        },
        {
            "currency": "ada",
            "balance": "0",
            "type": "spot"
        },
        {
            "currency": "usdt",
            "balance": "8.08559165",
            "type": "spot"
        }
    ]
}
```

### 响应数据

| 参数   | 是否必填 | 数据类型 | 说明 | 取值范围        |
| ------ | -------- | -------- | ---- | --------------- |
| status   | true     |  string   | 状态 | "OK" or "Error" |
| \<data\> | true     | list     |      |             |
| currency | true       | string   | 币种                                 |                                                        |
| type     | true       | string   | 账户类型                             | spot：现货账户，point：点卡账户, margin:逐仓杠杆账户，super-margin：全仓杠杆账户 |
| balance  | true       | string   | 账户余额（可用余额和冻结余额的总和） |                                                        |
| \</data\> |      |      |      |             |      |


## 子用户余额

API Key 权限：读取<br>
限频值（NEW）：20次/2s

母用户查询子用户各币种账户余额

### HTTP 请求

- GET `/v1/account/accounts/{sub-uid}`

### 请求参数

| 参数    | 是否必填 | 数据类型 | 长度 | 说明         | 取值范围 |      |
| ------- | -------- | -------- | ---- | ------------ | -------- | ---- |
| sub-uid | true     | long     | -    | 子用户的 UID | -        |      |

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "id": 13704588,
            "type": "spot",
            "state": "working",
            "list": [
                {
                    "currency": "usdt",
                    "type": "trade",
                    "balance": "8.0855916572"
                }
            ],
            "symbol": ""
        },
        {
            "id": 24994285,
            "type": "point",
            "state": "working",
            "list": [
                {
                    "currency": "hbpoint",
                    "type": "trade",
                    "balance": "10"
                }
            ],
            "symbol": ""
        }
    ]
}
```

### 响应数据


| 参数 | 是否必填 | 数据类型 |  说明     | 取值范围                                                     |      |
| ---- | -------- | -------- | -------- | ------------------------------------------------------------ | ---- |
| status   | TRUE    | string     |  状态 | "OK" or "Error"      |      |
| \<data\>   | TRUE       | object     |    |                              |      |
| id   | TRUE       | long     | 账户ID   |                                                              |      |
| type | TRUE      | string   | 账户类型 | spot：现货账户，point：点卡账户, margin:逐仓杠杆账户，super-margin：全仓杠杆账户 |      |
| state | TRUE    | string   |          |                                                            |      |
| \<list\> | TRUE      | object   |         |                                                            |      |
| currency | TRUE       | string   | 币种     |                                  |      |
| type     | TRUE       | string   | 账户类型 | trade：交易账户，frozen：冻结账户 |      |
| balance  | TRUE        | decimal  | 账户余额 |                                  |      |
| \</list\> |          |    |          |                                                            |      |
| symbol   | TRUE       | string     |   |     |      |
| \</data\>   |       |      |    |                              |      |


## 常见错误码

以下是子用户相关接口返回的返回码、返回消息以及说明。

| 错误码 | 返回消息                                                  | 说明                               |
| ------ | --------------------------------------------------------- | ---------------------------------- |
| 1002   | "forbidden"                                               | 禁止操作，如该账户不允许创建子用户 |
| 1003   | "unauthorized”                                            | 未认证                             |
| 2002   | invalid field value                                       | 参数错误                           |
| 2014   | number of sub account in the request exceeded valid range | 子账户数量达到限制                 |
| 2014   | number of api key in the request exceeded valid range     | API Key数量超过限制                |
| 2016   | invalid request while value specified in sub user states  | 冻结/解冻失败    |

# 现货 / 杠杆交易

## 简介

现货/杠杆交易接口提供了下单、撤单、订单查询、成交明细查询、手续费率查询等功能。

<aside class="notice">访问交易相关的接口需要进行签名认证。</aside>

以下是订单业务相关的字段说明

**订单类型 (type)**：订单类型由方向和行为类型组合而成，[方向]-[行为类型]

方向：

- buy: 买
- sell: 卖

行为类型：

- market：市价单，该类型订单仅需指定下单金额或下单数量，不需要指定价格，订单在进入撮合时，会直接与对手方进行成交，直至金额或数量低于最小成交金额或成交数量为止。
- limit：限价单，该类型订单需指定下单价格，下单数量。
- limit-maker：只做maker单，即限价挂单，该订单在进入撮合时，只能作为maker进入市场深度，若订单会作为taker成交，则会被直接取消。
- ioc：立即成交或取消（immediately or cancel），该订单在进入撮合后，若不能直接成交，则会被直接取消（部分成交后，剩余部分也会被取消）。
- limit-fok： 立即完全成交否则完全取消（fill or kill），该订单在进入撮合后，若不能立即完全成交，则会被完全取消。
- market-grid：网格交易市价单（暂不支持API下单）。
- limit-grid：网格交易限价单（暂不支持API下单）。
- stop-limit：止盈止损单，设置高于或低于市场价格的订单，当订单到达触发价格后，才会正式的进入撮合队列。该类型已被策略委托订单代替，请使用策略委托订单。

**订单来源 (source)**：

- spot-api：现货API交易
- margin-api：逐仓杠杆API交易
- super-margin-api：全仓杠杆API交易
- c2c-margin-api：C2C杠杆API交易
- grid-trading-sys：网格交易（暂不支持API下单）

**订单状态 (state)**:

- created：已创建，该状态订单尚未进入撮合队列。
- submitted : 已挂单等待成交，该状态订单已进入撮合队列当中。
- partial-filled : 部分成交，该状态订单在撮合队列当中，订单的部分数量已经被市场成交，等待剩余部分成交。
- filled : 已成交。该状态订单不在撮合队列中，订单的全部数量已经被市场成交。
- partial-canceled : 部分成交撤销。该状态订单不在撮合队列中，此状态由partial-filled转化而来，订单数量有部分被成交，但是被撤销。
- canceling : 撤销中。该状态订单正在被撤销的过程中，因订单最终需在撮合队列中剔除才会被真正撤销，所以此状态为中间过渡态。
- canceled : 已撤销。该状态订单不在撮合订单中，此状态订单没有任何成交数量，且被成功撤销。

**相关ID**

- order-id : 订单的唯一编号

- client-order-id : 客户自定义ID，该ID在下单时传入，与下单成功后返回的order-id对应。

  client-order-id 时效：对于已完结状态订单，2小时内有效。（其他状态订单有效时间仍为8小时有效）即订单创建超过2h，将无法使用clientOrderId查询已完结状态订单，建议用户通过orderid进行查询。其中，已完结订单状态包括部分成交已撤销、已撤销和完全成交。

- 。 允许的字符包括字母(大小写敏感)、数字、下划线 (_)和横线(-)，最长64位

- match-id : 订单在撮合中的顺序编号

- trade-id : 成交的唯一编号

## 下单

API Key 权限：交易
限频值；100次/2s

发送一个新订单到火币以进行撮合。

### HTTP 请求

- POST `/v1/order/orders/place`

> Request:

```json
{
  "account-id": "100009",
  "amount": "10.1",
  "price": "100.1",
  "source": "api",
  "symbol": "ethusdt",
  "type": "buy-limit",
  "client-order-id": "a0001"
}
```

### 请求参数

| 参数名称        | 数据类型 | 是否必需 | 默认值   | 描述                                                         |
| --------------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| account-id      | string   | true     | NA       | 账户 ID，取值参考 `GET /v1/account/accounts`。现货交易使用 ‘spot’ 账户的 account-id；逐仓杠杆交易，请使用 ‘margin’ 账户的 account-id；全仓杠杆交易，请使用 ‘super-margin’ 账户的 account-id |
| symbol          | string   | true     | NA       | 交易对,即btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |
| type            | string   | true     | NA       | 订单类型，包括buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker（说明见下文）, buy-stop-limit, sell-stop-limit, buy-limit-fok, sell-limit-fok, buy-stop-limit-fok, sell-stop-limit-fok |
| amount          | string   | true     | NA       | 订单交易量（市价买单为订单交易额）                           |
| price           | string   | false    | NA       | 订单价格（对市价单无效）                                     |
| source          | string   | false    | spot-api | 现货交易填写“spot-api”，逐仓杠杆交易填写“margin-api”，全仓杠杆交易填写“super-margin-api”, C2C杠杆交易填写"c2c-margin-api" |
| client-order-id | string   | false    | NA       | 用户自编订单号（最大长度64个字符，须在8小时内保持唯一性）    |
| stop-price      | string   | false    | NA       | 止盈止损订单触发价格                                         |
| operator        | string   | false    | NA       | 止盈止损订单触发价运算符 gte – greater than and equal (>=), lte – less than and equal (<=) |


**buy-limit-maker**

当“下单价格”>=“市场最低卖出价”，订单提交后，系统将拒绝接受此订单；

当“下单价格”<“市场最低卖出价”，提交成功后，此订单将被系统接受。

**sell-limit-maker**

当“下单价格”<=“市场最高买入价”，订单提交后，系统将拒绝接受此订单；

当“下单价格”>“市场最高买入价”，提交成功后，此订单将被系统接受。

> Response:

```json
{
    "status": "ok",
    "data": "356501383558845"
}
```

### 响应数据

返回的主数据对象是一个对应下单单号的字符串。

如client order ID（在8小时内）被复用，节点将返回错误消息invalid.client.order.id。


## 批量下单

API Key 权限：交易<br>
限频值（NEW）：50次/2s<br>

一个批量最多10张订单

### HTTP 请求

- POST `/v1/order/batch-orders`

> Request:

```json
[
    {
        "account-id": "13496526",
        "symbol": "adausdt",
        "type": "buy-limit-maker",
        "amount": "5",
        "price": "1",
        "source": "spot-api",
        "client-order-id": "2345"
    },
    {
        "account-id": "13496526",
        "symbol": "adausdt",
        "type": "buy-limit-maker",
        "amount": "4",
        "price": "1",
        "source": "spot-api",
        "client-order-id": "23456"
    }
]
```

### 请求参数

| 参数名称        | 数据类型 | 是否必需 | 默认值   | 描述                                                         |
| --------------- | -------- | -------- | -------- | ------------------------------------------------------------ |
| [{ account-id   | string   | true     | NA       | 账户 ID，取值参考 `GET /v1/account/accounts`。现货交易使用 ‘spot’ 账户的 account-id；逐仓杠杆交易，请使用 ‘margin’ 账户的 account-id；全仓杠杆交易，请使用 ‘super-margin’ 账户的 account-id; C2C杠杆交易，请使用borrow账户的account-id |
| symbol          | string   | true     | NA       | 交易对,即btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |
| type            | string   | true     | NA       | 订单类型，包括buy-market, sell-market, buy-limit, sell-limit, buy-ioc, sell-ioc, buy-limit-maker, sell-limit-maker（说明见下文）, buy-stop-limit, sell-stop-limit, buy-limit-fok, sell-limit-fok, buy-stop-limit-fok, sell-stop-limit-fok |
| amount          | string   | true     | NA       | 订单交易量（市价买单为订单交易额）                           |
| price           | string   | false    | NA       | 订单价格（对市价单无效）                                     |
| source          | string   | false    | spot-api | 现货交易填写“spot-api”，逐仓杠杆交易填写“margin-api”，全仓杠杆交易填写“super-margin-api”, C2C杠杆交易填写"c2c-margin-api" |
| client-order-id | string   | false    | NA       | 用户自编订单号（最大长度64个字符，须在8小时内保持唯一性）    |
| stop-price      | string   | false    | NA       | 止盈止损订单触发价格                                         |
| operator }]     | string   | false    | NA       | 止盈止损订单触发价运算符 gte – greater than and equal (>=), lte – less than and equal (<=) |

**buy-limit-maker**

当“下单价格”>=“市场最低卖出价”，订单提交后，系统将拒绝接受此订单；

当“下单价格”<“市场最低卖出价”，提交成功后，此订单将被系统接受。

**sell-limit-maker**

当“下单价格”<=“市场最高买入价”，订单提交后，系统将拒绝接受此订单；

当“下单价格”>“市场最高买入价”，提交成功后，此订单将被系统接受。

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "order-id": 361560582529749,
            "client-order-id": "2345"
        },
        {
            "client-order-id": "23456",
            "err-code": "order-value-min-error",
            "err-msg": "Order total cannot be lower than: 5 USDT"
        }
    ]
}
```

### 响应数据

| 字段名称        | 数据类型 | 描述                                 |
| --------------- | -------- | ------------------------------------ |
| status          | string  | 状态                             |
| \<data\>        | object  |                              |
| order-id        | long    | 订单编号                             |
| client-order-id | string   | 用户自编订单号（如有）               |
| err-code        | string   | 订单被拒错误码（仅对被拒订单有效）   |
| err-msg         | string   | 订单被拒错误信息（仅对被拒订单有效） |
| \</data\>       |   |                              |

如client order ID（在8小时内）被复用，节点返回先前订单的order ID及client order ID。


## 撤销订单

API Key 权限：交易<br>
限频值（NEW）：100次/2s

此接口发送一个撤销订单的请求。

<aside class="warning">此接口只提交取消请求，实际取消结果需要通过订单状态，撮合状态等接口来确认。</aside>
### HTTP 请求

- POST `/v1/order/orders/{order-id}/submitcancel`


### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述               | 默认值 | 取值范围 |
| -------- | -------- | ------ | ------------------ | ------ | -------- |
| order-id | true     | string | 订单ID，填在path中 |        |          |
| symbol | false     | string | 交易对，填在URL请求参数中 |        |          |

> Success response:

```json
{
    "status": "ok",
    "data": "356501495694025"
}
```

### 响应数据

返回的主数据对象是一个对应下单单号的字符串。

### 错误码

> Failure response:

```json
{
    "status": "error",
    "err-code": "order-orderstate-error",
    "err-msg": "Incorrect order state",
    "data": null,
    "order-state": 7   // 当前订单状态
}
```

返回字段列表中，order-state的可能取值包括 -

| order-state | Description                                                  |
| ----------- | ------------------------------------------------------------ |
| -1          | order was already closed in the long past (order state = canceled, partial-canceled, filled, partial-filled) |
| 1           | created                                             |
| 3           | submitted                                             |
| 4           | partial-filled                                             |
| 5           | partial-canceled                                             |
| 6           | filled                                                       |
| 7           | canceled                                                     |
| 10          | cancelling                                                   |

## 撤销订单（基于client order ID）

API Key 权限：交易<br>
限频值（NEW）：100次/2s

此接口基于client-order-id（8小时内有效）发送一个撤销订单的请求。

<aside class="notice">撤单个订单建议通过接口/v1/order/orders/{order-id}/submitcancel，会更快更稳定</aside>
<aside class="warning">此接口只提交取消请求，实际取消结果需要通过订单状态，撮合状态等接口来确认。</aside>


### HTTP 请求

- POST `/v1/order/orders/submitCancelClientOrder`

> Request:

```json
{
  "client-order-id": "a0001"
}
```

### 请求参数

| 参数名称        | 是否必须 | 类型   | 描述                                                         | 默认值 | 取值范围 |
| --------------- | -------- | ------ | ------------------------------------------------------------ | ------ | -------- |
| client-order-id | true     | string | 用户自编订单号，必须8小时内已有该订单存在，否则下次下单时不允许用此值 |        |          |


> Response:

```json
{
    "status": "ok",
    "data": 10
}
```
### 响应数据

| 字段名称 | 数据类型 | 描述       |
| -------- | -------- | ---------- |
| data     | integer  | 撤单状态码 |

| Status Code | Description                                                  |
| ----------- | ------------------------------------------------------------ |
| -1          | order was already closed in the long past (order state = canceled, partial-canceled, filled, partial-filled) |
| 0           | client-order-id not found                                    |
| 1           | created                                             |
| 3           | submitted                                           |
| 4           | partial-filled                                      |
| 5           | partial-canceled                                             |
| 6           | filled                                                       |
| 7           | canceled                                                     |
| 10          | cancelling                                                   |



## 自动撤销订单

API Key 权限：交易<br>

为了防止API用户在发生网络故障或用户端系统故障与火币系统失去联系时，给用户造成意外损失，火币新增自动撤单接口，当用户与火币发生意外断连时，能自动帮用户取消全部委托单，以避免损失，即提供Dead man's switch功能。若开启，在设定的时间数完前，接口没有被再次调用，则用户所有现货委托单将被取消（最大支持撤500单）。

### HTTP 请求

- POST `/v2/algo-orders/cancel-all-after`

> Request:

```json
{
  "timeout": "10"
}
```

### 请求参数

| 参数名称        | 是否必须 | 类型   | 描述     | 默认值 | 取值范围 |
| --------------- | -------- | ------ | ----------- | ------ | -------- |
| timeout | true  | int | 超时时间（单位：秒），设置建议见附注 |  NA   |  0或者大于等于5秒  |


> 响应示例-开启成功 
Response:

```json
{
    "code": 200,
    "message": "success",
    "data": {
        "currentTime": 1630491627230,
        "triggerTime": 1630491637230
    }
}
```


> 响应示例-关闭成功 
Response:

```json
{
    "code": 200,
    "message": "success",
    "data": {
        "currentTime": 1630491780445,
        "triggerTime": 0
    }
}
```


> 响应示例-开启/关闭失败
Response:

```json
{
    "code": 2002,
    "message": "Invalid constraints error timeout",
    "data": null
}
```
### 响应数据

| **参数名称**  | **是否必须** | **数据类型** | **描述**         |
| ------------- | ------------ | ------------ | ---------------- |
| code          | true         | int          | 状态码           |
| message       | false        | string       | 错误描述（如有） |
| \<data\>      | true         | object       |                  |
| currentTime   | true         | long         | 当前时间         |
| triggerTime   | true         | long         | 触发时间         |
| \</data\>     |          |        |                  |


## 查询当前未成交订单

API Key 权限：读取<br>
限频值（NEW）：50次/2s

查询已提交但是仍未完全成交或未被撤销的订单。

### HTTP 请求

- GET `/v1/order/openOrders`

> Request:

```json
{
   "account-id": "100009",
   "symbol": "ethusdt",
   "side": "buy"
}
```

### 请求参数

| 参数名称   | 数据类型 | 是否必需                                         | 默认值 | 描述                                                         |
| ---------- | -------- | ------------------------------------------------ | ------ | ------------------------------------------------------------ |
| account-id | string   | false                                            | NA     | 账户 ID，取值参考 `GET /v1/account/accounts`。现货交易使用‘spot’账户的 account-id；逐仓杠杆交易，请使用 ‘margin’ 账户的 account-id；全仓杠杆交易，请使用 ‘super-margin’ 账户的 account-id；c2c杠杆交易，请使用borrow账户的account-id |
| symbol     | string   | false                                            | NA     | 交易对,即btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |
| side       | string   | false                                            | NA     | 指定只返回某一个方向的订单，可能的值有: buy, sell. 默认两个方向都返回。 |
| types      | string | false |        |查询的订单类型组合，使用逗号分割|
| from       | string   | false                                            |        | 查询起始 ID，如果是向后查询，则赋值为上一次查询结果中得到的最后一条id ；如果是向前查询，则赋值为上一次查询结果中得到的第一条id |
| direct     | string   | false (如字段'from'已设定，此字段'direct'为必填) |        | 查询方向，prev 向前；next 向后                               |
| size       | int      | false                                            | 100    | 返回订单的数量，最大值500。                                  |

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "symbol": "apnusdt",
            "source": "web",
            "price": "1.555550000000000000",
            "created-at": 1630633835224,
            "amount": "572.330000000000000000",
            "account-id": 13496526,
            "filled-cash-amount": "0.0",
            "client-order-id": "",
            "filled-amount": "0.0",
            "filled-fees": "0.0",
            "id": 357630527817871,
            "state": "submitted",
            "type": "sell-limit"
        }
    ]
}
```

### 响应数据

| 字段名称           | 数据类型 | 描述                                                   |
| ------------------ | -------- | ------------------------------------------------------ |
| status             | string  | 状态  |
| \<data\>           | object  |     |
| id                 | long     | 订单id，无大小顺序，可作为下一次翻页查询请求的from字段 |
| client-order-id    | string   | 用户自编订单号（所有open订单可返回client-order-id）    |
| symbol             | string   | 交易对, 例如btcusdt, ethbtc                            |
| price              | string   | limit order的交易价格                                  |
| created-at         | long     | 订单创建的调整为新加坡时间的时间戳，单位毫秒           |
| type               | string   | 订单类型                                               |
| filled-amount      | string   | 订单中已成交部分的数量                                 |
| filled-cash-amount | string   | 订单中已成交部分的总价格                               |
| filled-fees        | string   | 已交交易手续费总额（准确数值请参考matchresults接口）   |
| source             | string   | 订单来源                                               |
| state              | string   | 订单状态，包括created, submitted, partial-filled       |
| stop-price         | string   | 止盈止损订单触发价格                                   |
| operator           | string   | 止盈止损订单触发价运算符                               |
| \</data\>          |   |     |

## 批量撤销所有订单

API Key 权限：交易<br>
限频值（NEW）：50次/2s

此接口发送批量撤销所有（单次最大100个）订单的请求。

<aside class="warning">此接口只提交取消请求，实际取消结果需要通过订单状态，撮合状态等接口来确认。</aside>
### HTTP 请求

- POST `/v1/order/orders/batchCancelOpenOrders`


### 请求参数

| 参数名称   | 是否必须 | 类型   | 描述                                                         | 默认值 | 取值范围                                          |
| ---------- | -------- | ------ | ------------------------------------------------------------ | ------ | ------------------------------------------------- |
| account-id | false    | string | 账户ID，取值参考 `GET /v1/account/accounts`                  |        |                                                   |
| symbol     | false    | string | 交易代码列表（最多10 个symbols，多个交易代码间以逗号分隔），btcusdt, ethbtc...（取值参考`/v1/common/symbols`） | all    |                                                   |
| types      | false    | string | 订单类型组合，使用逗号分割                                   |        | 所有可能的订单类型（见本章节简介）                |
| side       | false    | string | 主动交易方向                                                 |        | “buy”或“sell”，缺省将返回所有符合条件尚未成交订单 |
| size       | false    | int    | 撤销订单的数量                                               | 100    | [0-100]                                           |


> Response:

```json
{
    "status":"ok",
    "data":{
        "success-count":2,
        "failed-count":0,
        "next-id":5454600
    }
}
```

### 响应数据


| 参数名称      | 是否必须 | 数据类型 | 描述                   |
| ------------- | -------- | -------- | ---------------------- |
| status        | true     | string      | 状态       |
| \<data\>      | true     | object      |        |
| success-count | true     | int      | 成功取消的订单数       |
| failed-count  | true     | int      | 取消失败的订单数       |
| next-id       | true     | long     | 下一个可以撤销的订单号，返回-1表示没有可以撤销的订单 |
| \</data\>     |      |       |        |


## 批量撤销指定订单

API Key 权限：交易<br>
限频值（NEW）：50次/2s

此接口同时为多个订单（基于id）发送取消请求，建议通过order-ids来撤单，比client-order-ids更快更稳定。

### HTTP 请求

- POST `/v1/order/orders/batchcancel`

> Request:

```json
{
    "client-order-ids": [
         "12345", "123456"
    ]
}
```

### 请求参数

| 参数名称         | 是否必须 | 类型     | 描述                                                         | 默认值 | 取值范围           |
| ---------------- | -------- | -------- | ------------------------------------------------------------ | ------ | ------------------ |
| order-ids        | false    | string[] | 订单编号列表（order-ids和client-order-ids必须且只能选一个填写，不超过50张订单），建议通过order-ids来撤单，比client-order-ids更快更稳定 |        | 单次不超过50个订单 |
| client-order-ids | false    | string[] | 用户自编订单号列表（order-ids和client-order-ids必须且只能选一个填写，不超过50张订单），必须已有该订单存在，否则下次下单时不允许用此值 |        | 单次不超过50个订单 |

> Response:

```json
{
    "status": "ok",
    "data": {
        "success": [
            "12345"
        ],
        "failed": [
            {
                "err-msg": "Incorrect order state",
                "order-state": 7,
                "order-id": "357631450723117",
                "err-code": "order-orderstate-error",
                "client-order-id": "123456"
            }
        ]
    }
}
```

### 响应数据

| 字段名称  | 数据类型 | 描述                                                         |
| --------- | -------- | ------------------------------------------------------------ |
| status          | string | 状态 |
| \<data\>        | object |  |
| success         | array  | 撤单成功订单列表（可为order-id列表或client-order-id列表，以用户请求为准） |
| \<failed\>      | object | 撤单失败订单列表（可为order-id列表或client-order-id列表，以用户请求为准） |
| order-id        | string   | 订单编号（如用户创建订单时包含order-id，返回中也须包含此字段） |
| client-order-id | string   | 用户自编订单号（如用户创建订单时包含client-order-id，返回中也须包含此字段） |
| err-code        | string   | 订单被拒错误码（仅对被拒订单有效）                           |
| err-msg         | string   | 订单被拒错误信息（仅对被拒订单有效）                         |
| order-state     | string   | 当前订单状态（若有） 
| \</failed\>     |  |  |
| \</data\>       |  |  |


返回字段列表中，order-state的可能取值包括 -

| order-state | Description                                                  |
| ----------- | ------------------------------------------------------------ |
| -1          | order was already closed in the long past (order state = canceled, partial-canceled, filled, partial-filled) |
| 1           | created                                             |
| 3           | submitted                                             |
| 4           | partial-filled                                      |
| 5           | partial-canceled                                             |
| 6           | filled                                                       |
| 7           | canceled                                                     |
| 10          | cancelling                                                   |


## 查询订单详情

API Key 权限：读取<br>
限频值（NEW）：50次/2s

此接口返回指定订单的最新状态和详情。通过API创建的订单，撤销超过2小时后无法查询。通过API创建的订单返回order-id，按此order-id查询订单还是返回base-record-invalid是因为系统内部处理有延迟，但是不影响成交。建议您后续重试查询或者通过订阅订单推送WebSocket消息查询。

### HTTP 请求

- GET `/v1/order/orders/{order-id}`


### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述               | 默认值 | 取值范围 |
| -------- | -------- | ------ | ------------------ | ------ | -------- |
| order-id | true     | string | 订单ID，填在path中 |        |          |


> Response:

```json
{
    "status": "ok",
    "data": {
        "id": 357632718898331,
        "symbol": "adausdt",
        "account-id": 13496526,
        "client-order-id": "23456",
        "amount": "5.000000000000000000",
        "price": "1.000000000000000000",
        "created-at": 1630649406687,
        "type": "buy-limit-maker",
        "field-amount": "0.0",
        "field-cash-amount": "0.0",
        "field-fees": "0.0",
        "finished-at": 0,
        "source": "spot-api",
        "state": "submitted",
        "canceled-at": 0
    }
}
```

### 响应数据

| 字段名称          | 是否必须 | 数据类型 | 描述                                                         | 取值范围                           |
| ----------------- | -------- | -------- | ------------------------------------------------------------ | ---------------------------------- |
| status            | true     | string     | 状态                                                      |                                    |
| \<data\>          | true     | object     |                                                          |                                    |
| account-id        | true     | long     | 账户 ID                                                      |                                    |
| amount            | true     | string   | 订单数量                                                     |                                    |
| canceled-at       | false    | long     | 订单撤销时间                                                 |                                    |
| created-at        | true     | long     | 订单创建时间                                                 |                                    |
| field-amount      | true     | string   | 已成交数量                                                   |                                    |
| field-cash-amount | true     | string   | 已成交总金额                                                 |                                    |
| field-fees        | true     | string   | 已成交手续费（准确数值请参考matchresults接口）               |                                    |
| finished-at       | false    | long     | 订单变为终结态的时间，不是成交时间，包含“已撤单”状态         |                                    |
| id                | true     | long     | 订单ID                                                       |                                    |
| client-order-id   | false    | string   | 用户自编订单号（所有open订单可返回client-order-id（如有）；仅7天内（基于订单创建时间）的closed订单（state <> canceled）可返回client-order-id（如有）；仅8小时内（基于订单创建时间）的closed订单（state = canceled）可返回client-order-id（如有）） |                                    |
| price             | true     | string   | 订单价格                                                     |                                    |
| source            | true     | string   | 订单来源                                                     | api                                |
| state             | true     | string   | 订单状态                                                     | 所有可能的订单状态（见本章节简介） |
| symbol            | true     | string   | 交易对                                                       | btcusdt, ethbtc, rcneth ...        |
| type              | true     | string   | 订单类型                                                     | 所有可能的订单类型（见本章节简介） |
| stop-price        | false    | string   | 止盈止损订单触发价格                                         |                                    |
| operator          | false    | string   | 止盈止损订单触发价运算符                                     | gte,lte                            |
| \</data\>         |      |      |                                                          |                                    |


## 查询订单详情（基于client order ID）

API Key 权限：读取<br>
限频值（NEW）：50次/2s

此接口返回指定用户自编订单号（8小时内）的订单最新状态和详情。通过API创建的订单，撤销超过2小时后无法查询。建议通过GET `/v1/order/orders/{order-id}`来撤单，比使用clientOrderId更快更稳定

### HTTP 请求

- GET `/v1/order/orders/getClientOrder`

### 请求参数

| 参数名称      | 是否必须 | 类型   | 描述           | 默认值 | 取值范围 |
| ------------- | -------- | ------ | -------------- | ------ | -------- |
| clientOrderId | true     | string | 用户自编订单号 |        |          |

> Response:

```json
{
    "status": "ok",
    "data": {
        "id": 357632718898331,
        "symbol": "adausdt",
        "account-id": 13496526,
        "client-order-id": "23456",
        "amount": "5.000000000000000000",
        "price": "1.000000000000000000",
        "created-at": 1630649406687,
        "type": "buy-limit-maker",
        "field-amount": "0.0",
        "field-cash-amount": "0.0",
        "field-fees": "0.0",
        "finished-at": 0,
        "source": "spot-api",
        "state": "submitted",
        "canceled-at": 0
    }
}
```

### 响应数据

| 字段名称          | 是否必须 | 数据类型 | 描述                                                         | 取值范围                           |
| ----------------- | -------- | -------- | ------------------------------------------------------------ | ---------------------------------- |
| status            | true     | string   | 状态                                                    |                                    |
| \<data\>          | true     | object   |                                                  |                                    |
| account-id        | true     | long     | 账户 ID                                                      |                                    |
| amount            | true     | string   | 订单数量                                                     |                                    |
| canceled-at       | false    | long     | 订单撤销时间                                                 |                                    |
| created-at        | true     | long     | 订单创建时间                                                 |                                    |
| field-amount      | true     | string   | 已成交数量                                                   |                                    |
| field-cash-amount | true     | string   | 已成交总金额                                                 |                                    |
| field-fees        | true     | string   | 已成交手续费（准确数值请参考matchresults接口）               |                                    |
| finished-at       | false    | long     | 订单变为终结态的时间，不是成交时间，包含“已撤单”状态         |                                    |
| id                | true     | long     | 订单ID                                                       |                                    |
| client-order-id   | false    | string   | 用户自编订单号（仅8小时内（基于订单创建时间）的订单可被查询，订单状态是终态的2小时内可查询） |                                    |
| price             | true     | string   | 订单价格                                                     |                                    |
| source            | true     | string   | 订单来源                                                     | api                                |
| state             | true     | string   | 订单状态                                                     | 所有可能的订单状态（见本章节简介） |
| symbol            | true     | string   | 交易对                                                       | btcusdt, ethbtc, rcneth ...        |
| type              | true     | string   | 订单类型                                                     | 所有可能的订单类型（见本章节简介） |
| stop-price        | false    | string   | 止盈止损订单触发价格                                         |                                    |
| operator          | false    | string   | 止盈止损订单触发价运算符                                     | gte,lte                            |
| \</data\>         |      |    |                                                       |                                    |


> 如client order ID不存在，返回如下错误信息 

```json
{
    "status": "error",
    "err-code": "base-record-invalid",
    "err-msg": "record invalid",
    "data": null
}
```

## 成交明细

API Key 权限：读取<br>
限频值（NEW）：50次/2s

此接口返回指定订单的成交明细。

### HTTP 请求

- GET `/v1/order/orders/{order-id}/matchresults`

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述               | 默认值 | 取值范围 |
| -------- | -------- | ------ | ------------------ | ------ | -------- |
| order-id | true     | string | 订单ID，填在path中 |        |          |


> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "symbol": "polyusdt",
            "fee-currency": "poly",
            "source": "spot-web",
            "order-id": 345487249132375,
            "price": "0.338",
            "created-at": 1629443051839,
            "role": "taker",
            "match-id": 5014,
            "filled-amount": "147.928994082840236",
            "filled-fees": "0",
            "filled-points": "0.1",
            "fee-deduct-currency": "hbpoint",
            "fee-deduct-state": "done",
            "trade-id": 1085,
            "id": 313288753120940,
            "type": "buy-market"
        }
    ]
}
```

### 响应数据

<aside class="notice">返回的主数据对象为一个对象数组，其中每一个元件代表一个交易结果。</aside>

| 字段名称            | 是否必须 | 数据类型 | 描述                                                         | 取值范围                                                     |
| ------------------- | -------- | -------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status              | true     | string     | 状态                     |                                                              |
| \<data\>             | true     | object     |                         |                                                              |
| created-at          | true     | long     | 该成交记录创建的时间戳（略晚于成交时间）                     |                                                              |
| filled-amount       | true     | string   | 成交数量                                                     |                                                              |
| filled-fees         | true     | string   | 交易手续费（正值）或交易返佣金（负值）                       |                                                              |
| fee-currency        | true     | string   | 交易手续费或交易返佣币种（买单的交易手续费币种为基础币种，卖单的交易手续费币种为计价币种；买单的交易返佣币种为计价币种，卖单的交易返佣币种为基础币种） |                                                              |
| id                  | true     | long     | 订单成交记录ID                                               |                                                              |
| match-id            | true     | long     | 撮合ID，订单在撮合中执行的顺序ID                             |                                                              |
| order-id            | true     | long     | 订单ID，成交所属订单的ID                                     |                                                              |
| trade-id            | false    | integer  | Unique trade ID (NEW)唯一成交编号，成交时产生的唯一编号ID    |                                                              |
| price               | true     | string   | 成交价格                                                     |                                                              |
| source              | true     | string   | 订单来源                                                     | api                                                          |
| symbol              | true     | string   | 交易对                                                       | btcusdt, ethbtc, rcneth ...                                  |
| type                | true     | string   | 订单类型                                                     | 所有可能的订单类型（见本章节简介） |
| role                | true     | string   | 成交角色                                                     | maker,taker                                                  |
| filled-points       | true     | string   | 抵扣数量（可为ht或hbpoint）                                  |                                                              |
| fee-deduct-currency | true     | string   | 抵扣类型                                                     | 如果为空，代表扣除的手续费是原币；如果为"ht"，代表抵扣手续费的是HT；如果为"hbpoint"，代表抵扣手续费的是点卡 |
| fee-deduct-state    | true     | string   | 抵扣状态                                                     | 抵扣中：ongoing，抵扣完成：done                              |
| \</data\>           |      |      |                         |                                                              |

注：<br>
- filled-fees中的交易返佣金额可能不会实时到账。<br>


## 搜索历史订单

API Key 权限：读取<br>
限频值（NEW）：50次/2s

此接口基于搜索条件查询历史订单。通过API创建的订单，撤销超过2小时后无法查询。

- 如用户start-time和end-time两个参数都没填写，服务器将返回由近到远[now, now-48小时]内的历史订单。
- 如用户填写start-time而没填写end-time参数，服务器将返回由近到远[start-time+48小时, start-time]内的历史订单。
- 如用户没有填写start-time而填写end-time参数，服务器将返回由近到远[end-time, end-time-48小时]内的历史订单。
- 如用户start-time和end-time两个参数都填写了，服务器将返回由近到远[end-time, start-time]内的历史订单。
- 每次查询范围最大为48小时, 可连续查询最近180天数据。

### HTTP 请求

- GET `/v1/order/orders`

> Request:

```json
  
{
   "account-id": "100009",
   "amount": "10.1",
   "price": "100.1",
   "source": "api",
   "symbol": "ethusdt",
   "type": "buy-limit"
}
```

### 请求参数

| 参数名称   | 是否必须 | 类型   | 描述            | 默认值                      | 取值范围                   |
| -------- | ------- | ----- | --------------- | -------------------------- | ------------------------ |
| symbol     | true     | string | 交易对       |                             | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`）       |
| types      | false    | string | 查询的订单类型组合，使用逗号分割               |                             | 所有可能的订单类型（见本章节简介）                           |
| start-time | false    | long   | 查询开始时间, 时间格式UTC time in millisecond。 以订单生成时间进行查询 | -48h 查询结束时间的前48小时 | 取值范围 [((end-time) – 48h), (end-time)] ，查询窗口最大为48小时，窗口平移范围为最近180天，已完全撤销的历史订单的查询窗口平移范围只有最近2小时(state="canceled") |
| end-time   | false    | long   | 查询结束时间, 时间格式UTC time in millisecond。 以订单生成时间进行查询 | present                     | 取值范围 [(present-179d), present] ，查询窗口最大为48小时，窗口平移范围为最近180天，已完全撤销的历史订单的查询窗口平移范围只有最近2小时(state="canceled") |
| states     | true     | string | 查询的订单状态组合，使用','分割        |                             | filled（已成交），partial-canceled（部分成交撤销），canceled（已撤销）                          |
| from       | false    | string | 查询起始 ID     |              | 如果是向后查询，则赋值为上一次查询结果中得到的最后一条id ；如果是向前查询，则赋值为上一次查询结果中得到的第一条id |
| direct     | false    | string | 查询方向          |                             | prev 向前；next 向后                                         |
| size       | false    | string | 查询记录大小                     | 100                         | [1-100]                                              |


> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "id": 345487249132375,
            "symbol": "polyusdt",
            "account-id": 13496526,
            "client-order-id": "",
            "amount": "50.000000000000000000",
            "price": "0.0",
            "created-at": 1629443051822,
            "type": "buy-market",
            "field-amount": "147.928994082840236000",
            "field-cash-amount": "49.999999999999999768",
            "field-fees": "0.295857988165680472",
            "finished-at": 1629443051838,
            "source": "spot-web",
            "state": "filled",
            "canceled-at": 0
        }
    ]
}
```

### 响应数据

| 参数名称          | 是否必须 | 数据类型 | 描述                                                         | 取值范围                                                     |
| ----------------- | -------- | -------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status            | true     | string   | 状态                                                      |                                                              |
| \<data\>          | true     | object   |                                                          |                                                              |
| account-id        | true     | long     | 账户 ID                                                      |                                                              |
| amount            | true     | string   | 订单数量                                                     |                                                              |
| canceled-at       | false    | long     | 接到撤单申请的时间                                           |                                                              |
| created-at        | true     | long     | 订单创建时间                                                 |                                                              |
| field-amount      | true     | string   | 已成交数量                                                   |                                                              |
| field-cash-amount | true     | string   | 已成交总金额                                                 |                                                              |
| field-fees        | true     | string   | 已成交手续费（准确数值请参考matchresults接口）                   |                                                              |
| finished-at       | false    | long     | 最后成交时间                                                 |                                                              |
| id                | true     | long     | 订单ID，无大小顺序，可作为下一次翻页查询请求的from字段       |                                                              |
| client-order-id   | false    | string   | 用户自编订单号（所有open订单可返回client-order-id（如有）；仅7天内（基于订单创建时间）的closed订单（state <> canceled）可返回client-order-id（如有）；仅8小时内（基于订单创建时间）的closed订单（state = canceled）可被查询） |                                                              |
| price   | true   | string   | 订单价格  |        |
| source  | true   | string   | 订单来源  | 所有可能的订单来源（见本章节简介） |
| state  | true   | string   | 订单状态  | filled（已成交），partial-canceled（部分成交撤销），canceled（已撤销）  |
| symbol  | true | string  | 交易对  | btcusdt, ethbtc, rcneth ...     |
| type   | true  | string  | 订单类型  | 所有可能的订单类型（见本章节简介） |
| stop-price  | false    | string   | 止盈止损订单触发价格  |   |
| operator  | false    | string   | 止盈止损订单触发价运算符  | gte,lte   |
| \</data\>          |      |    |                                                    |                                                              |


### start-date, end-date相关错误码

| 错误码             | 对应错误场景                                                 |
| ------------------ | ------------------------------------------------------------ |
| invalid_interval   | start date小于end date; 或者 start date 与end date之间的时间间隔大于2天 |
| invalid_start_date | start date是一个180天之前的日期；或者start date是一个未来的日期 |
| invalid_end_date   | end date 是一个180天之前的日期；或者end date是一个未来的日期 |

## 搜索最近48小时内历史订单

API Key 权限：读取<br>
限频值（NEW）：20次/2s

此接口基于搜索条件查询最近48小时内历史订单。通过API创建的订单，撤销超过2小时后无法查询。

### HTTP 请求

- GET `/v1/order/history`

> Request:

```json
{
   "symbol": "btcusdt",
   "start-time": "1556417645419",
   "end-time": "1556533539282",
   "direct": "prev",
   "size": "10"
}
```

### 请求参数

| 参数名称   | 是否必须 | 类型   | 描述                                                         | 默认值         | 取值范围                                               |
| ---------- | -------- | ------ | ------------------------------------------------------------ | -------------- | ------------------------------------------------------ |
| symbol     | false    | string | 交易对                                                       |             | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |
| start-time | false    | long   | 查询起始时间（含）   | 48小时前的时刻 | UTC time in millisecond     |
| end-time   | false    | long   | 查询结束时间（含）     | 查询时刻       | UTC time in millisecond      |
| direct     | false    | string | 订单查询方向（注：仅在检索出的总条目数量超出size字段限定时起作用；如果检索出的总条目数量在size 字段限定内，direct 字段不起作用。） | next           | prev 向前, next 向后                                   |
| size       | false    | int    | 每次返回条目数量                        | 100            | [10-1000],最低参数值为10                                              |

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "id": 357632718898331,
            "symbol": "adausdt",
            "account-id": 13496526,
            "client-order-id": "23456",
            "amount": "5.000000000000000000",
            "price": "1.000000000000000000",
            "created-at": 1630649406687,
            "type": "buy-limit-maker",
            "field-amount": "0.0",
            "field-cash-amount": "0.0",
            "field-fees": "0.0",
            "finished-at": 0,
            "source": "spot-api",
            "state": "submitted",
            "canceled-at": 0
        },
        {
            "id": 357632718898330,
            "symbol": "adausdt",
            "account-id": 13496526,
            "client-order-id": "2345",
            "amount": "5.000000000000000000",
            "price": "1.000000000000000000",
            "created-at": 1630649406687,
            "type": "buy-limit-maker",
            "field-amount": "0.0",
            "field-cash-amount": "0.0",
            "field-fees": "0.0",
            "finished-at": 0,
            "source": "spot-api",
            "state": "submitted",
            "canceled-at": 0
        }
    ]
}
```

### 响应数据

| 参数名称          | 是否必须 | 数据类型 | 描述                                                         | 取值范围                                                     |
| ----------------- | -------- | -------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status            | true     | string   | 状态                                                      |                                                              |
| \<data\>          | true     | object   |                                                          |                                                              |
| account-id        | true     | long     | 账户 ID                                                      |                                                              |
| amount            | true     | string   | 订单数量                                                     |                                                              |
| canceled-at       | false    | long     | 接到撤单申请的时间                                           |                                                              |
| created-at        | true     | long     | 订单创建时间                                                 |                                                              |
| field-amount      | true     | string   | 已成交数量                                                   |                                                              |
| field-cash-amount | true     | string   | 已成交总金额                                                 |                                                              |
| field-fees        | true     | string   | 已成交手续费（准确数值请参考matchresults接口） |                                                              |
| finished-at       | false    | long     | 最后成交时间                                                 |                                                              |
| id                | true     | long     | 订单ID，无大小顺序                                           |                                                              |
| client-order-id   | false    | string   | 用户自编订单号（仅48小时内（基于订单创建时间）的closed订单（state <> canceled）可返回client-order-id（如有）；仅8小时内（基于订单创建时间）的closed订单（state = canceled）可被查询） |                                                              |
| price             | true     | string   | 订单价格                                                     |                                                              |
| source            | true  | string  | 订单来源 | 所有可能的订单来源（见本章节简介）   |
| state             | true     | string   | 订单状态                                                     | partial-canceled 部分成交撤销, filled 完全成交, canceled 已撤销 |
| symbol            | true     | string   | 交易对                                                       | btcusdt, ethbtc, rcneth ...                                  |
| stop-price        | false    | string   | 止盈止损订单触发价格                                         |                                                              |
| operator          | false    | string   | 止盈止损订单触发价运算符                                     | gte,lte                                                      |
| type              | true  | string   | 订单类型   | 所有可能的订单类型（见本章节简介） |
| \</data\>         |      |    |                                                          |                                                              |
| next-time         | false    | long     | 下一查询起始时间（当请求字段”direct”为”prev”时有效）, 下一查询结束时间（当请求字段”direct”为”next”时有效）。注：仅在检索出的总条目数量超出size字段限定时，此返回字段存在。 | UTC time in millisecond                                      |


## 当前和历史成交

API Key 权限：读取<br>
限频值（NEW）：20次/2s

此接口基于搜索条件查询当前和历史成交记录。

### HTTP 请求

- GET `/v1/order/matchresults`


### 请求参数

| 参数名称   | 是否必须 | 类型   | 描述                    | 默认值                      | 取值范围                                                     |
| -------- | ------- | ----- | ----------------------- | -------------------------- | ------------------------------------------------------------ |
| symbol     | true     | string | 交易对               | N/A                         | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`）       |
| types      | false    | string | 查询的订单类型组合，使用','分割                       | all                         | 所有可能的订单类型（见本章节简介）                           |
| start-time | false    | long   | 查询开始时间, 时间格式UTC time in millisecond。 以订单成交时间进行查询 | -48h 查询结束时间的前48小时 | 取值范围 [((end-time) – 48h), (end-time)] ，查询窗口最大为48小时，窗口平移范围为最近120天。 |
| end-time   | false    | long   | 查询结束时间, 时间格式UTC time in millisecond。 以订单成交时间进行查询 | present                     | 取值范围 [(present-120d), present] ，查询窗口最大为48小时，窗口平移范围为最近120天。 |
| from       | false    | string | 查询起始 ID                                                  | N/A                         | 如果是向后查询，则赋值为上一次查询结果中得到的最后一条id（不是trade-id） ；如果是向前查询，则赋值为上一次查询结果中得到的第一条id（不是trade-id） |
| direct     | false    | string | 查询方向                                                     | next                        | prev 向前；next 向后                                         |
| size       | false    | string | 查询记录大小                                                 | 100                         | [1-500]                                  |

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "symbol": "polyusdt",
            "fee-currency": "poly",
            "source": "spot-web",
            "price": "0.338",
            "created-at": 1629443051839,
            "role": "taker",
            "order-id": 345487249132375,
            "match-id": 5014,
            "trade-id": 1085,
            "filled-amount": "147.928994082840236",
            "filled-fees": "0",
            "filled-points": "0.1",
            "fee-deduct-currency": "hbpoint",
            "fee-deduct-state": "done",
            "id": 313288753120940,
            "type": "buy-market"
        }
    ]
}
```

### 响应数据
<aside class="notice">返回的主数据对象为一个对象数组，其中每一个元件代表一个交易结果。</aside>

| 参数名称            | 是否必须 | 数据类型 | 描述                                                         | 取值范围                                                     |
| ------------------- | -------- | -------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status              | true     | string   | 状态                     |                                                              |
| \<data\>            | true     | object   |                         |                                                              |
| created-at          | true     | long     | 该成交记录创建的时间戳（略晚于成交时间）                     |                                                              |
| filled-amount       | true     | string   | 成交数量                                                     |                                                              |
| filled-fees         | true     | string   | 交易手续费（正值）或交易返佣（负值）                         |                                                              |
| fee-currency        | true     | string   | 交易手续费或交易返佣币种（买单的交易手续费币种为基础币种，卖单的交易手续费币种为计价币种；买单的交易返佣币种为计价币种，卖单的交易返佣币种为基础币种） |                                                              |
| id                  | true     | long     | 订单成交记录 ID，无大小顺序，可作为下一次翻页查询请求的from字段 |                                                              |
| match-id            | true     | long     | 撮合 ID                                                      |                                                              |
| order-id            | true     | long     | 订单 ID                                                      |                                                              |
| trade-id            | false    | integer  | 唯一成交编号                                                 |                                                              |
| price               | true     | string   | 成交价格                                                     |                                                              |
| source              | true     | string   | 订单来源                                                     | api                                                          |
| symbol              | true     | string   | 交易对                                                       | btcusdt, ethbtc, rcneth ...                                  |
| type                | true     | string   | 订单类型                                                     | 所有可能的订单类型（见本章节简介） |
| role                | true     | string   | 成交角色                                                     | maker,taker                                                  |
| filled-points       | true     | string   | 抵扣数量（可为ht或hbpoint）                                  |                                                              |
| fee-deduct-currency | true     | string   | 抵扣类型                                                     | ht,hbpoint                                                   |
| fee-deduct-state    | true     | string   | 抵扣状态                                                     | 抵扣中：ongoing，抵扣完成：done                              |
| \</data\>           |      |    |                         |                                                              |


注：<br>
- filled-fees中的交易返佣金额可能不会实时到账；<br>

### start-date, end-date相关错误码 

| 错误码             | 对应错误场景                                                 |
| ------------------ | ------------------------------------------------------------ |
| invalid_interval   | start date小于end date; 或者 start date 与end date之间的时间间隔大于2天 |
| invalid_start_date | start date是一个61天之前的日期；或者start date是一个未来的日期 |
| invalid_end_date   | end date 是一个61天之前的日期；或者end date是一个未来的日期  |


## 获取用户当前手续费率

Api用户查询交易对费率，一次限制最多查10个交易对，子用户的费率和母用户保持一致

API Key 权限：读取

### HTTP 请求

- GET `/v2/reference/transact-fee-rate`

### 请求参数

| 参数    | 数据类型 | 是否必须 | 默认值 | 描述                     | 取值范围                                                |
| ------- | -------- | -------- | ------ | ------------------------ | ------------------------------------------------------- |
| symbols | string   | true     | NA     | 交易对，可多填，逗号分隔 | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`）> |

> Response:

```json
{
    "code": 200,
    "data": [
        {
            "symbol": "btcusdt",
            "actualMakerRate": "0.002",
            "actualTakerRate": "0.002",
            "takerFeeRate": "0.002",
            "makerFeeRate": "0.002"
        },
        {
            "symbol": "apnusdt",
            "actualMakerRate": "0.002",
            "actualTakerRate": "0.002",
            "takerFeeRate": "0.002",
            "makerFeeRate": "0.002"
        },
        {
            "symbol": "htusdt",
            "actualMakerRate": "0.002",
            "actualTakerRate": "0.002",
            "takerFeeRate": "0.002",
            "makerFeeRate": "0.002"
        }
    ],
    "success": true
}
```
### 响应数据

| 字段名称          | 数据类型 | 描述                                                         |      |
| ----------------- | -------- | ------------------------------------------------------------ | ---- |
| code              | integer  | 状态码                                                       |      |
| message           | string   | 错误描述（如有）                                             |      |
| \<data\>          | object   |                                                              |      |
| symbol          | string   | 交易代码                                                     |      |
| makerFeeRate      | string   | 基础费率 - 被动方，如适用交易手续费返佣，返回返佣费率（负值） |      |
| takerFeeRate      | string   | 基础费率 - 主动方                                            |      |
| actualMakerRate   | string   | 抵扣后费率 - 被动方，如不适用抵扣或未启用抵扣，返回基础费率；如适用交易手续费返佣，返回返佣费率（负值） |      |
| actualTakerRate   | string   | 抵扣后费率 – 主动方，如不适用抵扣或未启用抵扣，返回基础费率  |      |
| \</data\>         |    |                                                              |      |


注：<br>
- 如makerFeeRate/actualMakerRate为正值，该字段意为交易手续费率；<br>
- 如makerFeeRate/actualMakerRate为负值，该字段意为交易返佣费率。<br>

## 常见错误码

以下是交易相关接口返回的返回码以及说明。

| 返回码                                                       | 说明                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| base-argument-unsupported                                    | 某参数不支持，请检查参数                                     |
| base-system-error                                            | 系统错误，如果是撤单：缓存中查不到订单状态，该订单无法撤单；如果是下单：订单入缓存失败，请再次尝试 |
| login-required                                               | url中没有Signature参数或找不到此用户（key与账户id不对应等情况） |
| parameter-required                                           | 止盈止损订单缺少参数 stop-price或operator                    |
| base-record-invalid                                          | 暂时未找到数据，请稍后重试                                   |
| order-amount-over-limit                                      | 订单数量超出限额                                             |
| base-symbol-trade-disabled                                   | 该交易对被禁止交易                                           |
| base-operation-forbidden                                     | 用户不在白名单内或该币种不允许OTC交易等禁止行为              |
| account-get-accounts-inexistent-error                        | 该账户在该用户下不存在                                       |
| account-account-id-inexistent                                | 该账户不存在                                                 |
| operation-forbidden-for-fl-account-state                     | 账户爆仓状态下禁止订单操作                                   |
| sub-user-auth-required                                       | 子用户未开通逐仓杠杆权限                                     |
| order-disabled                                               | 交易对暂停，无法下单                                         |
| cancel-disabled                                              | 交易对暂停，无法撤单                                         |
| order-invalid-price                                          | 下单价格非法（如市价单不能有价格，或限价单价格超过市场价10%） |
| order-accountbalance-error                                   | 账户余额不足                                                 |
| order-limitorder-price-min-error                             | 卖出价格不能低于指定价格（限价卖出不能低于市场价90%）                                     |
| order-limitorder-price-max-error                             | 买入价格不能高于指定价格（限价买入不能高于市场价110%）                                    |
| order-limitorder-amount-min-error                            | 下单数量不能低于指定数量                                     |
| order-limitorder-amount-max-error                            | 下单数量不能高于指定数量                                     |
| order-etp-nav-price-min-error                                | 下单价格不能低于净值的指定比率                               |
| order-etp-nav-price-max-error                                | 下单价格不能高于净值等指定比率                               |
| order-orderprice-precision-error                             | 交易价格精度错误                                             |
| order-orderamount-precision-error                            | 交易数额精度错误                                             |
| order-value-min-error                                        | 订单交易额不能低于指定额度                                   |
| order-marketorder-amount-min-error                           | 卖出数量不能低于指定数量                                     |
| order-marketorder-amount-buy-max-error                       | 市价单买入额度不能高于指定额度                               |
| order-marketorder-amount-sell-max-error                      | 市价单卖出数量不能高于指定数量                               |
| order-holding-limit-failed                                   | 下单超出该币种的持仓限额                                     |
| order-type-invalid                                           | 订单类型非法                                                 |
| order-orderstate-error                                       | 订单状态错误                                                 |
| order-date-limit-error                                       | 查询时间不能超过系统限制                                     |
| order-source-invalid                                         | 订单来源非法                                                 |
| order-update-error                                           | 更新数据错误                                                 |
| order-fl-cancellation-is-disallowed                          | 禁止撤销爆仓单                                               |
| operation-forbidden-for-fl-account-state                     | 账户爆仓状态下禁止订单操作                                   |
| operation-forbidden-for-lock-account-state                   | 账户lock状态下禁止订单操作或c2c借款账户被禁止下撤单          |
| fl-order-already-existed                                     | 爆仓单已经存在 而且未成交                                    |
| order-user-cancel-forbidden                                  | 订单类型为IOC或FOK 不允许撤单                                |
| account-state-invalid                                        | 不支持的爆仓账户状态                                         |
| order-price-greater-than-limit                               | 下单价格高于开盘前下单限制价格，请重新下单                   |
| order-price-less-than-limit                                  | 下单价格低于开盘前下单限制价格，请重新下单                   |
| order-stop-order-hit-trigger                                 | 止盈止损单下单被当前价触发                                   |
| market-orders-not-support-during-limit-price-trading         | 限时下单不支持市价单                                         |
| price-exceeds-the-protective-price-during-limit-price-trading | 限价时间内价格超出保护价                                     |
| invalid-client-order-id                                      | client order id 在最近的下单或撤单参数中已被使用             |
| invalid-interval                                             | 查询起止窗口设置错误                                         |
| invalid-start-date                                           | 查询起始日期含非法取值                                       |
| invalid-end-date                                             | 查询起始日期含非法取值                                       |
| invalid-start-time                                           | 查询起始时间含非法取值                                       |
| invalid-end-time                                             | 查询起始时间含非法取值                                       |
| validation-constraints-required                              | 指定的必填参数缺失                                           |
| symbol-not-support                                           | 交易对不支持，全仓杠杆或c2c                                  |
| not-found                                                    | 撤单时订单不存在                                             |
| base-not-found                                               | 未找到记录                                                   |
| base_record_invalid                                          | 订单不存在 （传错订单ID）                                    |
| dw_cancel_withdraw_failed                                    | 取消失败，订单状态错误                                       |
| base_update_error                                            | 内部系统错误                                                 |

## 常见问题

### Q1：client-order-id是什么？
A： client-order-id作为下单请求标识的一个参数，类型为字符串，长度为64。 此id为用户自己生成，8小时内有效。如果是终态订单仅2小时有效。

### Q2：如何获取下单数量、金额、小数限制、精度的信息？
A： 可使用 Rest API `GET /v1/common/symbols` 获取相关币对信息， 下单时注意最小下单数量和最小下单金额的区别。 

常见返回错误如下：  

- order-value-min-error: 下单金额小于最小交易额  
- order-orderprice-precision-error : 限价单价格精度错误  
- order-orderamount-precision-error : 下单数量精度错误  
- order-limitorder-price-max-error : 限价单价格高于限价阈值（限价买入不能高于市场价110%） 
- order-limitorder-price-min-error : 限价单价格低于限价阈值（限价卖出不能低于市场价90%）  
- order-limitorder-amount-max-error : 限价单数量高于限价阈值  
- order-limitorder-amount-min-error : 限价单数量低于限价阈值  

### Q3： 为什么收到订单成功成交的消息后再次进行下单，返回余额不足？
A：为保证订单的及时送达以及低延时， 订单推送的结果是在撮合后直接推送，此时订单可能并未完成资产的清算。  

建议使用以下方式保证资金可以正确下单：

1. 结合资产推送主题`accounts`同步接收资产变更的消息，确保资金已经完成清算。

2. 收到订单推送消息时，使用Rest接口调用账户余额，验证账户资金是否足够。

3. 账户中保留相对充足的资金余额。

### Q4: 成交明细里的filled-fees和filled-points有什么区别？
A: 成交中的成交手续费分为普通手续费以及抵扣手续费两种类型，两种类型不会同时存在。

1. 普通手续费表示，在成交时，未开启HT抵扣、点卡抵扣，使用原币进行手续费扣除。例如：在BTCUSDT币种对下购买BTC，filled-fees字段不为空，表示扣除了普通手续费，单位是BTC。

2. 抵扣手续费表示，在成交时，开启了HT抵扣或点卡抵扣，使用HT或点卡进行手续费的抵扣。例如BTCUSDT币种对下购买BTC，HT\点卡充足时，filled-fees为空，filled-points不为空，表示扣除了HT或点卡作为手续费，扣除单位需参考fee-deduct-currency字段

### Q5: 成交明细中match-id和trade-id有什么区别？
A: match-id表示订单在撮合中的顺序号，trade-id表示成交时的序号， 一个match-id可能有多个trade-id（成交时），也可能没有trade-id(创建订单、撤销订单)

### Q6: 为什么基于当前盘口买一或者卖一价格进行下单触发了下单限价错误？
A: 当前火币有基于最新成交价上下一定幅度的限价保护，对流动性不好的币，基于盘口数据下单可能会触发限价保护。建议基于ws推送的成交价+盘口数据信息进行下单

### Q7: 如何获取杠杆类交易的币种对？
A: 您可以根据` GET /v1/common/symbols`接口返回数据中的字段区分。leverage-ratio代表逐仓杠杆倍数。super-margin-leverage-ratio代表支持全仓杠杆倍数。如果值为0，表明不支持杠杆交易。

# 策略委托

## 简介

策略委托，目前仅包括计划委托及追踪委托。与现有止盈止损订单相比，计划委托/追踪委托有以下显著不同 –<br>特别说明，如遇行情或其他极端情况，策略委托单可能会延迟触发。

1）	计划委托/追踪委托被创建后，未触发前，交易所将不会冻结委托保证金。仅当计划委托成功触发后，交易所才会冻结该委托的保证金。<br>
2）	计划委托支持限价单和市价单类型，追踪委托仅支持市价单。<br>
3）	追踪委托是一种更高级的计划委托。通常的计划委托仅可设置触发价一个条件，当市场最新价格达到触发价时，该订单即被送入撮合。追踪委托在计划委托的基础上增加了一个设定条件，即回调幅度。当市场最新价达到设定的触发价时，该追踪委托并不会被送入撮合，而是继续等待市场价格回转出现。当市场价格回转幅度达到设定的回调幅度时，该追踪委托才会被送入撮合。火币Global支持用户设定的回调幅度范围为0.1%~5%。<br>

<aside class="notice">访问策略委托相关的接口需要进行签名认证。</aside>
<aside class="notice"> 在计划委托/追踪委托上线一段时间后，火币Global可能会下线现有止盈止损订单类型。届时将另行通知。 </aside>

## 策略委托下单

 - POST `/v2/algo-orders`

API Key 权限：交易<br>
限频值（NEW）：20次/2秒<br>
仅可通过此节点下单策略委托，不可通过现货/杠杆交易相关接口下单策略委托，支持未触发OPEN订单最大数量为100。<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	默认值|	描述	|	取值范围	|
|	-----	|	-----	|	------	|	----	|	------	|	----	|
|	accountId	|	integer	|	TRUE	|		|	账户编号	|当前仅支持spot账户ID、margin账户ID、super-margin账户ID，暂不支持c2c-margin账户ID		|
|	symbol	|	string	|	TRUE	|		|	交易代码	|		|
|	orderPrice	|	string	|	FALSE	|		|	订单价格（对市价单无效）	|		|
|	orderSide	|	string	|	TRUE	|		|	订单方向	|	buy,sell	|
|	orderSize	|	string	|	FALSE	|		|	订单数量（对市价买单无效）	|		|
|	orderValue	|	string	|	FALSE	|		|	订单金额（仅对市价买单有效）	|		|
|	timeInForce	|	string	|	FALSE	|	gtc for orderType=limit; ioc for orderType=market	|	订单有效期	|	gtc(对orderType=market无效),boc(对orderType=market无效),ioc,fok(对orderType=market无效)	|
|	orderType	|	string	|	TRUE	|		|	订单类型	|	limit,market	|
|	clientOrderId	|	string	|	TRUE	|		|	用户自编订单号（最长64位）	|		|
|	stopPrice	|	string	|	TRUE	|		|	触发价	|		|
|	trailingRate	|	string	|	FALSE	|		|	 回调幅度（仅对追踪委托有效）	|	[0.001-0.050]	|

注：<br>
•	orderPrice与stopPrice的偏离率不能超出交易所对该币对的价格限制（百分比），例如，当交易所限定，限价买单的订单价格不能高于市价的110%时，该限制比率也同样适用于orderPrice与stopPrice之比。<br>
•	用户须保证策略委托在触发时，其clientOrderId不与该用户的其它（8小时内）订单重复，否则，会导致触发失败。<br>
•	用户须保证相关账户（accountId）中存有足够资金作为委托保证金，否则将导致策略委托触发时校验失败。<br>
•	timeInForce字段中各枚举值含义：gtc - good till cancel (除非用户主动撤销否则一直有效)，boc - book or cancel（即post only，或称book only，除非成功挂单否则自动撤销），ioc - immediate or cancel（立即成交剩余部分自动撤销），fok - fill or kill（立即全部成交否则全部自动撤销）<br>

> Response

```json
{
    "code": 200,
    "data": {
        "clientOrderId": "a001"
    }
}
```

### 响应数据
| 名称	|	类型	|	是否必需	|	描述	|
| -----	|	-----	|	------	|	----	|
| code	    |	integer	|	TRUE	|状态码	|
| message	|	string	|	FALSE	|错误描述（如有）	|
| \<data\>  |	object	|	TRUE	|	|
| clientOrderId 	|	string	|	TRUE	|用户自编订单号	|
| \</data\> |		|		|	|


## 策略委托（触发前）撤单

- POST `/v2/algo-orders/cancellation`

API Key 权限：交易<br>
限频值（NEW）：20次/2秒<br>
单次请求最多批量撤销50张订单<br>
如需撤销已成功触发的订单，须通过现货/杠杆交易相关接口完成<br>
如需撤销未触发的订单，仅可通过此节点撤销，不可通过现货/杠杆交易相关接口撤销<br>

> Request

```json
{
    "clientOrderIds": [
        "zy0002","zy0003"
    ]
}
```

### 请求参数
|	名称	|	类型	|	是否必需	|	默认值|	描述	|	取值范围	|
|	-----	|	-----	|	------	|	----	|	------	|	----	|
|	clientOrderIds	|	string[]	|	TRUE	|		|	用户自编订单号（可多填，以数组的形式传输）	|		|

> Response

```json
{
    "code": 200,
    "data": {
        "accepted": [
            "zy0002",
            "zy0003"
        ],
        "rejected": []
    }
}
```

### 响应数据
|	名称	    |	类型	|	是否必需	|	描述	|
|	-----	    |	-----	|	------	|	----	|
|	code	    |	integer	|	TRUE	| 状态码	|
|	message	    |	string	|	FALSE	| 错误描述（如有）	|
|	\<data\>	|	object	|	TRUE	| 按用户请求顺序排列	|
|   accepted	|	string[]	|	TRUE	|已接受订单clientOrderId列表	|
|	rejected  	|	string[]	|	TRUE	|已拒绝订单clientOrderId列表	|
|	\</data\>	|		|		| 	


## 查询未触发OPEN策略委托

 - GET `/v2/algo-orders/opening`

API Key 权限：读取<br>
限频值（NEW）：20次/2秒<br>
以orderOrigTime检索<br>
未触发OPEN订单，指的是已成功下单，但尚未触发，订单状态orderStatus为created的订单<br>
未触发OPEN订单，可通过此节点查询，但不可通过现货/杠杆交易相关接口查询<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	默认值|	描述	|	取值范围	|
|	-----	|	-----	|	------	|	----	|	------	|	----	|
|	accountId	|	integer	|	FALSE	|	all	|	账户编号	|		|
|	symbol	|	string	|	FALSE	|	all	|	交易代码	|		|
|	orderSide	|	string	|	FALSE	|	all	|	订单方向	|	buy,sell	|
|	orderType	|	string	|	FALSE	|	all	|	订单类型	|	limit,market	|
|	sort	|	string	|	FALSE	|	desc	|	检索方向	| asc - 由远及近, desc - 由近及远		|
|	limit	|	integer	|	FALSE	|	100	|	单页最大返回条目数量	|[1-500]		|
|	fromId	|	long	|	FALSE	|		|	起始编号（仅在下页查询时有效）	|		|

> Response

```json
{
    "code": 200,
    "data": [
        {
            "lastActTime": 1630657250326,
            "orderOrigTime": 1630657250238,
            "symbol": "adausdt",
            "source": "api",
            "clientOrderId": "123",
            "orderSide": "buy",
            "orderType": "limit",
            "orderPrice": "0.1",
            "orderSize": "100",
            "accountId": 13496526,
            "timeInForce": "gtc",
            "stopPrice": "0.1",
            "orderStatus": "created"
        },
        {
            "lastActTime": 1630657243576,
            "orderOrigTime": 1630657243534,
            "symbol": "adausdt",
            "source": "api",
            "clientOrderId": "12",
            "orderSide": "buy",
            "orderType": "limit",
            "orderPrice": "0.1",
            "orderSize": "100",
            "accountId": 13496526,
            "timeInForce": "gtc",
            "stopPrice": "0.1",
            "orderStatus": "created"
        }
    ]
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	\<data\>	|	object	|	TRUE	|按用户请求参数sort指定顺序排列	|
|	accountId	|	integer	|	TRUE	|账户编号	|
|	source	|	string	|	TRUE	|订单来源（api,web,ios,android,mac,windows,sys）	|
|	clientOrderId	|	string	|	TRUE	|用户自编订单号	|
|	symbol	|	string	|	TRUE	|交易代码	|
|	orderPrice	|	string	|	TRUE	| 订单价格（对市价单无效）	|
|	orderSize	|	string	|	FALSE	| 订单数量（对市价买单无效）	|
|	orderValue	|	string	|	FALSE	| 订单金额（仅对市价买单有效）	|
|	orderSide	|	string	|	TRUE	| 订单方向	|
|	timeInForce	|	string	|	TRUE	| 订单有效期 |
|	orderType	|	string	|	TRUE	| 订单类型	|
|	stopPrice	|	string	|	TRUE	| 触发价	|
|	trailingRate	|	string	|	FALSE	|	回调幅度（仅对追踪委托有效）	|
|	orderOrigTime	|	long	|	TRUE	| 订单创建时间	|
|	lastActTime	|	long	|	TRUE	| 订单最近更新时间	|
|	orderStatus }	|	string	|	TRUE	| 订单状态（created）	|
|	\</data\>	|		|		|  	|
|	nextId	|	long	|	FALSE	| 下页起始编号（仅在查询结果需要分页返回时传此字段）	|


## 查询策略委托历史

 - GET `/v2/algo-orders/history`

API Key 权限：读取<br>
限频值（NEW）：20次/2秒<br>
以orderOrigTime检索<br>
历史终态订单包括，触发前被主动撤销的策略委托（orderStatus=canceled），触发失败的策略委托（orderStatus=rejected），触发成功的策略委托（orderStatus=triggered）。<br>
如需查询已成功触发订单的后续状态，须通过现货/杠杆交易相关接口完成<br>
触发前被主动撤销的策略委托及触发失败的策略委托，可通过此节点查询，但不可通过现货/杠杆交易相关接口查询<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	默认值|	描述	|	取值范围	|
|	-----	|	-----	|	------	|	----	|	------	|	----	|
|	accountId	|	integer	|	FALSE	|	all	|	账户编号	|		|
|	symbol	|	string	|	TRUE	|		|	交易代码	|		|
|	orderSide	|	string	|	FALSE	|	all	|	订单方向	|	buy,sell	|
|	orderType	|	string	|	FALSE	|	all	|	订单类型	|	limit,market	|
|	orderStatus	|	string	|	TRUE	|		|	订单状态	|	canceled,rejected,triggered	|
|	startTime	|	long	|	FALSE	|		|	远点时间	||
|	endTime	|	long	|	FALSE	|当前时间		|	近点时间 | |
|	sort	|	string	|	FALSE	|	desc	|	检索方向	|asc - 由远及近, desc - 由近及远		|
|	limit	|	integer	|	FALSE	|	100	|	单页最大返回条目数量	|[1-500]		|
|	fromId	|	long	|	FALSE	|		|	起始编号（仅在下页查询时有效）	|		|

> Response

```json
{
    "code": 200,
    "data": [
        {
            "orderOrigTime": 1630656758442,
            "lastActTime": 1630656880512,
            "symbol": "adausdt",
            "source": "api",
            "clientOrderId": "1234567",
            "orderSide": "buy",
            "orderType": "limit",
            "orderPrice": "0.1",
            "orderSize": "100",
            "accountId": 13496526,
            "timeInForce": "gtc",
            "stopPrice": "0.1",
            "orderStatus": "canceled"
        }
    ],
    "nextId": 9585084
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	| 状态码	|
|	message	|	string	|	FALSE	| 错误描述（如有）	|
|	\<data\>	|	object	|	TRUE	| 按用户请求参数sort指定顺序排列	|
|	accountId	|	integer	|	TRUE	| 账户编号	|
|	source	|	string	|	TRUE	| 订单来源	|
|	clientOrderId	|	string	|	TRUE	| 用户自编订单号	|
|	orderId	|	string	|	FALSE	| 订单编号（仅对orderStatus=triggered有效）	|
|	symbol	|	string	|	TRUE	| 交易代码	|
|	orderPrice	|	string	|	TRUE	| 订单价格（对市价单无效）	|
|	orderSize	|	string	|	FALSE	| 订单数量（对市价买单无效）	|
|	orderValue	|	string	|	FALSE	| 订单金额（仅对市价买单有效）	|
|	orderSide	|	string	|	TRUE	| 订单方向	|
|	timeInForce	|	string	|	TRUE	| 订单有效期|
|	orderType	|	string	|	TRUE	| 订单类型	|
|	stopPrice	|	string	|	TRUE	| 触发价	|
|	trailingRate	|	string	|	FALSE	|	回调幅度（仅对追踪委托有效）	|
|	orderOrigTime	|	long	|	TRUE	|订单创建时间	|
|	lastActTime	|	long	|	TRUE	|订单最近更新时间	|
|	orderCreateTime	|	long	|	FALSE	|订单触发时间（仅对orderStatus=triggered有效）	|
|	orderStatus	|	string	|	TRUE	|订单状态（triggered,canceled,rejected）	|
|	errCode	|	integer	|	FALSE	|订单被拒状态码（仅对orderStatus=rejected有效）	|
|	errMessage 	|	string	|	FALSE	|订单被拒错误消息（仅对orderStatus=rejected有效）	|
|	\</data\>	|		|		|     |
|	nextId	|	long	|	FALSE	|下页起始编号（仅在查询结果需要分页返回时传此字段）	|


## 查询特定策略委托

 - GET `/v2/algo-orders/specific`

API Key 权限：读取<br>
限频值（NEW）：20次/2秒<br>
以orderOrigTime检索<br>
如需查询已成功触发订单的后续状态，须通过现货/杠杆交易相关接口完成<br>
未触发的策略委托及触发失败的策略委托，可通过此节点查询，但不可通过现货/杠杆交易相关接口查询<br>

### 请求参数
|	名称	|	类型	|	是否必需	|	默认值|	描述	|	取值范围	|
|	-----	|	-----	|	------	|	----	|	------	|	----	|
|	clientOrderId	|	string	|	TRUE	|		| 用户自编订单号|		|

> Response

```json
{
    "code": 200,
    "data": {
        "lastActTime": 1630656880512,
        "orderOrigTime": 1630656758442,
        "symbol": "adausdt",
        "source": "api",
        "orderStatus": "canceled",
        "clientOrderId": "1234567",
        "orderSide": "buy",
        "orderType": "limit",
        "orderPrice": "0.1",
        "orderSize": "100",
        "accountId": 13496526,
        "timeInForce": "gtc",
        "stopPrice": "0.1"
    }
}
```

### 响应数据
|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	-----	|	------	|	----	|
|	code	|	integer	|	TRUE	| 状态码	|
|	message	|	string	|	FALSE	| 错误描述（如有）	|
|	\<data\>	|	object	|	TRUE	|	|
|	accountId	|	integer	|	TRUE	| 账户编号	|
|	source	|	string	|	TRUE	| 订单来源	|
|	clientOrderId	|	string	|	TRUE	| 用户自编订单号	|
|	orderId	|	string	|	FALSE	| 订单编号（仅对orderStatus=triggered有效）	|
|	symbol	|	string	|	TRUE	| 交易代码	|
|	orderPrice	|	string	|	TRUE	| 订单价格（对市价单无效）	|
|	orderSize	|	string	|	FALSE	| 订单数量（对市价买单无效）	|
|	orderValue	|	string	|	FALSE	| 订单金额（仅对市价买单有效）	|
|	orderSide	|	string	|	TRUE	| 订单方向	|
|	timeInForce	|	string	|	TRUE	| 订单有效期 |
|	orderType	|	string	|	TRUE	| 订单类型	|
|	stopPrice	|	string	|	TRUE	| 触发价	|
|	trailingRate	|	string	|	FALSE	|	回调幅度（仅对追踪委托有效）	|
|	orderOrigTime	|	long	|	TRUE	| 订单创建时间	|
|	lastActTime	|	long	|	TRUE	| 订单最近更新时间	|
|	orderCreateTime	|	long	|	FALSE	| 订单触发时间（仅对orderStatus=triggered有效）	|
|	orderStatus	|	string	|	TRUE	| 订单状态（created,triggered,canceled,rejected）	|
|	errCode	|	integer	|	FALSE	| 订单被拒状态码（仅对orderStatus=rejected有效）	|
|	errMessage 	|	string	|	FALSE	| 订单被拒错误消息（仅对orderStatus=rejected有效）	|
|	\</data\>	|		|		|	|


## 常见错误码

以下是策略委托接口返回的错误码和说明。

| 错误码 | 说明                       |
| ------ | -------------------------- |
| 2002   | 参数无效                   |
| 1001   | 无效的url                  |
| 1002   | 请重新登录后重试           |
| 1003   | API签名无效                |
| 1005   | 访问权重不足               |
| 1006   | 超出访问限制               |
| 1007   | 未查询到记录               |
| 2003   | 交易功能暂停               |
| 3002   | 订单数量精度错误           |
| 3003   | 触发价格精度错误           |
| 3004   | 低于限价单最小订单数量限制 |
| 3005   | 超出限价单最大订单数量限制 |
| 3006   | 超出限价单最高订单价格限制 |
| 3007   | 低于限价单最低订单价格限制 |
| 3008   | 低于最小订单金额限制       |
| 3009   | 低于市价单最小订单数量限制 |
| 3010   | 超出市价单最大订单数量限制 |
| 3100   | 限价交易期间不接受市价申报 |


# 借币（逐仓/全仓杠杆）

## 简介

逐仓杠杆/全仓杠杆接口提供了账户借币、还币、查询、划转等功能

<aside class="notice">访问借币相关的接口需要进行签名认证。</aside>
<aside class="notice">目前逐仓杠杆交易仅支持部分以 USDT，HSUD， 和 BTC 为报价币种的交易对。</aside>


## 归还借币（全仓逐仓通用）

API Key 权限：交易

限频值：2次/秒

子用户可以调用

还币顺序为，（如不指定transactId）先借先还，利息先还；如指定transactId时，currency参数不做校验。

### HTTP 请求

- POST `/v2/account/repayment`

> Request:

```json
{
    "accountid": "1266826",
    "currency": "btc",
    "amount": "0.00800334",
    "transactId": "437"
}
```

### 请求参数

| **名称**   | **类型** | **是否必需** | **描述**       |
| ---------- | -------- | ------------ | -------------- |
| accountId  | string   | TRUE         | 还币账户ID     |
| currency   | string   | TRUE         | 还币币种       |
| amount     | string   | TRUE         | 还币金额       |
| transactId | string   | FALSE        | 原始借币交易ID |

> Response:

```json
{
    "code":200,
    "Data":[
        {
            "repayId":1174424,
            "repayTime":1600747722018
        }
    ]
}
```

### 响应数据

| **名称**     | **类型** | **是否必需** | **描述**                                 |
| ------------ | -------- | ------------ | ---------------------------------------- |
| code         | integer  | TRUE         | 状态码                                   |
| message      | string   | FALSE        | 错误描述（如有）                         |
| \<data\>     | array    | TRUE         |                                          |
| repayId      | string   | TRUE         | 还币交易ID                               |
| repayTime    | long     | TRUE         | 还币交易时间（unix time in millisecond） |
| \</data\>     |     |          |                                          |


### 注：
返回relayId不意味着该还币100%成功，用户须在还币后通过查询还币交易记录确认该还币状态。


## 资产划转（逐仓）

API Key 权限：交易<br>
限频值（NEW）：2次/2s

此接口用于现货账户与逐仓杠杆账户的资产互转。

从现货账户划转至逐仓杠杆账户 `transfer-in`，从逐仓杠杆账户划转至现货账户 `transfer-out`

### HTTP 请求

- POST `/v1/dw/transfer-in/margin`

- POST `/v1/dw/transfer-out/margin`

> Request:

```json
{
  "symbol": "ethusdt",
  "currency": "eth",
  "amount": "1.0"
}
```


### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述                         |
| -------- | -------- | -------- | ------ | ---------------------------- |
| symbol   | string   | true     | NA     | 交易对, e.g. btcusdt, ethbtc |
| currency | string   | true     | NA     | 币种                         |
| amount   | string   | true     | NA     | 划转数量                     |


> Response:

```json
{
    "status": "ok",
    "data": 46971504,
    "code": 200
}
```

### 响应数据


| 参数名称 | 数据类型 | 描述        |
| -------- | -------- | ----------- |
| data     | integer  | Transfer id |
| status   | string   | 状态         |
| code     | integer  | 状态码       |


## 查询借币币息率及额度（逐仓）

API Key 权限：读取<br>
限频值（NEW）：20次/2s

此接口返回用户级别的借币币息率及借币额度。

### HTTP 请求

- GET `/v1/margin/loan-info`

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述                          |
| -------- | -------- | -------- | ------ | ----------------------------- |
| symbols  | string   | false    | all    | 交易代码 (可多选，以逗号分隔) |

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "symbol": "btcusdt",
            "currencies": [
                {
                    "currency": "btc",
                    "interest-rate": "0.00098",
                    "min-loan-amt": "0.020000000000000000",
                    "max-loan-amt": "550.000000000000000000",
                    "loanable-amt": "0.045696000000000000",
                    "actual-rate": "0.00098"
                },
                {
                    "currency": "usdt",
                    "interest-rate": "0.00098",
                    "min-loan-amt": "100.000000000000000000",
                    "max-loan-amt": "4000000.000000000000000000",
                    "loanable-amt": "400.000000000000000000",
                    "actual-rate": "0.00098"
                }
            ]
        }
    ]
}
```

### 响应数据

| 参数名称       | 数据类型 | 描述                                                         |
| -------------- | -------- | ------------------------------------------------------------ |
| status       | string   | 状态                                                     |
| \<data\>       | object   |                                                      |
| symbol         | string   | 交易代码                                                     |
| \<currencies\> | object   |                                                              |
| currency       | string   | 币种                                                         |
| interest-rate  | string   | 基础日币息率                                                 |
| min-loan-amt   | string   | 最小允许借币金额                                             |
| max-loan-amt   | string   | 最大允许借币金额                                             |
| loanable-amt   | string   | 最大可借金额                                                 |
| actual-rate    | string   | 抵扣后的实际借币币息率，如不适用抵扣或未启用抵扣，返回基础日币息率 |
| \</currencies\> |    |                                                              |
| \</data\>       |    |                                                      |


## 申请借币（逐仓）

API Key 权限：交易<br>
限频值（NEW）：2次/2s

此接口用于申请借币.

### HTTP 请求

- POST `/v1/margin/orders`

> Request:

```json
{
  "symbol": "ethusdt",
  "currency": "eth",
  "amount": "1.0"
}
```

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述                      |
| -------- | -------- | -------- | ------ | ------------------------- |
| symbol   | string   | true     | NA     | 交易对                    |
| currency | string   | true     | NA     | 币种                      |
| amount   | string   | true     | NA     | 借币数量（精度：3位小数） |

> Response:

```json
{
  "status": "ok",
  "data": 1000
}
```

### 响应数据

| 字段名称 | 数据类型 | 描述   |
| -------- | -------- | ------ |
| status   | string   | 状态   |
| data     | integer  | 订单id |

## 归还借币（逐仓）

API Key 权限：交易<br>
限频值（NEW）：2次/2s

此接口用于归还借币.

### HTTP 请求

- POST `/v1/margin/orders/{order-id}/repay`

> Request:

```json
{
  "amount": "1.0"
}
```

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 描述                          |
| -------- | -------- | -------- | ----------------------------- |
| order-id | string   | true     | 借币订单 ID，写在 url path 中 |
| amount   | string   | true     | 归还币种数量                  |

> Response:

```json
{  
  "data": 1000
}
```

### 响应数据


| 参数名称 | 数据类型 | 描述            |
| -------- | -------- | --------------- |
| data     | integer  | Margin order id |


## 查询借币订单（逐仓）

API Key 权限：读取<br>
限频值（NEW）：100次/2s

此接口基于指定搜索条件返回借币订单。

### HTTP 请求

- GET `/v1/margin/loan-orders`

### 请求参数

| 参数名称   | 是否必须 | 类型   | 描述                     | 默认值                           | 取值范围                                                     |
| ---------- | -------- | ------ | ---------------------| -------------------------------- | ------------------------------------------------------------ |
| symbol     | true     | string | 交易对                                               |                                  | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`）       |
| start-date | false    | string | 查询开始日期, 日期格式yyyy-mm-dd                     |                                  |                                                              |
| end-date   | false    | string | 查询结束日期, 日期格式yyyy-mm-dd                     |                                  |                                                              |
| states     | false    | string | 状态列表，可以支持多个状态，用逗号分隔               |                                  | created 未放款，accrual 已放款，cleared 已还清，invalid 异常 |
| from       | false    | string | 查询起始 ID                                          |                                  |                                                              |
| direct     | false    | string | 查询方向                                             |                                  | prev 向前，时间（或 ID）正序；next 向后，时间（或 ID）倒序） |
| size       | false    | string | 查询记录大小                                         | 100                              | [1, 100]                                                     |
| sub-uid    | false    | int    | 子用户编号（母用户查询子用户借币订单时，此字段必填） | 如不填，缺省查询当前用户借币订单 |                                                              |

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "deduct-rate": "1",
            "created-at": 1595831651478,
            "updated-at": 1595832010845,
            "accrued-at": 1595831651478,
            "interest-amount": "0.004083000000000000",
            "loan-amount": "100.000000000000000000",
            "hour-interest-rate": "0.000040830000000000",
            "loan-balance": "0.000000000000000000",
            "interest-balance": "0.000000000000000000",
            "paid-coin": "0.004083000000000000",
            "day-interest-rate": "0.000980000000000000",
            "interest-rate": "0.000040830000000000",
            "user-id": 5574974,
            "account-id": 5463409,
            "currency": "usdt",
            "symbol": "btcusdt",
            "paid-point": "0.000000000000000000",
            "deduct-currency": "",
            "deduct-amount": "0",
            "id": 7839857,
            "state": "cleared"
        }
    ]
}
```

### 响应数据


| 字段名称           | 是否必须 | 数据类型 | 描述                       | 取值范围                                                     |
| ------------------ | -------- | -------- | -------------------------- | ------------------------------------------------------------ |
| status             | true     | string   |   状态                       |                                                              |
| \<data\>           | true     | object   |                             |                                                              |
| id                 | true     | long     | 订单号                     |                                                              |
| user-id            | true     | long     | 用户ID                     |                                                              |
| account-id         | true     | long     | 账户ID                     |                                                              |
| symbol             | true     | string   | 交易对                     |                                                              |
| currency           | true     | string   | 币种                       |                                                              |
| loan-amount        | true     | string   | 借币本金总额               |                                                              |
| loan-balance       | true     | string   | 未还本金                   |                                                              |
| interest-rate      | true     | string   | 币息率                     |                                                              |
| interest-amount    | true     | string   | 币息总额                   |                                                              |
| interest-balance   | true     | string   | 未还币息                   |                                                              |
| created-at         | true     | long     | 借币发起时间               |                                                              |
| accrued-at         | true     | long     | 最近一次计息时间           |                                                              |
| state              | true     | string   | 订单状态                   | created 未放款，accrual 已放款，cleared 已还清，invalid 异常 |
| paid-point         | true     | string   | 已支付点卡金额（用于还息） |                                                              |
| paid-coin          | true     | string   | 已支付原币金额（用于还息） |                                                              |
| deduct-rate        | true     | string   | 抵扣率（用于还息）         |                                                              |
| deduct-currency    | true     | string   | 抵扣币种（用于还息）       |                                                              |
| deduct-amount      | true     | string   | 抵扣金额（用于还息）       |                                                              |
| updated-at         | true     | long     | 更新时间                   |                                                              |
| hour-interest-rate | true     | string   | 时息率                     |                                                              |
| day-interest-rate  | true     | string   | 日息率                     |                                                              |
| \</data\>          |      |    |                             |                                                              |


## 借币账户详情（逐仓）

API Key 权限：读取<br>
限频值（NEW）：100次/2s

此接口返回借币账户详情。

### HTTP 请求

- GET `/v1/margin/accounts/balance`

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述                                                         | 默认值                           | 取值范围 |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------------------------------- | -------- |
| symbol   | false    | string | 交易对，作为get参数<br />如果不传则不返回可转余额(transfer-out-available)和可借余额(loan-available) |                                  |          |
| sub-uid  | false    | int    | 子用户编号（母用户查询子用户借币详情时，此字段必填）         | 如不填，缺省查询当前用户借币详情 |          |

> Response:

```json
{  
  "data": [
    {
      "id": 18264,
      "type": "margin",
      "state": "working",
      "symbol": "btcusdt",
      "fl-price": "0",
      "fl-type": "safe",
      "risk-rate": "475.952571086994250554",
      "list": [
          {
              "currency": "btc",
              "type": "trade",
              "balance": "1168.533000000000000000"
          },
          {
              "currency": "btc",
              "type": "frozen",
              "balance": "0.000000000000000000"
          },
          {
              "currency": "btc",
              "type": "loan",
              "balance": "-2.433000000000000000"
          },
          {
              "currency": "btc",
              "type": "interest",
              "balance": "-0.000533000000000000"
          },
          {
              "currency": "btc",
              "type": "transfer-out-available",//可转btc,只有传入symbol才会返回
              "balance": "1163.872174670000000000"
          },
          {
              "currency": "btc",
              "type": "loan-available",//可借btc,只有传入symbol才会返回
              "balance": "8161.876538350676000000"
          }
      ]
    }
  ]
}
```

### 响应数据

| 字段名称   | 是否必须 | 数据类型 | 描述                                                         | 取值范围 |
| ---------- | -------- | -------- | ------------------------------------------------------------ | -------- |
| \<data\>   | true     | object   |                                                        |          |
| id         | true     | int      |                                                        |          |
| type       | true     | string   |                                                        |          |
| fl-type    | true     | string   |                                                        |          |
| symbol     | true     | string   | 交易对                                                       |          |
| state      | true     | string   | 账户状态，working 正常,fl-sys 系统自动爆仓,fl-mgt 手动爆仓,fl-end 爆仓结束 |          |
| risk-rate  | true     | string   | 风险率                                                       |          |
| fl-price   | true     | string   | 爆仓价                                                       |          |
| \<list\>   | true     | array    | 借币账户详情列表                                             |          |
| currency   | true     | string   | 币种                                                         |          |
| type       | true     | string   | 类型，trade: 交易余额, frozen: 冻结余额, loan: 待还借贷本金, interest: 待还借贷利息, ,transfer-out-available 可划转额, loan-available 可借额 |    |
| balance    | true     | string   | 余额，负数表示应还金额。transfer-out-available的余额如果为-1，代表该币种可全部转出。 |          |
| \</list\>   |      |     |                                             |          |
| \</data\>   |      |     |                                                        |          |


## 资产划转（全仓）

API Key 权限：交易

限频值（NEW）：10次/s

此接口用于现货账户与全仓杠杆账户的资产互转。

从现货账户划转至全仓杠杆账户 `transfer-in`，从全仓杠杆账户划转至现货账户 `transfer-out`

### HTTP 请求

- POST `/v1/cross-margin/transfer-in`
- POST `/v1/cross-margin/transfer-out`

> Request:

```json
{
  "currency": "eth",
  "amount": "1.0"
}
```

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述     |
| -------- | -------- | -------- | ------ | -------- |
| currency | string   | true     | NA     | 币种     |
| amount   | string   | true     | NA     | 划转数量 |


> Response:

```json
{  
  "status": "ok",
  "data": 1000
}
```

### 响应数据


| 参数名称 | 数据类型 | 描述        |
| -------- | -------- | ----------- |
| status   | string   | 状态         |
| data     | integer  | Transfer id |


## 查询借币币息率及额度（全仓）

API Key 权限：读取<br>

限频值（NEW）：2次/2s

此接口返回用户级别的借币币息率及借币额度。

### HTTP 请求

- GET `/v1/cross-margin/loan-info`

### 请求参数

无

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "currency": "bch",
            "interest-rate": "0.00098",
            "min-loan-amt": "0.35",
            "max-loan-amt": "3500",
            "loanable-amt": "0.70405181",
            "actual-rate": "0.000343"
        },
        {
            "currency": "btc",
            "interest-rate": "0.00098",
            "min-loan-amt": "0.01",
            "max-loan-amt": "100",
            "loanable-amt": "0.02281914",
            "actual-rate": "0.000343"
        },
        {
            "currency": "eos",
            "interest-rate": "0.00098",
            "min-loan-amt": "30",
            "max-loan-amt": "300000",
            "loanable-amt": "57.69175296",
            "actual-rate": "0.000343"
        },
        {
            "currency": "eth",
            "interest-rate": "0.00098",
            "min-loan-amt": "0.5",
            "max-loan-amt": "6000",
            "loanable-amt": "1.06712197",
            "actual-rate": "0.000343"
        },
        {
            "currency": "ltc",
            "interest-rate": "0.00098",
            "min-loan-amt": "1.5",
            "max-loan-amt": "15000",
            "loanable-amt": "3.28947368",
            "actual-rate": "0.000343"
        },
        {
            "currency": "usdt",
            "interest-rate": "0.00098",
            "min-loan-amt": "100",
            "max-loan-amt": "1500000",
            "loanable-amt": "200.00000000",
            "actual-rate": "0.000343"
        },
        {
            "currency": "xrp",
            "interest-rate": "0.00098",
            "min-loan-amt": "380",
            "max-loan-amt": "4000000",
            "loanable-amt": "734.21439060",
            "actual-rate": "0.000343"
        }
    ],
    "code": 200
}
```

### 响应数据

| 参数名称      | 数据类型 | 描述                                                         |
| ------------- | -------- | ------------------------------------------------------------ |
| status        | string   | 状态                                                         |
| \<data\>      | object   |                                                             |
| currency      | string   | 币种                                                         |
| interest-rate | string   | 基础日币息率                                                 |
| min-loan-amt  | string   | 最小允许借币金额                                             |
| max-loan-amt  | string   | 最大允许借币金额                                             |
| loanable-amt  | string   | 最大可借金额                                                 |
| actual-rate   | string   | 抵扣后的实际币息率，如不适用抵扣或未启用抵扣则返回基础日币息率 |
| \</data\>     |          |                                                             |
| code          | int      |  状态码                                                       |


## 获取杠杆持仓限额（全仓）

API Key 权限：读取<br>

限频值（NEW）：2次/2s

此接口返回用户级别的持仓限额。

### HTTP 请求

- GET `/v2/margin/limit`

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述                                                         |
| -------- | -------- | -------- | ------ | ------------------------------------------------------------ |
| currency | string   | true     | NA     | 币种，支持批量查询(币种之间用英文逗号分隔)，单次最多可查10个币种 |

> Response:

```json
{
    "status": "ok",
    "data": [
        {
            "currency": "btc",
            "max-holdings": "-1" // -1表示不限制
        },
        {
            "currency": "eth",
            "max-holdings": "-1"
        },
        {
            "currency": "ada",
            "max-holdings": "3000000"
        }
    ],
    "code": 200
}
```

### 响应数据

### 

| 名称         | 类型    | 描述             |
| ------------ | ------- | ---------------- |
| code         | integer | 状态码           |
| message      | string  | 错误描述（如有） |
| status       | string  | 状态           |
| \<data\>     | object  |               |
| currency     | string  | 币种             |
| maxHoldings  | string  | 持仓限额         |
| \</data\>    |    |               |


## 申请借币（全仓）

API Key 权限：交易<br>

限频值（NEW）：2次/2s

此接口用于申请借币.

### HTTP 请求

- POST `/v1/cross-margin/orders`

> Request:

```json
{
  "currency": "eth",
  "amount": "1.0"
}
```

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 默认值 | 描述                      |
| -------- | -------- | -------- | ------ | ------------------------- |
| currency | string   | true     | NA     | 币种                      |
| amount   | string   | true     | NA     | 借币数量（精度：3位小数） |

> Response:

```json
{  
  "status": "ok",
  "data": 1000
}
```

### 响应数据

| 字段名称 | 数据类型 | 描述            |
| -------- | -------- | --------------- |
| status   | string   | 状态             |
| data     | integer  | Margin order id |


## 归还借币（全仓）

API Key 权限：交易<br>

限频值（NEW）：2次/2s

此接口用于归还借币.

### HTTP 请求

- POST `/v1/cross-margin/orders/{order-id}/repay`

> Request:

```json
{
  "amount": "1.0"
}
```

### 请求参数

| 参数名称 | 数据类型 | 是否必需 | 描述                          |
| -------- | -------- | -------- | ----------------------------- |
| order-id | string   | true     | 借币订单 ID，写在 url path 中 |
| amount   | string   | true     | 归还币种数量                  |

> Response:

```json
{  
  "status": "ok",
  "data": null
}
```

### 响应数据

| 参数名称 | 数据类型 | 描述 |
| -------- | -------- | ---- |
| status   | string   | 状态  |
| data     | null     | -    |


## 查询借币订单（全仓）

API Key 权限：读取<br>

限频值（NEW）：2次/2s

此接口基于指定搜索条件返回借币订单。

### HTTP 请求

- GET `/v1/cross-margin/loan-orders`

### 请求参数

| 参数名称   | 是否必须 | 类型   | 描述                             | 默认值 | 取值范围 |
| ---------- | -------- | ------ | -------------------------------- | ------ | -------- |
| start-date | false    | string | 查询开始日期, 日期格式yyyy-mm-dd |        |          |
| end-date   | false    | string | 查询结束日期, 日期格式yyyy-mm-dd |        |          |
| currency   | false    | string | 币种                             |        |          |
| state | false | string | 状态   |all   |created 未放款，accrual 已放款，cleared 已还清，invalid 异常
| from   | false | string | 查询起始 ID  | 0   |     |
| direct | false | string | 查询方向     |    | prev 向前，时间（或 ID）正序；next 向后，时间（或 ID）倒序） |
| size   | false | string | 查询记录大小  |  10  |[10-100]     |
| sub-uid| false |long    | 子用户UID   | 如不填，缺省查询当前用户借贷订单 ||

> Response:

```json
{
    "status":"ok",
    "data":[
        {
            "loan-balance":"0.100000000000000000",
            "interest-balance":"0.000200000000000000",
            "loan-amount":"0.100000000000000000",
            "accrued-at":1511169724531,
            "interest-amount":"0.000200000000000000",
            "filled-points":"0.2",
            "filled-ht":"0.2",
            "currency":"btc",
            "id":394,
            "state":"accrual",
            "account-id":17747,
            "user-id":119913,
            "created-at":1511169724531
        }
    ]
}
```

### 响应数据

| 字段名称         | 是否必须 | 数据类型 | 描述             | 取值范围                                                     |
| ---------------- | -------- | -------- | ---------------- | ------------------------------------------------------------ |
| status           | true     | string   | 状态             |                                                              |
| \<data\>         | true     | object   |                 |                                                              |
| id               | true     | long     | 订单号           |                                                              |
| user-id          | true     | long     | 用户ID           |                                                              |
| account-id       | true     | long     | 账户ID           |                                                              |
| currency         | true     | string   | 币种             |                                                              |
| loan-amount      | true     | string   | 借币本金总额     |                                                              |
| loan-balance     | true     | string   | 未还本金         |                                                              |
| interest-amount  | true     | string   | 币息总额         |                                                              |
| interest-balance | true     | string   | 未还币息         |                                                              |
| filled-points    | true     | string   | 点卡抵扣数量     |                                                              |
| filled-ht        | true     | string   | HT抵扣数量       |                                                              |
| created-at       | true     | long     | 借币发起时间     |                                                              |
| accrued-at       | true     | long     | 最近一次计息时间 |                                                              |
| state            | true     | string   | 订单状态         | created 未放款，accrual 已放款，cleared 已还清，invalid 异常 |
| \</data\>        |          |          |                 |                                                              |


## 借币账户详情（全仓）

API Key 权限：读取<br>

限频值（NEW）：2次/2s

此接口返回借币账户详情。

### HTTP 请求

- GET `/v1/cross-margin/accounts/balance`

### 请求参数

| 参数名称 | 是否必须 | 类型 | 描述      | 默认值                           | 取值范围 |
| -------- | -------- | ---- | --------- | -------------------------------- | -------- |
| sub-uid  | false    | long | 子用户UID | 如不填，缺省查询当前用户借贷订单 |          |

> Response:

```json
{
    "status":"ok",
    "data":{
        "id":18264,
        "type":"cross-margin",
        "state":"working",
        "risk-rate":"1000",
        "acct-balance-sum":"12312.123123",
        "debt-balance-sum":"1231.2123123",
        "list":[
            {
                "currency":"btc",
                "type":"trade",
                "balance":"1168.533000000000000000"
            },
            {
                "currency":"btc",
                "type":"frozen",
                "balance":"0.000000000000000000"
            },
            {
                "currency":"btc",
                "type":"loan",
                "balance":"-2.433000000000000000"
            },
            {
                "currency":"btc",
                "type":"interest",
                "balance":"-0.000533000000000000"
            },
            {
                "currency":"btc",
                "type":"transfer-out-available", //可借btc
                "balance":"1163.872174670000000000"
            },
            {
                "currency":"btc",
                "type":"loan-available", //可借btc
                "balance":"8161.876538350676000000"
            }
        ]
    }
}
```

### 响应数据

| 字段名称         | 是否必须 | 数据类型 | 描述                                                         |
| ---------------- | -------- | -------- | ------------------------------------------------------------ |
| status           | true     | string   | 状态                                                        |
| \<data\>         | true     | object   |                                                              |
| id               | true     | integer  | Account ID 账户编号                                          |
| type             | true     | integer  | 账户类型：cross-margin                                       |
| state            | true     | string   | 账户状态：working 正常,fl-sys 系统自动爆仓,fl-end 爆仓结束,fl-negative 穿仓 |
| risk-rate        | true     | string   | 风险率                                                       |
| acct-balance-sum | true     | string   | 总持有usdt折合                                               |
| debt-balance-sum | true     | string   | 总负债usdt折合                                               |
| \<list\>         | true     | array    | 借币账户详情列表                                             |
| currency         | true     | string   | 币种                                                         |
| type             | true     | string   | 账户类型，trade: 交易余额, frozen: 冻结余额, loan: 待还借贷本金, interest: 待还借贷利息, ,transfer-out-available 可划转额, loan-available 可借额 |
| balance          | true     | string   | 余额，负数表示应还金额。transfer-out-available的账户余额如果为-1，代表该币种可全部转出。 |
| \</list\>        |      |     |                                              |
| \</data\>        |      |     |                                                              |


## 还币交易记录查询

API Key 权限：读取

限频值：2次/秒

子用户可以调用

按repayTime检索

### HTTP 请求

- GET `/v2/account/repayment`

### 请求参数

| **名称**  | **类型** | **是否必需** | **描述**                                                     |
| --------- | -------- | ------------ | ------------------------------------------------------------ |
| repayId   | string   | FALSE        | 还币交易ID                                                   |
| accountId | string   | FALSE        | 账户ID（缺省值：所有账户）                                   |
| currency  | string   | FALSE        | 借入/借出币种（缺省值：所有币种）                            |
| startTime | long     | FALSE        | 远点时间（unix time in millisecond；取值范围：[(endTime - x天), endTime]；缺省值：(endTime - x天)） |
| endTime   | long     | FALSE        | 近点时间（unix time in millisecond；取值范围：[(当前时间 - y天), 当前时间]；缺省值：当前时间） |
| sort      | string   | FALSE        | 检索方向（有效值：asc 由远及近, desc 由近及远；缺省值：desc） |
| limit     | integer  | FALSE        | 单页最大返回条目数量（取值范围：[1-100]；缺省值：50）        |
| fromId    | long     | FALSE        | 查询起始编号（仅对翻页查询有效）                             |

> Response:

```json
{
    "code":200,
    "data":[
        {
            "repayId":1174413,
            "repayTime":1600747389111,
            "accountId":1266826,
            "currency":"btc",
            "repaidAmount":"0.00200083",
            "transactIds":{
                "transactId":502,
                "repaidprincipal":"0.00199666",
                "repaidInterest":"0.00000417",
                "paidHt":"0",
                "paidPoint":"0"
            }
        }
    ]
}
```
### 响应数据
| **名称**        | **类型** | **是否必需** | **描述**                                                 |
| --------------- | -------- | ------------ | -------------------------------------------------------- |
| code            | integer  | TRUE         | 状态码                                                   |
| message         | string   | FALSE        | 错误描述（如有）                                         |
| \<data\>        | array    | TRUE         | 按sort指定顺序排列                                       |
| repayId         | string   | TRUE         | 还币交易ID                                               |
| repayTime       | long     | TRUE         | 还币交易时间（unix time in millisecond）                 |
| accountId       | string   | TRUE         | 还币账户ID                                               |
| currency        | string   | TRUE         | 还币币种                                                 |
| repaidAmount    | string   | TRUE         | 已还币金额                                               |
| \<transactIds\> | object   | TRUE         | 该笔还币所涉及的原始借币交易ID列表（按还币优先顺序排列） |
| transactId      | long     | TRUE         | 原始借币交易ID                                           |
| repaidPrincipal | string   | TRUE         | 该笔还币交易已还本金                                     |
| repaidInterest  | string   | TRUE         | 该笔还币交易已还利息                                     |
| paidHt          | string   | TRUE         | 该笔还币交易已支付HT金额                                 |
| paidPoint       | string   | TRUE         | 该笔还币交易已支付点卡金额                               |
| \</transactIds\> |    |          |        |
| \</data\>        |    |          |                                        |
| nextId          | long     | FALSE        | 下页查询起始编号（仅在存在下页数据时返回）               |

## 常见错误码

**以下是逐仓杠杆接口的返回码和说明。**

| 返回码                                      | 说明                                                         |
| ------------------------------------------- | ------------------------------------------------------------ |
| account-transfer-balance-insufficient-error | 账户余额不足                                                 |
| account-transfer-balance-overflow-error     | 负账户余额溢出                                               |
| account-transfer-balance-insufficient_error | 账户余额不足（不区分动作类型）                               |
| base-msg                                    | 自定义错误消息                                               |
| base-system-error                           | 系统异常                                                     |
| base-currency-error                         | currency不存在                                               |
| base-symbol-error                           | symbol不存在                                                 |
| base-margin-symbol-invalid                  | 非法借贷交易对(非法交易对或者被禁止借贷的交易对)             |
| base-record-invalid                         | 记录无效                                                     |
| base-request-timeout                        | 请求超时，请稍后再试                                         |
| base_request_exceed_number_limit            | 请求人数过多，请稍后再试                                     |
| base-date-limit-error                       | 日期错误                                                     |
| base-update-error                           | 更新数据错误                                                 |
| base-operation-forbidden 禁止操作           | 非计息状态 禁止还款                                          |
| dw-insufficient-balance                     | 余额不足                                                     |
| dw-account-transfer-error                   | 转账错误                                                     |
| frequent-invoke                             | 操作过于频繁，请稍后重试                                     |
| loan-order-not-found                        | 订单未找到                                                   |
| loan-amount-scale-limit                     | 借贷&还款 金额精度限制                                       |
| loan-repay-max-limit                        | 偿还大于借贷                                                 |
| loan-insufficient-balance                   | 余额不足                                                     |
| login-required                              | 需要登录                                                     |
| margin-country-not-allow                    | 国家未开放借贷                                               |
| margin-country-auth-required                | 国家未开放借贷，需要认证                                     |
| margin-trading-is-not-available             | 暂不支持逐仓杠杆交易--禁止土耳其籍或通过土耳其KYC的用户进行逐仓杠杆借币 |
| margin-account-state-error                  | 账户状态异常(爆仓中)                                         |
| risk-verification-failed                    | 风控拦截通用错误码                                           |
| sub-user-auth-required                      | 需要母用户授权子用户                                         |

**以下是全仓杆接口的返回码和说明。**

| 返回码                                   | 说明                                  |
| ---------------------------------------- | ------------------------------------- |
| abnormal-users-cannot-transfer           | 非正常用户不能转出                    |
| account-explosion-in-prohibited-transfer | 账户爆仓中禁止划转操作                |
| account-is-abnormal-retry-after-refresh  | 账户异常请刷新重试                    |
| account-balance-insufficient-error       | 账户余额不足                          |
| account-cannot-be-inquired               | 无法查询到全仓杠杆账户                |
| base-not-in-white-list                   | 不是白名单用户                        |
| base-currency-error                      | currency不存在                        |
| base-operation-forbidden                 | 禁止操作                              |
| base-user-request-exceed-limit           | 操作太频繁，请稍后再试                |
| base-currency-not-open                   | currency还没有开放 该保证金币种未开启 |
| beyond-maximum-number-of-rollover        | 超出最大转出数量                      |
| exceed-maximum-amount                    | 超出最大数量                          |
| start-date-cannot-greater-than-end-date  | 开始时间不能大于结束时间              |
| frequent-invoke                          | 操作过于频繁，请稍后重试              |
| insufficient-exchange-fund               | 交易所资金不足                        |
| loan-order-not-found                     | 订单未找到                            |
| loan-amount-scale-limit                  | 借贷&还款 金额精度限制                |
| loan-repay-max-limit                     | 偿还大于借贷                          |
| loan-insufficient-balance                | 余额不足                              |
| loan-fee-rate-compute-fail               | 系统借款利率计算异常                  |
| login-required                           | 需要登录                              |
| margin-subuser-no-permission             | 全仓杠杆子账号未开通权限              |
| normal-and-warehouse-can-transfer        | 正常用户与穿仓用户可以转入            |
| order-orderamount-precision-error        | 交易数额精度错误                      |
| require-exchange-id                      | 需要交易所id                          |
| subacount-currency-not-exit              | 该币种的子账户不存在                  |
| system-busy                              | 系统繁忙                              |
| unsupport-kyc-info                       | 不支持的kyc认证信息                   |
| uc-network-error                         | 网络错误                              |
| uncreated-currency-cannot-be-drawn       | 未创建币种子账户无法划出              |

## 常见问题

### Q1: 逐仓和全仓借币时我查询到可借余额有值，而且我申请借币的额度小于可借余额，为什么借币时却提示可借币不足错误，无法借币成功？

A: 用户可借额度不仅取决于用户账户的可借额度，也取决于系统可借总额度。按照风险控制要求系统每天有一个借币的总额度，为所有用户共享。如果超过了这个额度，即使账户自己的额度够也无法借币。系统当天总额度用尽时，只有当天有用户还币之后，才可以继续借币。我们目前正在实现对用户更友好的解决方案，尝试将更准确的信息通过API提供给用户。                       


# Websocket行情数据

## 简介

### 接入URL

**Global站行情请求地址（除MBP增量推送及MBP全量REQ以外Websocket行情频道）**

**`wss://api.huobi.pro/ws`**  

**`wss://api-aws.huobi.pro/ws`**  

**MBP增量推送及MBP全量REQ请求地址**

**`wss://api.huobi.pro/feed`**  

**`wss://api-aws.huobi.pro/feed`** 

### 数据压缩

WebSocket 行情接口返回的所有数据都进行了 GZIP 压缩，需要 client 在收到数据之后解压。

### 心跳消息

```json
{"ping": 1492420473027} 
```

当用户的Websocket客户端连接到火币Websocket服务器后，服务器会定期（当前设为5秒）向其发送`ping`消息并包含一整数值。

```json
{"pong": 1492420473027} 
```

当用户的Websocket客户端接收到此心跳消息后，应返回`pong`消息并包含同一整数值。

<aside class="warning">当Websocket服务器连续两次发送了`ping`消息却没有收到任何一次`pong`消息返回后，服务器将主动断开与此客户端的连接。</aside>

### 订阅主题

> Sub request:

```json
{
  "sub": "market.btcusdt.kline.1min",
  "id": "id1"
}
```

成功建立与Websocket服务器的连接后，Websocket客户端发送请求以订阅特定主题：

`{`
    `"sub": "topic to req",`
    `"id": "id generate by client"`
`}`

> Sub response:

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.kline.1min",
  "ts": 1489474081631
}
```

成功订阅后，Websocket客户端将收到确认。

之后, 一旦所订阅的主题有更新，Websocket客户端将收到服务器推送的更新消息（push）。

### 取消订阅

> UnSub request:

```json
{
  "unsub": "market.btcusdt.trade.detail",
  "id": "id4"
}
```

取消订阅的格式如下：

`{`
    `"unsub": "topic to req",`
    `"id": "id generate by client"`
`}`

> UnSub response:

```json
{
    "id": "id4",
    "status": "ok",
    "unsubbed": "market.btcusdt.trade.detail",
    "ts": 1494326028889
}
```

取消订阅成功确认。

### 请求数据

Websocket服务器同时支持一次性请求数据（pull）。

一次性请求的格式如下：

`{`
    `"req": "topic to req",`
    `"id": "id generate by client"`
`}`

一次性返回数据的具体格式参见各个主题。

### 限频

数据请求（req）限频规则

单个连接每两次请求不能小于100ms。


## 聚合行情(Ticker)数据

### 主题订阅

获取市场聚合行情数据，每100ms推送一次。

`market.$symbol.ticker`

> 订阅请求

```json
{
  "sub": "market.btcusdt.ticker"
}
```

### 请求参数

| 参数   | 数据类型 | 是否必须 | 默认值 | 描述   | 取值范围                                               |
| ------ | -------- | -------- | ------ | ------ | ------------------------------------------------------ |
| symbol | string   | true     | NA     | 交易对 | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |

> Response:

```json
{
    "ch":"market.btcusdt.ticker",
    "ts":1630982370526,
    "tick":{
        "open":51732,
        "high":52785.64,
        "low":51000,
        "close":52735.63,
        "amount":13259.24137056181,
        "vol":687640987.4125315,
        "count":448737,
        "bid":52732.88,
        "bidSize":0.036,
        "ask":52732.89,
        "askSize":0.583653,
        "lastPrice":52735.63,
        "lastSize":0.03
    }
}
```

### 响应数据

| 字段名称  | 数据类型 | 描述                                     |
| --------- | -------- | ---------------------------------------- |
| ch        | string   | 数据所属的 channel，格式：market.$symbol.ticker  |
| ts        | long     | 系统响应时间                                   |
| \<tick\>  | object   |                                        |
| amount    | float    | 以基础币种计量的交易量（以滚动24小时计） |
| count     | integer  | 交易次数（以滚动24小时计）               |
| open      | float    | 本阶段开盘价（以滚动24小时计）           |
| close     | float    | 本阶段最新价（以滚动24小时计）           |
| low       | float    | 本阶段最低价（以滚动24小时计）           |
| high      | float    | 本阶段最高价（以滚动24小时计）           |
| vol       | float    | 以报价币种计量的交易量（以滚动24小时计） |
| bid       | float    | 当前的最高买价                           |
| bidSize   | float    | 最高买价对应的量                         |
| ask       | float    | 当前的最低卖价                           |
| askSize   | float    | 最低卖价对应的量                         |
| lastPrice | float    | 最新成交价                               |
| lastSize  | float    | 最新成交价对应的量                       |
| \</tick\>  |     |                                        |


## 市场深度行情数据

此主题发送最新市场深度快照。快照频率为每秒1次。

### 主题订阅

`market.$symbol.depth.$type`

> Subscribe request

```json
{
  "sub": "market.btcusdt.depth.step0",
  "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述         | 取值范围                                               |
| ------ | -------- | -------- | ------ | ------------ | ------------------------------------------------------ |
| symbol | string   | true     | NA     | 交易代码     | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |
| type   | string   | true     | step0  | 合并深度类型 | step0, step1, step2, step3, step4, step5               |

**"type" 合并深度类型**

| Value | Description                          |
| ----- | ------------------------------------ |
| step0 | 不合并深度                           |
| step1 | Aggregation level = precision*10     |
| step2 | Aggregation level = precision*100    |
| step3 | Aggregation level = precision*1000   |
| step4 | Aggregation level = precision*10000  |
| step5 | Aggregation level = precision*100000 |

当type值为‘step0’时，默认深度为150档;
当type值为‘step1’,‘step2’,‘step3’,‘step4’,‘step5’时，默认深度为20档。

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.depth.step0",
  "ts": 1489474081631 //system response time
}
```

> Update example

```json
{
    "ch":"market.btcusdt.depth.step0",
    "ts":1630983549503,
    "tick":{
        "bids":[
            [
                52690.69,
                0.36281
            ],
            [
                52690.68,
                0.2
            ]
        ],
        "asks":[
            [
                52690.7,
                0.372591
            ],
            [
                52691.26,
                0.13
            ]
        ],
        "version":136998124622,
        "ts":1630983549500
    }
}
```

### 数据更新字段列表

<aside class="notice">在'tick'object下方呈现买盘卖盘深度列表</aside>

| 字段    | 数据类型 | 描述                         |
| ------- | -------- | ---------------------------- |
| ch      | string   | 数据所属的 channel，格式：market.$symbol.depth.$type  |
| ts      | long     | 系统响应时间                |
| \<tick\>| object   |  |
| bids    | object   | 当前的所有买单 [price, size] |
| asks    | object   | 当前的所有卖单 [price, size] |
| version | integer  | 内部字段                     |
| ts      | integer  | 新加坡时间的时间戳，单位毫秒 |
| \</tick\> |     |  |

<aside class="notice">当symbol被设为"hb10"时，amount, count, vol均为零值 </aside>


### 数据请求

支持数据请求方式一次性获取市场深度数据：

```json
{
  "req": "market.btcusdt.depth.step0",
  "id": "id10"
}
```

## 市场深度MBP行情数据（增量推送）

用户可订阅此频道以接收最新深度行情Market By Price (MBP) 的增量数据推送；同时，该频道支持用户以req方式请求获取全量数据。

**MBP增量推送及MBP全量REQ请求地址**

**`wss://api.huobi.pro/feed`**  

**`wss://api-aws.huobi.pro/feed`** 

建议下游数据处理方式：<br>
1）	订阅增量数据并开始缓存；<br>
2）	请求全量数据（同等档位数）并根据该全量消息的seqNum与缓存增量数据中的prevSeqNum对齐；<br>
3）	开始连续增量数据接收与计算，构建并持续更新MBP订单簿；<br>
4）	每条增量数据的prevSeqNum须与前一条增量数据的seqNum一致，否则意味着存在增量数据丢失，须重新获取全量数据并对齐；<br>
5）	如果收到增量数据包含新增price档位，须将该price档位插入MBP订单簿中适当位置；<br>
6）	如果收到增量数据包含已有price档位，但size不同，须替换MBP订单簿中该price档位的size；<br>
7）	如果收到增量数据某price档位的size为0值，须将该price档位从MBP订单簿中删除；<br>
8）	如果收到单条增量数据中包含两个及以上price档位的更新，这些price档位须在MBP订单簿中被同时更新。<br>

当前仅支持5档/20档MBP逐笔增量以及150档MBP快照增量的推送，二者的区别为 -<br>
1） 深度不同；<br>
2） 5档/20档为逐笔增量MBP行情，150档为100毫秒定时快照增量MBP行情；<br>
3） 当5档/20档订单簿仅发生单边行情变化时，增量推送仅包含单边行情更新，比如，推送消息中包含数组asks，但不含数组bids；<br>

```json
{
    "ch":"market.btcusdt.mbp.5",
    "ts":1630985211662,
    "tick":{
        "seqNum":136999309829,
        "prevSeqNum":136999309815,
        "bids":[
            [
                52771.08,
                1.804671
            ]
        ]
    }
}
```
当150档订单簿仅发生单边行情变化时，增量推送包含双边行情更新，但其中一边行情为空，比如，推送消息中包含数组asks更新的同时，也包含bids空数组；<br>

```json
{
    "ch":"market.btcusdt.mbp.150",
    "ts":1573199608679,
    "tick":{
        "seqNum":100020146795,
        "prevSeqNum":100020146794,
        "bids":[ ],
        "asks":[
            [645.14,26.75597395914065]
        ]
    }
}
```
未来，150档增量推送的数据行为将与5档/20档增量保持一致，即，单边深度行情变更时，推送消息中将不包含另一边行情深度行情；<br>
4） 当150档订单簿在100毫秒时间间隔内未发生变化时，增量推送包含bids和asks空数组；<br>

```json
{
    "ch":"market.zecusdt.mbp.150",
    "ts":1585074391470,
    "tick":{
        "seqNum":100772868478,
        "prevSeqNum":100772868476,
        "bids":[  ],
        "asks":[  ]
    }
}
```
而5档/20档MBP逐笔增量，在订单簿未发生变化时，不推送数据；<br>
未来，150档增量推送的数据行为将与5档增量保持一致，即，在订单簿未发生变化时，不再推送空消息；<br>
5）5档/20档逐笔增量行情仅支持部分交易对（btcusdt,ethusdt,xrpusdt,eosusdt,ltcusdt,etcusdt,adausdt,dashusdt,bsvusdt），150档快照增量支持全部交易对。<br>

REQ频道支持5档/20档/150档全量数据的获取。<br>

### 订阅增量推送

`market.$symbol.mbp.$levels`

> Sub request

```json
{
  "sub": "market.btcusdt.mbp.5",
  "id": "id1"
}
```

### 请求全量数据

`market.$symbol.mbp.$levels`

> Req request

```json
{
  "req": "market.btcusdt.mbp.5",
  "id": "id2"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述                         | 取值范围                         |
| ------ | -------- | -------- | ------ | ---------------------------- | -------------------------------- |
| symbol | string   | true     | NA     | 交易代码（不支持通配符）     |                                  |
| levels | integer  | true     | NA     | 深度档位（取值：5， 20， 150，400） | 当前仅支持5档，20档，150或400档深度 |

> Response (增量订阅)

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.mbp.5",
  "ts": 1489474081631 //system response time
}
```

> Incremental Update (增量订阅)

```json
{
	"ch": "market.btcusdt.mbp.5",
	"ts": 1573199608679, //system update time
    "tick": {
            "seqNum": 100020146795,
            "prevSeqNum": 100020146794,
            "asks": [
                 [645.140000000000000000, 26.755973959140651643] // [price, size]
           ]
    }
}
```

> Response (全量请求)

```json
{
	"id": "id2",
	"rep": "market.btcusdt.mbp.150",
	"status": "ok",
	"data": {
		"seqNum": 100020142010,
		"bids": [
			[618.37, 71.594], // [price, size]
			[423.33, 77.726],
			[223.18, 47.997],
			[219.34, 24.82],
			[210.34, 94.463]
    ],
		"asks": [
			[650.59, 14.909733438479636],
			[650.63, 97.996],
			[650.77, 97.465],
			[651.23, 83.973],
			[651.42, 34.465]
		]
	}
}
```

### 数据更新字段列表

| 字段       | 数据类型 | 描述                                    |
| ---------- | -------- | --------------------------------------- |
| seqNum     | integer  | 消息序列号                              |
| prevSeqNum | integer  | 上一消息序列号                          |
| bids       | object   | 买盘，按price降序排列，["price","size"] |
| asks       | object   | 卖盘，按price升序排列，["price","size"] |

## 市场深度MBP行情数据（全量推送）

用户可订阅此频道以接收最新深度行情Market By Price (MBP) 的全量数据推送。推送频率为大约100毫秒一次。

### 订阅增量推送

`market.$symbol.mbp.refresh.$levels`

> Sub request

```json
{
    "sub": "market.btcusdt.mbp.refresh.20",
    "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述                     | 取值范围 |
| ------ | -------- | -------- | ------ | ------------------------ | -------- |
| symbol | string   | true     | NA     | 交易代码（不支持通配符） |          |
| levels | integer  | true     | NA     | 深度档位                 | 5,10,20  |

> Response

```json
{
    "id": "id1",
    "status": "ok",
    "subbed": "market.btcusdt.mbp.refresh.20",
    "ts": 1489474081631 //system response time
}
```

> Refresh Update

```json
{
    "ch": "market.btcusdt.mbp.refresh.20",
    "ts": 1573199608679, //system update time
    "tick": {
		"seqNum": 100020142010,
		"bids": [
			[618.37, 71.594], // [price, size]
			[423.33, 77.726],
			[223.18, 47.997],
			[219.34, 24.82],
			[210.34, 94.463], ... // 省略余下15档
   		],
		"asks": [
			[650.59, 14.909733438479636],
			[650.63, 97.996],
			[650.77, 97.465],
			[651.23, 83.973],
			[651.42, 34.465], ... // 省略余下15档
		]
    }
}
```

### 数据更新字段列表

| 字段   | 数据类型 | 描述                                    |
| ------ | -------- | --------------------------------------- |
| seqNum | integer  | 消息序列号                              |
| bids   | object   | 买盘，按price降序排列，["price","size"] |
| asks   | object   | 卖盘，按price升序排列，["price","size"] |


## 买一卖一逐笔行情

当买一价、买一量、卖一价、卖一量，其中任一数据发生变化时，此主题推送逐笔更新。

### 主题订阅

`market.$symbol.bbo`

> Subscribe request

```json
{
  "sub": "market.btcusdt.bbo",
  "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述     | 取值范围                                               |
| ------ | -------- | -------- | ------ | -------- | ------------------------------------------------------ |
| symbol | string   | true     | NA     | 交易代码 | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.bbo",
  "ts": 1489474081631 //system response time
}
```

> Update example

```json
{
    "ch":"market.btcusdt.bbo",
    "ts":1630994555540,
    "tick":{
        "seqId":137005210233,
        "ask":52665.02,
        "askSize":1.502181,
        "bid":52665.01,
        "bidSize":0.178567,
        "quoteTime":1630994555539,
        "symbol":"btcusdt"
    }
}
```

### 数据更新字段列表

| 字段      | 数据类型 | 描述         |
| --------- | -------- | ------------ |
| ch        | string   | 数据所属的 channel，格式：market.$symbol.kline.$period |
| ts        | long     | 系统响应时间  |
| \<data\>  | object   |             |
| symbol    | string   | 交易代码     |
| quoteTime | long     | 盘口更新时间 |
| bid       | float    | 买一价       |
| bidSize   | float    | 买一量       |
| ask       | float    | 卖一价       |
| askSize   | float    | 卖一量       |
| seqId     | int      | 消息序号     |
| \</data\> |    |             |

## 成交明细

### 主题订阅

此主题提供市场最新成交逐笔明细。

`market.$symbol.trade.detail`

> Subscribe request

```json
{
  "sub": "market.btcusdt.trade.detail",
  "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述     | 取值范围                                               |
| ------ | -------- | -------- | ------ | -------- | ------------------------------------------------------ |
| symbol | string   | true     | NA     | 交易代码 | btcusdt, ethbtc...（取值参考`GET /v1/common/symbols`） |

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.trade.detail",
  "ts": 1489474081631 //system response time
}
```

> Update example

```json
{
    "ch":"market.btcusdt.trade.detail",
    "ts":1630994963175,
    "tick":{
        "id":137005445109,
        "ts":1630994963173,
        "data":[
            {
                "id":137005445109359286410323766,
                "ts":1630994963173,
                "tradeId":102523573486,
                "amount":0.006754,
                "price":52648.62,
                "direction":"buy"
            }
        ]
    }
}
```

### 数据更新字段列表

| 字段      | 数据类型 | 描述                                           |
| --------- | -------- | ---------------------------------------------- |
| ch        | string   | 数据所属的 channel，格式：market.$symbol.trade.detail   |
| ts        | long     | 系统响应时间                     |
| \<tick\>  | object   |                          |
| id        | long     | 全局成交ID                          |
| ts        | long     | 最新成交时间                         |
| \<data\>  | object   |                           |
| id        | integer  | 唯一成交ID（将被废弃）                         |
| tradeId   | integer  | 唯一成交ID（NEW）                              |
| amount    | float    | 成交量（买或卖一方）                           |
| price     | float    | 成交价                                         |
| ts        | integer  | 成交时间 (UNIX epoch time in millisecond)      |
| direction | string   | 成交主动方 (taker的订单方向) : 'buy' or 'sell' |
| \</data\> |    |                           |
| \</tick\> |    |                          |


### 数据请求

支持数据请求方式一次性获取成交明细数据（仅能获取最多最近300个成交记录）：

```json
{
  "req": "market.btcusdt.trade.detail",
  "id": "id11"
}
```

## 市场概要

### 主题订阅

此主题提供24小时内最新市场概要快照。快照频率不超过每秒10次。

`market.$symbol.detail`

> Subscribe request

```json
{
  "sub": "market.btcusdt.detail",
  "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述     | 取值范围             |
| ------ | -------- | -------- | ------ | -------- | -------------------- |
| symbol | string   | true     | NA     | 交易代码 | btcusdt, ethbtc...等 |

> Response

```json
{
  "id": "id1",
  "status": "ok",
  "subbed": "market.btcusdt.detail",
  "ts": 1489474081631 //system response time
}
```

> Update example

```json
{
    "ch":"market.btcusdt.detail",
    "ts":1630998026649,
    "tick":{
        "id":273956868110,
        "low":51000,
        "high":52924.14,
        "open":51823.62,
        "close":52379.99,
        "vol":727676440.200527,
        "amount":13991.028076056185,
        "version":273956868110,
        "count":471348
    }
}
```

### 数据更新字段列表

| 字段   | 数据类型 | 描述                     |
| ------ | -------- | ------------------------ |
| ch     | string   | 数据所属的 channel，格式：market.btcusdt.detail |
| ts     | long     | 系统响应时间           |
| \<tick>| object   |   |
| id     | integer  | unix时间，同时作为消息ID |
| amount | float    | 24小时成交量             |
| count  | integer  | 24小时成交笔数           |
| open   | float    | 24小时开盘价             |
| close  | float    | 最新价                   |
| low    | float    | 24小时最低价             |
| high   | float    | 24小时最高价             |
| vol    | float    | 24小时成交额             |
| version    | long    | 版本号             |
| \</tick>|    |   |


### 数据请求

支持数据请求方式一次性获取市场概要数据：

```json
{
  "req": "market.btcusdt.detail",
  "id": "id11"
}
```

## 杠杆ETP实时净值推送

### 主题订阅

此主题提供杠杆ETP实时净值的推送。

`market.$symbol.etp`

> Subscribe request

```json
{
  "sub": "market.btc3lusdt.etp",
  "id": "id1"
}
```

### 参数

| 参数   | 数据类型 | 是否必需 | 缺省值 | 描述     | 取值范围      |
| ------ | -------- | -------- | ------ | -------- | ------------- |
| symbol | string   | true     | NA     | 交易代码 | 杠杆ETP交易对 |

> Update example

```json
{
    "ch":"market.btc3lusdt.etp",
    "ts":1630998641232,
    "tick":{
        "actualLeverage":2.939514947040537,
        "nav":55.96301165128891,
        "outstanding":302712.87098475,
        "symbol":"btc3lusdt",
        "navTime":1630998641232,
        "basket":[
            {
                "amount":0.003154874364924647,
                "currency":"btc"
            },
            {
                "amount":-108.54109757907857,
                "currency":"usdt"
            }
        ]
    }
}
```

### 数据更新字段列表

| 字段名称       | 数据类型 | 描述                                        |
| -------------- | -------- | ------------------------------------------- |
| ch             | string   | 数据所属的 channel，格式：market.$symbol.etp   |
| ts             | long     | 系统响应时间                             |
| \<tick\>       | object   |                               |
| symbol         | string   | 杠杆ETP交易代码                             |
| nav            | float    | 最新净值                                    |
| navTime        | long     | 最新净值更新时间 (unix time in millisecond) |
| outstanding    | float    | ETP总份额                                   |
| \<basket\>     | object   | 篮子                                        |
| currency       | float    | 币种                                        |
| amount         | float    | 金额                                        |
| \</basket\>    |    |                                         |
| actualLeverage | float    | 实际杠杆率                                  |
| \</tick\>       |    |                               |


## 常见错误码

以下是WebSocket行情接口的错误码、错误消息和说明。

| 错误码      | 错误消息                               | 说明                     |
| ----------- | -------------------------------------- | ------------------------ |
| bad-request | invalid topic                          | topic错误                |
| bad-request | invalid symbol                         | symbol错误               |
| bad-request | symbol trade not open now              | 该交易对未到开始交易时间 |
| bad-request | 429 too many request                   | req 请求太频繁           |
| bad-request | unsub with not subbed topic            | 未订阅该主题             |
| bad-request | not json string                        | 发送的请求不是JSON格式   |
| 1008        | header required correct cloud-exchange | exchangeCode 参数错误    |
| bad-request | request timeout                        | 请求超时                 |

# Websocket资产及订单

## 简介

### 接入URL

**Websocket资产及订单**

**`wss://api.huobi.pro/ws/v2`**  

**`wss://api-aws.huobi.pro/ws/v2`**   

注：api-aws.huobi.pro域名对使用aws云服务的用户做了一定的链路延迟优化。  

请使用中国大陆以外的服务器访问火币 API。

### 数据压缩

与行情WebSocket不同，资产和订单返回的数据未进行 GZIP 压缩。

### 心跳消息

当用户的Websocket客户端连接到火币WebSocket服务器后，服务器会定期（当前设为20秒）向其发送`Ping`消息并包含一整数值如下：

```json
{
	"action": "ping",
	"data": {
		"ts": 1575537778295
	}
}
```

当用户的Websocket客户端接收到此心跳信息后，应返回`Pong`消息并包含同一整数值：

```json
{
    "action": "pong",
    "data": {
          "ts": 1575537778295 // 使用Ping消息中的ts值
    }
}
```

### `action`的有效取值

| 有效取值   | 取值说明                             |
| ---------- | ------------------------------------ |
| sub        | 订阅数据                             |
| req        | 数据请求                             |
| ping、pong | 心跳数据                             |
| push       | 推送数据，服务端发送至客户端数据类型 |

### 限频

此版本对用户采取了多维度的限频策略，具体策略如下：

- 限制单连接**有效**的请求（包括req，sub，unsub，不包括ping/pong和其他无效请求)为**50次/秒**（此处秒限制为滑动窗口）。当超过此限制时，会返回"too many request"错误消息。
- 限制单API Key建连总数为**10**。当超过此限制时，会返回"too many connection"错误消息。
- 限制单IP建立连接数为**100次/秒**。当超过次限制时，会返回"too many request"错误消息。

### 鉴权

鉴权请求格式如下：

```json
{
    "action": "req", 
    "ch": "auth",
    "params": { 
        "authType":"api",
        "accessKey": "e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx",
        "signatureMethod": "HmacSHA256",
        "signatureVersion": "2.1",
        "timestamp": "2019-09-01T18:16:16",
        "signature": "4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o="
    }
}

```

鉴权成功后返回数据格式如下：

```json
{
	"action": "req",
	"code": 200,
	"ch": "auth",
	"data": {}
}
```

参数说明

| 字段             | 是否必需 | 数据类型 | 描述                                                         |
| ---------------- | -------- | -------- | ------------------------------------------------------------ |
| action           | true     | string   | Websocket数据操作类型，鉴权固定值为req                       |
| ch               | true     | string   | 请求主题，鉴权固定值为auth                                   |
| authType         | true     | string   | 鉴权类型，鉴权固定值为api。注意，该参数不在签名计算中。      |
| accessKey        | true     | string   | 您申请的API Key中的AccessKey                                 |
| signatureMethod  | true     | string   | 签名方法，用户计算签名寄语哈希的协议，固定值为HmacSHA256     |
| signatureVersion | true     | string   | 签名协议版本，固定值为2.1                                    |
| timestamp        | true     | string   | 时间戳，您发出请求的时间（UTC时间）在查询请求中包含此值有助于防止第三方截取您的请求。如：2017-05-11T16:22:06。再次强调是 (UTC 时区) |
| signature        | true     | string   | 签名, 计算得出的值，用于确保签名有效和未被篡改               |

### 签名步骤

资产和订单WebSocket签名与Rest接口签名步骤相似，具体区别如下：

1. 生成参与签名的字符串时，请求方法固定使用GET，请求地址固定为/ws/v2

2. 生成参与签名的固定参数名替换为：accessKey，signatureMethod，signatureVersion，timestamp

3. signatureVersion版本升级为2.1

Rest接口签名步骤,您可以点击 <a href='https://huobiapi.github.io/docs/spot/v1/cn/#c64cd15fdc'>这里</a> 获取。

签名前最后生成的字符串如下：


`GET\n`
`api.huobi.pro\n`
`/ws/v2\n`
`accessKey=0664b695-rfhfg2mkl3-abbf6c5d-49810&signatureMethod=HmacSHA256&signatureVersion=2.1&timestamp=2019-12-05T11%3A53%3A03`


注：JSON请求中的数据不需要URL编码。

### 订阅主题

成功建立与Websocket服务器的连接后，Websocket客户端发送如下请求以订阅特定主题：

```json
{
	"action": "sub",
	"ch": "accounts.update"
}
```
订阅成功Websocket客户端会接收到如下消息：

```json
{
	"action": "sub",
	"code": 200,
	"ch": "accounts.update#0",
	"data": {}
}
```

### 请求数据

成功建立Websocket服务器的连接后，Websocket客户端发送如下请求用以获取一次性数据：


```json
{
    "action": "req", 
    "ch": "topic"
}
```

请求成功后Websocket客户端会收到如下消息：

```json
{
    "action": "req",
    "ch": "topic",
    "code": 200,
    "data": {} // 请求数据体
}
```

## 订阅订单更新

API Key 权限：读取

订单的更新推送由任一以下事件触发：<br>
- 计划委托或追踪委托触发失败事件（eventType=trigger）<br>
- 计划委托或追踪委托触发前撤单事件（eventType=deletion）<br>
- 订单创建（eventType=creation）<br>
-	订单成交（eventType=trade）<br>
-	订单撤销（eventType=cancellation）<br>

不同事件类型所推送的消息中，字段列表略有不同。开发者可以采取以下两种方式设计返回的数据结构：<br>
- 定义一个包含所有字段的数据结构，并允许某些字段为空<br>
- 定义不同的数据结构，分别包含各自的字段，并继承自一个包含公共数据字段的数据结构

### 订阅主题

`orders#${symbol}`

### 订阅参数

> Subscribe request

```json
{
	"action": "sub",
	"ch": "orders#btcusdt"
}

```

> Response

```json
{
	"action": "sub",
	"code": 200,
	"ch": "orders#btcusdt",
	"data": {}
}
```

| 参数   | 数据类型 | 描述                      |
| ------ | -------- | ------------------------- |
| symbol | string   | 交易代码（支持通配符 * ） |


### 数据更新字段列表

> Update example

```json
{
	"action":"push",
	"ch":"orders#btcusdt",
	"data":
	{
		"orderSide":"buy",
		"lastActTime":1583853365586,
		"clientOrderId":"abc123",
		"orderStatus":"rejected",
		"symbol":"btcusdt",
		"eventType":"trigger",
		"errCode": 2002,
		"errMessage":"invalid.client.order.id (NT)"
	}
}
```

当计划委托/追踪委托触发失败后 –

| 字段          | 数据类型 | 描述                                                         |
| ------------- | -------- | ------------------------------------------------------------ |
| eventType     | string   | 事件类型，有效值：trigger（本事件仅对计划委托/追踪委托有效） |
| symbol        | string   | 交易代码                                                     |
| clientOrderId | string   | 用户自编订单号                                               |
| orderSide     | string   | 订单方向，有效值：buy,sell                                   |
| orderStatus   | string   | 订单状态，有效值：rejected                                   |
| errCode       | int      | 订单触发失败错误码                                           |
| errMessage    | string   | 订单触发失败错误消息                                         |
| lastActTime   | long     | 订单触发失败时间                                             |

> Update example

```json
{
	"action":"push",
	"ch":"orders#btcusdt",
	"data":
	{
		"orderSide":"buy",
		"lastActTime":1583853365586,
		"clientOrderId":"abc123",
		"orderStatus":"canceled",
		"symbol":"btcusdt",
		"eventType":"deletion"
	}
}
```

当计划委托/追踪委托在触发前被撤销后 –

| 字段          | 数据类型 | 描述                                                         |
| ------------- | -------- | ------------------------------------------------------------ |
| eventType     | string   | 事件类型，有效值：deletion（本事件仅对计划委托/追踪委托有效） |
| symbol        | string   | 交易代码                                                     |
| clientOrderId | string   | 用户自编订单号                                               |
| orderSide     | string   | 订单方向，有效值：buy,sell                                   |
| orderStatus   | string   | 订单状态，有效值：canceled                                   |
| lastActTime   | long     | 订单撤销时间                                                 |

> Update example

```json
{
	"action":"push",
	"ch":"orders#btcusdt",
	"data":
	{
		"orderSize":"2.000000000000000000",
		"orderCreateTime":1583853365586,
		"accountId":992701,
		"orderPrice":"77.000000000000000000",
		"type":"sell-limit",
		"orderId":27163533,
		"clientOrderId":"abc123",
		"orderSource":"spot-api",
		"orderStatus":"submitted",
		"symbol":"btcusdt",
		"eventType":"creation"
	}
}
```

当订单挂单后 –

| 字段            | 数据类型 | 描述                                                         |
| --------------- | -------- | ------------------------------------------------------------ |
| eventType       | string   | 事件类型，有效值：creation                                   |
| symbol          | string   | 交易代码                                                     |
| accountId       | long     | 账户ID                                                       |
| orderId         | long     | 订单ID                                                       |
| clientOrderId   | string   | 用户自编订单号（如有）                                       |
| orderSource     | string   | 订单来源                                                     |
| orderPrice      | string   | 订单价格                                                     |
| orderSize       | string   | 订单数量（对市价买单无效）                                   |
| orderValue      | string   | 订单金额（仅对市价买单有效）                                 |
| type            | string   | 订单类型，有效值：buy-market, sell-market, buy-limit, sell-limit, buy-limit-maker, sell-limit-maker, buy-ioc, sell-ioc, buy-limit-fok, sell-limit-fok |
| orderStatus     | string   | 订单状态，有效值：submitted                                  |
| orderCreateTime | long     | 订单创建时间                                                 |

注：<br>
- 止盈止损订单在尚未被触发时，接口将不会推送此订单的创建；<br>
- Taker订单在成交前，接口首先推送其创建事件。<br>
- 止盈止损订单的订单类型不再是原始订单类型“buy-stop-limit”或“sell-stop-limit”，而是变为“buy-limit”或“sell-limit”。<br>

> Update example

```json
{
	"action":"push",
	"ch":"orders#btcusdt",
	"data":
	{
		"tradePrice":"76.000000000000000000",
		"tradeVolume":"1.013157894736842100",
		"tradeId":301,
		"tradeTime":1583854188883,
		"aggressor":true,
		"remainAmt":"0.000000000000000400000000000000000000",
		"execAmt":"2",
		"orderId":27163536,
		"type":"sell-limit",
		"clientOrderId":"abc123",
		"orderSource":"spot-api",
		"orderPrice":"15000",
		"orderSize":"0.01",
		"orderStatus":"filled",
		"symbol":"btcusdt",
		"eventType":"trade"
	}
}
```

当订单成交后 –

| 字段          | 数据类型 | 描述                                                         |
| ------------- | -------- | ------------------------------------------------------------ |
| eventType     | string   | 事件类型，有效值：trade                                      |
| symbol        | string   | 交易代码                                                     |
| tradePrice    | string   | 成交价                                                       |
| tradeVolume   | string   | 成交量                                                       |
| orderId       | long     | 订单ID                                                       |
| type          | string   | 订单类型，有效值：buy-market, sell-market, buy-limit, sell-limit, buy-limit-maker, sell-limit-maker, buy-ioc, sell-ioc, buy-limit-fok, sell-limit-fok |
| clientOrderId | string   | 用户自编订单号（如有）                                       |
| orderSource   | string   | 订单来源                                                     |
| orderPrice    | string   | 原始订单价（市价单无效）                                     |
| orderSize     | string   | 原始订单数量（市价买单无效）                                 |
| orderValue    | string   | 原始订单金额（仅对市价买单有效）                             |
| tradeId       | long     | 成交ID                                                       |
| tradeTime     | long     | 成交时间                                                     |
| aggressor     | bool     | 是否交易主动方，有效值： true (taker), false (maker)         |
| orderStatus   | string   | 订单状态，有效值：partial-filled, filled                     |
| remainAmt     | string   | 该订单未成交数量（市价买单为未成交金额）                     |
| execAmt       | string   | 该订单累计成交量（市价买单为成交金额）                       |

注：<br>
- 止盈止损订单的订单类型不再是原始订单类型“buy-stop-limit”或“sell-stop-limit”，而是变为“buy-limit”或“sell-limit”。<br>
- 当一张taker订单同时与对手方多张订单成交后，所产生的每笔成交（tradePrice, tradeVolume, tradeTime, tradeId, aggressor）将被分别推送（而不是合并推送一笔）。<br>

> Update example

```json
{
	"action":"push",
	"ch":"orders#btcusdt",
	"data":
	{
		"lastActTime":1583853475406,
		"remainAmt":"2.000000000000000000",
		"execAmt":"2",
		"orderId":27163533,
		"type":"sell-limit",
		"clientOrderId":"abc123",
		"orderSource":"spot-api",
		"orderPrice":"15000",
		"orderSize":"0.01",
		"orderStatus":"canceled",
		"symbol":"btcusdt",
		"eventType":"cancellation"
	}
}
```

当订单被撤销后 –

| 字段          | 数据类型 | 描述                                                         |
| ------------- | -------- | ------------------------------------------------------------ |
| eventType     | string   | 事件类型，有效值：cancellation                               |
| symbol        | string   | 交易代码                                                     |
| orderId       | long     | 订单ID                                                       |
| type          | string   | 订单类型，有效值：buy-market, sell-market, buy-limit, sell-limit, buy-limit-maker, sell-limit-maker, buy-ioc, sell-ioc, buy-limit-fok, sell-limit-fok |
| clientOrderId | string   | 用户自编订单号（如有）                                       |
| orderSource   | string   | 订单来源                                                     |
| orderPrice    | string   | 原始订单价（市价单无效）                                     |
| orderSize     | string   | 原始订单数量（市价买单无效）                                 |
| orderValue    | string   | 原始订单金额（仅对市价买单有效）                             |
| orderStatus   | string   | 订单状态，有效值：partial-canceled, canceled                 |
| remainAmt     | string   | 该订单未成交数量（市价买单为未成交金额）                     |
| execAmt       | string   | 该订单累计成交量（市价买单为成交金额）                       |
| lastActTime   | long     | 订单最近更新时间                                             |
注：<br>
- 止盈止损订单的订单类型不再是原始订单类型“buy-stop-limit”或“sell-stop-limit”，而是变为“buy-limit”或“sell-limit”。<br>

## 订阅清算后成交及撤单更新

API Key 权限：读取

仅当用户订单成交或撤销时推送。其中，订单成交为逐笔推送，如一张 taker 订单同时与多张 maker 订单成交，该接口将推送逐笔更新。但用户收到的这几笔成交消息的次序，有可能与实际的成交次序不完全一致。另外，如果一张订单的成交及撤销几乎同时发生，例如 IOC 订单成交后剩余部分被自动撤销，用户可能会先收到撤单推送，再收到成交推送。<br>

如用户需要获取依次更新的订单推送，建议订阅另一频道 orders#${symbol}。<br>

### 订阅主题

`trade.clearing#${symbol}#${mode}`

### 订阅参数

| 参数   | 数据类型 | 是否必需 | 描述                                                         |
| ------ | -------- | -------- | ------------------------------------------------------------ |
| symbol | string   | TRUE     | 交易代码（支持通配符 * ）                                    |
| mode   | int      | FALSE    | 推送模式（0 - 仅在订单成交时推送；1 - 在订单成交、撤销时均推送；缺省值：0） |

注：<br>
可选订阅参数 mode，如不填或填0，仅推送成交事件；如填1，推送成交及撤销事件。<br>

> Subscribe request

```json
{
	"action": "sub",
	"ch": "trade.clearing#btcusdt#0"
}

```

> Response

```json
{
	"action": "sub",
	"code": 200,
	"ch": "trade.clearing#btcusdt#0",
	"data": {}
}
```

> Update example

```json
{
    "ch": "trade.clearing#btcusdt#0",
    "data": {
         "eventType": "trade",
         "symbol": "btcusdt",
         "orderId": 99998888,
         "tradePrice": "9999.99",
         "tradeVolume": "0.96",
         "orderSide": "buy",
         "aggressor": true,
         "tradeId": 919219323232,
         "tradeTime": 998787897878,
         "transactFee": "19.88",
         "feeDeduct ": "0",
         "feeDeductType": "",
         "feeCurrency": "btc",
         "accountId": 9912791,
         "source": "spot-api",
         "orderPrice": "10000",
         "orderSize": "1",
         "clientOrderId": "a001",
         "orderCreateTime": 998787897878,
         "orderStatus": "partial-filled"
    }
}
```

### 数据更新字段列表（当订单成交后）

| 字段            | 数据类型 | 描述                                                         |
| --------------- | -------- | ------------------------------------------------------------ |
| eventType       | string   | 事件类型（trade）                                            |
| symbol          | string   | 交易代码                                                     |
| orderId         | long     | 订单ID                                                       |
| tradePrice      | string   | 成交价                                                       |
| tradeVolume     | string   | 成交量                                                       |
| orderSide       | string   | 订单方向，有效值： buy, sell                                 |
| orderType       | string   | 订单类型，有效值： buy-market, sell-market,buy-limit,sell-limit,buy-ioc,sell-ioc,buy-limit-maker,sell-limit-maker,buy-stop-limit,sell-stop-limit,buy-limit-fok, sell-limit-fok, buy-stop-limit-fok, sell-stop-limit-fok |
| aggressor       | bool     | 是否交易主动方，有效值： true, false                         |
| tradeId         | long     | 交易ID                                                       |
| tradeTime       | long     | 成交时间，unix time in millisecond                           |
| transactFee     | string   | 交易手续费（正值）或交易手续费返佣（负值）                   |
| feeCurrency     | string   | 交易手续费或交易手续费返佣币种（买单的交易手续费币种为基础币种，卖单的交易手续费币种为计价币种；买单的交易手续费返佣币种为计价币种，卖单的交易手续费返佣币种为基础币种） |
| feeDeduct       | string   | 交易手续费抵扣                                               |
| feeDeductType   | string   | 交易手续费抵扣类型，有效值： ht, point                       |
| accountId       | long     | 账户编号                                                     |
| source          | string   | 订单来源                                                     |
| orderPrice      | string   | 订单价格 （市价单无此字段）                                  |
| orderSize       | string   | 订单数量（市价买单无此字段）                                 |
| orderValue      | string   | 订单金额（仅市价买单有此字段）                               |
| clientOrderId   | string   | 用户自编订单号                                               |
| stopPrice       | string   | 订单触发价（仅止盈止损订单有此字段）                         |
| operator        | string   | 订单触发方向（仅止盈止损订单有此字段）                       |
| orderCreateTime | long     | 订单创建时间                                                 |
| orderStatus     | string   | 订单状态，有效值：filled, partial-filled                     |

注：<br>
- transactFee中的交易返佣金额可能不会实时到账；<br>

### 数据更新字段列表（当订单撤销后）

| 字段            | 数据类型 | 描述                                                         |
| --------------- | -------- | ------------------------------------------------------------ |
| eventType       | string   | 事件类型（cancellation）                                     |
| symbol          | string   | 交易代码                                                     |
| orderId         | long     | 订单ID                                                       |
| orderSide       | string   | 订单方向，有效值： buy, sell                                 |
| orderType       | string   | 订单类型，有效值： buy-market, sell-market,buy-limit,sell-limit,buy-ioc,sell-ioc,buy-limit-maker,sell-limit-maker,buy-stop-limit,sell-stop-limit,buy-limit-fok, sell-limit-fok, buy-stop-limit-fok, sell-stop-limit-fok |
| accountId       | long     | 账户编号                                                     |
| source          | string   | 订单来源                                                     |
| orderPrice      | string   | 订单价格 （市价单无此字段）                                  |
| orderSize       | string   | 订单数量（市价买单无此字段）                                 |
| orderValue      | string   | 订单金额（仅市价买单有此字段）                               |
| clientOrderId   | string   | 用户自编订单号                                               |
| stopPrice       | string   | 订单触发价（仅止盈止损订单有此字段）                         |
| operator        | string   | 订单触发方向（仅止盈止损订单有此字段）                       |
| orderCreateTime | long     | 订单创建时间                                                 |
| remainAmt       | string   | 未成交量（对于市价买单，该字段定义为未成交额）               |
| orderStatus     | string   | 订单状态，有效值：canceled, partial-canceled                 |


## 订阅账户变更

API Key 权限：读取

订阅账户的余额更新。

### 订阅主题

`accounts.update#${mode}`

用户可选择以下任一账户变更推送的触发方式

1、仅在账户余额发生变动时推送；

2、在账户余额发生变动或可用余额发生变动时均推送，且分别推送。

3、在账户余额发生变动或可用余额发生变动时均推送，且一起推送。

注意：现货和合约之间的账户划转引起的账户余额变动，暂时没有消息推送。

### 订阅参数

| 参数 | 数据类型 | 描述                                 |
| ---- | -------- | ------------------------------------ |
| mode | integer  | 推送方式，有效值：0，1，2  默认值：0 |

订阅示例  

1、不填mode：  

accounts.update  

仅当账户余额变动时推送；  

2、填写mode=0：  

accounts.update#0  

仅当账户余额变动时推送；  

3、填写mode=1： 

accounts.update#1  

在账户余额发生变动或可用余额发生变动时均推送且分别推送。

4、填写mode=2：  

accounts.update#2

 在账户余额发生变动或可用余额发生变动时均推送且一起推送。

注：无论用户采用哪种模式订阅，在订阅成功后，服务器将首先推送当前各账户的账户余额与可用余额，然后再推送后续的账户更新。在首推各账户初始值时，消息中的changeType和changeTime的值为null。

> Subscribe request

```json
{
	"action": "sub",
	"ch": "accounts.update"
}
```

> Response

```json
{
	"action": "sub",
	"code": 200,
	"ch": "accounts.update#0",
	"data": {}
}
```

> Update example

```json
accounts.update#0：
{
	"action": "push",
	"ch": "accounts.update#0",
	"data": {
		"currency": "btc",
		"accountId": 123456,
		"balance": "23.111",
		"changeType": "transfer",
        "accountType":"trade",
        "seqNum": "86872993928",
		"changeTime": 1568601800000
	}
}

accounts.update#1：
{
	"action": "push",
	"ch": "accounts.update#1",
	"data": {
		"currency": "btc",
		"accountId": 33385,
		"available": "2028.699426619837209087",
		"changeType": "order.match",
        "accountType":"trade",
        "seqNum": "86872993928",
		"changeTime": 1574393385167
	}
}
{
	"action": "push",
	"ch": "accounts.update#1",
	"data": {
		"currency": "btc",
		"accountId": 33385,
		"balance": "2065.100267619837209301",
		"changeType": "order.match",
        "accountType":"trade",
        "seqNum": "86872993928",
		"changeTime": 1574393385122
	}
}
```

### 数据更新字段列表

| 字段        | 数据类型 | 描述                                                         |
| ----------- | -------- | ------------------------------------------------------------ |
| currency    | string   | 币种                                                         |
| accountId   | long     | 账户ID                                                       |
| balance     | string   | 账户余额（仅当账户余额发生变动时推送）                       |
| available   | string   | 可用余额（仅当可用余额发生变动时推送）                       |
| changeType  | string   | 余额变动类型，有效值：order-place(订单创建)，order-match(订单成交)，order-refund(订单成交退款)，order-cancel(订单撤销)，order-fee-refund(点卡抵扣交易手续费)，margin-transfer(杠杆账户划转)，margin-loan(借币本金)，margin-interest(借币计息)，margin-repay(归还借币本金币息)，deposit (充币）, withdraw (提币)，other(其他资产变化) |
| accountType | string   | 账户类型，有效值：trade, loan, interest                      |
| changeTime  | long     | 余额变动时间，unix time in millisecond                       |
| seqNum      | long     | 账户变更的序号                                               |

注：<br>
账户更新推送的是到账金额，多笔成交产生的多笔交易返佣可能会合并到帐。<br>

## 常见错误码

以下是WebSocket资产和订单接口的错误码、错误消息和说明。

| 错误码 | 错误消息                 | 说明                                                         |
| ------ | ------------------------ | ------------------------------------------------------------ |
| 200    | 正确                     | 正确返回                                                     |
| 100    | 超时关闭                 | 超时关闭                                                     |
| 400    | Bad Request              | 请求错误                                                     |
| 404    | Not Found                | 找不到服务                                                   |
| 429    | Too Many Requests        | 超过单机服务最大连接数或者超过单IP最大连接数                 |
| 500    | 系统异常                 | 系统错误                                                     |
| 2000   | invalid.ip               | 无效的ip                                                     |
| 2001   | nvalid.json              | 无效的请求json                                               |
| 2001   | invalid.authType         | 验签方式错误                                                 |
| 2001   | invalid.action           | 无效的订阅事件                                               |
| 2001   | invalid.symbol           | 无效的交易对                                                 |
| 2001   | invalid.ch               | 无效的订阅                                                   |
| 2001   | invalid.exchange         | 无效的交易所code                                             |
| 2001   | missing.param.auth       | 缺少验签参数                                                 |
| 2002   | invalid.auth.state       | 认证未通过                                                   |
| 2002   | auth.fail                | 验签失败，包括API Key绑定的IP错误                            |
| 2003   | query.account.list.error | 查询账户列表失败                                             |
| 4000   | too.many.request         | 客户端上行请求限频（单个实例50次/秒）                        |
| 4000   | too.many.connection      | 同一个API Key的建联数量超过服务器单个实例限制（单个实例最多连接10个） |

# 稳定币

## 简介

稳定币接口提供了价格查询和兑换功能。

## 稳定币兑换价格查询

 - GET `v1/stable-coin/quote`

API Key 权限：读取

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述                       | 取值范围         |
| -------- | -------- | ------ | -------------------------- | ---------------- |
| currency | true     | string | 与HUSD兑换的稳定币币种     | PAX/USDC/TUSD    |
| amount   | true     | string | 与HUSD兑换的稳定币币种数量 | amount必须为整数 |
| type     | true     | string | 兑换方向                   | buy兑入/sell兑出 |

### 响应数据

| 参数名称       | 是否必须 | 数据类型 | 描述                       | 取值范围                                                     |
| -------------- | -------- | -------- | -------------------------- | ------------------------------------------------------------ |
| currency       | true     | string   | 与HUSD兑换的稳定币币种     | PAX/USDC/TUSD                                                |
| amount         | true     | string   | 与HUSD兑换的稳定币币种数量 | 因兑换账户额度等因素影响，返回的amount可能会比请求的amount小 |
| type           | true     | string   | 兑换方向                   | buy兑入/sell兑出                                             |
| exchangeAmount | true     | string   | 匹配的HUSD数量             | type=buy时，exchangeAmount为用户所需支付的husd数量；type=sell时，exchangeAmount为用户可获得的husd数量 |
| exchangeFee    | true     | string   | 手续费金额 （单位：HUSD）  |                                                              |
| quoteId        | true     | string   | 该次稳定币报价唯一ID       |                                                              |
| expiration     | true     | string   | 确认兑换有效期             | 时间（一般为接口请求时间向后延伸10秒）                       |

## 兑换稳定币

 - POST `v1/stable-coin/exchange`

API Key 权限：交易

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述                 | 取值范围 |
| -------- | -------- | ------ | -------------------- | -------- |
| quote-id | true     | string | 该次稳定币报价唯一ID |          |

### 响应数据

| 参数名称        | 是否必须 | 数据类型 | 描述                       | 取值范围                                                     |
| --------------- | -------- | -------- | -------------------------- | ------------------------------------------------------------ |
| transact-id     | true     | long     | 兑换记录ID                 |                                                              |
| currency        | true     | string   | 与HUSD兑换的稳定币币种     | PAX/USDC/TUSD                                                |
| amount          | true     | string   | 与HUSD兑换的稳定币币种数量 |                                                              |
| type            | true     | string   | 兑换方向                   | buy兑入/sell兑出                                             |
| exchange-amount | true     | string   | 匹配的HUSD数量             | type=buy时，exchange-amount为用户所需支付的husd数量；type=sell时，exchange-amount为用户可获得的husd数量 |
| exchange-fee    | true     | string   | 手续费金额 （单位：HUSD）  |                                                              |
| time            | true     | long     | 时间戳                     |                                                              |

## 常见错误码

以下是是稳定币接口的错误码和说明。

| 响应码                         | 说明                                             |
| ------------------------------ | ------------------------------------------------ |
| invalid-currency               | 币种无效                                         |
| invalid-amount                 | 币种数量小于最低值（1000）或大于当前可兑换额度   |
| invalid-type                   | type不为sell或buy                                |
| quote-exceed-price-limit       | 报价超过合理范围（小于0.9或者大于1.1）           |
| quote-exceed-time-limit        | 报价时间已经过期                                 |
| quote-failure                  | 后端其他错误引起的后端其他错误引起的价格查询失败 |
| invalid-quote-id               | 无效的quote-id                                   |
| insufficient-balance           | 可用余额不足                                     |
| insufficient-quota             | 稳定币限额不足/超出稳定币限额                    |
| exchange-failure               | 后端其他错误引起的兑换失败                       |
| Base-user-request-exceed-limit | 您的操作太频繁，请稍后再试                       |

# 杠杆ETP

## 简介

杠杆ETP接口提供了ETP的换入、换出、调仓、查询等功能。

## 基础参考信息

用户可以通过该接口取得关于杠杆ETP换入换出的基础参考信息。

### HTTP 请求

- GET `/v2/etp/reference`

公共数据接口

### 请求参数

| 名称    | 类型 | 是否必需 | 描述                             |      |
| ------- | ---- | -------- | -------------------------------- | ---- |
| etpName | true | string   | 杠杆ETP名称 (for example: btc3l) |      |

> Response:

```json
{
    "data": {
        "etpStatus": "normal",
        "creationQuota": {
            "maxCreationValue": "10000",
            "minCreationValue": "200",
            "dailyCreationValue": "50000",
            "creationCurrency": "btc3l"
        },
        "maxRedemptionAmount": "1000",
        "minRedemptionAmount": "50",
        "dailyRedemptionAmount": "5000",
        "creationFeeRate": "0.0035",
        "redemptionFeeRate": "0.0035",
        "displayName": "BTC*3/USDT",
        "etpName": "btc3l"
    },
    "code": 200,
    "success": true
}
```

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	\<data\>	|	object	|	TRUE	|	|
|	etpName	    |	string	|	TRUE	|杠杆ETP名称	|
|	displayName	|	string	|	TRUE	|杠杆ETP显示名称	|
|	\<creationQuota\>	|	object	|	TRUE	|	|
|	maxCreationValue	|	int	|	TRUE	|单次最大申购金额	|
|	minCreationValue	|	int	|	TRUE	|单次最小申购金额	|
|	dailyCreationValue	|	int	|	TRUE	|单日最大申购金额	|
|	creationCurrency 	|	string	|	TRUE	|申购金额单位（计价币种）	|
|	\</creationQuota\>	|	 	|	 	|	|
|	maxRedemptionAmount	|	int	|	TRUE	|单次最大赎回数量	|
|	minRedemptionAmount	|	int	|	TRUE	|单次最小赎回数量	|
|	dailyRedemptionAmount	|	int	|	TRUE	|单日最大赎回数量	|
|	creationFeeRate	|	float	|	TRUE	|申购费率	|
|	redemptionFeeRate	|	float	|	TRUE	|赎回费率	|
|	etpStatus   |	string	|	TRUE	|ETP申购赎回状态（normal, creation-only, redemption-only, halted）	|
|	\<data\>	|	 	|	 	|	|


## 杠杆ETP换入

用户可以通过该接口换入杠杆ETP。

### HTTP 请求

- POST `/v2/etp/creation`

API Key 权限：交易<br>
限频值：2次/秒<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	etpName	|	string	|	TRUE	| 杠杆ETP名称 (for example: btc3l)	|
|	value	|	float	|	TRUE	| 申购金额（基于计价币种）		|
|	currency	|	string	|	TRUE	| 申购金额单位（计价币种）	|

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	\<data\>    	|	object	|	TRUE	|	|
|	transactId  	|	long	|	TRUE	|交易ID	|
|	transactTime 	|	long	|	TRUE	|交易时间（unix time in millisecond）	|
|	\</data\>    	|	 	|	 	|	|

注：
返回transactId 不意味着申购成功，用户须在申购后通过查询交易记录确认该申购状态。


## 杠杆ETP换出

用户可以通过该接口换出杠杆ETP。

### HTTP 请求

- POST `/v2/etp/redemption`

API Key 权限：交易<br>
限频值：2次/秒<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	etpName	|	string	|	TRUE	| ETP名称 (for example: btc3l)	|
|	currency	|	string	|	TRUE	| 赎回币种（计价币种）	|
|	amount	|	float	|	TRUE	| 赎回数量	|

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	\<data\>    	|	object	|	TRUE	|	|
|	transactId	    |	long	|	TRUE	|交易ID	|
|	transactTime 	|	long	|	TRUE	|交易时间（unix time in millisecond）	|
|	\</data\>    	|	 	|	 	|	|

注：
返回transactId不意味着赎回成功，用户须在赎回后通过查询交易记录确认该赎回状态。


## 获取杠杆ETP申赎记录

用户可以通过该接口获取杠杆ETP申赎记录。

### HTTP 请求

- GET `/v2/etp/transactions`

API Key 权限：读取<br>
限频值：2次/秒<br>
按transactTime检索<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	etpNames	|	string	|	TRUE	| ETP名称， for example: btc3，仅支持单个查询 |
|	currencies	|	string	|	FALSE	| 计价币种（仅对transactTypes=creation有效；可多填，以逗号分隔；缺省值：该ETP下所有计价币种）	|
|	transactTypes	|	string	|	TRUE	| 交易类型（可多填，以逗号分隔；有效值：creation, redemption；缺省值：所有交易类型）	|
|	transactStatus	|	string	|	FALSE	|交易状态，有效值：completed, processing, clearing, rejected，仅支持单个查询	|
|	startTime|	long	|	FALSE	|远点时间（unix time in millisecond；取值范围：[(endTime - 10天), endTime]；缺省值：(endTime - 10天)）	|
|	endTime|	long	|	FALSE	|近点时间（unix time in millisecond；取值范围：[(当前时间 - 180天), 当前时间]；缺省值：当前时间）	|
|	sort|	string	|	FALSE	|检索方向（有效值：asc 由远及近, desc 由近及远；缺省值：desc）	|
|	limit|	integer	|	FALSE	|单页最大返回条目数量（取值范围：[1-500]；缺省值：100）	|
|	fromId	|	long	|	FALSE	| 查询起始编号（仅对翻页查询有效）	|

注：<br>
startTime与endTime构成查询窗口，窗口最大可设置为10天，窗口可在“之前180天”与“当前时间”范围内平移。<br>

> Response

```json
{
    "code": 200,
    "data": [
        {
            "currency": "btc3l",
            "feeCurrency": "usdt",
            "transactValue": "90.812020468704123849",
            "transactPrice": "77.40447942",
            "transactId": "9054329",
            "transactTime": 1621405496048,
            "transactType": "redemption",
            "transactAmount": "1.17321402",
            "transactAmountOrig": "1.1733",
            "transactValueOrig": null,
            "transactFee": "0.090812020468704123",
            "transactStatus": "completed",
            "errCode": null,
            "etpName": "btc3lusdt",
            "errMessage": null
        }
    ]
}
```

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	\<data\>	|	object	|	TRUE	|按用户指定sort方向排列	|
|	etpName	|	string	|	TRUE	| 杠杆ETP名称	|
|	transactId	|	long	|	TRUE	|交易ID	|
|	transactTime	|	long	|	TRUE	|交易时间（unix time in millisecond）	|
|	transactType	|	string	|	TRUE	|交易类型（有效值：creation, redemption）	|
|	transactAmount	|	float	|	TRUE	| 实际交易数量（基础币种）	|
|	transactAmountOrig	|	float	|	FALSE	| 原始赎回数量（基于基础币种；仅对transactType=redemption有效）	|
|	transactValue	|	float	|	TRUE	| 实际交易金额（计价币种）	|
|	transactValueOrig	|	float	|	FALSE	| 原始申购金额（基于计价币种；仅对transactType=creation有效）	|
|	transactPrice	|	float	|	TRUE	| 实际交易价格（基于计价币种）	|
|	currency	|	string	|	TRUE	| 计价币种	|
|	transactFee	|	float	|	TRUE	| 交易手续费	|
|	feeCurrency	|	string	|	TRUE	| 交易手续费币种	|
|	transactStatus	|	string	|	TRUE	|交易状态（有效值：completed, processing, clearing, rejected）	|
|	errCode	    |	integer	|	FALSE	|错误码（仅对transactStatus=rejected有效）	|
|	errMessage 	|	string	|	FALSE	|错误描述（仅对transactStatus=rejected有效）	|
|	\</data\>	|	 	|	 	|  	|
|	nextId	|	long	|	FALSE	| 下页查询起始编号（仅在存在下页数据时返回）	|

注：<br>
如用户查询时，实际交易数量、实际交易金额、实际交易价格尚未生成，字段transactAmount、transactValue、transactPrice更新为空。<br>

## 获取特定杠杆ETP申赎记录

用户可以通过该接口获取特定杠杆ETP申赎记录。

### HTTP 请求

- GET `/v2/etp/transaction`

API Key 权限：读取<br>
限频值：2次/秒<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	transactId	|	long	|	TRUE	|交易ID	|

> Response

```json
{
    "data": {
        "currency": "btc3l",
        "etpName": "btc3lusdt",
        "errCode": null,
        "feeCurrency": "usdt",
        "transactId": "9054329",
        "transactTime": 1621405496048,
        "transactType": "redemption",
        "transactAmount": "1.17321402",
        "transactAmountOrig": "1.1733",
        "transactValue": "90.812020468704123849",
        "transactValueOrig": null,
        "transactPrice": "77.40447942",
        "transactFee": "0.090812020468704123",
        "transactStatus": "completed",
        "errMessage": null
    },
    "code": 200,
    "success": true
}
```

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	\<data\>	|	object	|	TRUE	|	|
|	etpName	    |	string	|	TRUE	| 杠杆ETP名称	|
|	transactId	|	long	|	TRUE	|交易ID	|
|	transactTime	|	long	|	TRUE	|交易时间（unix time in millisecond）	|
|	transactType	|	string	|	TRUE	|交易类型（有效值：creation, redemption）	|
|	transactAmount	|	float	|	TRUE	| 实际交易数量（基础币种）	|
|	transactAmountOrig	|	float	|	FALSE	| 原始赎回数量（基于基础币种；仅对transactType=redemption有效）	|
|	transactValue	|	float	|	TRUE	| 实际交易金额（计价币种）	|
|	transactValueOrig	|	float	|	FALSE	| 原始申购金额（基于计价币种；仅对transactType=creation有效）	|
|	transactPrice	|	float	|	TRUE	| 实际交易价格（基于计价币种）	|
|	currency	|	string	|	TRUE	| 计价币种	|
|	transactFee	|	float	|	TRUE	| 交易手续费	|
|	feeCurrency	|	string	|	TRUE	| 交易手续费币种	|
|	transactStatus	|	string	|	TRUE	|交易状态（有效值：completed, processing, clearing, rejected）	|
|	errCode	|	integer	|	FALSE	|状态码（仅对transactStatus=rejected有效）	|
|	errMessage 	|	string	|	FALSE	|错误描述（仅对transactStatus=rejected有效）	|
|	\</data\>	|	 	|	 	|	|

注：<br>
如用户查询时，实际交易数量、实际交易金额、实际交易价格尚未生成，字段transactAmount、transactValue、transactPrice更新为空。<br>

## 获取杠杆ETP调仓记录

用户可以通过该接口获取杠杆ETP调仓记录。

### HTTP 请求

- GET `/v2/etp/rebalance`

公共数据接口<br>
按rebalTime检索<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	symbol	|	string	|	TRUE	| ETP交易代码 (for example: btc3lusdt)|
|	rebalTypes	|	string	|	FALSE	| 调仓类型（可多填，以逗号分隔；有效值：daily, adhoc；缺省值：所有类型）	|
|	startTime|	long	|	FALSE	|远点时间（unix time in millisecond；取值范围：[(endTime - 10天), endTime]；缺省值：(endTime - 10天)）	|
|	endTime|	long	|	FALSE	|近点时间（unix time in millisecond；取值范围：[(当前时间 - 180天), 当前时间]；缺省值：当前时间）	|
|	sort|	string	|	FALSE	|检索方向（有效值：asc 由远及近, desc 由近及远；缺省值：desc）	|
|	limit|	integer	|	FALSE	|单页最大返回条目数量（取值范围：[1-500]；缺省值：100）	|
|	fromId	|	long	|	FALSE	| 查询起始编号（仅对翻页查询有效）	|

注：<br>
startTime与endTime构成查询窗口，窗口最大可设置为10天，窗口可在“之前180天”与“当前时间”范围内平移。<br>

> Response

```json
{
    "code":200,
    "data":[
        {
            "symbol":"btc3lusdt",
            "rebalTime":1630944000192,
            "rebalType":"daily"
        },
        {
            "symbol":"btc3lusdt",
            "rebalTime":1630857600186,
            "rebalType":"daily"
        },
        {
            "symbol":"btc3lusdt",
            "rebalTime":1630771200185,
            "rebalType":"daily"
        }
    ],
    "nextId":8168108
}
```

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	\<data\>	|	object	|	TRUE	|按用户指定sort方向排列	|
|	symbol	    |	string	|	TRUE	|ETP交易代码	|
|	rebalTime	|	long	|	TRUE	|调仓时间（unix time in millisecond）	|
|	rebalType 	|	string	|	TRUE	|调仓类型（daily, adhoc）	|
|	\</data\>	|		|		|	|
|	nextId	|	long	|	FALSE	| 下页查询起始编号（仅在存在下页数据时返回）	|



## 杠杆ETP单个撤单

用户可以通过该接口进行杠杆ETP撤单。

### HTTP 请求

- POST `/v2/etp/{transactId}/cancel`

API Key 权限：交易<br>限频值：1次/秒<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	transactId	|	long	|	TRUE	| ETP交易ID|



> Response

```json

{
    "code": 80042,
    "message": "撤单失败，订单不存在"
}

```

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|




## 杠杆ETP批量撤单

用户可以通过该接口进行杠杆ETP批量撤单。

### HTTP 请求

- POST `/v2/etp/batch-cancel`

API Key 权限：交易<br>限频值：1次/5秒<br>

### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	transactId	|	long	|	TRUE	| ETP交易ID，例如："transactId":[65445,65446]|


> Response

```json
{
    "code":200,
    "data":{
        "success":[
            "5983466"
        ],
        "failed":[
            {
                "errMsg":"Cancellation of order failed, order does not exist",
                "transactId":"65445",
                "errCode":80043
            },
            {
                "errMsg":"Cancellation of order failed, order does not exist",
                "transactId":"65446",
                "errCode":80043
            }
        ]
    },
    "message":null
}
```

### 响应数据

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	--------	|	-----	|
|	code	|	integer	|	TRUE	|状态码	|
|	message	|	string	|	FALSE	|错误描述（如有）	|
|	\<data\>	|	object	|	TRUE	|	|
|	success	|	array	|	TRUE	|ETP撤单成功交易列表	|
|	\<failed\>	|	object	|	FALSE	| 	|
|	errMsg	|	long	|	FALSE	|撤单失败错误信息	|
|	errCode 	|	string	|	FALSE	|撤单失败错误码	|
|	transactId	|	long	|	FALSE	| 交易ID	|
|	\</failed\>	|	 	|	 	|  	|
|	\</data\>	|	 	|	 	|	|


## 获取ETP持仓限额

用户可以通过该接口查询ETP的持仓限额。

### HTTP 请求

- GET `/v2/etp/limit`

API Key 权限：交易<br>

限频值：1次/1秒<br>


### 请求参数

|	名称	|	类型	|	是否必需	|	描述	|
|	-----	|	----	|	------	|	-----	|
|	currency	|	string	|	TRUE	| 币种,支持批量查询(币种之间用英文逗号分隔)，单次最多可查10个币种|


> Response

```json
{
    "data": [
        {
            "remainingAmount": "48",
            "maxHoldings": "48",
            "currency": "btc3l"
        },
        {
            "remainingAmount": "7561552",
            "maxHoldings": "7561552",
            "currency": "btc3s"
        }
    ],
    "code": 200,
    "success": true
}
```

### 响应数据

| 名称             | 类型    | 描述             |
| ---------------- | ------- | ---------------- |
| code             | integer | 状态码           |
| message          | string  | 错误描述（如有） |
| \<data\>         | object  |       |
| currency         | string  | ETP交易代码      |
| maxHoldings      | string  | 持仓限额         |
| remainingAmount  | string  | 剩余额度         |
| \</data\>        |   |       |


## 常见错误码

以下是杠杆ETP接口的错误码、错误消息和说明。

| 错误码 | 错误消息                       | 说明                                                   |
| ------ | ------------------------------ | ------------------------------------------------------ |
| 1002   | 您所在的国家禁止申购赎回       | 用户注册或认证国籍不允许申赎                           |
| 2002   | 参数错误                       | 错误的币种传入                                         |
| 80007  | 申购关闭，订单已取消           | 申购关闭                                               |
| 80008  | 赎回关闭，订单已取消           | 赎回关闭                                               |
| 80009  | 申购金额不得低于{0}            | 小于最小下单量                                         |
| 80010  | 申购金额不得高于{0}            | 高于最大下单量                                         |
| 80011  | 个人今日可申购额度超限         | 个人单日申购已超出限额                                 |
| 80012  | 平台今日可申购额度超限         | 平台整体申购超出                                       |
| 80013  | 赎回数量不得低于{0}            | 小于最小下单量                                         |
| 80014  | 赎回数量不得高于{0}            | 高于最大下单量                                         |
| 80015  | 个人今日可赎回额度超限         | 人单日赎回已超出限额                                   |
| 80016  | 平台今日可赎回额度超限         | 平台整体赎回超出限额                                   |
| 80018  | 资产余额不足                   | 资产余额不足                                           |
| 80019  | 下单失败，请重试               | broker返回非已知错误异常                               |
| 80021  | 申购失败，订单已取消           | 用户申购金额过小，不足合约1张                          |
| 80022  | 赎回失败，订单已取消           | 用户赎回金额过小，不足合约1张                          |
| 80023  | 申购失败，订单已取消           | 行情波动较大，合约下单后计算用户需扣款金额大于下单金额 |
| 80024  | 赎回失败，订单已取消           | 行情波动较大，合约下单后计算用户需扣款金额大于下单金额 |
| 80026  | 系统繁忙，请稍后再试           | 超出订单排队队列                                       |
| 80027  | 赎回失败，订单已取消           | 没有份额可供用户赎回                                   |
| 80028  | 下单失败，超出该币种的持仓限额 | 下单失败，超出该币种的持仓限额                         |
| 80041  | 撤单失败，该订单已取消         | 撤单失败，该订单已取消                                 |
| 80042  | 撤单失败，该订单已执行         | 撤单失败，该订单已执行                                 |
| 80043  | 撤单失败，订单不存在           | 撤单失败，订单不存在                                   |
| 80045  | 撤单失败，系统繁忙，请稍后重试 | 调用broker等失败                                       |
| 80052  | 超出最大查询限制10             | 超出最大查询限制                                       |
