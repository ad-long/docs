---
title: 火币 API 文档

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.hbg.com/zh-cn/apikey/'>创建 API Key </a>
includes:

search: True
---

# 简介

## API 简介

欢迎使用火币合约 API！ 你可以使用此 API 获得市场行情数据，进行交易，并且管理你的账户。

在文档的右侧是代码示例，目前我们仅提供针对 `shell` 的代码示例。

你可以通过选择上方下拉菜单的版本号来切换文档对应的 API 版本，也可以通过点击右上方的语言按钮来切换文档语言。

## 做市商项目

<aside class="notice">
做市商项目不支持点卡抵扣、VIP、交易量相关活动以及任何形式的返佣活动。
</aside>

欢迎有优秀 maker 策略交易量大的用户参与长期合约做市商项目。如果您的火币交割合约账户中有折合大于 3 BTC 资产，或火币币本位永续合约账户中有折合大于 3 BTC 资产，或火币USDT本位永续合约账户中有大于 100000 USDT 资产，请提供以下信息到 Vip@global-hgroup.com（做市商项目不支持点卡抵扣、VIP、交易量相关活动以及任何形式的返佣活动）:

1. 提供火币UID （需不存在返佣关系的 UID）；
2. 提供其他交易平台 maker 交易量截图证明（比如30天内成交量，或者 VIP 等级等）；

# 更新日志

## 1.2.9 2021年5月17日 【修改：母子账户划转（新增选填入参：client_order_id）】

### 1、修改母子账户划转接口（新增选填入参：client_order_id）
 - 接口名称：母子账户划转
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_master_sub_transfer

## 1.2.8 2021年5月12日 【新增：跟踪委托订单接口】

### 1、新增跟踪委托订单下单接口
 - 接口名称：跟踪委托订单下单
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_track_order

### 2、新增跟踪委托订单撤单接口
 - 接口名称：跟踪委托订单撤单
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_track_cancel

### 3、新增跟踪委托订单全部撤单接口
 - 接口名称：跟踪委托订单全部撤单
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_track_cancelall

### 4、新增跟踪委托订单当前委托接口
 - 接口名称：跟踪委托订单当前委托
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_track_openorders

### 5、新增跟踪委托订单历史委托接口
 - 接口名称：跟踪委托订单历史委托
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_track_hisorders

## 1.2.7 2021年4月28日 【新增:获取市场最优挂单接口。修改：获取标记价格K线接口（支持symbol入参直接使用合约代码请求，例于：BTC210326）、订阅标记价格K线数据接口（支持symbol入参直接使用合约代码请求，例于：BTC210326）、请求标记价格K线数据接口（支持symbol入参直接使用合约代码请求，例于：BTC210326）】

### 1、新增获取市场最优挂单接口
 - 接口名称：获取市场最优挂单
 - 接口类型：公共接口
 - 接口URL：/market/bbo

### 2、修改获取标记价格K线接口（支持symbol入参直接使用合约代码请求，例于：BTC210326）
 - 接口名称：获取标记价格的K线数据
 - 接口类型：公共接口
 - 接口URL：/index/market/history/mark_price_kline

### 3、修改订阅标记价格K线数据接口（支持symbol入参直接使用合约代码请求，例于：BTC210326）
 - 接口名称：订阅标记价格K线数据
 - 接口类型：公共接口
 - 订阅地址：market.$symbol.mark_price.$period

### 4、修改请求标记价格K线数据接口（支持symbol入参直接使用合约代码请求，例于：BTC210326）
 - 接口名称：请求标记价格K线数据
 - 接口类型：公共接口
 - 订阅地址：market.$symbol.mark_price.$period

## 1.2.6 2021年3月15日 【新增：获取标记价格K线接口、订阅标记价格K线数据接口、请求标记价格K线数据接口】

### 1、新增获取标记价格K线接口
 - 接口名称：获取标记价格的K线数据
 - 接口类型：公共接口
 - 接口URL：/index/market/history/mark_price_kline

### 2、新增订阅标记价格K线数据接口
 - 接口名称：订阅标记价格K线数据
 - 接口类型：公共接口
 - 订阅地址：market.$symbol.mark_price.$period

### 3、新增请求标记价格K线数据接口
 - 接口名称：请求标记价格K线数据
 - 接口类型：公共接口
 - 订阅地址：market.$symbol.mark_price.$period

## 1.2.5 2021年2月26日 【新增：获取账户总资产估值接口。修改获取合约最高限价和最低限价接口（支持用户所有入参都不填，接口返回所有当前上市合约的限价数据。）、修改获取市场最近成交记录接口（支持用户所有入参都不填，接口返回所有当前上市合约的最近成交数据；当用户不传入参时， 返参ch值为market.*trade.detail。在返参tick下新增字段：symbol。）】

### 1、新增获取账户总资产估值接口
 - 接口名称：获取账户总资产估值
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_balance_valuation

### 2、修改获取合约最高限价和最低限价接口（支持用户所有入参都不填，接口返回所有当前上市合约的限价数据。）
 - 接口名称：获取合约最高限价和最低限价
 - 接口类型：共公接口
 - 接口URL：/api/v1/contract_price_limit

### 3、修改获取市场最近成交记录接口（支持用户所有入参都不填，接口返回所有当前上市合约的最近成交数据；当用户不传入参时， 返参ch值为market.*trade.detail。在返参tick下新增字段：symbol。）
 - 接口名称：获取市场最近成交记录
 - 接口类型：共公接口
 - 接口URL：/market/trade

## 1.2.4 2021年2月5日【新增：获取平台阶梯保证金接口、批量设置子账户交易权限接口、批量获取子账户资产信息接口。4-7 修改接口，新增字段。8 查询用户结算记录接口（为避免影响系统性能，接口仅支持查询最近90天用户结算记录）】

### 1、新增获取平台阶梯保证金接口
 - 接口名称：获取平台阶梯保证金
 - 接口类型：公共接口
 - 接口URL：/api/v1/contract_ladder_margin

### 2、新增批量设置子账户交易权限接口
 - 接口名称：批量设置子账户交易权限
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_sub_auth

### 3、新增批量获取子账户资产信息接口
 - 接口名称：批量获取子账户资产信息
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_sub_account_info_list

### 4、修改获取市场最近成交记录接口（返参data参数下新增quantity，表示成交量（币）。计算公式：成交量（币） = 成交量（张）* 合约面值/成交价格）
 - 接口名称：获取市场最近成交记录
 - 接口类型：公共接口
 - 接口URL：/market/trade

### 5、修改批量获取最近的交易记录接口（返参data参数下内层data中新增quantity，表示成交量（币）。计算公式：成交量（币） = 成交量（张）* 合约面值/成交价格）
 - 接口名称：批量获取最近的交易记录
 - 接口类型：公共接口
 - 接口URL：/market/history/trade

### 6、修改订阅 Trade Detail 数据接口（返参tick参数下的data参数中新增quantity，表示成交量（币）。计算公式：成交量（币） = 成交量（张）* 合约面值/成交价格）
 - 接口名称：订阅 Trade Detail 数据
 - 接口类型：公共接口
 - 订阅地址：market.$symbol.trade.detail

### 7、修改请求 Trade Detail 数据接口（返参data参数中新增quantity，表示成交量（币）。计算公式：成交量（币） = 成交量（张）* 合约面值/成交价格）
 - 接口名称：请求 Trade Detail 数据
 - 接口类型：公共接口
 - 订阅地址：market.$symbol.trade.detail

### 8、修改查询用户结算记录接口（为避免影响系统性能，接口仅支持查询最近90天用户结算记录）
 - 接口名称：查询用户结算记录
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_user_settlement_records


## 1.2.3 2021年1月29日 【新增：批量获取聚合行情接口。 2-14 修改接口，新增字段。修改：计划委托订单的订单ID由原本的自然数自增ID 改为长度为 18 位的唯一标识ID。推荐使用下单后返回的 order_id_str（字符串类型的订单 ID），避免发生长度过大而被系统截断的情况。】

### 1、新增批量获取聚合行情接口
 - 接口名称：批量获取聚合行情
 - 接口类型：公共接口
 - 接口URL：/market/detail/batch_merged

### 2、修改全部撤单接口（请求参数新增 2 个选填字段:direction，表示买卖方向，不填默认撤销全部。参数可选值为“buy”:买，“sell”:卖。 offset，表示开平方向，不填默认撤销全部。参数可 选值为“open”:开仓，“close”:平仓。）
 - 接口名称：全部撤单
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_cancelall

### 3、修改获取合约订单信息接口（返参data中新增real_profit字段，表示真实收益，类型decimal）
 - 接口名称：获取合约订单信息
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_order_info

### 4、修改获取订单明细信息接口（返回参数中的 data 和 trades 下各新增以下字段:real_profit(真实收益)。同时 trades 下新增每笔成交收益字段：profit（平仓盈亏））
 - 接口名称：获取订单明细信息
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_order_detail	

### 5、修改获取合约当前未成交委托接口（请求参数新增选填 2 个字段:sort_by，表示排序字段，不填默认按创建时间倒序。参数可选值为“created_at”(按照创建时间倒序)，“update_time”(按照更新时间倒 序)。trade_type，表示交易类型，不填默认查询全部。参数可选值为 0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多。返回参数中的 orders 下新增以下字段:update_time(订单更新时间，单位毫秒)、 real_profit(真实收益)。）
 - 接口名称：获取合约当前未成交委托接口
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_openorders

### 6、修改获取合约历史委托接口（返参orders中新增real_profit字段，表示真实收益，类型decimal）
 - 接口名称：获取合约历史委托
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_hisorders

### 7、修改组合查询合约历史委托接口（返参orders中新增real_profit字段，表示真实收益，类型decimal）
 - 接口名称：组合查询合约历史委托
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_hisorders_exact

### 8、修改获取历史成交记录接口（返参trades中新增real_profit字段，表示真实收益，类型decimal）
 - 接口名称：获取历史成交记录
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_matchresults

### 9、修改组合查询历史成交记录接口（返参trades中新增real_profit字段，表示真实收益，类型decimal）
 - 接口名称：组合查询历史成交记录
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_matchresults_exact

### 10、修改订阅订单成交数据接口（返参外层新增real_profit字段，表示真实收益，类型decimal.返参trade中新增：real_profit字段，表示真实收益、profit字段，表示平仓盈亏。）
 - 接口名称：订阅订单成交数据
 - 接口类型：私有接口
 - 订阅地址：orders.$symbol

### 11、修改计划委托全部撤单接口（请求参数新增 2 个选填字段:direction，表示买卖方向，不填默认撤销全部。参数可选值为“buy”:买，“sell”:卖。offset，表示开平方向，不填默认撤销全部。参数可 选值为“open”:开仓，“close”:平仓。）
 - 接口名称：计划委托全部撤单
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_trigger_cancelall

### 12、修改止盈止损订单全部撤单接口（请求参数新增选填字段:direction，表示买卖方向，不填默认撤销全部。参数可选值为“buy”:买，“sell”:卖。）
 - 接口名称：止盈止损订单全部撤单
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_tpsl_cancelall

### 13、修改查询计划委托当前委托接口（请求参数新增选填字段:trade_type，表示交易类型，不填默认查询全部。参数可选值为 0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多。）
 - 接口名称：查询计划委托当前委托
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_trigger_openorders

### 14、修改查询止盈止损订单当前委托接口（请求参数新增选填字段:trade_type，表示交易类型，不填默认查询全部。参数可选值为 0:全部,3: 买入平空,4: 卖出平多。）
 - 接口名称：查询止盈止损订单当前委托
 - 接口类型：私有接口
 - 接口URL：/api/v1/contract_tpsl_openorders

## 1.2.2 2021年01月12号 【1 新增获取预估结算价。2-7 新增止盈止损API接口，8-23 修改接口，新增字段。新增【合约策略订单】一级菜单，将本次新增的双向止盈止损相关接口以及原有的计划委托相关接口挪到该菜单下】

### 1、新增获取预估结算价
 - 接口名称: 获取预估结算价
 - 接口类型: 公共接口
 - 接口URL: /api/v1/contract_estimated_settlement_price

### 2、新增对仓位设置止盈止损订单
 - 接口名称: 对仓位设置止盈止损订单
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_tpsl_order

### 3、新增止盈止损订单撤单接口
 - 接口名称: 止盈止损订单撤单
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_tpsl_cancel

### 4、新增止盈止损订单全部撤单接口
 - 接口名称: 止盈止损订单全部撤单
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_tpsl_cancelall

### 5、新增查询止盈止损订单当前委托接口
 - 接口名称: 查询止盈止损订单当前委托
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_tpsl_openorders

### 6、新增查询止盈止损订单历史委托接口
 - 接口名称: 查询止盈止损订单历史委托
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_tpsl_hisorders

### 7、新增查询开仓单关联的止盈止损订单详情接口
 - 接口名称: 查询开仓单关联的止盈止损订单详情
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_relation_tpsl_order

### 8、修改合约下单接口（新增选填入参：tp_trigger_price（止盈触发价格）、tp_order_price（止盈委托价格）、tp_order_price_type（止盈委托类型）、sl_trigger_price（止损触发价格）、sl_order_price（止损委托价格）、sl_order_price_type（止损委托类型）。）
 - 接口名称: 合约下单
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_order

### 9、修改合约批量下单接口（在入参orders_data中新增选填参数：tp_trigger_price（止盈触发价格）、tp_order_price（止盈委托价格）、tp_order_price_type（止盈委托类型）、sl_trigger_price（止损触发价格）、sl_order_price（止损委托价格）、sl_order_price_type（止损委托类型）。）
 - 接口名称: 合约批量下单
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_batchorder

### 10、修改获取合约订单信息接口（新增返回参数：is_tpsl(表示是否设置止盈止损，1：是；0：否),在返回参数order_source订单来源新增枚举值（tpsl:止盈止损触发））
 - 接口名称: 获取合约订单信息
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_order_info

### 11、修改获取订单明细信息接口（新增返回参数：is_tpsl(表示是否设置止盈止损，1：是；0：否),在返回参数order_source订单来源新增枚举值（tpsl:止盈止损触发））
 - 接口名称: 获取订单明细信息	
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_order_detail

### 12、修改获取合约当前未成交委托接口（新增返回参数：is_tpsl(表示是否设置止盈止损，1：是；0：否),在返回参数order_source订单来源新增枚举值（tpsl:止盈止损触发））
 - 接口名称: 获取合约当前未成交委托
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_openorders

### 13、修改获取合约历史委托接口（新增入参：sort_by(表示：排序字段，可选值为“create_date”，“update_time”)。新增返回参数：is_tpsl(表示是否设置止盈止损，1：是；0：否),update_time（表示：订单的更新时间）,在返回参数order_source订单来源新增枚举值（tpsl:止盈止损触发））
 - 接口名称: 获取合约历史委托
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_hisorders

### 14、修改组合查询合约历史委托接口（新增返回参数：is_tpsl(表示是否设置止盈止损，1：是；0：否),在返回参数order_source订单来源新增枚举值（tpsl:止盈止损触发））
 - 接口名称: 组合查询合约历史委托
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_hisorders_exact

### 15、修改订阅订单成交数据接口（新增返回参数：is_tpsl(表示是否设置止盈止损，1：是；0：否),在返回参数order_source订单来源新增枚举值（tpsl:止盈止损触发））
 - 接口名称: 订阅订单成交数据
 - 接口类型: 私有接口
 - 订阅主题: orders.$symbol

### 16、修改订阅订单撮合数据接口（新增返回参数：is_tpsl(表示是否设置止盈止损，1：是；0：否),在返回参数order_source订单来源新增枚举值（tpsl:止盈止损触发））
 - 接口名称: 订阅订单撮合数据	
 - 接口类型: 私有接口
 - 订阅主题: matchOrders.$symbol

### 17、修改获取计划委托历史委托接口（新增入参：sort_by(表示：排序字段，可选值为“created_at”，“update_time”)。新增返回参数：update_time（表示：订单的更新时间））
 - 接口名称: 获取计划委托历史委托	
 - 接口类型: 私有接口
 - 接口URL: /api/v1/contract_trigger_hisorders

### 18、修改查询K线数据（支持查询已下市四周内的合约的K线数据（即到期日在过去最近四周的合约），可输入已下市四周内的合约的合约代码进行查询K线数据。）
 - 接口名称: 查询K线数据
 - 接口类型: 公共接口
 - 接口URL: market/history/kline

### 19、修改请求K线数据（支持查询已下市四周内的合约的K线数据（即到期日在过去最近四周的合约），可输入已下市四周内的合约的合约代码进行查询K线数据。）
 - 接口名称: 请求K线数据
 - 接口类型: 公共接口
 - 订阅主题: market.$symbol.kline.$period

### 20、修改获取当前可用合约总持仓量（在返回参数data中新增trade_volume：最近24小时成交量（张），trade_amount：最近24小时成交量（币），trade_turnover：最近24小时成交额。这三个字段 ）
 - 接口名称: 获取当前可用合约总持仓量
 - 接口类型: 公共接口
 - 接口URL: /api/v1/contract_open_interest

### 21、修改订阅Market Detail数据（在返参tick中新增ask表示卖一，bid表示买一。）
 - 接口名称: 订阅Market Detail数据
 - 接口类型: 公共接口
 - 订阅主题: market.$symbol.detail

### 22、修改获取合约信息接口（新增返回参数：settlement_time（表示下次结算时间（毫秒时间戳）），delivery_time（表示交割时间（毫秒时间戳）））
 - 接口名称: 获取合约信息
 - 接口类型: 公共接口
 - 接口URL: /api/v1/contract_contract_info

### 23、修改订阅合约信息变动（新增返回参数：settlement_time（表示下次结算时间（毫秒时间戳）），delivery_time（表示交割时间（毫秒时间戳）））
 - 接口名称: 订阅合约信息变动
 - 接口类型: 公共接口
 - 订阅主题: public.$symbol.contract_info


## 1.2.1 2020年12月2日 【修改获取订单明细信息接口（查询无成交撤单数据时，如果不传“created_at”和“order_type”参数，由原来的只能查询到最近12小时数据，改为只能查询到最近2小时数据）；修改获取合约历史委托接口（查询无成交撤单数据时，由原来的只保留最近24小时数据，改为只保留最近2小时数据。）；修改组合查询合约历史委托接口（查询无成交撤单数据时，由原来的只保留最近24小时数据，改为只保留最近2小时数据。）】

### 1、修改获取订单明细信息接口（查询无成交撤单数据时，如果不传“created_at”和“order_type”参数，由原来的只能查询到最近12小时数据，改为只能查询到最近2小时数据）

   - 接口名称：获取订单明细信息

   - 接口类型：私有接口

   - 接口URL：api/v1/contract_order_detail

### 2、修改获取合约历史委托接口（查询无成交撤单数据时，由原来的只保留最近24小时数据，改为只保留最近2小时数据。）

  - 接口名称：获取合约历史委托

  - 接口类型：私有接口

  - 接口URL：api/v1/contract_hisorders

### 3、修改组合查询合约历史委托接口（查询无成交撤单数据时，由原来的只保留最近24小时数据，改为只保留最近2小时数据。）

  - 接口名称：组合查询合约历史委托

  - 接口类型：私有接口
    
  - 接口URL：api/v1/contract_hisorders_exact

## 1.2.0 2020年11月24日 【新增：查询平台历史结算记录；修改：获取强平订单接口新增返参字段，订阅强平订单数据接口新增返参字段】

### 1、新增查询平台历史结算记录接口

  - 接口名称：查询平台历史结算记录
  
  - 接口类型：公共接口
  
  - 接口URL：api/v1/contract_settlement_records

### 2、获取强平订单接口新增返参字段（返回参数中的 orders 参数下增加 amount 字段，表示强平数量(币)）

  - 接口名称：获取强平订单接口
  
  - 接口类型：公共接口
  
  - 接口URL：api/v1/contract_liquidation_orders

### 3、订阅强平订单数据接口新增返参字段（返回参数中的data参数下增加amount字段，表示强平数量(币)）

  -  接口名称：订阅强平订单数据
  
  -  接口类型：公共接口
  
  -  订阅主题：public.$symbol.liquidation_orders

## 1.1.9 2020年10月28日 【新增：1、新增组合查询财务记录接口、组合查询合约历史委托接口、组合查询历史成交记录接口。】

### 1、新增组合查询合约历史成交记录接口

  - 接口名称：组合查询合约历史成交记录

  - 接口类型：私有接口

  - 接口地址：api/v1/contract_matchresults_exact

### 2、新增组合查询合约历史委托接口

  - 接口名称：组合查询合约历史委托

  - 接口类型：私有接口

  - 接口地址：api/v1/contract_hisorders_exact
  
### 3、新增组合查询财务记录接口

  - 接口名称：组合查询财务记录

  - 接口类型：私有接口

  - 接口地址：api/v1/contract_financial_record_exact

## 1.1.8 2020年10月15日 【新增：切换杠杆倍数接口；修改：切换杠杆成功时 WS 资产接口推送更新信息，切换杠杆成功时 WS 持仓接口推送更新信息，订单撮合推送接口新增返参字段，获取合约订单信息接口（将原支持查询 24 小时的撤单数据改为支持查询 4 小时撤单数据）】

### 1、新增切换杠杆倍数接口

  - 接口名称：切换杠杆

  - 接口类型：私有接口

  - 接口地址：api/v1/contract_switch_lever_rate

### 2、订阅资产接口推送更新（返参event新增事件类型，switch_lever_rate表示切换倍数。在用户切换倍数成功时，需推送一次最新的资产信息，event为switch_lever_rate。）

  - 接口名称：订阅资产变动数据

  - 接口类型：私有接口

  - 订阅主题：accounts.$symbol

### 3、订阅持仓接口推送更新（返参event新增事件类型，switch_lever_rate表示切换杠杆。在用户切换杠杆倍数成功时，需推送一次最新的持仓信息（若用户持仓量为0，则不会触发推送），event为switch_lever_rate。）

  - 接口名称：订阅持仓变动数据

  - 接口类型：私有接口

  - 订阅主题：positions.$symbol 

### 4、订阅订单撮合推送接口更新（返回参数新增以下字段:direction(买卖方向)、offset (开平方向)、lever_rate(杠杆倍数)、price(委托价格)、created_at(创建时间)、order_source (订单来源)、order_price_type(订单报价类型)。）

  - 接口名称：订阅订单撮合推送

  - 接口类型：私有接口

  - 订阅主题：matchOrders.$symbol  

### 5、获取合约订单信息接口（将原支持查询 24 小时的撤单数据改为支持查询 4 小时撤单数据）

  - 接口名称：获取合约订单信息

  - 接口类型：私有接口

  - 接口地址：api/v1/contract_order_info

## 1.1.7 2020年10月10日 【新增：订阅系统状态更新推送的 WebSocket 接口】

### 1、新增订阅系统状态更新推送的 WebSocket 接口
  - 接口名称：订阅系统状态更新
  - 接口类型: 公共接口
  - 订阅主题：public.$service.heartbeat

## 1.1.6 2020年9月22日 【新增：市场行情接口已支持按照合约code调用，包括rest和ws接口。请求参数的“symbol”字段中，新增合约code类型，格式固定为“品种”、“年”、“月”、“日”，比如：BTC200925；通过合约code调用暂时只支持查询当前上市中的合约。】

### 1、获取行情深度数据
  - 接口名称：获取行情深度数据
  - 接口类型: 公共接口
  - 接口URL：/market/depth
  
### 2、获取K线数据
  - 接口名称：获取K线数据
  - 接口类型: 公共接口
  - 接口URL：/market/history/kline
  
### 3、获取聚合行情
  - 接口名称：获取聚合行情
  - 接口类型: 公共接口
  - 接口URL：/market/detail/merged
  
### 4、获取市场最近成交记录
  - 接口名称：获取市场最近成交记录
  - 接口类型: 公共接口
  - 接口URL：/market/trade
  
### 5、批量获取最近的交易记录
  - 接口名称：批量获取最近的交易记录
  - 接口类型: 公共接口
  - 接口URL：/market/history/trade
  
### 6、订阅 KLine 数据
  - 接口名称：订阅 KLine 数据
  - 接口类型: 公共接口
  - 订阅主题：market.$symbol.kline.$period
  
### 7、请求 KLine 数据
  - 接口名称：请求 KLine 数据
  - 接口类型: 公共接口
  - 订阅主题：market.$symbol.kline.$period
  
### 8、订阅 Market Depth 数据
  - 接口名称：订阅 Market Depth 数据
  - 接口类型: 公共接口
  - 订阅主题：market.$symbol.depth.$type
  
### 9、订阅 Market Detail 数据
  - 接口名称：订阅 Market Detail 数据
  - 接口类型: 公共接口
  - 订阅主题：market.$symbol.detail
  
### 10、订阅 Trade Detail 数据
  - 接口名称：订阅 Trade Detail 数据
  - 接口类型: 公共接口
  - 订阅主题：market.$symbol.trade.detail
  
### 11、请求 Trade Detail 数据
  - 接口名称：请求 Trade Detail 数据
  - 接口类型: 公共接口
  - 订阅主题：market.$symbol.trade.detail
  
### 12、订阅 Market Depth 增量数据
  - 接口名称：订阅 Market Depth 增量数据
  - 接口类型: 公共接口
  - 订阅主题：market.$symbol.depth.size_${size}.high_freq
  
### 13、订阅买一卖一逐笔行情推送
  - 接口名称：订阅买一卖一逐笔行情推送
  - 接口类型: 公共接口
  - 订阅主题：market.$symbol.bbo
  

## 1.1.5 2020年8月6日 【新增：查询用户结算记录接口；订阅计划委托订单更新接口】

  
### 1、新增查询用户结算记录接口
  - 接口名称：查询用户结算记录

  - 接口类型：私有接口

  - 接口地址：api/v1/contract_user_settlement_records 

### 2、订阅计划委托订单更新

  - 接口名称：订阅计划委托订单更新

  - 接口类型：私有接口

  - 订阅主题：trigger_order.$symbol

## 1.1.4 2020年6月19日 【订阅订单撮合数据接口推送结果新增client_order_id字段】

### 1、订阅订单撮合数据接口推送结果新增client_order_id字段

  - 接口名称：订阅订单撮合数据

  - 接口类型： 私有接口
  
  - 订阅主题：matchOrders.$symbol

## 1.1.3 2020年6月14日 【增加合约信息变动 WS 接口; 增加买一卖一逐笔行情 WS 接口; 订阅 Market Depth 接口新增 4 个深度类型可选值; 新增查询用户可用杠杆倍数; 资产变动与持仓变动 WS 接口新增定期推送; 下单接口支持高倍杠杆; 优化查询订单相关接口的返回参数;私有推送接口新增 uid 返回参数;订单撮合推送接口新增字段;合约类型参数新增次季度合约】

### 1、增加合约信息变动ws推送接口

  - 接口名称：增加合约信息变动ws推送接口
  
  - 接口类型：公开接口

  - 订阅主题：public.$symbol.contract_info

### 2、增加买一卖一逐笔行情 WS 接口

  - 接口名称：订阅买一卖一逐笔行情推送

  - 接口类型：公开接口

  - 订阅主题：market.$symbol.bbo

### 3、订阅 Market Depth 接口新增 4 个深度类型可选值:step12、step13、step14、step15

  - 接口名称：订阅 Market Depth 数据

  - 接口类型：公开接口

  - 订阅主题：market.$symbol.depth.$type

### 4、新增查询用户可用杠杆倍数

  - 接口名称：查询用户可用杠杆倍数

  - 接口类型：私有

  - 接口地址：api/v1/contract_available_level_rate


### 5、资产变动WS 接口新增定期推送: 5秒一次定期推送

  - 接口名称：订阅资产变动数据

  - 接口类型：私有接口

  - 订阅主题： accounts.$symbol

### 6、仓位变动WS 接口新增定期推送: 5秒一次定期推送

  - 接口名称：订阅持仓变动数据

  - 接口类型：私有接口

  - 订阅主题：positions.$symbol

### 7、下单接口支持高倍杠杆

  - 接口名称：合约下单
  
  - 接口类型：私有接口
  
  - 接口地址：api/v1/contract_order


  - 接口名称：合约批量下单
  
  - 接口类型：私有接口
  
  - 接口地址：api/v1/contract_batchorder


  - 接口名称：合约计划委托下单
  
  - 接口类型：私有接口
  
  - 接口地址：api/v1/contract_trigger_order

### 8、获取订单明细信息接口返回参数,增加9个字段：fee（总手续费）、order_id（订单id）、order_id_str（string格式的订单id）、client_order_id（客户订单id）、order_type（订单类型）、status（订单状态）、trade_avg_price（成交均价）、trade_turnover（成交总金额）、trade_volume（成交总数量）

  - 接口名称：获取订单明细信息

  - 接口类型：私有接口

  - 接口地址：api/v1/contract_order_detail

### 9、获取订单信息接口返回参数,增加2个字段：liquidation_type（强平类型）、 canceled_at（撤单时间）

  - 接口名称：获取订单信息接口 

  - 接口类型：私有接口

  - 接口地址：api/v1/contract_order_info

### 10、订阅成交订单推送，增加2个字段：canceled_at（撤单时间）、fee_asset （手续费币种）

  - 接口名称：订阅成交订单推送

  - 接口类型：私有接口

  - 订阅主题：orders.$symbol

### 11、私有推送接口新增 uid 返回参数

  - 接口名称：订阅成交订单推送
  
  - 接口类型：私有接口
  
  - 订阅主题：orders.$symbol


  - 接口名称：订阅资产变动推送
  
  - 接口类型：私有接口
  
  - 订阅主题：accounts.$symbol


  - 接口名称：订阅持仓变动推送
  
  - 接口类型：私有接口
  
  - 订阅主题：positions.$symbol


  - 接口名称：订阅订单撮合推送
  
  - 接口类型：私有接口
  
  - 订阅主题：matchOrders.$symbol

### 12、订单撮合推送新增接口新增字段，在返回参数的外层新增两个字段：trade_volume（订单已成交数量） 、volume（订单总委托数量）

  - 接口名称：订阅订单撮合推送

  - 接口类型：私有接口

  - 订阅主题：matchOrders.$symbol

### 13、合约类型参数新增次季度合约,合约类型（contract_type）参数新增次季度合约可选值

  - 接口名称：行情市场、资产以及交易(restful及websocket)接口

  - 接口类型: 公开/私有


## 1.1.2 2020年4月9日 【增加：增加免鉴权的强平订单WS推送接口】

  - 接口名称：WS订阅强平订单(免鉴权)
  - 接口类型：公共接口
  - 订阅主题：public.$symbol.liquidation_orders


## 1.1.1 2020年3月12日 【增加：增加WS订阅推送指数K线数据接口；增加WS订阅推送基差数据接口；增加获取指数K线数据restful接口；增加获取基差数据restful接口】

### 1、增加WS订阅推送指数K线数据
  
   - 接口名称：WS指数K线推送
   - 接口类型：公共接口
   - 订阅主题：market.$symbol.index.$period

### 2、增加WS订阅推送基差数据

   - 接口名称：WS指数基差推送
   - 接口类型： 公共接口
   - 订阅主题：market.$symbol.basis.$period.$basis_price_type

### 3、增加restful接口获取指数K线数据

   - 接口名称： 获取指数K线数据
   - 接口类型： 公共接口
   - 接口URL：/index/market/history/index

### 4、增加restful接口获取基差数据

   - 接口名称：获取基差数据
   - 接口类型：公共接口
   - 接口URL：/index/market/history/basis

## 1.1.0 2020年3月5日【增加：增加母子账号划转；增加多个下单类型；WS增加撮合订单推送】

### 1、在Web端和API端新增合约母子账户资产划转功能，Web端只有母账户有划转权限，可以进行母转子或者子转母，但是不能进行子账户之间相互划转。API端划转只能通过母账户的API Key进行母子账户的互相划转。
 
#### 1.1、增加母子账户划转的API接口，母账户与每个子账户相互划转限频10次/分钟。

  - 接口名称：母子账户划转
  - 接口类型：私有接口
  - 接口URL：api/v1/contract_master_sub_transfer
 
#### 1.2、查询系统状态的接口增加母子划转权限参数，在返回参数的数组"data"中，增加两个字段："master_transfer_sub"、"sub_transfer_master"。
    
  - 接口名称：查询系统状态
  - 接口类型：公共接口
  - 接口URL：api/v1/contract_api_state
 
#### 1.3、增加查询母账户下的所有母子账户的划转记录的功能。
    
  - 接口名称：获取母账户下的所有母子账户划转记录
  - 接口类型：私有接口
  - 接口URL：api/v1/contract_master_sub_transfer_record
 
#### 1.4、返回财务记录的接口中，增加返回4种母子账户划转的流水
    
  - 接口名称：查询用户财务记录
  - 接口类型：私有接口
  - 接口URL：api/v1/contract_financial_record
 
### 2、合约资产接口和合约交易接口中涉及到更改的如下：

#### 2.1、获取下单量限制的接口增加10种订单价格类型，包括：opponent_ioc（对手价-IOC下单），lightning_ioc（闪电平仓-IOC下单），optimal_5_ioc（最优5档-IOC下单），optimal_10_ioc（最优10档-IOC下单），optimal_20_ioc（最优20档-IOC下单），opponent_fok（对手价-FOK下单），lightning_fok（闪电平仓-FOK下单），optimal_5_fok（最优5档-FOK下单），optimal_10_fok（最优10档-FOK下单），optimal_20_fok（最优20档-FOK下单）。
    
  - 接口名称：查询用户当前的下单量限制
  - 接口类型：私有接口
  - 接口URL：POST api/v1/contract_order_limit
 
#### 2.2、合约下单接口增加8种订单价格类型，分别为：opponent_ioc（对手价-IOC下单），optimal_5_ioc（最优5档-IOC下单），optimal_10_ioc（最优10档-IOC下单），optimal_20_ioc（最优20档-IOC下单）, opponent_fok（对手价-FOK下单），optimal_5_fok（最优5档-FOK下单），optimal_10_fok（最优10档-FOK下单），optimal_20_fok（最优20档-FOK下单）。
    
  - 接口名称：合约下单
  - 接口类型：私有接口
  - 接口URL：api/v1/contract_order
 
#### 2.3、合约批量下单接口增加8种订单价格类型，分别为：opponent_ioc（对手价-IOC下单），optimal_5_ioc（最优5档-IOC下单），optimal_10_ioc（最优10档-IOC下单），optimal_20_ioc（最优20档-IOC下单），opponent_fok（对手价-FOK下单），optimal_5_fok（最优5档-FOK下单），optimal_10_fok（最优10档-FOK下单），optimal_20_fok（最优20档-FOK下单）。
    
  - 接口名称：合约批量下单
  - 接口类型：私有接口
  - 接口URL：api/v1/contract_batchorder
 
#### 2.4、获取订单明细信息增加字段liquidation_type
    
  - 接口名称：获取订单明细信息
  - 接口类型：私有接口
  - 接口URL：POST api/v1/contract_order_detail
 
#### 2.5、获取合约历史委托trade_type和orders修改，请求参数的trade_type中，增加类型：减仓平多，减仓平空；返回参数的orders数组增加字段"liquidation_type"。
 
  - 接口名称：获取合约历史委托
  - 接口类型：私有接口
  - 接口URL：POST api/v1/contract_hisorders
 
#### 2.6、闪电平仓下单接口请求参数增加字段order_price_type，值分别为：lightning_ioc（闪电平仓-IOC下单），lightning_fok（闪电平仓-FOK下单），lightning(闪电平仓-默认值）。
  
  - 接口名称：闪电平仓下单
  - 接口类型：私有接口
  - 接口URL：api/v1/lightning_close_position
 
#### 2.7、WS订单成交推送增加字段liquidation_type
    
  - 接口名称：WS订单成交
  - 接口类型：私有接口
  - 订阅主题：orders.$symbol
 
#### 2.8、增加WS撮合订单成交推送接口
    
  - 接口名称：WS撮合订单成交推送
  - 接口类型：私有接口
  - 订阅主题：matchOrders.$symbol
 
#### 2.9、查询系统是否可用接口，增加永续合约相关状态字段，在返回参数的数组"data"中，增加两个字段："swap_heartbeat"、"swap_estimated_recovery_time"。
    
  - 接口名称：查询系统是否可用
  - 接口类型：公共接口
  - 接口URL：https://api.hbdm.com/heartbeat/

#### 2.10、增加获取用户的API指标禁用信息的API接口

  - 接口名称：获取用户的API指标禁用信息
  - 接口类型：私有接口
  - 接口URL：api/v1/contract_api_trading_status

## 1.0.11  2020年2月21日【更新：批量20个订单改成批量最多10个订单】
### 1、接口名称：合约批量下单
 - 接口URL：api/v1/contract_batchorder
 - 接口类型：私有接口
 - 优化点：批量下单的请求参数“orders_data”的一次最多允许批量请求订单数由20个改为10个。
 
### 2、接口名称：撤销订单
- 接口URL：api/v1/contract_cancel
- 接口类型：私有接口
- 优化点：撤单接口的请求参数“order_id” 与 “client_order_id” 的一次最多允许撤消订单数由20个改为10个，多个订单ID中间以","分隔。


## 1.0.10 2020年1月15日【更新:更改K线等接口】

### 1、获取K线数据的接口中增加了两个请求参数“from”和“to”，“from”表示开始时间点（时间戳精确到秒），“to”表示结束时间点（时间戳精确到秒），最多可获取连续两年的数据。请求参数“size”改为非必填项。

- /market/history/kline 获取K线数据

### 2、获取合约订单信息接口查询撤单信息，只能查询最近24小时内的撤单信息。

- /api/v1/contract_order_info 获取合约订单信息

### 3、历史委托查询接口查询撤单信息，只能查询最近24小时内的撤单信息。

- /api/v1/contract_hisorders 历史委托查询

### 4、获取订单明细接口查询撤单数据时，如果传“created_at”和“order_type”参数则能查询最近90天数据，如果不传“created_at”和“order_type”参数只能查询到最近24小时数据。

- /api/v1/contract_order_detail 获取订单明细

## 1.0.9 2019年12月2日【更新:新增计划委托接口】


### 1、新增查询资金持仓接口

  rest接口api/v1/contract_account_position_info，用于获取到当前的资产和持仓信息。
  
### 2、新增计划委托接口

- `api/v1/contract_trigger_order`合约计划委托下单接口

- `api/v1/contract_trigger_cancel`合约计划委托撤单接口

- `api/v1/contract_trigger_cancelall`合约计划委托全部撤单接口

- `api/v1/contract_trigger_openorders`获取计划委托当前委托接口

- `api/v1/contract_trigger_hisorders`获取计划委托历史委托接口

### 3、部分接口增加返回“手续费币种”字段

部分API和内部接口增加返回字段表示手续费对应的币种：

-  `api/v1/contract_fee`查询用户当前的手续费费率

-  `api/v1/contract_order_info`获取合约订单信息

-  `api/v1/contract_order_detail`获取订单明细

-  `api/v1/contract_openorders`获取合约当前未成交委托

-  `api/v1/contract_hisorders`获取合约历史委托

-  `api/v1/contract_matchresults`获取历史成交记录

-  WS成交推送，增加返回“手续费币种”字段

### 4、部分接口请求参数的天数改为可随意输入

部分接口的请求参数“create_date”，由只能填写7或90 改为 可随意输入正整数，如果参数超过90则默认查询90天的数据：

- `api/v1/contract_hisorders`获取限价单历史委托的接口

- `api/v1/contract_trigger_hisorders`获取计划委托的历史委托接口

- `api/v1/contract_matchresults`获取成交记录的接口

- `api/v1/contract_financial_record`获取财务记录的接口


## 1.0.8 2019年10月17日【更新:增加order_id_str字段】

- 为了解决nodejs和Javascript的用户order_id返回是18位数字长度过长的问题,接口返回增加order_id_str字段，类型为字符串，来表示订单号。

涉及接口:

    api/v1/contract_order
    
    api/v1/contract_batchorder
    
    api/v1/contract_matchresults
    
    api/v1/contract_hisorders
    
    api/v1/contract_openorders
    
    api/v1/lightning_close_position 
    
    api/v1/contract_order_info
    
- 订单推送ws  增加 order_id_str

## 1.0.7  2019年10月15日

<aside class="warning">
nodejs和Javascript的用户请特别注意：order_id返回是18位，nodejs和javascript默认解析18位有问题，nodejs和javascript里面JSON.parse默认是int，大于等于18位的数字用json-bigint的包解析。
具体参考nodejs的demo，点击<a href='https://github.com/huobiapi/Futures-Node.js-demo/tree/master/REST-Node.js-demo'>查看</a>。
详细说明，请点击<a href='https://github.com/huobiapi/Futures-Node.js-demo/blob/master/Nodejs%20%E5%90%88%E7%BA%A6%20DEMO%E4%BF%AE%E6%94%B9.docx?raw=true'>下载</a>
</aside>

### 1、修改接口获取用户账户信息

  rest接口api/v1/contract_account_info增加返回字段‘ margin_static’，表示用户的静态权益

### 2、修改获取订单明细信息

  rest接口api/v1/contract_order_detail、查询用户的成交记录

  rest接口api/v1/contract_matchresults、用户订单的成交推送的ws增加字段id,表示成交唯一ID

### 3、修改下单

  rest接口api/v1/contract_order和批量下单

  rest接口api/v1/contract_batchorder

  请求参数order_price_type中增加订单价格类型“ioc”(ioc:立即成交并取消剩余);

  请求参数order_price_type中增加订单价格类型“fok”(fok:全部成交或立即取消);

### 4、修改查询用户当前的下单量限制

  rest接口api/v1/contract_order_limit返回参数的“ order_price_type”，表示订单报价类型，

  增加"fok":FOK订单(fok:全部成交或立即取消)，"ioc":IOC订单(ioc:立即成交并取消剩余)

### 5、新增查询系统状态的API

  rest接口api/v1/contract_api_state

### 6、新增账户多空持仓对比-账户数

  rest接口api/v1/contract_elite_account_ratio

### 7、新增精英账户多空持仓对比-持仓量 

  rest接口api/v1/contract_elite_position_ratio

### 8、新增获取强平订单

  rest接口api/v1/contract_liquidation_orders和ws推送


## 1.0.6 2019年8月8日【更新:新增rest接口】

### 新增rest接口：

  请求访问地址：https://api.hbdm.com/heartbeat/
  
  备注：查询系统是否可用，其中heartbeat为1是可用，为0不可用。
  
## 1.0.5 2019年7月10日【更新:查询及下单功能】

### 新增接口：

  新增rest接口,查询用户的下单量限制；
  
  新增rest接口,查询用户的手续费费率；
  
  新增rest接口,查询用户的划转限制；
  
  新增rest接口,查询用户的持仓量限制；
  
  新增rest接口,查询平台的风险准备金、预估分摊比例；
  
  新增rest接口,查询平台持仓量；
  
  新增rest接口,查询平台的风险准备金历史数据；
  
  新增rest接口,查询平台的阶梯调整系数；
  
  新增rest接口,闪电平仓下单；

### 对已有接口的修改：

  rest接口，查询用户账户信息接口增加返回用户的调整系数；
  
  rest接口，查询单个子账户资产信息接口增加返回用户的调整系数；

  ws接口，资金推送增加返回用户的调整系数；
  
  rest接口，下单接口和批量下单接口新增最优5、10、20档下单；
  
  rest接口，获取成交记录增加按照合约code查询；

## 1.0.4 2019年6月6日【更新: Restful查询接口】

### 1.查询母账户下所有子账户资产信息

  URL：api/v1/contract_sub_account_list
  
  备注：只返回已经开通合约交易的子账户数据

### 2.查询单个子账户资产信息

  URL：api/v1/contract_sub_account_info
  
  备注：只能查询到开通合约交易的子账户信息；子账户来过合约系统但是未开通合约交易也不返回对应的数据

### 3.查询单个子账户持仓信息

  URL：api/v1/contract_sub_position_info

### 4.查询用户财务记录

  URL：api/v1/contract_financial_record
 

## 1.0.3 2019年5月28日【更新：WS增加资产信息推送】

WS增加资产信息推送 

WS增加持仓信息推送 

rest接口获取用户的持仓信息接口api/v1/contract_position_info增加返回字段“最新价”
 

## 1.0.2 2019年5月14日【更新:  币币账户和合约账户间进行资金的划转】

### 新增账户接口/v1/futures/transfer 

  币币账户和合约账户间进行资金的划转
  
  从现货现货账户转至合约账户，类型为pro-to-futures; 从合约账户转至现货账户，类型为futures-to-pro
  
  该接口的访问频次的限制为1分钟10次

### API限频

  限频时间间隔从1秒变为3秒
  
  私有接口限频由原来的10次/s变更为30次/3s，即请求发送3秒内不超过30次
  
  其他非行情类的公开接口限频由原来的20次/s变更为60次/3s，即请求发送3秒内不超过60次
 

## 1.0.1 2019年5月9日【更新：post_only高级限价委托功能上线】

### 全部撤单接口/v1/contract_cancelall

  只传symbol，撤销该品种下所有周期的合约
  
  只要有contract_code，则撤销该code的合约
  
  只传symbol+contract_type， 则撤销二者拼接所成的合约订单

### 下单接口/v1/ contract_order

  报单字段order_price_type中增加订单价格类型post_only，post_only是“只做Maker（post_only）”，不会立刻在市场成交，保证用户始终为Maker；如果委托会立即与已有委托成交，那么该委托会被取消。
  
  Post only只受用户持仓数量限制，单笔下单不受下单数量限制。

### 批量下单接口/v1/ contract_batchorder

  报单字段order_price_type中增加订单价格类型post_only，post_only是“只做Maker（post_only）”，不会立刻在市场成交，保证用户始终为Maker；如果委托会立即与已有委托成交，那么该委托会被取消。
  
  Post only只受用户持仓数量限制，单笔下单不受下单数量限制。

### 所有API接口返回数据中增加限频信息

  将在api接口response中的header返回以下字段
  
  ratelimit-limit： 单轮请求数上限，单位：次数
  
  ratelimit-interval：请求数重置的时间间隔，单位：毫秒
  
  ratelimit-remaining：本轮剩余可用请求数，单位：次数
  
  ratelimit-reset：请求数上限重置时间，单位：毫秒

### 查询订单详细信息/v1/contract_order_detail

  trades增加成交角色字段role：taker或maker
  
  获取成交记录/v1/contract_matchresults
  
  trades增加成交角色字段role：taker或maker
  
  获取该用户在某品种上的最新成交记录，可以按照交易类型进行过滤筛选。注意，该接口是需要API KEY验签的私有接口，只能查询属于该用户自己的最新成交记录。

### WS成交推送接口

  trades增加成交角色字段role：taker或maker
  
  WebSocket私有订单成交推送接口(需要API KEY验签)
  
  一个UID最多同时建立30个私有订单成交推送WS链接。该用户在一个品种(包含该品种的所有周期的合约)上，仅需要维持一个订单推送WS链接即可。
  
  注意: 订单推送WS的限频，跟用户RESTFUL私有接口的限频是分开的，相互不影响。
 

## 1.0.0 于2018年12月10日上线

# 合约交易接入说明

## 合约交易接口列表

### 接口列表

  权限类型  |    接口数据类型   |   请求方法      |          类型  |   描述                     |   需要验签  |
----------- |  ------------------ | ---------------------------------------- |  ---------- |  ------------------------------- |  --------------  |
读取     |  基础信息接口           |  /api/v1/contract_contract_info  |                 GET        |  获取合约信息                 |  否  |
读取     |  基础信息接口           |  /api/v1/contract_index  |                         GET        |  获取合约指数信息             |  否  |
读取     |  基础信息接口           |  /api/v1/contract_price_limit  |                 GET         |  获取合约最高限价和最低限价   |  否  |
读取     |  基础信息接口           |   /api/v1/contract_open_interest  |                  GET        |  获取当前可用合约总持仓量     |  否  |
读取     |  基础信息接口           |   /api/v1/contract_delivery_price  |                  GET        |  获取预估交割价    |  否  |
读取     |  基础信息接口           |   /api/v1/contract_api_state   |                  GET        |  查询系统状态    |  否  |
读取     |  市场行情接口           | /market/depth |                                GET        |  获取行情深度数据            |  否  |
读取     |  市场行情接口           |  /market/history/kline |                        GET        |  获取K线数据                  |  否  |
读取     |  市场行情接口           |  /index/market/history/mark_price_kline |        GET        |  获取标记价格的K线数据                 |  否  |
读取     |  市场行情接口           |   /market/detail/merged |                     GET        |  获取聚合行情                 |  否  |
读取     |  市场行情接口           |  /market/detail/batch_merged  |                 GET        |  批量获取聚合行情                 |  否  |
读取     |  市场行情接口           |  /market/bbo |        GET        | 获取市场最优挂单            |  否  |
读取     |  市场行情接口           |   /market/trade |                                GET        |  获取市场最近成交记录         |  否  |
读取     |  市场行情接口           |  /market/history/trade |                         GET        |  批量获取最近的交易记录       |  否  |
读取     |  市场行情接口           |  /api/v1/contract_risk_info |    GET       |  查询合约风险准备金余额和预估分摊比例            |  否  |
读取     |  市场行情接口           |  /api/v1/contract_insurance_fund |  GET       |  查询合约风险准备金余额历史数据            |  否  |
读取     |  市场行情接口           |  /api/v1/contract_adjustfactor |   GET       |  查询平台阶梯调整系数            |  否  |
读取     |  市场行情接口           |  /api/v1/contract_his_open_interest |   GET       |  平台持仓量的查询            |  否  |
读取     |  市场行情接口        |  /api/v1/contract_ladder_margin           |    GET       |       获取平台阶梯保证金       |  否  |
读取     |  市场行情接口           |  /api/v1/contract_elite_account_ratio |   GET       |  精英账户多空持仓对比-账户数            |  否  |
读取     |  市场行情接口           |  /api/v1/contract_elite_position_ratio |   GET       |  精英账户多空持仓对比-持仓量            |  否  |
读取     |  市场行情接口           |  /api/v1/contract_liquidation_orders |   GET       |  获取强平订单            |  否  |
读取     |  市场行情接口           |  /api/v1/contract_settlement_records |     GET       |  查询平台历史结算记录            |  否  |
读取     |  市场行情接口           |  /index/market/history/index |   GET       |  获取指数K线数据            |  否  |
读取     |  市场行情接口           |  /index/market/history/basis |   GET       |  获取基差数据            |  否  |
读取     | 市场行情接口         |  /api/v1/contract_estimated_settlement_pr ice           | GET    |     获取预估结算价      |      否          |
读取     |  资产接口           | /api/v1/contract_balance_valuation |         POST        |  获取账户总资产估值                  |  是  |
读取     |  资产接口           |   /api/v1/contract_account_info |               POST        |  获取用户账户信息              |  是  | 
读取     |  资产接口              |  /api/v1/contract_position_info |                POST       |  获取用户持仓信息              |  是  |
交易     |  账户接口           |  /api/v1/contract_sub_auth                |    POST       |       批量设置子账户交易权限       |  是  |
读取     | 账户接口           | /api/v1/contract_sub_account_list  |      POST       |  币查询母账户下所有子账户资产信息         | 是 |
读取     |  账户接口           |  /api/v1/contract_sub_account_info_list   |    POST       |       批量获取子账户资产信息      |  是  |
读取     | 账户接口           | /api/v1/contract_sub_account_info |       POST       |  查询单个子账户资产信息            | 是 |
读取     | 账户接口           | /api/v1/contract_sub_position_info |     POST       |  查询单个子账户持仓信息的            | 是 |
读取     | 账户接口           | /api/v1/contract_financial_record |   POST       | 查询用户财务记录                    |  是  |
读取     | 账户接口           | /api/v1/contract_financial_record_exact |   POST       | 组合查询财务记录                   |  是  |
读取     |  账户接口           |  /api/v1/contract_user_settlement_records |   POST       |  查询用户结算记录            |  是  |
读取     |  账户接口           |  /api/v1/contract_order_limit |  POST       |  查询用户当前的下单量限制            |  是  |
读取     |  账户接口           |  /api/v1/contract_fee |  POST       |  查询用户当前的手续费费率            |  是  |
读取     |  账户接口           |  /api/v1/contract_transfer_limit |  POST       |  查询用户当前的划转限制            |  是  |
读取     |  账户接口           |  /api/v1/contract_position_limit |   POST       |  用户持仓量限制的查询            |  是  |
读取     |  账户接口           |  /api/v1/contract_account_position_info |   POST       |  查询用户账户和持仓信息            |  是  |
交易     | 账户接口   | /api/v1/contract_master_sub_transfer    | POST | 母子账户划转         | 是    |
读取     | 账户接口   | /api/v1/contract_master_sub_transfer_record    | POST | 获取母账户下的所有母子账户划转记录         | 是    
交易     |  交易接口           |  /api/v1/contract_order |                        POST       |  合约下单                      |  是  |
交易     |  交易接口           |  /api/v1/contract_batchorder |                    POST       |  合约批量下单                  |  是  |
交易     |  交易接口           |  /api/v1/contract_cancel |                        POST       |  撤销订单                     |  是  |
交易     |  交易接口           |  /api/v1/contract_cancelall |                     POST       |  全部撤单                     |  是  |
交易     |  交易接口           |  /api/v1/contract_switch_lever_rate |             POST       |  切换杠杆                  |  是  |
读取     |  交易接口          |  /api/v1/contract_order_info |                   POST       |  获取合约订单信息             |  是  |
读取    |  交易接口           |   /api/v1/contract_order_detail |               POST        |  获取订单明细信息             |  是  |
读取     |  交易接口           |   /api/v1/contract_openorders |                   POST       |  获取合约当前未成交委托       |  是  |
读取     |  交易接口           |  /api/v1/contract_hisorders |                    POST        |  获取合约历史委托             |  是  |
读取     |  交易接口           |  /api/v1/contract_hisorders_exact |                    POST        |  组合查询合约历史委托   |  是  |
读取     |  交易接口           |  /api/v1/contract_matchresults |                    POST       |  获取历史成交记录            |  是  |
读取     |  交易接口           |  /api/v1/contract_matchresults_exact |                    POST       |  组合查询合约历史成交记录   |  是  |
读取     |  账户接口           |  /api/v1/contract_trigger_openorders |    POST       |  获取计划委托当前委托接口            |  是  |
读取     |  账户接口           |  /api/v1/contract_trigger_hisorders |    POST       |       获取计划委托历史委托接口       |  是  |
交易     |  账户接口           |  /v1/futures/transfer |                    POST       |  币币账户和合约账户间进行资金的划转            |  是  |
交易     |  交易接口           |  /api/v1/lightning_close_position |    POST       |  闪电平仓下单            |  是  |
交易     |  策略接口           |  /api/v1/contract_trigger_order |    POST       |  合约计划委托下单            |  是  |
交易     |  策略接口           |  /api/v1/contract_trigger_cancel |    POST       |  合约计划委托撤单            |  是  |
交易     |  策略接口           |  /api/v1/contract_trigger_cancelall |    POST       |  合约计划委托全部撤单            |  是  |
交易  | 策略接口  |  /api/v1/contract_tpsl_order                            | POST    |     对仓位设置止盈止损订单       |       是          |
交易  | 策略接口  |  /api/v1/contract_tpsl_cancel                           | POST    |     止盈止损订单撤单       |       是          |
交易  | 策略接口  |  /api/v1/contract_tpsl_cancelall                        | POST    |     止盈止损订单全部撤单       |       是          |
读取  | 策略接口  |  /api/v1/contract_tpsl_openorders                       | POST    |     止盈止损订单当前委托       |       是          |
读取  | 策略接口  |  /api/v1/contract_tpsl_hisorders                        | POST    |     止盈止损订单历史委托       |       是          |
读取  | 策略接口  |  /api/v1/contract_relation_tpsl_order                   | POST    |     查询开仓单关联的止盈止损订单       |       是          | 
交易     |  策略接口           |  /api/v1/contract_track_order |        POST        | 跟踪委托订单下单            |  是  |
交易     |  策略接口           |  /api/v1/contract_track_cancel |        POST        | 跟踪委托订单撤单            |  是  |
交易     |  策略接口           |  /api/v1/contract_track_cancelall |        POST        | 跟踪委托订单全部撤单            |  是  |
读取     |  策略接口           |  /api/v1/contract_track_openorders |        POST        | 跟踪委托订单当前委托            |  是  |
读取     |  策略接口           |  /api/v1/contract_track_hisorders |        POST        | 跟踪委托订单历史委托            |  是  | 


## 访问地址

访问地址 | 适用站点 | 适用功能 | 适用交易对 |
------ | ---- | ---- | ------ |
https://api.hbdm.com| 火币合约|   行情     | 火币合约的交易品种  |

### 备注

 如果api.hbdm.com无法访问，可以使用api.btcgateway.pro来做调试，AWS服务器用户推荐使用api.hbdm.vn；

## 签名认证

### 签名说明

API 请求在通过 internet 传输的过程中极有可能被篡改，为了确保请求未被更改，除公共接口（基础信息，行情数据）外的私有接口均必须使用您的 API Key 做签名认证，以校验参数或参数值在传输途中是否发生了更改。

一个合法的请求由以下几部分组成：

- 方法请求地址：即访问服务器地址 api.hbdm.com，比如 api.hbdm.com/api/v1/contract_order。

- API 访问密钥（AccessKeyId）：您申请的 API Key 中的 Access Key。

- 签名方法（SignatureMethod）：用户计算签名的基于哈希的协议，此处使用 HmacSHA256。

- 签名版本（SignatureVersion）：签名协议的版本，此处使用2。

- 时间戳（Timestamp）：您发出请求的时间 (UTC 时区) (UTC 时区) (UTC 时区) 。如：2017-05-11T16:22:06。在查询请求中包含此值有助于防止第三方截取您的请求。

- 必选和可选参数：每个方法都有一组用于定义 API 调用的必需参数和可选参数。可以在每个方法的说明中查看这些参数及其含义。 请一定注意：对于 GET 请求，每个方法自带的参数都需要进行签名运算； 对于 POST 请求，每个方法自带的参数不进行签名认证，即 POST 请求中需要进行签名运算的只有 AccessKeyId、SignatureMethod、SignatureVersion、Timestamp 四个参数，其它参数放在 body 中。

- 签名：签名计算得出的值，用于确保签名有效和未被篡改。


### 创建 API Key

您可以在 <a href='https://www.hbg.com/zh-cn/apikey/'>这里 </a> 创建 API Key。

API Key 包括以下两部分

- `Access Key`  API 访问密钥
  
- `Secret Key`  签名认证加密所使用的密钥（仅申请时可见）

<aside class="notice">
创建 API Key 时可以选择绑定 IP 地址，未绑定 IP 地址的 API Key 有效期为90天。
</aside>
<aside class="notice">
API Key 具有包括交易、借贷和充提币等所有操作权限。
</aside>
<aside class="warning">
这两个密钥与账号安全紧密相关，无论何时都请勿向其它人透露。
</aside>


### 签名步骤

规范要计算签名的请求 因为使用 HMAC 进行签名计算时，使用不同内容计算得到的结果会完全不同。所以在进行签名计算前，请先对请求进行规范化处理。下面以查询某订单详情请求为例进行说明：

查询某订单详情

`https://api.hbdm.com/api/v1/contract_order?`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`&SignatureMethod=HmacSHA256`

`&SignatureVersion=2`

`&Timestamp=2017-05-11T15:19:30`

#### 1. 请求方法（GET 或 POST），后面添加换行符 “\n”


`GET\n`

#### 2. 添加小写的访问地址，后面添加换行符 “\n”

`
api.hbdm.com\n
`

#### 3. 访问方法的路径，后面添加换行符 “\n”

`
/api/v1/contract_order\n
`

#### 4. 按照ASCII码的顺序对参数名进行排序。例如，下面是请求参数的原始顺序，进行过编码后


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

<aside class="notice">
使用 UTF-8 编码，且进行了 URI 编码，十六进制字符必须大写，如 “:” 会被编码为 “%3A” ，空格被编码为 “%20”。
</aside>
<aside class="notice">
时间戳（Timestamp）需要以YYYY-MM-DDThh:mm:ss格式添加并且进行 URI 编码。
</aside>


#### 5. 经过排序之后

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx`

`SignatureMethod=HmacSHA256`

`SignatureVersion=2`

`Timestamp=2017-05-11T15%3A19%3A30`

#### 6. 按照以上顺序，将各参数使用字符 “&” 连接


`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`

#### 7. 组成最终的要进行签名计算的字符串如下

`POST\n`

`api.hbdm.com\n`

`/api/v1/contract_order\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`


#### 8. 用上一步里生成的 “请求字符串” 和你的密钥 (Secret Key) 生成一个数字签名

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

1. 将上一步得到的请求字符串和 API 私钥作为两个参数，调用HmacSHA256哈希函数来获得哈希值。

2. 将此哈希值用base-64编码，得到的值作为此次接口调用的数字签名。

#### 9. 将生成的数字签名加入到请求的路径参数里

最终，发送到服务器的 API 请求应该为

`https://api.hbdm.com/api/v1/contract_order?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`

1. 把所有必须的认证参数添加到接口调用的路径参数里

2. 把数字签名在URL编码后加入到路径参数里，参数名为“Signature”。

## 访问次数限制

* 交割合约、币本位永续合约和USDT本位永续合约都分开限频

* 公开行情接口和用户私有接口都有访问次数限制

* 普通用户，需要密钥的私有接口，每个UID 3秒最多 72 次请求(交易接口3秒最多 36 次请求，查询接口3秒最多 36 次请求) (该UID的所有币种和不同到期日的合约的所有私有接口共享该限制) <a href=https://docs.huobigroup.com/docs/dm/v1/cn/#ab0b26742c>查看API接口类型列表(其中读取即查询,交易即交易)</a>  

* 其他非行情类的公开接口，比如获取指数信息，限价信息，交割结算、平台持仓信息等，所有用户都是每个IP3秒最多120次请求（所有该IP的非行情类的公开接口请求共享3秒120次的额度）

- 行情类的公开接口，比如：获取K线数据、获取聚合行情、市场行情、获取行情深度数据、获取指数k线、获取基差数、获取市场最近成交记录：

    （1） restful接口：同一个IP, 所有业务（交割合约、币本位永续合约和USDT本位永续合约）总共1秒最多800个请求

    （2） websocket：req请求，同一时刻最多请求50次；sub请求，无限制，服务器主动推送数据
    
- WebSocket私有订单成交推送接口(需要API KEY验签)

     一个UID最多同时建立30个私有订单成交推送WS链接。该用户在一个品种(包含该品种的所有周期的合约)上，仅需要维持一个订单推送WS链接即可。
   
     注意: 订单推送WS的限频，跟用户RESTFUL私有接口的限频是分开的，相互不影响。
     

- 查询与交易API接口返回的header中会有限频信息。比如：查询订单信息接口(/api/v1/contract_order_info)，返回的header中的ratelimit-limit即查询接口的总限制频率次数，ratelimit-remaining即查询接口的剩余总限制频率次数。下单接口(/api/v1/contract_order)，返回的header中的ratelimit-limit即交易接口的总限制频率次数，ratelimit-remaining即交易接口的剩余总限制频率次数。<a href=https://docs.huobigroup.com/docs/dm/v1/cn/#ab0b26742c>查看API接口类型列表(其中读取即查询,交易即交易)</a>

  将在api接口response中的header返回以下字段：
  
  ratelimit-limit： 单轮请求数上限，单位：次数
  
  ratelimit-interval：请求数重置的时间间隔，单位：毫秒
  
  ratelimit-remaining：本轮剩余可用请求数，单位：次数
  
  ratelimit-reset：请求数上限重置时间，单位：毫秒

  如果触发了撤单率限制，您的api接口response返回header中会包括字段：
  
  recovery-time：禁用的恢复时间戳，单位为毫秒，表示禁用结束时间，可恢复访问的时间戳；
  
  如果不在禁用期间，header不返回recovery-time字段；
  
- 一个uid对应计划委托下单接口请求1秒5次、一个uid对应计划委托撤单接口请求1秒5次、一个uid对应计划委托全部撤单接口请求1秒5次。


## 撤单率限制

- 当用户通过API在10分钟内特定订单价格类型的委托单总笔数大于或等于3000笔时，系统会自动计算撤单率，如果撤单率大于99%，则禁止该用户通过API特定价格类型进行下单5分钟（如果下单会报：1084  您的合约API挂单接口被禁用,请于{0} (GMT+8) 后再试）；

- 当API用户在1小时的总禁用次数达到3次时，则禁止用户通过API特定价格类型进行下单30分钟（如果下单会报：1084  您的合约API挂单接口被禁用,请于{0} (GMT+8) 后再试），待解禁恢复访问后，总禁用次数重置，且之前周期统计过的次数不计入新周期的总禁用次数;

- 其他客户端挂撤单以及API撤单将不受影响，每次禁用会以短信和邮件形式通知；

- 被禁用的API下单类型仅包括：限价委托、Post_only、FOK、IOC四种订单价格类型，其他下单方式如lightning（闪电平仓下单），opponent(对手价下单)，optimal_5（最优5档），optimal_10(最优10档下单），optimal_20（最优20档下单），opponent_ioc（对手价-IOC下单），lightning_ioc（闪电平仓-IOC下单），optimal_5_ioc（最优5档-IOC下单），optimal_10_ioc（最优10档-IOC下单），optimal_20_ioc（最优20档-IOC下单），opponent_fok（对手价-FOK下单），lightning_fok（闪电平仓-FOK下单），optimal_5_fok（最优5档-FOK下单），optimal_10_fok（最优10档-FOK下单），optimal_20_fok（最优20档-FOK下单）等在禁用期间将仍然可用；

- HTTP返回的header信息：

  - 禁用期间下单类型为被禁用的四种类型时,接口返回信息header中会包括字段："recovery-time：禁用的恢复时间戳"，单位为毫秒，表示禁用结束时间，可恢复访问的时间戳；

  - 如果不在禁用期间，header中不返回该字段；
  

- 委托单总笔数与撤单率的计算是基于UID，母子UID是分开单独计算的。计算撤单率的时间周期为10分钟/次（开始时间从00:00开始,结束时间00:10。每10分钟一个周期。）；

- 指标说明：
 	- 撤单率 = 无效撤单总笔数 / 委托单总笔数（订单来源均为API）。
  - 委托单总笔数=同时满足以下所有条件的委托单总笔数：
      - 订单来源为API并且订单类型为报单（order Type = 1）；
    
      - 订单价格类型为限价委托、Post_only、FOK和IOC四种订单价格类型；
    
      - 委托单的下单时间在【当周期开始时间-3秒，当周期结束时间】内的委托单总笔数；
 	
    - 无效撤单总笔数=同时满足以下所有条件的委托单总笔数：
      - 订单来源为API并且订单类型为报单（order Type = 1）；
    
      - 订单价格类型为限价委托、Post_only、FOK和IOC四种订单价格类型；
    
      - 订单状态为已撤销（status = 7）；
    
      - 订单成交数量为0；
    
      - 撤单时间与下单时间间隔小于等于3秒；
    
      - 委托单的撤单时间在当周期内的委托单。
      
- 为了保证API系统的稳定性和交易性能，请您在高峰期时段尽量降低API订单的撤单量和撤单率，以避免频繁触发API的限制机制，以下是降低撤单率的建议：

  - 1．订单的价格更靠近盘口；

  - 2、适当延长下单与撤单的时间间隔；

  - 3、适当增加单笔订单金额，减少下单次数；

  - 4、尽量增加订单成交率:

      - 1) 优先使用对手价、最优5档、最优10档、最优20档、闪电平仓、opponent_ioc（对手价-IOC下单）、lightning_ioc（闪电平仓-IOC下单）、optimal_5_ioc（最优5档-IOC下单）、optimal_10_ioc（最优10档-IOC下单）、optimal_20_ioc（最优20档-IOC下单）、opponent_fok（对手价-FOK下单）、lightning_fok（闪电平仓-FOK下单）、optimal_5_fok（最优5档-FOK下单）、optimal_10_fok（最优10档-FOK下单）、optimal_20_fok（最优20档-FOK下单）等成交概率大的委托方式下单；

      - 2) IOC订单、FOK订单、Post_only订单尽量摆在买卖第一档的位置上；

  - 5、适当延长策略轮询时间。

## 停服维护

当该业务系统停服维护期间，除了以下2个提供给用户查询系统状态的接口能够正常使用外（<a href='https://docs.huobigroup.com/docs/dm/v1/cn/#cd63bde415'>获取当前系统状态</a>、<a href='https://docs.huobigroup.com/docs/dm/v1/cn/#bef5ec9210'>查询系统是否可用</a>），该业务所有rest接口都会固定返回响应报文:`{"status": "maintain"}`。websocket推送接口在停服维护时，除了WebSocket系统状态更新的推送接口可以正常调用外（<a href='https://docs.huobigroup.com/docs/dm/v1/cn/#websocket-6'>WebSocket系统状态更新接口</a>），其他推送接口都会返回1006的错误码。

>Response

```json
{
    "status": "maintain"
}
``` 

#### 2个接口为：
 - 查询系统是否可用：https://api.hbdm.com/heartbeat/
 - statuspage查询系统状态：https://status-dm.huobigroup.com/api/v2/summary.json
 
除了以上两个rest接口获取系统维护停服信息外，也可以通过订阅WebSocket系统状态更新接口获取系统维护停服信息 

## 获取当前系统状态

此接口返回当前的系统状态，包含当前系统维护计划和故障进度等。

如您需要通过邮件、短信、Webhook、RSS/Atom feed接收以上信息，可点击<a href='https://status-dm.huobigroup.com/'>这里</a>进入页面进行订阅。当前订阅依赖Google服务，订阅前请确保您可正常访问Google的服务，否则将订阅失败。

```shell
curl "https://status-dm.huobigroup.com/api/v2/summary.json"
```

### HTTP 请求

- GET `https://status-dm.huobigroup.com/api/v2/summary.json`

### 请求参数

此接口不接受任何参数。

> Response:

```json
{
  "page": {  // 合约页面基本信息
    "id": "p0qjfl24znv5",  // 页面id
    "name": "Huobi",  // 页面名称
    "url": "https://status-dm.huobigroup.com", // 页面地址
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
            "impact": "minor", // 事件影响程度
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
                    "only_show_if_degraded": false                }
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
|page    |                     | status page页面基本信息
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


## 查询系统是否可用  

- Interface `https://api.hbdm.com/heartbeat/`

### 备注：
 -  注意请求时地址后面的“/”一定要带上。

### 返回参数
| 参数名称 |  类型  |   描述         |
| ------------------ | ------------------ | ------------- | 
| status             | string                   | "ok" 或 "error"... 
| \<data\>             | dict object                 | 
| heartbeat             | int                   | 交割合约 1: 可用 0: 不可用(即停服维护) 
| swap_heartbeat             | int                   | 币本位永续 1: 可用 0: 不可用(即停服维护) 
| estimated_recovery_time             | long                   | null: 正常. 交割合约预计恢复时间， 单位:毫秒
| swap_estimated_recovery_time             | long                   | null: 正常. 币本位永续合约预计恢复时间，单位：毫秒.
| linear_swap_heartbeat             | long                   | USDT本位永续 1: 可用 0: 不可用(即停服维护)  
| linear_swap_estimated_recovery_time             | long                   | null: 正常. USDT本位永续合约预计恢复时间，单位：毫秒.
| \</data\>             |                  | 

> 返回数据

```json

{
    "status":"ok",
    "data":{
        "heartbeat":1,
        "estimated_recovery_time":null,
        "swap_heartbeat":1,
        "swap_estimated_recovery_time":null,
        "linear_swap_heartbeat":1,
        "linear_swap_estimated_recovery_time":null
    },
    "ts":1557714418033
}
```
 
## 获取当前系统时间戳

 - GET `https://api.hbdm.com/api/v1/timestamp`

### 请求参数
   无
   
> 返回数据

```json

{
    "status": "ok",
    "ts": 1578124684692
}

```
### 返回参数
| 参数名称                   | 是否必须 | 类型      | 描述                 | 取值范围                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | 请求处理结果             |                                          |
| ts                     | true | long    | 当前系统时间戳                |                                          |

#### 备注
- 可以用于校对系统时间。

## 错误码详情

错误代码	 | 错误描述|
----- | ---------------------- |
403	|	无效身份                |
1000 | 系统异常
1001 | 系统未准备就绪
1002 | 查询异常
1003 | 操作redis异常
1004 | 系统繁忙,请稍后再试
1010 | 用户不存在
1011 | 用户会话不存在,请重试
1012 | 账户不存在
1013 | 合约品种不存在
1014 | 合约不存在
1015 | 指数价格不存在
1016 | 对手价不存在
1017 | 查询订单不存在
1018 | 主账号不存在
1019 | 主账号不在开通子账号白名单里
1020 | 您的子账号数量已超出限制,请联系客服
1021 | 开户失败。您的主账号尚未开通合约交易权限,请前往开通
1030 | 输入错误
1031 | 非法的请求来源
1032 | 访问次数超出限制
1033 | 合约周期字段值错误
1034 | 报单价格类型字段值错误
1035 | 报单方向字段值错误
1036 | 报单开平字段值错误
1037 | 倍数不符合要求,请联系客服
1038 | 下单价格超出精度限制,请修改后下单
1039 | 买入价必须低于{0}{1},卖出价必须高于{2}{3}
1040 | 下单数量不能为空或者不能小于0, 请修改后下单
1041 | 下单数量超出限制 ({0}张),请修改后下单
1042 | 下单数量+挂单数量+持仓数量超过了单用户多仓持仓限制({0}张),请修改后下单
1043 | 下单数量+挂单数量+持仓数量超过了单用户空仓持仓限制({0}张), 请修改后下单
1044 | 触发平台限仓,请修改后下单
1045 | 当前有挂单,无法切换倍数
1046 | 当前合约持仓不存在
1047 | 可用担保资产不足
1048 | 可平量不足
1049 | 暂不支持市价开仓
1050 | 客户报单号重复
1051 | 没有可撤销的订单
1052 | 批量撤单、下单的订单数量超过平台限制数量
1053 | 无法获取最新价格区间
1054 | 无法获取最新价
1055 | 价格不合理, 下单后将导致账户权益小于0 , 请修改价格后下单
1056 | 结算中,暂时无法下单/撤单
1057 | 暂停交易中,暂时无法下单
1058 | 停牌中,暂时无法下单
1059 | 交割中,暂时无法下单/撤单
1060 | 合约处于非交易状态,暂时无法下单
1061 | 订单不存在
1062 | 撤单中,请耐心等待
1063 | 订单已成交
1064 | 报单主键冲突
1065 | 客户报单号不是整数
1066 | {0}字段不能为空
1067 | {0}字段不合法
1068 | 导出错误
1069 | 价格不合理
1070 | 数据为空,无法导出
1071 | 订单已撤,无法撤单
1072 | 卖出价必须低于{0}{1}
1073 | 仓位异常,请联系客服
1074 | 下单异常,请联系客服
1075 | 价格不合理, 下单后将导致担保资产率小于0 , 请修改价格后下单
1076 | 盘口无数据,请稍后再试
1077 | 交割结算中,当前品种资金查询失败
1078 | 交割结算中,部分品种资金查询失败
1079 | 交割结算中,当前品种持仓查询失败
1080 | 交割结算中,部分品种持仓查询失败
1081 | {0}合约计划委托订单数量不得超过{1}
1082 | 触发类型参数错误
1083 | 您的仓位已进入强平接管,暂时无法下单
1084 | 您的合约API挂单接口被禁用,请于{0} (GMT+8) 后再试
1085 | 计划委托下单失败,请修改价格再次下单或联系客服
1086 | {0}合约暂时限制{1}端开仓,请联系客服
1087 | {0}合约暂时限制{1}端平仓,请联系客服
1088 | {0}合约暂时限制{1}端撤单,请联系客服
1089 | {0}账户暂时限制划转,请联系客服
1090 | 担保资产率小于0, 无法下单
1091 | 账户权益小于0, 无法下单
1092 | 闪电平仓取盘口第{0}档的价格, 下单后将导致账户权益小于0 , 请改为手动输入价格或使用对手价下单
1093 | 闪电平仓取盘口第{0}档的价格, 下单后将导致担保资产率小于0 , 请改为手动输入价格或使用对手价下单
1094 | 倍数不能为空, 请切换倍数或联系客服
1095 | 合约处于非交易状态, 暂时无法切换倍数
1100 | 您没有开仓权限,请联系客服
1101 | 您没有平仓权限,请联系客服
1102 | 您没有转入权限,请联系客服
1103 | 您没有转出权限,请联系客服
1104 | 合约交易受限,当前禁止交易
1105 | 合约交易受限,当前只能平仓
1106 | 合约交割结算中,暂时无法划转
1108 | Dubbo调用异常
1109 | 子账号没有开仓权限,请联系客服
1110 | 子账号没有平仓权限,请联系客服
1111 | 子账号没有入金权限,请联系客服
1112 | 子账号没有出金权限,请联系客服
1113 | 子账号没有交易权限,请登录主账号授权
1114 | 子账号没有划转权限,请登录主账号授权
1115 | 您没有访问此子账号的权限
1200 | 登录失败,请重试
1220 | 您尚未开通合约交易,无访问权限
1221 | 币币账户总资产不满足合约开通条件
1222 | 开户天数不满足合约开通条件
1223 | VIP等级不满足合约开通条件
1224 | 您所在的国家/地区不满足合约开通条件
1225 | 开通合约失败
1226 | 合约已开户,无法重复开户
1227 | 火币合约暂不支持子账户,请返回退出子账户,切换主账户登录
1228 | 您尚未开通合约交易, 请先开通
1229 | 重复同意协议
1230 | 您尚未做风险认证
1231 | 您尚未做身份认证
1232 | 您上传的图片格式/大小不符合要求,请重新上传
1233 | 您尚未开通高倍数协议 (使用高倍数请先使用主账号登录web或APP端同意高倍数协议)
1234 | {0}合约未完成的开仓委托数量不得超过{1}笔
1235 | {0}合约未完成的平仓委托数量不得超过{1}笔
1250 | 无法获取HT_token
1251 | 无法获取BTC净资产,请稍后再试
1252 | 无法获取币币账户资产,请稍后再试
1253 | 签名验证错误
1254 | 子账号无权限开通合约，请前往web端登录主账号开通
1300 | 划转失败
1301 | 可划转余额不足
1302 | 系统划转错误
1303 | 单笔转出的数量不能低于{0}{1}
1304 | 单笔转出的数量不能高于{0}{1}
1305 | 单笔转入的数量不能低于{0}{1}
1306 | 单笔转入的数量不能高于{0}{1}
1307 | 您当日累计转出量超过{0}{1}, 暂无法转出
1308 | 您当日累计转入量超过{0}{1}, 暂无法转入
1309 | 您当日累计净转出量超过{0}{1}, 暂无法转出
1310 | 您当日累计净转入量超过{0}{1}, 暂无法转入
1311 | 超过平台当日累计最大转出量限制, 暂无法转出
1312 | 超过平台当日累计最大转入量限制, 暂无法转入
1313 | 超过平台当日累计最大净转出量限制, 暂无法转出
1314 | 超过平台当日累计最大净转入量限制, 暂无法转入
1315 | 划转类型错误
1316 | 划转冻结失败
1317 | 划转解冻失败
1318 | 划转确认失败
1319 | 查询可划转金额失败
1320 | 此合约在非交易状态中, 无法进行系统划转
1321 | 划转失败, 请稍后重试或联系客服
1322 | 划转金额必须大于0
1323 | 服务异常, 划转失败, 请稍后再试
1325 | 设置交易单位失败
1326 | 获取交易单位失败
1327 | 无划转权限, 划转失败, 请联系客服
1328 | 无划转权限, 划转失败, 请联系客服
1329 | 无划转权限, 划转失败, 请联系客服
1330 | 无划转权限, 划转失败, 请联系客服
1331 | 超出划转精度限制(8位), 请修改后操作
1332 | 永续合约不存在
1333 | 开通跟单吃单协议失败
1334 | 查询跟单吃单协议失败
1335 | 查询跟单吃单二次确认设置失败
1336 | 更新跟单吃单二次确认设置失败
1337 | 查询跟单吃单设置失败
1338 | 更新跟单吃单设置失败
1339 | 昵称含有不合法词汇, 请修改
1340 | 昵称已被使用, 请修改
1341 | 报名阶段已结束
1342 | 子账号无法设置昵称
1343 | 指标失效, 请重新设置
1344 | 抱歉, 目前可最多对{0}个合约创建行情提醒
1345 | 抱歉, {0}合约目前可最多创建{1}个提醒
1346 | 该指标已存在, 请勿重复设置
1347 | {0}参数错误, 请修改
1348 | 该合约不支持全仓模式
1349 | 委托单倍数与当前持仓的倍数不符, 请先切换倍数
1401 | 委托价必须小于行权价
1403 | {0}合约止盈止损订单的委托数量不得超过{1}  
1404 | 止盈止损订单仅支持与开仓订单绑定 
1405 | 止盈价不得{0}{1}{2} 
1406 | 您的抽奖次数已用完 
1407 | 止损价不得{0}{1}{2}
1408 | 该止盈止损委托单未生效, 无法撤销
1409 | 您没有止盈止损订单权限,请联系客服
1410 | 批量操作子账号的数量不能超过{0}个
1411 | 结算中, 暂时无法查询订单信息
1412 | {0}不符合价格精度限制{1}   
1413 | 您没有跟踪委托订单权限,请联系客服
1414 | 您尚未开通网格交易协议(使用网格交易请先使用主账号登录web或APP端同意协议)
1415 | 终止价不得在网格价格范围内,请修改!
1416 | 超出最大运行时长({0}天{1}时),请修改!
1417 | 超出网格数量范围({0}~{1}个),请修改!
1418 | 最多同时运行{0}个网格, 请先终止其它网格
1419 | 超出初始化保证金范围({0}~{1}}{2})
1420 | 您没有合约的网格交易权限, 请联系客服
1421 | 当前合约有委托单或持仓, 请先撤销或平仓
1422 | 预计每格收益率小于0,请修改!
1423 | 网格最低价和最高价的价差不合理,请修改!
1424 | 该网格已因其它原因被终止, 无法修改或手动终止
1425 | 回调比例必须{0}{1}, 请修改!
1426 | 激活价必须{0}最新价
1427 | {0}合约跟踪委托订单数量不得超过{1}
1428 | 相同合约的优惠券只能领取1张
1429 | 已领取,请勿重复领取
1430 | 此优惠券已失效,请刷新
1431 | 系统维护中,预计GMT+8 {0} 可恢复
1432 | 存在初始化中的网格,暂时无法下单 
1433 | 您有限价单导致网格终止,请前往历史委托查看详情  
1434 | 小于最小初始担保资产({0}{1}), 导致每个网格的数量小于最小下单量, 请修改!
1435 | 该网格已被您手动终止
1436 | 网格超时, 自动终止
1437 | 系统原因导致网格终止, 请联系客服
1438 | 网格触发终止条件, 已终止
1439 | 网格触发强平, 已终止
1440 | {0}合约撤销失败
1441 | 触发价必须小于网格最高终止价, 大于网格最低终止价, 请修改!
1442 | 有效时长必须大于已运行时长1分钟以上, 请修改!
1443 | 合约{0}交割导致网格终止
1450 | 您所在的风险等级不支持使用当前倍数  
1451 | 您所在的风险等级不支持使用当前倍数, 请登录主账号查看
1452 | 网格订单数量超出平台数量限制, 暂时无法下单  
1453 | 计划委托订单数量超出平台数量限制, 暂时无法下单
1454 | 止盈止损订单数量超出平台数量限制, 暂时无法下单
1455 | 跟踪委托订单数量超出平台数量限制, 暂时无法下单 
12001 | 无效的提交时间
12002 | 错误的签名版本
12003 | 错误的签名方法
12004 | 密钥已经过期
12005 | ip地址错误
12006 | 提交时间不能为空
12007 | 公钥错误
12008 | 校验失败
12009 | 用户被锁定或不存在


## API 最佳实践

### 1、/api/v1/contract_hisorders 历史委托查询接口：

- 为了保证时效性和降低延迟，强烈建议用户使用/api/v1/contract_order_info获取用户订单信息接口来查询订单信息，获取合约订单信息接口从内存里面查询，无延迟，接口响应速度更快。

- 如果用户一定要使用/api/v1/contract_hisorders 历史委托查询接口，请尽量输入更多的查询条件，symbol、trade_type（推荐传0查询全部）、type、status、create_date尽量都输入，并且查询日期create_date参数输入尽量小的整数，最好只查询一天的数据；

 

### 2、/api/v1/contract_matchresults 获取历史成交记录接口：

- 为了提升查询的性能和响应速度，查询条件 symbol 、trade_type（推荐传0查询全部） 、contract_code 、create_date 尽量都输入，并且create_date输入尽量小的整数，最好只查询一天的数据；

 

### 3、/api/v1/contract_financial_record 查询用户财务记录接口：

- 为了提升查询的性能和响应速度，查询条件symbol、type（推荐不填查询全部）、create_date，尽量都输入，并且查询日期create_date参数输入尽量小的整数，最好只查询一天的数据；

 

### 4、/api/v1/contract_order_detail 获取订单明细接口：

- 请求参数没有带上created_at等参数查询订单时，可能会发生查询结果延迟。建议您在使用此接口时请求字段带上：created_at（下单时间戳）和 order_type(订单类型，默认填1)，会直接查询数据库，查询结果会更及时。

- 查询条件created_at使用13位long类型时间戳（包含毫秒时间），如果输入准确的时间戳，查询性能将会提升。

- 例如:"2019/10/18 10:26:22"转换为时间戳为：1571365582123。也可以直接从contract_order下单接口返回报文中的ts中获取时间戳作为参数查询接口/api/v1/contract_order_detail获取订单明细，同时created_at禁止传0；；

 
### 5、/api/v1/contract_trigger_hisorders 获取计划委托历史委托接口：

- 为了提升查询的性能和响应速度，参数symbol、contract_code、trade_type、status、create_date尽量都输入，并且查询日期create_date参数输入尽量小的整数，最好只查询一天的数据；

 
### 6、订阅Market Depth 数据的WebSocket：

- 获得150档深度数据，使用step0, step1, step2, step3, step4, step5,step14,step15；

- 获得20档深度数据，使用 step6, step7, step8, step9, step10, step11,step12,step13；

- 由于每100ms推送一次150档全量数据，数据量比较大，如果客户端网络带宽不足或者处理不及时，webSocket断开可能比较频繁，强烈建议使用step6, step7, step8, step9, step10, step11, step12, step13 取20档数据。比如订阅20档数据

`{`

  `"sub": "market.BTC_CQ.depth.step6",`

  `"id": "id5"`

`}`

- 我们也推荐使用增量订阅市场深度数据，增量深度数据有20档不合并数据和150档不合并数据，首次或者重连都推送全量数据，之后会推送增量数据，每30MS检查一次，如果有更新则推送，没有更新则不推送。需要维护好本地的深度数据。

`{`

  `"sub": "market.BTC_CQ.depth.size_20.high_freq",`

  `"data_type":"incremental",`

  `"id": "id1"`

`}`
 

### 7、/api/v1/contract_order合约下单和api/v1/contract_batchorder合约批量下单接口：

- 推荐传参数client_order_id（用户级别唯一），主要防止下单和批量下单接口由于网络或其它原因接口超时或者没有返回，可以根据client_order_id通过请求接口/api/v1/contract_order_info来快速获取订单是否下单正常或者快速获取订单信息。

### 8、服务器部署最佳选择：

- 建议您将服务器放置在AWS东京C区，并且使用api.hbdm.vn域名，能有效减少网络断连与网络超时情况。



## 代码实例

**REST**

- <a href='https://github.com/huobiapi/Futures-Java-demo'>Java</a>

- <a href='https://github.com/huobiapi/Futures-Python-demo'>Python</a>

- <a href='https://github.com/huobiapi/Futures-Go-demo'>Golang</a>

- <a href='https://github.com/huobiapi/Futures-CSharp-demo'>CSharp</a>

- <a href='https://github.com/huobiapi/Futures-PHP-demo'>PHP</a>

- <a href='https://github.com/huobiapi/Futures-Node.js-demo'>Node.js</a>

- <a href='https://github.com/huobiapi/Futures-Yi-demo'>易语言</a>

- <a href='https://github.com/hbdmapi/huobi_futures_Postman'>Postman</a>
  
**Websocket**

- <a href='https://github.com/huobiapi/Futures-Java-demo/tree/master/WebSocket-JAVA-demo'>Java</a>

- <a href='https://github.com/huobiapi/Futures-Python-demo/tree/master/Websocket-Python3-demo'>Python</a>

- <a href='https://github.com/huobiapi/Futures-Node.js-demo/tree/master/WebSocket-Node.js-demo'>Node.js</a>

**合约sdk**

- <a href='https://github.com/hbdmapi/huobi_future_Java'>Java sdk</a>

**异步库**

- <a href='https://github.com/hbdmapi/huobi_future_async'> Rust </a>

# 常见问题

## 接入验签相关

### Q1: 合约API Key和现货是否同一个？

合约API Key和现货API Key是同一个，两个是一样的。您可以在 <a href='https://www.hbg.com/zh-cn/apikey/'>这里 </a> 创建 API Key。

### Q2: 为什么经常出现断线、超时的错误？

如果是在大陆网络环境去请求API接口，网络连接很不稳定，很容易出现超时。建议使用AWS东京C区服务器进行访问。

国内网络可以使用api.btcgateway.pro或者api.hbdm.vn来进行调试,如果仍然无法请求，请在国外服务器上进行运行。

### Q3: 为什么WebSocket总是断开连接？

由于网络环境不同，很容易导致websocket断开连接(websocket: close 1006 (abnormal closure))，目前最佳实践是建议您将服务器放置在AWS东京C区，并且使用api.hbdm.vn域名；同时需要做好断连重连操作；行情心跳与订单心跳均需要按照《Websocket心跳以及鉴权接口》的行情心跳与订单心跳回复不同格式的Pong消息：<a href='https://docs.huobigroup.com/docs/coin_margined_swap/v1/cn/#472585d15d'>这里</a>。以上操作可以有效减少断连情况。

### Q4: api.hbdm.com与api.hbdm.vn有什么区别？

api.hbdm.vn域名使用的是AWS的CDN服务，理论上AWS服务器用户使用此域名会更快更稳定；api.hbdm.com域名使用的是Cloudflare的CDN服务。

### Q5: 市商享受的colocation服务是指什么以及使用注意事项？

colo相当于是 创建一个VPC节点，直接连了火币合约的内网，会减少客户服务器和火币合约服务器的通讯时间（绕过CDN）。

火币交割合约 的Colocation和 永续合约 是共用的，即连接永续合约Colocation的域名与交割合约是一样的；

但请您注意：colo需要使用：api.hbdm.com 进行签名（鉴权），避免返回403:Verification failure [校验失败] 的错误。

### Q6: 为什么签名认证总返回失败(403:Verification failure [校验失败]) ？

交割签名过程和现货签名过程类似，除了参考以下注意事项外，请参照现货或者永续的demo代码来验证签名是否成功，demo代码验证通过后，再去核对您自己的签名代码。币本位永续的demo代码在 <a href='https://docs.huobigroup.com/docs/coin_margined_swap/v1/cn/#2cff7db524'>  这里 </a>   查看。交割的demo代码在<a href='https://docs.huobigroup.com/docs/dm/v1/cn/#2cff7db524'>  这里</a>  查看。USDT本位永续的demo代码在 <a href='https://docs.huobigroup.com/docs/usdt_swap/v1/cn/#2cff7db524'>  这里 </a>  查看。

1. 检查 API Key 是否有效，是否复制正确

2. 是否有绑定 IP 白名单

3. 检查时间戳是否是 UTC 时间

4. 检查参数是否按字母排序

5. 检查编码，使用 UTF-8 编码

6. 检查签名是否有 base64 编码

7. 对于 GET 请求，每个方法自带的参数都需要进行签名运算

8. 对于 POST 请求，每个方法自带的参数不进行签名认证

9. 检查签名结果是否有进行 URI 编码，十六进制字符必须大写，如 “:” 会被编码为 “%3A” ，空 格被编码为 “%20”

10. websocket构建签名与restful类似，websocket构造json请求数据时不需要URL编码。

11. 签名时所带Host应与请求接口时Host相同。如果您使用了代理，代理可能会改变请求Host，可以尝试去掉代理；您使用的网络连接库可能会把端口包含在Host内，可以尝试在签名用到的Host中包含端口，如“api.hbdm.com:443"

12. Api Key 与 Secret Key中是否存在隐藏特殊字符，影响签名。

13. 检查生成 HmacSHA256 签名结果后是否直接将byte[] 转 Base64 编码，而不是使用其签名结果转换16进制字符串的内容再进行 Base64 编码。

如果通过以上的方法还没找出签名失败的原因，可以通过专门验证签名的 <a href='https://github.com/hbdmapi/huobi_api_rules '>  demo </a> 来确认您的签名是在哪一步出现问题。

### Q7: 公开行情根据ip限速，需要私钥的根据uid限速是吗？

是的。私有的根据UID来限速，不是根据API—KEY限速，母子帐号是分开分别限速，互不影响。

### Q8: 第三方框架集成火币合约是否有推荐？

目前已经有异步量化框架开源，集成了火币交割合约与永续合约： <a href=https://github.com/hbdmapi/hbdm_Python> 异步量化框架地址 </a>，有使用反馈或者问题请在github issue区进行提问。


## 行情及WS推送相关

### Q1: 全量行情orderbook订阅和增量orderbook订阅是多长时间推送？

全量orderbook深度推送(market.$symbol.depth.$type)是100MS检查一次，有更新则推送，至少1秒会推送1次。增量orderbook深度推送(market.$symbol.depth.size_${size}.high_freq)是30MS检查一次，有更新则推送，没有更新则不推送。

### Q2: 市场公开逐笔成交是多长时间推送？

市场公开逐笔成交market.$symbol.trade.detail是有成交则推送。

### Q3: 有没有历史K线数据或者历史的公开市场逐笔成交数据？

历史K线数据可以通过API接口/market/history/kline去获取，通过from,to来截取时间段获取（时间段不能超过两年），每次获取的数据不得超过2000条。

历史的公开市场逐笔成交数据，您可以通过订阅market.$symbol.trade.detail来本地进行存储。 

或者您可以通过 <a href='https://futures.huobi.be/zh-cn/data/landing_page'>历史行情数据下载</a> 来获取数据。

您也可以通过 <a href='https://github.com/hbdmapi/huobi_public_data'>Python的历史行情数据下载DEMO</a> 来获取数据。

### Q4: 如何获取K线上的MACD等技术指标？

API没有获取K线上的MACD等技术指标接口，您可以参考TradingView等网站来计算。

### Q5: 文档里的时间戳timestamp定义是什么？

文档里的时间戳是指格林威治时间1970年01月01日00时00分00秒(北京时间1970年01月01日08时00分00秒)起至现在的总秒数或者总毫秒数。

### Q6: 获取行情深度数据中请求参数type的 150档，20档具体是指？

订阅行情深度market.$symbol.depth.$type,150档指当前盘口的买卖盘的订单，将价格顺序切分为150个小区间，统计每个小区间的挂单数；20档指当前盘口的买卖盘的订单，将价格顺序切分为20个小区间，统计每个小区间的挂单数。

### Q7: 获取行情深度数据中请求参数type的“合并深度”是什么意思？

订阅行情深度(market.$symbol.depth.$type)：

step1和step7 按5位小数合并，买盘向下、卖盘向上
step2和step8 按4位小数合并，买盘向下、卖盘向上
step3和step9 按3位小数合并，买盘向下、卖盘向上
step4和step10 按2位小数合并，买盘向下、卖盘向上
step5和step11 按1位小数合并，买盘向下、卖盘向上
step12和step14 按个位数合并，买盘向下、卖盘向上
step13和step15 按十位数合并，买盘向下、卖盘向上
step4 合并为0.01 例如，下买单价格 100.123， 100.245，
盘口就显示下单价格 100.12， 100.24
如果是卖单 盘口显示价格： 100.13， 100.25

（“向下”和“向上”即是否四舍五入，如买盘向下则不进一位，卖盘向上则进一位）
step0到step5,step14,step15是150档；
step6到step13是20档；
step6是不合并小数；
结合以上举例说明：

假设当前价格1.123456  6位小数点，如果我单选step1，如果价格是买盘，显示价格是 1.12345（不四舍五入），如果是卖盘，就是1.12346（四舍五入）；

同理，如果我选择step7也是同样的，如果价格是买盘，显示价格是 1.12345（不四舍五入），如果是卖盘，就是1.12346（四舍五入）；

假设是TRX 选择20档 那么step6是不合并，如果当前价格是1.123456 6位小数点，选择step6，不论买卖盘口还是1.123456 6位小数；

假设是TRX 选择20档 那么step11按1位小数合并，假设当前价格1.123456 6位小数点，如果我单选step11，如果价格是买盘，显示价格是 1.1（不四舍五入），如果是卖盘，就是1.1（四舍五入)。

### Q8: websocket的持仓变动频道，每次是返回全量数据还是增量变化的数据？

订阅持仓推送："topic": "positions.BTC_CQ"，推送的是最新的持仓（包括持仓量、可平仓数量、冻结数量），没有变化就不推送。

### Q9: websocket持仓订阅频道，未实现盈亏有变化会推送吗?

订阅持仓推送："topic": "positions.BTC_CQ", 如果持仓有变动，包括开仓/平仓/交割等，会推送仓位变化，若只是单纯的未实现盈亏不会推送。

### Q10: WS中的market detail 和 trade detail 具体什么区别和含义?

Market Detail(market.$symbol.detail)  是市场聚合行情，0.5s检查1次，无成交不推送。包含了此时间段的开盘价、收盘价、最高价、最低价和成交数量；Trade Detail(market.$symbol.trade.detail) 是有成交更新就会推送，包括成交价格、成交数量和成交方向等数据。

### Q11: 订阅market depth增量数据返回参数的两个ts分别是什么？

增量depth订阅：market.$symbol.depth.size_${size}.high_freq，外层ts是到行情服务器开始转发这笔数据的系统时间戳，里层ts是orderbook的检测时间点。

### Q12: 通过ws订阅market depth数据和market depth增量数据的区别是什么？订阅market depth增量数据多久推送一次？

market.$symbol.depth.$type是全量数据，market.$symbol.depth.size_${size}.high_freq是增量数据，全量数据是100ms检查一次，至少1秒推送1次；增量30MS检查1次，无更新不推送。

目前market depth增量数据market.$symbol.depth.size_${size}.high_freq是30MS检测一次，不是随机检测，30m检查一次更新，但是有二台机同时进行，每两次的时间间隔最小可能是0，但30ms内最多推送6次，最大时间间隔无上限，30ms内最少推送次数为0。

### Q13: 增量数据market.$symbol.depth.size_${size}.high_freq推送如何维护本地数据？

增量数据首次会推送全量数据，之后推送的为增量数据。

(1) 把增量的价格与上一个全量做比较，相同的价格把挂单量替换；

(2) 没有相同价格的添加到本地全量数据；

(3) 如果某个价格挂单没有了，会推送类似[8100, 0]这样的数据，把本地相同价格的移除；

(4) 同一个websocket连接，增量数据version是递增的；如果 version不递增，您需要重新订阅并重新维护本地全量数据；

### Q14: 交割合约季度合约转为次周合约，WS推送是否会通知或者如何更改？

如果季度合约例如BTC_CQ转为次周合约BTC_NW，WS不会自动通知，您需要重新变更订阅为BTC_NW。

### Q15: 订阅多个合约代码同一主题时, 需要多个 ws 连接吗?

对于交割合约、币永续、u永续之间, 由于是不同的接口地址, 需要不同的 ws 连接

对于交割合约、币永续、u永续各自里面, 只要接口地址是一样的, 一个 ws 连接即可. 

### Q16: 是否可以通过 ws 下单和撤单?

目前不支持 ws 下单和撤单

### Q17: 如何订阅订单状态?

a. 订单交易成功: ”订阅合约订单撮合数据（matchOrders.$symbol）"或"订阅订单成交数据（orders.$symbol）"

b. 订单撤单成功: 订阅"资产变动数据（accounts.$symbol）”

### Q18: ”订阅合约订单撮合数据（matchOrders.$symbol）"和"订阅订单成交数据（orders.$symbol）"的区别

两者推送的数据不一样, 订单成交数据（orders.$symbol）会比订单撮合数据（matchOrders.$symbol）字段多一些

通常情况下, 撮合完成后的推送(订单撮合数据“matchOrders.$symbol”)要比清算完成后的(订单成交数据“orders.$symbol”)推送快, 但不能保证撮合完成后的推送一定比清算完成后的推送更快;

强平以及轧差订单不会推送"订单撮合数据（matchOrders.$symbol）”

### Q19: "订阅 KLine 数据（market.$symbol.kline.$period）”多久推送一次

有成交时, 500ms推送一次

无成交时, 根据订阅的周期推送

### Q20: 如何判断推送是否延迟

判断是否延迟, 请先同步服务器时间, 同步服务器时间接口为: https://api.hbdm.com/api/v1/timestamp, 返回数据中的 ts 是时间戳（毫秒）, 对应的时区是 UTC+8.

每个推送数据的外层都会有一个推送数据 ts, 这个 ts 是服务器推送数据给客户端那一刻的间戳（毫秒）, 对应的时区是 UTC+8.

当有推送数据到达时, 程序记录此时本地时间 ts. 当发现本地时间 ts 远远大于推送数据 ts 时（本地时间远远晚于推送数据时间）, 可以通过以下方式定位延迟和解决延迟: 

a. 减少订阅时推送的数据. 

b. 查看本地网络和服务器间的稳定性和速度（请把 api.btcgateway.pro 替换为程序使用的域名）

curl -o /dev/null -s -w time_namelookup"(s)":%{time_namelookup}"\n"time_connect"(s)":%{time_connect}"\n"time_starttransfer"(s)":%{time_starttransfer}"\n"time_total"(s)":%{time_total}"\n"speed_download"(B/s)":%{speed_download}"\n" api.btcgateway.pro

收到类似以下数据: 

time_namelookup(s):0.001378

time_connect(s):0.128641

time_starttransfer(s):0.276588

time_total(s):0.276804

speed_download(B/s):2010.000

若连续多次运行以上命令, 每次得到的结果差异很大, 可以: a.选择合适的火币域名, b.优化或者重新选择程序所在网络. 

## 交易相关

### Q1: 交割合约什么时候结算？周五结算时通过哪些接口可以查询状态？

在结算时不能下单和撤单，若用户在结算期间下单或撤单会返回错误码“1056”，提示结算中无法下单和撤单。

建议您在结算时间点每隔几秒钟轮询获取合约信息接口： /api/v1/contract_contract_info，当返回报文中contract_status返回状态码为5、6、7、8中的任意一个时表示在结算中，当contract_status返回状态码为1时是表示结算完成可以正常下单和撤单。

温馨提示您，交割合约在新加坡时间每天16:00进行结算或周五16:00进行交割。在结算或交割期间查询资金和持仓会返回错误码，返回的错误码及错误码表示的含义如下：

1. 错误码"1077"表示"交割结算中，当前品种资金查询失败"；
2. 错误码"1078"表示"交割结算中，部分品种资金查询失败"；
3. 错误码"1079"表示"交割结算中，当前品种持仓查询失败"；
4. 错误码"1080"表示"交割结算中，部分品种持仓查询失败"；

建议您从返回的报文里读取状态码，如果状态码出现上述四种类型，请不要用这个返回的数据。

### Q2: API返回1004错误码是什么原因？

由于近段时间平台系统订单堆积情况比较严重，我们的技术人员正在努力解决和优化中，如果近段时间出现系统繁忙的情况或者出现以下提示：

{“status”:”error”,”err_code”:1004,”err_msg”:”System busy. Please try again later.”,”ts”: }

请您耐心等待，在此过程中请不要进行重复的下单和撤单，以避免造成重复下单以及对系统性能造成额外的压力，在此期间，建议您可以通过Web和APP端进行下单和撤单。

### Q3: 同样的order id 和 match id，可以有N多个Trade，比如，用户是一笔大的taker单，吃掉了N个maker的订单，那么，就会对应有N个trade，如何标识这些不同的trade？

订单明细信息接口/api/v1/contract_order_detail返回的的字段id是全局唯一的交易标识。如果一个maker单，分多次match掉的话是每次推送只推match的部分，撮合一笔推送一笔。

### Q4: 交割合约交易全链路延时多少？

目前交割合约全链路(从开始下单到订单的订单状态可以查询)正常情况下大约在30-50MS左右,来行情时延迟会比平时大，可能会在秒级别。

### Q5: API接口返回Connection Reset 或者 Max retris 或者 Timed out 是什么原因？

出现连接重置或者网络超时，一般是网络不稳定导致，可以尝试将服务器放置在AWS东京C区，并使用api.hbdm.vn来尝试，可以有效减少网络超时等错误。

### Q6: API接口下单时出错没有order_id如何来查询订单状态？

如果由于网络原因等API下单超时或者失败，没有返回order_id，可以通过下单时加入client_order_id自定义订单号来进行查询订单状态。

### Q7: WS 订阅私有账户，订单或者仓位一段时间，连接断开如何办？

WS订阅私有账户，订单，仓位时，请注意也要定时维护好心跳，与市场行情的心跳格式不同，详情请参照菜单《Websocket心跳以及鉴权接口》里的订单推送心跳。同时如果连接断开，请做好重连逻辑。

### Q8: 合约资产接口中的“获取合约订单信息”的订单状态1和2都是准备提交有什么不同？3已提交又是什么？

1是准备提交，2是定序的提交，是内部流程的提交。可以认为已经被系统接受了，在系统的流程中。3是已委托到市场。

### Q9: API有获取总资产BTC的接口吗？

没有的。

### Q10: API撤单成功为什么查询订单却是成交？

请注意撤单成功或者下单成功只代表您撤单命令或者下单命令的成功，并不代表订单已经撤销，您可以通过该接口/api/v1/contract_order_info去查询订单状态。

### Q11: API一般从撤单开始到撤单成功需要多久？

撤单命令执行成功一般几十ms，实际撤单状态要查询订单状态/api/v1/contract_order_info获取。

### Q12: 获取历史强平订单的方法？

需要获取历史强平订单，可以通过：获取合约历史委托（/api/v1/contract_hisorders）、获取历史成交记录（/api/v1/contract_matchresults）、组合查询合约历史委托（/api/v1/contract_hisorders_exact）、组合查询历史成交记录接口（/api/v1/contract_matchresults_exact）这四个接口中的返回字段order_source(订单来源)来判断，当order_source返回的为“risk”说明这个订单就是被强平的订单。

### Q13: 用户开不了仓?
1、不满足可开最低张数的担保资产需求；
2、超出限价机制下单开仓；
3、超出单笔下单数量上限；
4、超出单个用户持仓数量上限；
5、交割前10分钟内只能平仓，不能开仓；(错误代码 1105)
6、强平系统接管处理中

### Q14: 如何查询交易所系统状态

交易所系统常见的两种状态: 系统处于结算/交割；停机维护. 当系统处于这两种状态时, 调用 api 接口会返回响应的错误代码和错误信息

a.如何判断是否是结算/交割完成

通过"获取合约信息”接口: /api/v1/contract_contract_info

在返回值中的 contract_status 来判断, 如果值为 1 表示已经结算/交割完成, 可以正常交易了

b.如何判断是否是停机维护

通过"查询系统是否可用”接口: https://api.hbdm.com/heartbeat/

或者"订阅系统状态更新”接口: "topic ": "public.$service.heartbeat"

在推送值中的 heartbeat 来判断, 如果值为 1 表示系统为可用, 可以正常连接了

### Q15: 是否支持双向持仓

支持的. 火币目前是支持同时持有空单和多单的

### Q16: 如何保证快速成交

火币合约目前是没有市价的. 为提高成交概率, 可以使用对手价: opponent, 最优5档: optimal_5, 最优10档: optimal_10, 最优20档: optimal_20. 其中最优20档的成交概率最大, 但是滑点也最大. 

需要注意的是, 以上下单价格方式, 不保证 100% 成交的. 系统执行下单时, 是获取当时时刻的对方 N 档价格, 进行下单的. 

### Q17: api 程序如何更快连接到交易所

推荐使用 AWS 东京 c 区服务器, 同时使用 api.hbdm.vn 域名连接

### Q18: 现货与合约之间, 划转报 Abnormal service 错误

a.检查请求地址是否为火币 Global 地址: api.huobi.pro

b.检查币的精度是否不超过 8 位小数

### Q19: 如何确认是否开仓/平仓成功

"合约下单（/api/v1/contract_order）”接口或者"合约批量下单（/api/v1/contract_batchorder）”接口下单成功后, 不代表已经开仓/平仓成功. 只是意味着服务器已经成功收到你的下单指令

查询是否开仓/平仓成功，可以使用返回的“order_id” 通过“获取合约订单信息（/api/v1/contract_order_info）” 或 “获取订单明细信息（/api/v1/contract_order_detail）”这两个接口来查询订单状态。当订单已经成交后，接口返回参数中的status 值为 6 （全部成交）。

但同时需要注意：

a.获取合约订单信息（/api/v1/contract_order_info）接口在系统结算或交割后，会把结束状态的订单（5部分成交已撤单 6全部成交 7已撤单）删除掉。

b.获取订单明细信息（/api/v1/contract_order_detail）接口存在延迟情况，所以查询时最好带上：created_at（下单时间戳）和 order_type(订单类型，默认填1)，会直接查询数据库，查询结果会更及时。


### Q20: 为什么系统自动撤单了?

下单时 order_price_type 为: IOC, FOK, Maker（post_only） 当盘口不满足条件时, 会自动撤单

post_only, 只做Maker（Post only）订单, 不会立刻在市场上成交, 如果委托会立即与已有委托成交, 那么该委托会被取消, 保证用户始终为Maker. 

IOC 订单, 若不能在市场上立即成交, 则未成交的部分立即取消. 

FOK 订单, 若不能全部成交则立即全部取消. 

### Q21: 如何获取用户当前资产最大可开张数

目前没有直接获取当前资产最大可开张数的接口. 

### Q22: order_id 和 order_id_str 是一样的吗?

order_id_str 是 order_id 的字符串格式, 两者的值是一样的

对于 18 位的 order_id, 在 nodejs 和 javascript 的 JSON.parse 默认是 int, 解析会有问题, 因此推荐使用 order_id_str

### Q23: 如何获取成交数据中的主买/主卖数量

"获取市场最近成交记录（/market/trade）”接口或"sub": "market.$symbol.trade.detail"订阅, 可以获取此数据, 其中: 

amount: 成交量(张), 买卖双边成交量之和

direction: 主动成交方向

### Q24: 获取K线数据时, from 和 to 的时间间隔是 2000 * period, 为什么获取的 data 为[]?

获取 K 线时, from 和 to 两个时间点是全都包含在内的, 因此是 2001 条数据. 此时数量超出了最大条数 2000. 所以返回 []

另外，当 from 和 to 的时间超过 2 年，返回的数据也会是 []

### Q25: 如何获取合约最新价格

a.调用"获取K线数据”接口, 任意 period, 返回数据的最后一条数据的 close 就是最新价. 

b.调用"获取市场最近成交记录”接口, 返回数据的 price 就是最新价

### Q26: 如何获取最新指数价?

有两种方式获取最新指数价: 

a.通过调用"获取合约指数信息（/api/v1/contract_index）”接口, 返回数据中的 index_price 就是最新指数价

b.通过订阅"指数K线数据（market.$symbol.index.$period）”websocket, 返回数据的最后一条k线的 close 就是最新指数价

### Q27: API 升级会影响程序的运行吗?

一般情况, API 升级会部分影响 ws 断连, 请做好 ws 重连逻辑. 升级内容可以订阅升级公告: 

交割: https://status-dm.huobigroup.com/

币本位永续: https://status-swap.huobigroup.com/

USDT本位永续: https://status-linear-swap.huobigroup.com/

### Q28: "获取用户账户信息（/api/v1/contract_account_info）"中 margin_balance 是指什么?

margin_balance 是指账户权益

1、账户权益（margin_balance）= 静态权益（margin_static）+ 未实现盈亏（profit_unreal）。

2、账户权益（margin_balance）= 账户余额 + 已实现盈亏（profit_real）+ 未实现盈亏（profit_unreal）。

注：账户余额 = 静态权益（margin_static）- 已实现盈亏（profit_real），我们在API中只给出了静态权益字段。

以上二种计算方式都可以得出帐户权益。

### Q29: 获取用户账户信息（/api/v1/contract_account_info）中的risk_rate "保证金率”和WEB端的"担保资产率”是一样的吗?

是一样的.
当 risk_rate <= 0 时, 用户的仓位将会被系统强平.

## 错误码相关

### Q1: 1030错误是什么原因？

如果您出现比如查询订单或者下单时遇到：{"status":"error","err_code":1030,"err_msg":"Abnormal service. Please try again later.","ts":1588093883199}类似错误，说明您的输入的请求参数值或者类型不对，请打印出您的request请求body及完整URL参数，并请一一核对对应API文档接口参数。常见的比如volume张数必须是整数。

### Q2: 1048错误是什么原因？

如果您出现{'index': 1, 'err_code': 1048, 'err_msg': 'Insufficient close amount available. '}类似错误，说明此时可平仓量不足，您平仓时需查询目前已有的仓位张数再去平仓。

1、检查平仓的张数是否过大（当有平仓的限价挂单时, 会占用可平仓位的张数, 建议您撤销这些挂单后再去重试）. 

2、检查仓位方向和开平方向（平多: 卖出平多(direction用sell、offset用close)、平空: 买入平空(direction用buy、offset用close)、闪电平仓只需传: direction（平多:sell、平空: buy））. 

3、止盈止损的挂单和计划委托的挂单, 不会占仓位数. 

### Q3: API返回1032错误码是什么原因？

1032代表您的访问次数超出限制，币本位永续合约、交割合约和USDT永续合约是分开限制频率，请查看合约交易接入说明中的访问次数限制，并且可以在api接口response中的header打印当前的频率限制次数来看是否超出限制频率。建议加大请求间隔延时避免超出限制频率。

## 如何更有效的解决问题

  您在反馈API错误时，需要附上您的请求URL，请求request的原始的完整body以及完整请求URL参数，服务器的回复response的原始完整log。如果是websocket订阅，需要您提供订阅的地址，订阅的主题，server推送的原始完整log。

  如果是订单相关问题，在使用API订单查询接口api/v1/contract_order_info请求后保留返回的完整log，并提供您的UID以及订单号。


# 合约市场行情接口

## 获取合约信息 

###  示例
      
- GET `/api/v1/contract_contract_info`

```shell
curl "https://api.hbdm.com/api/v1/contract_contract_info"
```

###  请求参数

参数名称     |  参数类型   |  必填   |  描述  |
---------------- |  -------------- |  ---------- |  ------------------------------------------------------------|
symbol           |  string         |  false |      支持大小写，"BTC","ETH"...  |
contract_type   |  string         |  false |      合约类型: （this_week:当周 next_week:下周 quarter:当季 next_quarter:次季） |
contract_code   |  string         |  false |      BTC180914  |

### 备注： 

如果不填，默认查询所有所有合约信息;

如果contract_code填了值，那就按照contract_code去查询;

如果contract_code没有填值，则按照symbol+contract_type去查询,contract_type参数需要和symbol配合查询;

> Response:

```json

{
    "status":"ok",
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC210813",
            "contract_type":"this_week",
            "contract_size":100,
            "price_tick":0.01,
            "delivery_date":"20210813",
            "delivery_time":"1628841600000",
            "create_date":"20210730",
            "contract_status":1,
            "settlement_time":"1628668800000"
        },
        {
            "symbol":"ETH",
            "contract_code":"ETH210813",
            "contract_type":"this_week",
            "contract_size":10,
            "price_tick":0.001,
            "delivery_date":"20210813",
            "delivery_time":"1628841600000",
            "create_date":"20210730",
            "contract_status":1,
            "settlement_time":"1628668800000"
        }
    ],
    "ts":1628650535608
}
```

###  返回参数

参数名称              |  是否必须   |  类型   |  描述                          |  取值范围|
-------------------------- |  ----------------- |  ---------- |  --------------------------------- |  -----------------------------------------------------------------------|
status                     |  true           |  string     |  请求处理结果                      |  "ok" , "error"  |
\<data\>    |              |           |                              |   |
symbol                     |  true           |  string     |  品种代码                          |  "BTC","ETH"...  |
contract_code             |  true           |  string     |  合约代码                          |  "BTC180914" ...  |
contract_type             |  true           |  string     |  合约类型                          |  当周:"this_week", 次周:"next_week", 当季:"quarter",次季:"next_quarter" |
contract_size             |  true           |  decimal    |  合约面值，即1张合约对应多少美元   |  10, 100...  |
price_tick                |  true           |  decimal    |  合约价格最小变动精度             |  0.001, 0.01...  |
delivery_date             |  true           |  string     |  合约交割日期                     |  如"20180720"  |
create_date               |  true           |  string     |  合约上市日期                      |  如"20180706"  |
settlement_time               |  true           |  string     |  下次结算时间（毫秒时间戳）                      |   |
delivery_time               |  true           |  string     |  交割时间（毫秒时间戳）                 |    |
contract_status           |  true           |  int        |  合约状态                          |  合约状态: 0:已下市、1:上市、2:待上市、3:停牌，4:暂停上市中、5:结算中、6:交割中、7:结算完成、8:交割完成、9:暂停交易中  |
\</data\>    |             |               |                     |        |                 
ts                         |  true           |  long       |  响应生成时间点，单位：毫秒  |      


## 获取合约指数信息

###  示例

- GET `/api/v1/contract_index`

```shell
curl "https://api.hbdm.com/api/v1/contract_index?symbol=BTC"
```

###  请求参数

参数名称   |  参数类型   | 必填   | 描述  |
-------------- |  -------------- |  ---------- |  ----------------  |
symbol         |  string         |  false       |  指数代码，不传查询所有指数信息。支持大小写，"BTC","ETH"...  |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "index_price": 13707.26,
            "index_ts": 1604296614010
        }
    ],
    "ts": 1604296620746
}
```

###  返回参数

参数名称               | 是否必须   | 类型   |  描述             | 取值范围 |
--------------------------  | --------------| ----------  | ---------------------------- |  ----------------  |
status                    | true           |  string     |  请求处理结果                 |  "ok" , "error"  |
\<data\>   |                |           |                           |  |
symbol                     |  true           |  string     |  指数代码                    | "BTC","ETH"...  |
index_price               |  true           |  decimal    |  指数价格   |                  |
index_ts                |  true           |  long   |  响应生成时间点，单位：毫秒   |                  |
\</data\>               |                |           |                           |  |                                                            
ts                         |  true           |  long       |  时间戳，单位：毫秒   |   |

## 获取合约最高限价和最低限价

###  示例

- GET `/api/v1/contract_price_limit`

```shell
curl "https://api.hbdm.com/api/v1/contract_price_limit?symbol=BTC&contract_type=this_week"
```

###  请求参数

参数名称     | 参数类型    | 必填    | 描述 |
----------------  | --------------  | ---------- |  -----------------------------------------------------------------  |
symbol           |  string         |  false      |  支持大小写，"BTC","ETH"...  |
contract_type   |  string         |  false      |  合约类型 (当周:"this_week", 次周:"next_week", 当季:"quarter",次季:"next_quarter")  |
contract_code   |  string         |  false      |  BTC180914 ...  |

###  备注：
所有入参都不填，接口返回所有当前上市合约的限价数据。

如果contract_code填了值，那就按照contract_code去查询；

contract_type参数需要和symbol配合查询，仅传contract_type查询不到合约数据。

> Response:

```json

{
    "status":"ok",
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC210813",
            "contract_type":"this_week",
            "high_limit":46365.84,
            "low_limit":44547.58
        }
    ],
    "ts":1628650919495
}
```

###  返回参数

参数名称              | 是否必须   | 类型    | 描述                      | 取值范围 |
-------------------------- |-------------- |---------- |---------------------------- |------------------------------------------------------ |
status  |  true  |  string  |  请求处理结果  |  "ok" ,"error"  |
\<data\>  |    |   |    |    |
symbol  |  true  |  string  |  品种代码  |  "BTC","ETH" ...                                    |
high_limit  |  true  |  decimal  |  最高买价|                                                          |
low_limit  | true  |  decimal   |  最低卖价|                                                          |
contract_code  |  true  |  string  |  合约代码  |  如"BTC180914" ...                                          |
contract_type  |  true  |  string  |  合约类型  |  当周:"this_week", 次周:"next_week", 当季:"quarter" ,次季:"next_quarter"             |
\<data\>  |    |    |    |    |
ts  |    true  |  long  |  响应生成时间点，单位：毫秒              |            |


## 获取当前可用合约总持仓量 

###  示例

- GET `/api/v1/contract_open_interest`

```shell
curl "https://api.hbdm.com/api/v1/contract_open_interest?symbol=BTC&contract_type=this_week"
```

###  请求参数

参数名称 | 参数类型    | 必填    | 描述 |
---------------- |  -------------- |  ---------- |  -----------------------------------------------------------------  |
symbol  |  string  |    false  | 支持大小写，"BTC","ETH"...  |
contract_type  |   string  |    false  | 合约类型 (当周:"this_week", 次周:"next_week", 当季:"quarter",次季:"next_quarter")  |
contract_code  |   string  |    false  | BTC180914  |

#### 备注
不传参数时可以查询所有品种合约总持仓。 

如果contract_code填了值，那就按照contract_code去查询；

如果contract_code没有填值，则按照symbol+contract_type去查询,contract_type参数需要和symbol配合查询;

> Response:

```json

{
    "status":"ok",
    "data":[
        {
            "volume":399976,
            "amount":877.273288561929011611,
            "symbol":"BTC",
            "contract_type":"this_week",
            "contract_code":"BTC210813",
            "trade_amount":4986.5280025389395513567887943123717024664,
            "trade_volume":2272868,
            "trade_turnover":227286800
        }
    ],
    "ts":1628651933482
}
```

###  返回参数

参数名称 |     是否必须    | 类型    | 描述 | 取值范围 |
-------------------------- |  -------------- |  ---------- |  ----------------------------  | ------------------------------------------------------  |
status  |  true  |  string  |  请求处理结果| "ok" , "error"  |
\<data\>  |    |    |   |    |
symbol  |  true  |  string  |  品种代码  |  "BTC", "ETH" ...  |
contract_type  |  true  |  string  |  合约类型|  当周:"this_week", 次周:"next_week", 当季:"quarter",次季:"next_quarter" |
volume  |  true  |  decimal  |  持仓量(张)。 单边数量 |    |   
amount  |  true  |  decimal  |  持仓量(币)。 单边数量 |    |   
contract_code  |  true  |  string  |  合约代码  |  如"BTC180914" ...  |
trade_amount            | true | decimal  | 最近24小时成交量（币）（当前时间-24小时）。 值是买卖双边之和 |  |
trade_volume                | true | decimal    | 最近24小时成交量（张）（当前时间-24小时）。 值是买卖双边之和 |                |
trade_turnover                | true | decimal    | 最近24小时成交额（当前时间-24小时）。 值是买卖双边之和 |                |
\</data\>  |    |    |    |    |
ts  |    true  |  long  |  响应生成时间点，单位：毫秒   |


## 获取预估交割价

###  示例

- GET `/api/v1/contract_delivery_price`

```shell
curl "https://api.hbdm.com/api/v1/contract_delivery_price?symbol=BTC"
```

###  请求参数

参数名称 | 参数类型    | 必填    | 描述 |
---------------- |  -------------- |  ---------- |  -----------------------------------------------------------------  |
symbol  |  string  |    true  | 合约品种，支持大小写，"BTC","ETH"...  |

> Response:

```json

{
    "status":"ok",
    "data":{
        "delivery_price":40883.1892735875313108822711
    },
    "ts":1628652034810
}
```

###  返回参数

参数名称  |    是否必须   |  类型   |  描述  |  取值范围  |
-------------------------- |  -------------- |  ---------- |  ----------------------------  | ------------------------------------------------------  |
status  |  true  |  string  |  请求处理结果  | "ok" , "error"  |
\<data\>  |    |    |    |       |
delivery_price  |  true  |  float  |  预估交割价  |   |
\</data\>  |    |    |    |    |
ts  |    true  |  long  |  响应生成时间点，单位：毫秒   |        |


## 获取预估结算价

 - GET `/api/v1/contract_estimated_settlement_price`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol | false  | string | 合约品种，不填返回所有品种     |     "BTC" ...                                         |

>Response

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "list": [
                {
                    "contract_type": "this_week",
                    "contract_code": "BTC210122",
                    "estimated_settlement_price": null,
                    "settlement_type": "settlement"
                },
                {
                    "contract_type": "next_week",
                    "contract_code": "BTC210129",
                    "estimated_settlement_price": null,
                    "settlement_type": "settlement"
                },
                {
                    "contract_type": "quarter",
                    "contract_code": "BTC210326",
                    "estimated_settlement_price": null,
                    "settlement_type": "settlement"
                },
                {
                    "contract_type": "next_quarter",
                    "contract_code": "BTC210625",
                    "estimated_settlement_price": null,
                    "settlement_type": "settlement"
                }
            ]
        }
    ],
    "ts": 1609835707183
}
```

### 返回参数

| 参数名称                   | 是否必须 | 类型      | 描述                 | 取值范围                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | 请求处理结果             |                                          |
| \<data\> | true     |  object  array      |                    |                                          |
| symbol          | true | string  | 合约品种              | "BTC" ...                          |
| \<list\> | true     |  object  array      |                    |                                          |
| contract_type          | true | string  | 合约类型               | 次周:"next_week", 当季:"quarter",次季:"next_quarter"                       |
| contract_code          | true | string  | 合约代码               | "ETH201225" ...                          |
| estimated_settlement_price              | true | decimal  |  本期预估结算价/预估交割价（结算类型为交割时为预估交割价；结算时为预估结算价；）  |                                  |
| settlement_type        | true | string | 本期结算类型         |  “delivery”：交割，“settlement”：结算            |
| \</list\>            |      |         |                    |                                          |
| \</data\>            |      |         |                    |                                          |
| ts                     | true | long    | 接口响应时间（毫秒）                |                                          |

#### 备注
 - 结算类型为结算时，预估结算价字段（estimated_settlement_price）在结算前60分钟到结算开始才计算和更新展示，其他时间点（包括结算中）则estimated_settlement_price为空，其他字段正常展示。
 - 结算类型为交割时，预估交割价字段（estimated_settlement_price）在交割前60分钟到交割开始才计算和更新展示，其他时间点（包括交割中）则estimated_settlement_price为空，其他字段正常展示。
 - 每6秒计算并更新一次预估结算价。


## 查询系统状态

###  示例

- GET `/api/v1/contract_api_state` 

```shell
curl "https://api.hbdm.com/api/v1/contract_api_state"
```

###  请求参数

参数名称   |  参数类型     |  必填    |  描述  |
-------------- |  -------------- |  ---------- |  -------------------------------------------------------------------------------- |
symbol  |    string  |    false  |  支持大小写，"BTC","ETH"...，如果缺省，默认返回所有品种  |

> Response:

```json

{
    "status":"ok",
    "data":[
        {
            "symbol":"BTC",
            "open":1,
            "close":1,
            "cancel":1,
            "transfer_in":1,
            "transfer_out":1,
            "master_transfer_sub":1,
            "sub_transfer_master":1
        },
        {
            "symbol":"ETH",
            "open":1,
            "close":1,
            "cancel":1,
            "transfer_in":1,
            "transfer_out":1,
            "master_transfer_sub":1,
            "sub_transfer_master":1
        }
    ],
    "ts":1628652120762
} 
```

###  返回参数

参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
status | true | string | 请求处理结果	 | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<data\> |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
open | true | int | 开仓下单权限："1"表示可用，“0”表示不可用 |  |
close | true | int | 平仓下单权限："1"表示可用，“0”表示不可用 |  |
cancel | true | int | 撤单权限："1"表示可用，“0”表示不可用 |  |
transfer_in | true | int | 从币币转入的权限："1"表示可用，“0”表示不可用 |  |
transfer_out | true | int | 转出至币币的权限："1"表示可用，“0”表示不可用 |  |
master_transfer_sub | true | int | 从母账号划转到子账号的权限："1"表示可用，“0”表示不可用 |  |
sub_transfer_master | true | int | 从子账号划转到母账号的权限："1"表示可用，“0”表示不可用 |  |
\</data\>|  |  |  |  |


## 获取行情深度数据

###  示例 

- GET `/market/depth` 

```shell
curl "https://api.hbdm.com/market/depth?symbol=BTC_CQ&type=step5"
```

###  请求参数

参数名称   |  参数类型     |  必填    |  描述  |
-------------- |  -------------- |  ---------- |  -------------------------------------------------------------------------------- |
symbol  |    string  |    true  |  支持大小写，如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示BTC次季合约。支持使用合约code来查询数据， 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。 |
type  |  string  |    true  |  仅支持小写，获得150档深度数据，使用step0, step1, step2, step3, step4, step5, step14, step15（step1至step5,step14，step15 是进行了深度合并后的深度），使用step0时，不合并深度获取150档数据;获得20档深度数据，使用 step6, step7, step8, step9, step10, step11, step12, step13（step7至step13是进行了深度合并后的深度），使用step6时，不合并深度获取20档数据  |


> Response:

```json

{
    "ch":"market.BTC_NQ.depth.step6",
    "status":"ok",
    "tick":{
        "asks":[
            [
                14100.87,
                163
            ],
            [
                14100.88,
                20
            ]
        ],
        "bids":[
            [
                14098.09,
                53
            ],
            [
                14098.08,
                75
            ]
        ],
        "ch":"market.BTC_NQ.depth.step6",
        "id":1604297395,
        "mrid":113765352864,
        "ts":1604297395012,
        "version":1604297395
    },
    "ts":1604297395085
}
```

###  返回参数

| 参数名称   | 是否必须 | 数据类型   | 描述  | 取值范围           |
| ------ | ---- | ------ | --------------------------------------- | -------------- |
| ch     | true | string | 数据所属的 channel，格式：market.$symbol.depth.$type         |                |
| status | true | string | 请求处理结果                                  | "ok" , "error" |
| \<tick\>   |  true    |   object     |               |                |
| asks   | false | array | 卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序 |                |
| bids   | false | array | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序 |                |
| ch     | true | string | 数据所属的 channel，格式：market.$symbol.depth.$type        |                |
| id     | true | long | 消息id        |                |
| mrid   | true | long | 订单ID                                    |                |
| ts   | true | long | 消息生成时间，单位：毫秒.  |                |
| version   | true | long | 版本                                    |                |
| \</tick\>              |      |        |               |                |
| ts     | true | long | 响应生成时间点，单位：毫秒 |                |


### 备注

- 合并深度时，一定报价精度内的市场挂单将予以合并显示。合并深度仅改变显示方式，不改变实际成交价格。

- step1至step5,step14,step15是进行了深度合并后的150档深度数据，step7至step13是进行了深度合并后的20档深度数据，对应精度如下：

| Depth 类型 | 精度 |
|----|----|
|step1、step7|0.00001|
|step2、step8|0.0001|
|step3、step9|0.001|
|step4、step10|0.01|
|step5、step11|0.1|
|step14、step12|1|
|step15、step13|10|


## 获取市场最优挂单

 - GET `/market/bbo`

### 请求参数
| 参数名称   | 是否必须 | 类型     | 描述  | 取值范围 |
| ------ | ---- | ------ | ---------------------------------------- | ---- |
| symbol | false | string | 合约标识，不填返回全部合约的最优挂单信息 | 如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约 ，"BTC_NQ"表示BTC次季度合约。 支持使用合约code来查询数据， 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。 |

>Response

```json
{
    "status":"ok",
    "ticks":[
        {
            "symbol":"BTC_CW",
            "ask":[
                45651.21,
                498
            ],
            "bid":[
                45644.31,
                40
            ],
            "mrid":144083800866,
            "ts":1628652339586
        },
        {
            "symbol":"BTC_NW",
            "ask":[
                45659.01,
                8
            ],
            "bid":[
                45659,
                184
            ],
            "mrid":144083799954,
            "ts":1628652337609
        }
    ],
    "ts":1628652339605
}
```

###  返回参数

| 参数名称   | 是否必须 | 数据类型   | 描述  | 取值范围           |
| ------ | ---- | ------ | ---------------------------------------- | -------------- |
| status | true | string | 请求处理结果     | "ok" , "error" |
| \<ticks\> |true  |  object array |           |                |
| symbol  | true | string  | 品种代码  | "BTC","ETH"...   |
| mrid   | true | long | 撮合ID，唯一标识  |                |
| ask   | false | array | [卖1价,卖1量(张)] |                |
| bid   | false | array | [买1价,买1量(张)] |                |
| ts   | true | long | 系统检测orderbook时间点，单位：毫秒   |                |
| \</ticks\>            |      |        |               |                |
| ts     | true | long | 响应生成时间点，单位：毫秒                            |                |


## 获取K线数据

###  示例

- GET  `/market/history/kline`

```shell
curl "https://api.hbdm.com/market/history/kline?period=1min&size=200&symbol=BTC_CQ"
```

###  请求参数

参数名称    |  是否必须  |   类型     |  描述    |  默认值   |  取值范围  |
-------------- |  -------------- |  ---------- |  ---------- |  ------------ |  -----------------------------------------------------|
symbol  |    true  |  string  |  合约名称  |  | 支持大小写， 如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季度合约"。支持使用合约code来查询数据， 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。  |
period  |    true  |  string  |  K线类型  |  |  1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon  |
size  |  false  |  int    |  获取数量   |  150  |  [1,2000]  |
from  |  false  |  long  |  开始时间戳 10位 单位S |    |
to  |  false  |  long  |   结束时间戳 10位 单位S |    |

### Note
   - 1、size字段或者from、to字段至少要填写一个。
   - 2、如果size、from、to 均不填写，则返回错误。
   - 3、如果填写from，也要填写to。最多可获取连续两年的数据。
   - 4、如果size、from、to 均填写，会忽略from、to参数。
   - 支持查询已下市四周内的合约的K线数据（即到期日在过去最近四周的合约），可输入已下市四周内的合约的合约代码进行查询K线数据。

> Response:

```json

{
    "ch":"market.BTC_CQ.kline.1min",
    "ts":1628652530074,
    "status":"ok",
    "data":[
        {
            "id":1628652420,
            "open":45875.02,
            "close":45851,
            "low":45850.93,
            "high":45880.01,
            "amount":2.6471133153472473090872159941957749262,
            "vol":1214,
            "count":50
        },
        {
            "id":1628652480,
            "open":45863.34,
            "close":45857.52,
            "low":45851.87,
            "high":45863.34,
            "amount":0.6411077350166105446511274681130233384,
            "vol":294,
            "count":7
        }
    ]
}
```

###  返回参数

| 参数名称   |  是否必须     |  数据类型     |  描述  |   取值范围  |
| --------------  |  -------------- |  -------------- |  ------------------------------------------ |  ----------------  |
| ch  |  true  |  string  |    数据所属的 channel，格式：market.$symbol.kline.$period   |        |
| \<data\>  |  true  |  object  |    KLine 数据  |   | 
| id | true  | int | K线id,也就是K线时间戳，K线起始时间  |
| vol |  true  | decimal  | 成交量张数。 值是买卖双边之和 |
| count |  true  | decimal  | 成交笔数。 值是买卖双边之和 |
| open | true  | decimal  | 开盘价               |
| close | true  | decimal  | 收盘价              |
| low | true  | decimal  |  最低价             |
| high | true  | decimal  | 最高价               |
| amount | true  | decimal  | 成交量(币)。 值是买卖双边之和 |
| \</data\>  |     |     |      |   | 
| status  |    true  |  string  |    请求处理结果  |  "ok" , "error"  |
| ts  |  true  |  long  |    响应生成时间点，单位：毫秒  |    | 


## 获取标记价格的K线数据

 - GET `/index/market/history/mark_price_kline`

### 请求参数（以GET URL方式传输参数）
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol | true | string  | 合约标识 |  | 如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约 ，"BTC_NQ"表示BTC次季度合约季度合约。支持使用合约code来查询数据， 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。 |
| period          | true     | string  | K线类型               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1week,1mon     |
| size  | true     | int    | K线获取数量     |  | [1,2000] |

##### 备注：
- 最多一次2000条数据
- 入参大小写不敏感，均支持

> Response

```json
{
    "ch": "market.BTC_CQ.mark_price.5min",
    "data": [
        {
            "amount": "0",
            "close": "45853.29",
            "count": "0",
            "high": "45936.25",
            "id": 1628652300,
            "low": "45853.05",
            "open": "45931.25",
            "vol": "0"
        },
        {
            "amount": "0",
            "close": "45862.49",
            "count": "0",
            "high": "45862.49",
            "id": 1628652600,
            "low": "45851.31",
            "open": "45852.5",
            "vol": "0"
        }
    ],
    "status": "ok",
    "ts": 1628652647728
}
```

### 返回参数：
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch     | true | string | 数据所属的 channel |                | |
| \<data\> |   true   |    object array    |               |                | |
| id     | true | long | k线id        |                | |
| vol     | true | string | 成交量(张)，数值为0        |                | |
| count     | true | string | 成交笔数，数值为0        |                | |
| open     | true | string | 开盘值        |                | |
| close     | true | string | 收盘值        |                | |
| low     | true | string | 最低值        |                | |
| high     | true | string | 最高值        |                | |
| amount     | true | string | 成交量(币), 数值为0        |                | |
| \</data\>            |      |        |               |                | |
| status | true | string | 请求处理结果                          | "ok" , "error" | |
| ts     | true | number | 响应生成时间点，单位：毫秒                   |                | |


## 获取聚合行情

###  示例

- GET  `/market/detail/merged`

```shell
curl "https://api.hbdm.com/market/detail/merged?symbol=BTC_CQ"
```

###  请求参数

参数名称   |  是否必须   |  类型   |  描述   |  默认值   |  取值范围  |
--------------  | --------------  | ---------- |  ----------  | ------------ |  --------------------------------------------------------------------------------  |
symbol  |    true  |  string  |  合约名称  |    | 支持大小写，如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季度合约"。支持使用合约code来查询数据， 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。  | 


> Response:

```json

{
    "ch": "market.BTC_NQ.detail.merged",
    "status": "ok",
    "tick": {
        "amount": "4478.2911316482577028620799060719867257944",
        "ask": [
            14114.01,
            177
        ],
        "bid": [
            14112.71,
            28
        ],
        "close": "14114",
        "count": 18805,
        "high": "14299.99",
        "id": 1604298319,
        "low": "14028.78",
        "open": "14229.47",
        "ts": 1604298319019,
        "vol": "633708"
    },
    "ts": 1604298319019
}
```

###  返回参数

| 参数名称     |  是否必须    |   数据类型     |  描述  |    取值范围  |
| -------------- |  -------------- |  -------------- |  ----------------------------------------------------------| ----------------  |
| ch  |  true  |  string  |    数据所属的 channel，格式： market.$symbol.detail.merged   |     |
| status  |    true  |  string  |    请求处理结果  |  "ok" , "error"  |
| \<tick\>  |  true  |  object  |    开盘价和收盘价（从当天零点(UTC+8)开始）  |    |
| id |  true  | int | K线id,也就是K线时间戳  |
| vol |  true  | string  | 成交量张数（最近24（当前时间-24小时）小时成交量张）。 值是买卖双边之和 |
| count |  true  | decimal  | 成交笔数（最近24（当前时间-24小时）小时成交笔数）。 值是买卖双边之和 |
| open |  true  | string  | 开盘价               |
| close |  true  | string  | 收盘价              |
| low |  true  | string  |  最低价             |
| high |  true  | string  | 最高价               |
| amount |  true  | string  | 成交量(币) （最近24（当前时间-24小时）小时成交量币）。 值是买卖双边之和 |
| ts  |  true  | long  | 时间戳            |
| ask | true | object |卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序 | | 
| bid | true| object | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序 | | 
| \</tick\> | | | |
| ts  |  true  |  long  |    响应生成时间点，单位：毫秒  |    | 


## 批量获取聚合行情

 - GET `/market/detail/batch_merged`

### 请求参数
 
| 参数名称   | 是否必须 | 类型     | 描述  | 取值范围 |
| ------ | ---- | ------ | ---------------------------------------- | ---- |
| symbol | false | string | 合约标识，不填返回全部合约的聚合行情 | 支持大小写，如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季度合约"。支持使用合约code来查询数据， 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。 |

#### 备注

 - 该接口更新频率为50ms

> Response:

```json
{
    "status":"ok",
    "ticks":[
        {
            "id":1610959373,
            "ts":1610959373238,
            "ask":[
                10000,
                85
            ],
            "bid":[
                9949.748,
                667
            ],
            "symbol":"BTC_CQ",
            "open":"9949.748",
            "close":"9949.748",
            "low":"9949.748",
            "high":"9949.748",
            "amount":"0",
            "count":0,
            "vol":"0"
        },
        {
            "id":1610959373,
            "ts":1610959373238,
            "ask":[
                14100,
                2
            ],
            "bid":[
                13200,
                3
            ],
            "symbol":"BTC_NW",
            "open":"13150",
            "close":"13200",
            "low":"13100",
            "high":"13200",
            "amount":"0.790832380747489890410694159864633903",
            "count":12,
            "vol":"104"
        }
    ],
    "ts":1585818739007
}
```

###  返回参数

| 参数名称   | 是否必须 | 数据类型   | 描述  | 取值范围           |
| ------ | ---- | ------ | ---------------------------------------- | -------------- |
| status | true | string | 请求处理结果     | "ok" , "error" |
| \<ticks\> | true  |  object array |           |                |
| symbol  | true | string  | 合约标识  | "BTC_CW","BTC_NW","BTC_CQ","BTC_NQ"   |
| id   | true | long | K线id |                |
| amount   | true | string | 成交量(币) （最近24（当前时间-24小时）小时成交量币）。 值是买卖双边之和 |                |
| ask   | true | array | [卖1价,卖1量(张)] |                |
| bid   | true | array | [买1价,买1量(张)] |                |
| open     | true | string | 开盘价     |                |
| close     | true | string | 收盘价,当K线为最晚的一根时，是最新成交价       |                |
| count     | true | decimal | 成交笔数（最近24（当前时间-24小时）小时成交笔数）。 值是买卖双边之和    |                |
| high   | true | string | 最高价                                    |                |
| low   | true | string | 最低价  |                |
| vol   | true | string | 成交量（张）（最近24（当前时间-24小时）小时成交量张）。 值是买卖双边之和    |                |
| ts   | true | long | 时间戳   |                |
| \</ticks\>            |      |        |               |                |
| ts     | true | long | 响应生成时间点，单位：毫秒                            |                |


## 获取市场最近成交记录

###  示例

- GET  `/market/trade`

```shell
curl "https://api.hbdm.com/market/trade?symbol=BTC_CQ"
```
###  请求参数

参数名称     |  是否必须   |  类型   |  描述   |   取值范围  |
-------------- |  -------------- |  ---------- |  ---------- |    -------------------------------------------  |
symbol  |   false  |  string  |  合约名称，不填返回所有当前上市合约的最近成交数据  |   支持大小写，如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季度合约"。支持使用合约code来查询数据， 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。  |


> Response:

```json
{
    "ch": "market.*.trade.detail",
    "status": "ok",
    "tick": {
        "data": [
            {
                "amount": "4",
                "quantity": "0.0129032258064516129032258064516129032",
                "ts": 1613998847438,
                "id": 50710000,
                "price": "31000",
                "direction": "buy",
                "symbol": "BTC_NQ"
            }
        ],
        "id": 1614068483482,
        "ts": 1614068483482
    },
    "ts": 1614068483482
}
```

###  返回参数

| 参数名称   | 是否必须 | 类型     | 描述  | 取值范围         |
| ------ | ---- | ------ | ---------------------------------------- |------------ |
| ch     | true | string | 数据所属的 channel，格式： market.$symbol.trade.detail |      |
| status | true | string | 请求处理结果 | "ok","error" |
| \<tick\>      | true | object |           |      |
| id     | true | long | 订单唯一id（品种唯一）      |      |
| ts     | true | long | 最新成交时间       |      |
| \<data\>      | true | object array |        |      |
| amount     | true | string | 成交量(张)。 值是买卖双边之和 |      |
| direction     | true | string | 买卖方向，即taker(主动成交)的方向       |      |
| id     | true | long | 成交唯一id（品种唯一）     |      |
| price     | true | string | 成交价       |      |
| ts     | true | long | 成交时间       |      |
| quantity  | true | string | 成交量（币）     |      |
| symbol  | true | string | 合约名称     |      |
| \</data\>      |  |  |              |      |
| \</tick\>      |  |  |              |      |
| ts     | true | long | 发送时间       |      |


## 批量获取最近的交易记录

###  示例

- GET  `/market/history/trade`

```shell
curl "https://api.hbdm.com/market/history/trade?symbol=BTC_CQ&size=100"
```

###  请求参数：

参数名称     |  是否必须     | 数据类型   |  描述  |    默认值    |  取值范围  |
-------------- |  -------------- |  -------------- |  -------------------- |  ------------ |  --------------------------------------------------------------------------------  |
symbol  |    true  |  string  |    合约名称  |    |  支持大小写，如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季度合约"。支持使用合约code来查询数据， 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。  |
size  |  true  |  int  |    获取交易记录的数量  |   |  [1, 2000]  |

> Response:

```json

{
    "status": "ok",
    "ts": 1612491154213,
    "ch": "market.BTC_NQ.trade.detail",
    "data": [
        {
            "id": 123609277049,
            "ts": 1612491144090,
            "data": [
                {
                    "amount": 20,
                    "quantity": 0.0504908595134751268141050255319653845,
                    "ts": 1612491144090,
                    "id": 1236092770490000,
                    "price": 39611.13,
                    "direction": "sell"
                }
            ]
        },
        {
            "id": 123609282167,
            "ts": 1612491148260,
            "data": [
                {
                    "amount": 20,
                    "quantity": 0.0504865897520300657739291289447696903,
                    "ts": 1612491148260,
                    "id": 1236092821670000,
                    "price": 39614.48,
                    "direction": "sell"
                }
            ]
        }
    ]
}
```

###  返回参数

| 参数名称   | 是否必须 | 数据类型   | 描述  | 取值范围         |
| ------ | ---- | ------ | ---------------------------------------- | ------------ |
| ch     | true | string | 数据所属的 channel，格式： market.$symbol.trade.detail |              |
| \<data\>   | true | object array |           |      |       |
| \<data\>    | true | object array |           |      |       |
| amount     | true | decimal | 成交量(张)。 值是买卖双边之和 |      |            |
| direction     | true | string | 买卖方向，即taker(主动成交)的方向   |      |            |
| id     | true | long | 成交唯一id（品种唯一）    |      |            |
| price     | true | decimal | 成交价格       |      |            |
| ts     | true | long | 成交时间       |      |            |
| quantity  | true | decimal | 成交量（币）     |      |
|\</data\>      |  |  |              |      |            |
| id     | true | long | 订单唯一id（品种唯一）     |      |            |
| ts     | true | long | 最新成交时间       |      |            |
|\</data\>      |  |  |              |      |            |
| status | true | string | 请求处理结果 | "ok"，"error" |
| ts     | true | long | 响应生成时间点，单位：毫秒                            |              |

#### 备注
- 2021年2月3日 21:00:00 后返回参数才会有quantity字段。


## 查询合约风险准备金余额和预估分摊比例

- GET `/api/v1/contract_risk_info`

```shell
curl "https://api.hbdm.com/api/v1/contract_risk_info"
```
 
### 请求参数

 参数名称               |   是否必须  |  类型  |  描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
symbol | false | string | 品种代码	 | 支持大小写，"BTC","ETH"...，如果缺省，默认返回所有品种 |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "BTC",
            "insurance_fund": 1909.852579486750035041,
            "estimated_clawback": 0
        }
    ],
    "ts": 1604298633195
}
```

### 返回参数

  参数名称                |   是否必须  |   类型   |   描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
 \<data\> |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 insurance_fund | true  | decimal | 风险准备金余额 |  |
 estimated_clawback | true  | decimal | 预估分摊比例 |  |
 \</data\> |  |  |  |  |

## 查询合约风险准备金余额历史数据

- GET `/api/v1/contract_insurance_fund`

```shell
curl "https://api.hbdm.com/api/v1/contract_insurance_fund?symbol=ETH"
```
 
### 请求参数

  参数名称                |   是否必须   |   类型    |    描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 symbol | true | string | 品种代码	 |  支持大小写，"BTC","ETH"... |

> Response:

```json

{
    "status":"ok",
    "data":{
        "symbol":"BTC",
        "tick":[
            {
                "insurance_fund":1909.852579486750035041,
                "ts":1604217600000
            },
            {
                "insurance_fund":1907.646552903264189201,
                "ts":1604131200000
            }
        ]
    },
    "ts":1604298695848
}

```

### 返回参数

  参数名称                |   是否必须   |   类型    |    描述             |    取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
 \<data\> |  |  |  | 字典数据 |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 \<tick\> |  |  |  |  |
 insurance_fund | true  | decimal | 风险准备金余额 |  |
 ts | true  | long | 数据时间点，单位：毫秒 |  |
 \</tick\> |  |  |  |  |
 \</data\> |  |  |  |  |

## 查询平台阶梯调整系数

- GET `/api/v1/contract_adjustfactor`

```shell
curl "https://api.hbdm.com/api/v1/contract_adjustfactor"
```

### 请求参数

  参数名称                |   是否必须   |    类型   |   描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 symbol | false | string | 品种代码	 |  支持大小写，"BTC","ETH"...，如果缺省，默认返回所有品种 |

> Response:

```json

{
    "status":"ok",
    "data":[
        {
            "symbol":"BTC",
            "list":[
                {
                    "lever_rate":125,
                    "ladders":[
                        {
                            "ladder":0,
                            "min_size":0,
                            "max_size":1999,
                            "adjust_factor":0.65
                        },
                        {
                            "ladder":1,
                            "min_size":2000,
                            "max_size":14999,
                            "adjust_factor":0.8
                        },
                        {
                            "ladder":2,
                            "min_size":15000,
                            "max_size":null,
                            "adjust_factor":0.85
                        }
                    ]
                }
            ]
        }
    ],
    "ts":1604298785020
}
```

### 返回参数

   参数名称                |   是否必须  |   类型   |    描述             |    取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
 \<data\> |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 \<list\> |  |  |  |  |
 lever_rate   | true     | decimal  | 杠杆倍数               |                |
 \<ladders\> |  |  |  |  |
 min_size | true | decimal | 净持仓量的最小值 |  |
 max_size | true | decimal | 净持仓量的最大值 |  |
 ladder | true | int | 档位 |  |
 adjust_factor | true | decimal | 调整系数 |  |
 \</ladders\> |  |  |  |  |
 \</list\> |  |  |  |  |
 \</data\> |  |  |  |  |
 
## 平台持仓量的查询

### 实例

- GET `/api/v1/contract_his_open_interest`

```shell
curl "https://api.hbdm.com/api/v1/contract_his_open_interest?symbol=BTC&contract_type=this_week&period=60min&amount_type=1"
```

### 请求参数

|  参数名称                |   是否必须   |   类型    |   描述             |   取值范围       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | true | string | 品种代码   |  支持大小写，"BTC","ETH"... |
| contract_type| true | string | 合约类型 | 当周:"this_week", 次周:"next_week", 当季:"quarter",次季:"next_quarter" |
| period | true | string | 时间周期类型 | 1小时:"60min"，4小时:"4hour"，12小时:"12hour"，1天:"1day" |
| size | false | int | 获取数量 | 默认为：48，取值范围 [1,200]  |
| amount_type | true | int | 计价单位 | 1:张，2:币  |

> Response:

```json

{
    "status": "ok",
    "data": {
        "symbol": "BTC",
        "contract_type": "quarter",
        "tick": [
            {
                "volume": "3058980.0000000000000000",
                "amount_type": 1,
                "ts": 1604296800000
            },
            {
                "volume": "3049899.0000000000000000",
                "amount_type": 1,
                "ts": 1604293200000
            }
        ]
    },
    "ts": 1604298943494
}
```

### 返回参数

|   参数名称                |   是否必须   |   类型    |   描述             |   取值范围       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | 请求处理结果   | "ok" , "error" |
| ts | true  | long | 响应生成时间点，单位：毫秒 |  |
| \<data\> |  |  | 字典数据 |  |
| symbol | true | string | 品种代码   | "BTC","ETH"... |
| contract_type| true | string | 合约类型 | 当周:"this_week", 次周:"next_week", 当季:"quarter",次季:"next_quarter"|
| \<tick\> |  |  |  |  |   
| volume | true | string | 持仓量。 |  |
| amount_type | true | int | 计价单位 | 1:张，2:币  |
| ts | true | long | 统计时间 |  |
| \</tick\> |  |  |  |  |
| \</data\> |  |  |  |  |

### 注意：
  tick字段：数组内的数据按照时间倒序排列；
  data字段：字典类型。



## 获取平台阶梯保证金

 - GET `api/v1/contract_ladder_margin`

### 请求参数：
| **参数名称**                | **是否必须** | **类型**  | **描述**             | **取值范围**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |	
| symbol | false | string | 品种代码，不填默认返回所有品种的阶梯保证金	 | 比如： “BTC”、“ETH”... |

> Response

```json
{
    "status":"ok",
    "data":[
        {
            "symbol":"BTC",
            "list":[
                {
                    "lever_rate":20,
                    "ladders":[
                        {
                            "min_margin_balance":0,
                            "max_margin_balance":20,
                            "min_margin_available":0,
                            "max_margin_available":20
                        },
                        {
                            "min_margin_balance":20,
                            "max_margin_balance":80,
                            "min_margin_available":20,
                            "max_margin_available":50
                        },
                        {
                            "min_margin_balance":80,
                            "max_margin_balance":380,
                            "min_margin_available":50,
                            "max_margin_available":110
                        },
                        {
                            "min_margin_balance":380,
                            "max_margin_balance":980,
                            "min_margin_available":110,
                            "max_margin_available":170
                        },
                        {
                            "min_margin_balance":980,
                            "max_margin_balance":null,
                            "min_margin_available":170,
                            "max_margin_available":null
                        }
                    ]
                }
            ]
        }
    ],
    "ts":1612489488052
}
```

### 返回参数：
| **参数名称**                | **是否必须** | **类型**  | **描述**             | **取值范围**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | 请求处理结果	 | "ok" , "error" |
| \<data\> | true  | object array |  |  |
| symbol | true  | string |  品种代码 |  比如："BTC"|
| \<list\> | true  | object array |  |  |
| lever_rate | true  | int |  杠杆倍数|   |
| \<ladders\> | true  | object array | 该合约对应杠杆倍数下的阶梯保证金数据 |  |
| min_margin_balance | true  | decimal |  最小账户权益（该阶梯权益范围起点，包含该值）  |   |
| max_margin_balance | true  | decimal |  最大账户权益（该阶梯权益范围终点，不包含该值，该值属于下一阶梯的权益范围起点）  |  |
| min_margin_available | true  | decimal |  最小可用保证金（范围内包含该值） |  |
| max_margin_available | true  | decimal |  最大可用保证金（范围内不包含该值，该值属于下一阶梯的最小可用保证金） |  |
| \</ladders\> |  |  |  |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |
| ts | true  | long | 响应生成时间点，单位：毫秒 |  |


## 精英账户多空持仓对比-账户数

### 实例

- GET `/api/v1/contract_elite_account_ratio`

```shell
curl "https://api.hbdm.com/api/v1/contract_elite_account_ratio?symbol=BTC&period=60min"
```

### 请求参数

   参数名称               |  是否必须  |   类型   |   描述            |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 symbol | true | string | 品种代码	 |  支持大小写，"BTC","ETH"... |
 period | true | string | 周期	 | 5min, 15min, 30min, 60min,4hour,1day |

> Response:

```json

{
    "status":"ok",
    "data":{
        "list":[
            {
                "buy_ratio":0.52,
                "sell_ratio":0.45,
                "locked_ratio":0.03,
                "ts":1604290200000
            }
        ],
        "symbol":"BTC"
    },
    "ts":1604299070097
}
```

### 返回参数

|  参数名称                |   是否必须   |   类型   |    描述            |    取值范围       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | 请求处理结果	 | "ok" , "error" |
| ts | true  | long | 响应生成时间点，单位：毫秒 |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | 品种代码 | "BTC","ETH"... |
| \<list\> |  |  |  |  |
| buy_ratio | true | decimal | 净多仓的账户比例 |  |
| sell_ratio | true | decimal | 净空仓的账户比例 |  |
| locked_ratio | true | decimal | 锁仓的账户比例 |  |
| ts | true  | long | 生成时间 |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

## 精英账户多空持仓对比-持仓量

### 实例

- GET `/api/v1/contract_elite_position_ratio`

```shell
curl "https://api.hbdm.com/api/v1/contract_elite_position_ratio?symbol=BTC&period=60min"
```

### 请求参数

   参数名称                |   是否必须   |   类型    |   描述             |    取值范围       |
 ----------------------- | -------- | ------- | ------------------ | -------------- |
 symbol | true | string | 品种代码	 |  支持大小写，"BTC","ETH"... |
 period | true | string | 周期	 | 5min, 15min, 30min, 60min,4hour,1day |

> Response:

```json

{
    "status":"ok",
    "data":{
        "list":[
            {
                "buy_ratio":0.51,
                "sell_ratio":0.49,
                "ts":1604290500000
            },
            {
                "buy_ratio":0.508,
                "sell_ratio":0.492,
                "ts":1604290800000
            }
        ],
        "symbol":"BTC"
    },
    "ts":1604299402211
}

```

### 返回参数

|   参数名称                |   是否必须   |   类型   |   描述             |   取值范围       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| status | true | string | 请求处理结果	 | "ok" , "error" |
| ts | true  | long | 响应生成时间点，单位：毫秒 |  |
| \<data\> |  |  |  |  |
| symbol | true  | string | 品种代码 | "BTC","ETH"... |
| \<list\> |  |  |  |  |
| buy_ratio | true | decimal | 多仓的总持仓量占比 |  |
| sell_ratio | true | decimal | 空仓的总持仓量占比 |  |
| ts | true  | long | 生成时间 |  |
| \</list\> |  |  |  |  |
| \</data\> |  |  |  |  |

## 获取强平订单

### 实例

- GET `/api/v1/contract_liquidation_orders`

```shell
curl "https://api.hbdm.com/api/v1/contract_liquidation_orders?symbol=BTC&trade_type=0&create_date=7"
```

### 请求参数

|   参数名称    |   是否必须  |   类型   |   描述        |   默认值   |    取值范围                                |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | 品种代码          |         |  支持大小写，"BTC","ETH"...                           |
| trade_type   | true     | int  | 交易类型         |               | 0:全部,5: 卖出强平,6: 买入强平 |
| create_date | true     | int    | 日期            |         | 7，90（7天或者90天）        |
| page_index | false     | int    | 页码,不填默认第1页            |    1     |         |
| page_size | false     | int    | 不填默认20，不得多于50            |    20     |   [1-50]     |

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "contract_code": "BTC201225",
                "symbol": "BTC",
                "direction": "buy",
                "offset": "close",
                "volume": 26,
                "price": 19674.96,
                "created_at": 1606293144641,
                "amount": 0.132147663832607537
            }
        ],
        "total_page": 114,
        "current_page": 1,
        "total_size": 2264
    },
    "ts": 1604299610722
}

```

### 返回参数

|  参数名称               |   是否必须   |   类型    |   描述             |   取值范围     |
| ---------------------- | -------- | ------- | ------------------ | ------------ |
| status                 | true     | string  | 请求处理结果             |              |
| \<data\> |          |         |                    |              |
| \<orders\> |          |         |                    |              |
| symbol                 | true     | string  | 品种代码               |              |
| contract_code          | true     | string  | 合约代码               |"BTC180914" ...  |
| direction              | true     | string  | "buy":买 "sell":卖         |              |
| offset              | true     | string  | "open":开 "close":平        |              
| volume           | true     | decimal | 强平数量（张）              |              |
| amount           | true     | decimal | 强平数量（币）               |              |
| price      | true     | decimal | 破产价格               |              |
| created_at            | true     | long    | 强平时间               |              |
| \</orders\>              |          |         |                    |              |
| total_page             | true     | int     | 总页数                |              |
| current_page           | true     | int     | 当前页                |              |
| total_size             | true     | int     | 总条数                |              |
| \</data\>            |          |         |                    |              |
| ts                     | true     | long    | 时间戳                |              |


## 查询平台历史结算记录

- GET `/api/v1/contract_settlement_records`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol        | true  | string | 品种代码          | "BTC","ETH"...                           |
| start_time    | false  | long    | 起始时间 （时间戳，单位毫秒）        |  取值范围：[(当前时间 - 90天), 当前时间] ，默认取当前时间- 90天   |
| end_time      | false  | long    | 结束时间（时间戳，单位毫秒）         | 取值范围：(start_time, 当前时间)，默认取当前时间  |
| page_index    | false  | int     | 页码，不填默认第1页                |                        |
| page_size     | false  | int     | 页长，不填默认20，不得多于50         |      [1-50]       |

> Response: 

```json
{
    "status": "ok",
    "data": {
        "total_page": 13,
        "current_page": 1,
        "total_size": 13,
        "settlement_record": [
            {
                "symbol": "BTC",
                "settlement_time": 1605859200000,
                "clawback_ratio": 0,
                "list": [
                    {
                        "contract_code": "BTC201120",
                        "settlement_price": 18217.62,
                        "settlement_type": "delivery"
                    },
                    {
                        "contract_code": "BTC201127",
                        "settlement_price": 18292.24,
                        "settlement_type": "settlement"
                    },
                    {
                        "contract_code": "BTC201225",
                        "settlement_price": 18490.42,
                        "settlement_type": "settlement"
                    },
                    {
                        "contract_code": "BTC210326",
                        "settlement_price": 18788.7,
                        "settlement_type": "settlement"
                    }
                ]
            }
        ]
    },
    "ts": 1606295834648
}

```

### 返回参数

| 参数名称                   | 是否必须 | 类型      | 描述                 | 取值范围                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                | true | string  | 请求处理结果        | "ok" , "error" |
| ts                    | true | long    | 响应生成时间点，单位：毫秒 |                |
| \<data\>    |  true    |   object array    |               |          |
| \<settlement_record\>    |  true    |   object array    |               |          |
| symbol                 | true | string | 品种代码          |             |
| settlement_time        | true | long | 结算时间（时间戳，单位毫秒） （当settlement_type为交割时，该时间为交割时间；当settlement_type为结算时，该时间为结算时间；）         |             |
| clawback_ratio        | true | decimal | 分摊比例        |             |
| \<list\>                |   true   |   object array   |         |                |
| contract_code        | true | string | 合约代码          |   "BTC180914" ...             |
| settlement_price        | true | decimal | 结算价格（当settlement_type为交割时，该价格为交割价格；当settlement_type为结算时，该价格为结算价格；）          |              |
| settlement_type        | true | string | 结算类型         |  “delivery”：交割，“settlement”：结算            |
| \</list\>         |      |         |         |                |
| \</settlement_record\>         |      |         |         |                |
| total_page        | true | int | 总页数   |                |
| current_page        | true | int | 当前页   |                |
| total_size        | true | int | 总条数   |                |
| \</data\>         |      |         |        |                |

## 获取指数K线数据

### 实例

- GET `/index/market/history/index`

```shell
curl "https://api.hbdm.com/index/market/history/index?symbol=BTC-USD&period=1min&size=150"
```

### 请求参数
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | 指数标识          |         | 支持大小写，"BTC-USD","ETH-USD"...                           |
| period          | true     | string  | K线类型               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |
| size  | true     | int    | K线获取数量          |     | [1,2000] |

> 返回示例：

```json

{
    "ch": "market.BTC-USD.index.60min",
    "data": [
        {
            "amount": 0,
            "close": 13703.4175,
            "count": 0,
            "high": 13720.84,
            "id": 1604293200,
            "low": 13658.245,
            "open": 13709.6175,
            "vol": 0
        },
        {
            "amount": 0,
            "close": 13751.6,
            "count": 0,
            "high": 13771.21,
            "id": 1604296800,
            "low": 13693.16,
            "open": 13703.365,
            "vol": 0
        }
    ],
    "status": "ok",
    "ts": 1604299755097
}
```

### 返回参数：

| **参数名称**  | **是否必须** | **类型**  | **描述**        | **取值范围**                                 |
| ----------- | --------    | ------   | -------------   | ---------------------------------------- |
| ch            | true     | string    | 数据所属的 channel 格式： market.$symbol.index.$period   |      |
| \<data\>      | true     | object    | 指数KLine 数据	     |       |        |
| id            | true     | decimal   |  指数K线id,也就是K线时间戳，K线起始时间	            |    |       
| vol           | true     | decimal   |  成交量张数,值为0    |    |       
| count         | true     | decimal   |   成交笔数，值为0    |    |       
| open          | true     | decimal   |  开盘指数价         |     |       
| close         | true     | decimal   |  收盘指数价,当K线为最晚的一根时，是最新指数价     |       |        
| low           | true     | decimal   |  最低指数价         |     |         
| high          | true     | decimal   |  最高指数价         |     |         
| amount        | true     | decimal   |  成交量(币), 即 sum(每一笔成交量(张) * 单张合约面值/该笔成交价)，值为0    |     |          
| \</data\>     |      |     | 	                |    |
| status        | true     | string    | 请求处理结果         |  "ok" , "error" |
| ts            | true     | long      | 响应生成时间点 单位：毫秒       |   |



## 获取基差数据

### 实例

- GET `/index/market/history/basis`

```shell
curl "https://api.hbdm.com/index/market/history/basis?symbol=BTC_CQ&period=1min&size=150&basis_price_type=open"
```

### 请求参数
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | 合约名称          |         | 支持大小写，如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季度合约"                          |
| period          | true     | string  | 周期               |         | 仅支持小写，1min,5min, 15min, 30min, 60min,4hour,1day,1mon     |
| basis_price_type          | false     | string  | 基差价格类型，表示在周期内计算基差使用的价格类型              |    开盘价：open     |    仅支持小写，开盘价：open，收盘价：close，最高价：high，最低价：low，平均价=（最高价+最低价）/2：average   |
| size  | true     | int    | 基差获取数量          |    | [1,2000] |

> 返回示例：

```json

{
    "ch": "market.BTC-USD.basis.5min.open",
    "data": [
        {
            "basis": "-2.1850000000013097",
            "basis_rate": "-0.00015880531885174013",
            "contract_price": "13756.8",
            "id": 1604299500,
            "index_price": "13758.985"
        },
        {
            "basis": "-4.235000000000582",
            "basis_rate": "-0.00030799697602973224",
            "contract_price": "13745.9",
            "id": 1604299800,
            "index_price": "13750.135"
        }
    ],
    "status": "ok",
    "ts": 1604299816352
}
```

### 返回参数

| **参数名称**                | **是否必须** | **类型**  | **描述**             | **取值范围**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| ch | true  | string | 主题 |  |
| status | true  | string |  状态 |  |
| \<data\>        | true     | object  | 基差数据	           |         |   |
| id | true | long | 唯一标识 |  |
| contract_price | true | string | 合约最新成交价 |  |
| index_price | true | string | 指数基准价，与基差价格类型匹配 |  |
| basis | true | string | 基差=合约基准价 - 指数基准价 |  |
| basis_rate | true | string | 基差率=基差/指数基准价 |  |
| \</data\>          |      |   | 	           |         |   |
| ts | true  | long | 生成时间 |  |


### 说明：

  一次最多2000条数据；
  
  次季度的基差数据在2020/6/15 14:00:00后才开始生成。



# 合约资产接口

## 获取账户总资产估值

 - POST `/api/v1/contract_balance_valuation`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| valuation_asset   | false  | string    |    资产估值币种，即按该币种为单位进行估值，不填默认"BTC"    |   "BTC","USD","CNY","EUR","GBP","VND","HKD","TWD","MYR","SGD","KRW","RUB","TRY"    |


> Response: 

```json
{
    "status": "ok",
    "data": [
        {
            "valuation_asset": "CNY",
            "balance": "295098.370590947021036643"
        }
    ],
    "ts": 1614044220841
}
```

### 返回参数

| 参数名称                   | 是否必须 | 类型      | 描述                 | 取值范围                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | 请求处理结果             |                                          |
| \<data\> | true     |  object array      |                    |                                          |
| valuation_asset   | true  | string    |    资产估值币种，即按该币种为单位进行估值   |  "BTC","USD","CNY","EUR","GBP","VND","HKD","TWD","MYR","SGD","KRW","RUB","TRY"   |
| balance        | true | string |    资产估值       |         |
| \</data\>            |      |         |                    |                                          |
| ts                     | true | long    | 时间戳                |                                          |


## 获取用户账户信息

###  示例

- POST  `/api/v1/contract_account_info`

###  请求参数

参数名称     |  是否必须   |  类型   |  描述   |  默认值   |  取值范围  |
-------------- |  -------------- |  ---------- |  ----------  | ------------ |  ------------------------------------------ |
symbol  |    false  |  string  |  品种代码  |    |  支持大小写,"BTC","ETH"...如果缺省，默认返回所有品种  |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "ADA",
            "margin_balance": 453.151955780787465997,
            "margin_position": 0,
            "margin_frozen": 0,
            "margin_available": 453.151955780787465997,
            "profit_real": 16.35635155751274032,
            "profit_unreal": 0,
            "risk_rate": null,
            "withdraw_available": 436.795604223274725677,
            "liquidation_price": null,
            "lever_rate": 10,
            "adjust_factor": 0.2,
            "margin_static": 453.151955780787465997
        }
    ],
    "ts": 1604300060777
}
```

###  返回参数

参数名称  |    是否必须   |  类型   |  描述  |   取值范围  |
-------------------------- |  -------------- |  ---------- |  ------------------------------------------ |  ----------------  |
status  |  true  |  string  |  请求处理结果  |  "ok" , "error"  |
\<data\>  |    |    |    |    |    
symbol  |  true  |  string  |  品种代码  |  "BTC","ETH"...  |
margin_balance  |  true  |  decimal    |  账户权益   |    |   
margin_position  |  true  |  decimal    |  持仓保证金（当前持有仓位所占用的保证金）   |    |
margin_frozen  |  true  |  decimal    |  冻结保证金  |   | 
margin_available  |  true  |  decimal   |  可用保证金  |    | 
profit_real  |    true  |  decimal    |  已实现盈亏  |    | 
profit_unreal  |  true  |  decimal    |  未实现盈亏  |   | 
risk_rate  | true  |  decimal    |  保证金率  |  |   
liquidation_price  |    true  |  decimal    |  预估强平价  |   | 
withdraw_available  |   true  |  decimal    |  可划转数量  |   | 
lever_rate  |  true  |  decimal    |  杠杠倍数  |    |   
adjust_factor                | true     | decimal  | 调整系数               |                |  
margin_static                | true     | decimal  | 静态权益               |                |  
\</data\>  |    |    |    |       |
ts  |    true  |    long  |  响应生成时间点，单位：毫秒  |    | 


## 获取用户持仓信息

###  示例

- POST `/api/v1/contract_position_info`

###  请求参数

参数名称   |  是否必须   |  类型    |  描述    |  默认值    |  取值范围  |
-------------- |  --------------  | ---------- |  ----------  | ------------ |  ------------------------------------------  |
symbol  |    false  |  string  |  品种代码  |    |  支持大小写,""BTC","ETH"...如果缺省，默认返回所有品种  |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "ADA",
            "contract_code": "ADA201225",
            "contract_type": "quarter",
            "volume": 1,
            "available": 1,
            "frozen": 0,
            "cost_open": 0.0991,
            "cost_hold": 0.0991,
            "profit_unreal": 0,
            "profit_rate": 0,
            "lever_rate": 10,
            "position_margin": 10.090817356205852674,
            "direction": "sell",
            "profit": 0,
            "last_price": 0.0991
        }
    ],
    "ts": 1604301441639
}
```

###  返回参数

参数名称  |     是否必须   |  类型   |  描述  |  取值范围  |
-------------------------- |  -------------- |  ---------- |  ---------------------------- |  ------------------------------------------------------  |
status  |  true  |  string  |  请求处理结果  |  "ok" , "error"  |
\<data\>  |    |    |    |     |
symbol  |  true  |  string  |  品种代码  |  "BTC","ETH"...  |
contract_code  |  true  |  string  |  合约代码  |  "BTC180914" ...  |
contract_type  |  true  |  string  |  合约类型  |  当周:"this_week", 次周:"next_week", 当季:"quarter", 次季:"next_quarter"  |
volume  |  true  |  decimal    |  持仓量|   |
available  | true  |  decimal    |  可平仓数量  |    |   
frozen  |  true  |  decimal    |  冻结数量  |    |
cost_open  |  true  |  decimal    |  开仓均价  |    |
cost_hold  | true  |  decimal    |  持仓均价  |    |
profit_unreal  |  true  |  decimal    |  未实现盈亏  |    |   
profit_rate  |    true  |  decimal    |  收益率  |   | 
profit  |  true  |  decimal   |  收益  |    |
position_margin  |  true  |  decimal    |  持仓保证金  |    |   
lever_rate  |  true  |  int  |   杠杠倍数  |    |
direction  |  true  |  string  |  仓位方向   | "buy":买，即多仓  "sell":卖，即空仓    |
last_price  |  true  |  decimal    |  最新价  |     | 
\</data\>  |    |    |    |    |
ts  |    true  |  long  |  响应生成时间点，单位：毫秒   |    |

#### 备注

- 如果有某个品种在结算中，不带请求参数去查询持仓，会返回错误码1080(1080 In settlement or delivery. Unable to get positions of some contracts. )。建议您带上请求参数去查询持仓，避免报错查询不到持仓。



## 批量设置子账户交易权限

 - POST `/api/v1/contract_sub_auth`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| sub_uid | true  | string | 子账户uid (多个uid中间以","分隔,一次最多允许开通10个子账户)	    |                                          |
| sub_auth | true  | int |  子账户交易权限	    |      1 开启，0关闭              |

#### 备注：
- 首次帮子账户开启交易权限时，系统会自动帮子账户先开通合约。
- 若子账户交易权益已开启，此时请求开启权限，则接口会直接返回成功；若子账户交易权益已关闭，此时用户请求关闭权限，则接口会直接返回成功；

> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "sub_uid": "1234567",
                "err_code": 1010,
                "err_msg": "Account doesnt exist."
            }
        ],
        "successes": "123456789"
    },
    "ts": 1612490081318
} 
```

###  返回参数

| 参数名称                   | 是否必须 | 类型     | 描述                                 | 取值范围           |
| ---------------------- | ---- | ------ | ---------------------------------- | -------------- |
| status                 | true | string | 请求处理结果                             | "ok" , "error" |
| \<data\>|  true    |      |                                    |                |
| \<errors\>|  true    | object array       |                                    |                |
| sub_uid               | true | string | 开通失败的子账户uid                            |                |
| err_code               | true | int    | 错误码                                |                |
| err_msg                | true | string | 错误信息                               |                |
| \</errors\>              |      |        |                                    |                |
| successes              | true | string | 开通合约成功的子账户uid列表 |                |
| \</data\>              |      |        |                                    |                |
| ts                     | true | long   | 响应生成时间点，单位：毫秒                      |                |


## 查询母账户下所有子账户资产信息

### 请求参数

- POST `/api/v1/contract_sub_account_list`

参数名称    |  是否必须   |   类型   |   描述          |   默认值   |   取值范围                                   |
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
symbol      | false     | string | 品种代码          |         | 支持大小写, "BTC","ETH"...  ,如果缺省，默认返回所有品种                         |

> Response:

```json
  
{
    "status": "ok",
    "data": [
        {
            "sub_uid": 123456789,
            "list": [
                {
                    "symbol": "ADA",
                    "margin_balance": 50,
                    "liquidation_price": null,
                    "risk_rate": null
                }
            ]
        }
    ],
    "ts": 1604301647427
}
  
```

### 返回参数
 
  参数名称                 |   是否必须   |   类型    |     描述               |   取值范围      |
---------------------- | -------- | ------- | ------------------ | ------------ |
status | true | string | 请求处理结果	 | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<data\> |  |  |  |  |
sub_uid | true  | long | 子账户UID |  |
\<list\> |  |  |  |  |
symbol | true | string | 品种代码 | "BTC","ETH"... |
margin_balance | true | decimal | 账户权益 |  |
liquidation_price | true | decimal | 预估强平价 |  |
risk_rate | true | decimal | 保证金率 |  |
\</list\> |  |  |  |  |
\</data\> |  |  |  |  |

### 备注
  只返回已经开通合约交易的子账户数据.


## 批量获取子账户资产信息

 - POST `/api/v1/contract_sub_account_info_list`

### 请求参数
| 参数名称   | 是否必须  | 类型     | 描述   |  取值范围       |
| ------ | ----- | ------ |  ---- | ------------------------------ |
| symbol | false | string | 品种代码 |  "BTC","ETH"...  ,如果缺省，默认返回所有品种 |
| page_index  | false | int    | 第几页,不填默认第一页            |                                          |
| page_size   | false | int    | 不填默认20，不得多于50          |    [1-50]  |

#### 备注：
- 只返回已经开通合约交易的子账户数据.

> Response:

```json
{
    "status": "ok",
    "data": {
        "total_page": 1,
        "current_page": 1,
        "total_size": 2,
        "sub_list": [
            {
                "sub_uid": 123456789,
                "account_info_list": [
                    {
                        "symbol": "BCH",
                        "margin_balance": 0,
                        "liquidation_price": null,
                        "risk_rate": null
                    }
                ]
            },
            {
                "sub_uid": 12345678,
                "account_info_list": [
                    {
                        "symbol": "BCH",
                        "margin_balance": 0,
                        "liquidation_price": null,
                        "risk_rate": null
                    }
                ]
            }
        ]
    },
    "ts": 1612490180078
}
  
```

### 返回参数

| 参数名称  | 是否必须 | 类型      | 描述     | 取值范围           |
| ----------------- | ---- | ------- | ------------- | -------------- |
| status                | true | string  | 请求处理结果        | "ok" , "error"                           |
| ts                    | true | long    | 响应生成时间点，单位：毫秒 |                                          |
| \<data\>              | true    |  object       | 字典类型          |                                          |
| \<sub_list\>  | true     |  object array       |               |                                          |
| sub_uid           | true | long    | 子账户UID        |                |
| \<account_info_list\>          |   true   |  object array       |               |                |
| symbol            | true | string  | 品种代码          | "BTC","ETH"... |
| margin_balance    | true | decimal | 账户权益          |                |
| liquidation_price | true | decimal | 预估强平价         |                |
| risk_rate         | true | decimal | 保证金率          |                |
| \</account_info_list\>         |      |         |               |                |
| \</sub_list\> |     |         |               |                                          |
| current_page          | true | int     | 当前页           |                                          |
| total_page            | true | int     | 总页数           |                                          |
| total_size            | true | int     | 总条数           |                                          |
| \</data\>             |      |         |      |     |



## 查询单个子账户资产信息

- POST `/api/v1/contract_sub_account_info`

>  Request:

```json
{
    "symbol":"BTC",
    "sub_uid":123456789
}
```
###  请求参数

  参数名称     |   是否必须   |  类型  |  描述         |   默认值   |   取值范围                                 |
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
symbol | false | string | 品种代码	 |    | 支持大小写,"BTC","ETH"...，如果缺省，默认返回所有品种 |
sub_uid | true | long | 子账户的UID	 |  |  |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "ADA",
            "margin_balance": 50,
            "margin_position": 0,
            "margin_frozen": 0,
            "margin_available": 50,
            "profit_real": 0,
            "profit_unreal": 0,
            "risk_rate": null,
            "withdraw_available": 50,
            "liquidation_price": null,
            "lever_rate": 5,
            "adjust_factor": 0.1,
            "margin_static": 5
        }
    ],
    "ts": 1604301730723
}
  
```

### 返回参数

  参数名称                |   是否必须   |  类型    |   描述               |   取值范围      |
---------------------- | -------- | ------- | ------------------ | ------------ |
status | true | string | 请求处理结果	 | "ok" , "error" |
ts                       | true | long | 响应生成时间点，单位：毫秒 |  |
\<data\> |  |  |  |  |
symbol                  | true     | string  | 品种代码               | "BTC","ETH"...， |
margin_balance                  | true     | decimal  | 账户权益               |                |
margin_position                 | true     | decimal  | 持仓保证金（当前持有仓位所占用的保证金）               |                |
margin_frozen                 | true     | decimal  | 冻结保证金               |                |
margin_available                 | true     | decimal  | 可用保证金               |                |
profit_real                 | true     | decimal  | 已实现盈亏               |                |
profit_unreal                 | true     | decimal  | 未实现盈亏               |                |
risk_rate                 | true     | decimal  | 保证金率               |                |
liquidation_price                | true     | decimal  | 预估爆仓价               |                |
withdraw_available                | true     | decimal  | 可划转数量               |                |
lever_rate                | true     | decimal  | 杠杆倍数               |                |
adjust_factor                | true     | decimal  | 调整系数               |                |  
margin_static                | true     | decimal  | 静态权益               |                |  
\</data\> |  |  |  |  |

### 备注

  只能查询到开通合约交易的子账户信息；
  
  子账户来过合约系统但是未开通合约交易也不返回对应的数据；


## 查询单个子账户持仓信息

- POST `/api/v1/contract_sub_position_info`

>  Request:

```json
{
    "symbol":"BTC",
    "sub_uid":123456789
}
```

### 请求参数

  参数名称    |  是否必须  |  类型  |  描述        |   默认值  |  取值范围                                  |
----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
symbol | false | string | 品种代码	 |  | 支持大小写, "BTC","ETH"...，如果缺省，默认返回所有品种 |
sub_uid | true | long | 子账户的UID	 |  |  |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "ADA",
            "contract_code": "ADA201225",
            "contract_type": "quarter",
            "volume": 1,
            "available": 1,
            "frozen": 0,
            "cost_open": 0.0991,
            "cost_hold": 0.0991,
            "profit_unreal": -0.04686106551835051,
            "profit_rate": -0.002321965796434265,
            "lever_rate": 5,
            "position_margin": 20.191006925515375451,
            "direction": "buy",
            "profit": -0.04686106551835051,
            "last_price": 0.099054
        }
    ],
    "ts": 1604302891178
}
                                                
``` 
                                            
### 返回参数

  参数名称                |   是否必须   |   类型    |   描述              |   取值范围       |
---------------------- | -------- | ------- | ------------------ | ------------ |
status | true | string | 请求处理结果	 | "ok" , "error" |
ts                       | true | long | 响应生成时间点，单位：毫秒 |  |
\<data\> |  |  |  |  |
symbol                  | true     | string  | 品种代码               | 支持大小写, "BTC","ETH"... |
contract_code                | true     | string  |  合约代码             | "BTC180914" ... |
contract_type                | true     | string  | 合约类型              | 当周:"this_week", 次周:"next_week", 当季:"quarter", 次季：“next_quarter” |
volume                | true     | decimal	  |  持仓量             |  |
available               | true     | decimal	  | 可平仓数量              |  |
frozen               | true     | decimal	  |  冻结数量             |  |
cost_open               | true     | decimal	  |  开仓均价             |  |
cost_hold               | true     | decimal	  | 持仓均价              |  |
profit_unreal               | true     | decimal	  | 未实现盈亏              |  |
profit_rate               | true     | decimal	  | 收益率              |  |
profit               | true     | decimal	  | 收益              |  |
position_margin               | true     | decimal	  | 持仓保证金              |  |
lever_rate               | true     | int	  | 杠杆倍数              |  |
direction               | true     | string	  |   仓位方向           |  "buy":买，即多仓  "sell":卖，即空仓 |
last_price  |  true  |  decimal    |  最新价  |     | 
\</data\> |  |  |  |  |

## 查询用户财务记录

- POST `/api/v1/contract_financial_record`

>  Request:

```json
{
    "create_date":7,
    "page_index":1,
    "symbol":"btc",
    "type":"3,4",
    "page_size":20
}
```
 
###  请求参数

参数名称                |  是否必须  |  类型   |  描述              |  取值范围       |
----------------------- | -------- | ------- | ------------------ | ------------------------------- |
symbol <img width=250/> | true <img width=250/> | string | 品种代码 <img width=1000/>  | 支持大小写,"BTC","ETH"... |
type | false | string | 不填查询全部类型,【查询多类型中间用，隔开】 | 3:平多; 4:平空; 5:开仓手续费-吃单; 6:开仓手续费-挂单; 7:平仓手续费-吃单; 8:平仓手续费-挂单; 9:交割平多; 10:交割平空; 11:交割手续费; 12:强制平多; 13:强制平空; 14:从币币转入; 15:转出至币币; 16:结算未实现盈亏-多仓; 17:结算未实现盈亏-空仓; 19:穿仓分摊; 26:系统; 28:活动奖励; 29:返利; 30:资金费-收入; 31:资金费-支出; 34:转出到子账号合约账户; 35:从子账号合约账户转入; 36:转出到母账号合约账户; 37:从母账号合约账户转入;  |
create_date | false | int | 可随意输入正整数，如果参数超过90则默认查询90天的数据 | [1-90]  |
page_index | false | int | 第几页,不填默认第一页 |  |
page_size | false | int | 不填默认20，不得多于50 | [1-50] |

> Response:

```json
                            
{
    "status": "ok",
    "data": {
        "total_page": 15,
        "current_page": 1,
        "total_size": 15,
        "financial_record": [
            {
                "id": 3662498355,
                "symbol": "ADA",
                "type": 8,
                "amount": -0.074766355140186915,
                "ts": 1605014144415,
                "contract_code": "ADA201225"
            }
        ]
    },
    "ts": 1604306015124
}                                
```   
                             
### 返回参数

参数名称                |   是否必须  |  类型   |  描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | ------------------------------- |
status <img width=250/> | true <img width=250/> | string | 请求处理结果 <img width=1000/>  | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<data\> |  |  | 字典类型 |  |
\<financial_record\> |  |  |  |  |
id | true  | long | 财务记录ID（品种唯一） |  |
ts | true  | long | 创建时间 |  |
symbol | true  | string | 品种代码 | 支持大小写,"BTC","ETH"... |
type | true  | int | 交易类型 | 3:平多; 4:平空; 5:开仓手续费-吃单; 6:开仓手续费-挂单; 7:平仓手续费-吃单; 8:平仓手续费-挂单; 9:交割平多; 10:交割平空; 11:交割手续费; 12:强制平多; 13:强制平空; 14:从币币转入; 15:转出至币币; 16:结算未实现盈亏-多仓; 17:结算未实现盈亏-空仓; 19:穿仓分摊; 26:系统; 28:活动奖励; 29:返利; 30:资金费-收入; 31:资金费-支出; 34:转出到子账号合约账户; 35:从子账号合约账户转入; 36:转出到母账号合约账户; 37:从母账号合约账户转入; |
amount | true  | decimal | 金额 |  |
contract_code | true  | string | 合约代码 |  |
\</financial_record\> |  |  |  |  |
total_page | true  | int | 总页数 |  |
current_page | true  | int | 当前页 |  |
total_size | true  | int | 总条数 |  |
\</data\> |  |  |  |  |

## 组合查询用户财务记录

 - POST `/api/v1/contract_financial_record_exact`
 
### 请求参数
| 参数名称        | 是否必须  | 类型     | 描述    | 取值范围  |
| ----------- | ----- | ------ | ---------------------- | ---------------------------------------- |
| symbol  <img width=250/>    | true <img width=250/> | string | 品种代码     <img width=1000/>    | "BTC","ETH"...                           |
| type        | false | string | 不填查询全部类型,【查询多类型中间用，隔开】 | 3:平多; 4:平空; 5:开仓手续费-吃单; 6:开仓手续费-挂单; 7:平仓手续费-吃单; 8:平仓手续费-挂单; 9:交割平多; 10:交割平空; 11:交割手续费; 12:强制平多; 13:强制平空; 14:从币币转入; 15:转出至币币; 16:结算未实现盈亏-多仓; 17:结算未实现盈亏-空仓; 19:穿仓分摊; 26:系统; 28:活动奖励; 29:返利; 30:资金费-收入; 31:资金费-支出; 34:转出到子账号合约账户; 35:从子账号合约账户转入; 36:转出到母账号合约账户; 37:从母账号合约账户转入; |
| start_time   | false  | long    | 起始时间（时间戳，单位毫秒）        | 详见备注    |
| end_time   | false  | long    | 结束时间（时间戳，单位毫秒）        |  详见备注   |
| from_id    | false | long    | 查询起始id（取返回数据的id ）    |                     |
| size     | false | int    | 数据条数,默认取20，最大50    |       [1-50]              |
| direct     | false | string    |  查询方向   |   prev 向前；next 向后；默认值取prev                          | 

#### 备注：
- 起始与结束时间取值说明：
   - start_time：取值范围为[(当前时间 - 90天)，当前时间] ；默认值取clamp（end_time - 10天，当前时间-90天，当前时间-10天），即时间最远取当前时间-90天，最近取当前时间-10天。
   - end_time：取值范围为：[(当前时间 - 90天)，above++)，若大于当前时间则直接取当前时间；若填写了start_time，则end_time必须大于start_time。默认值直接取当前时间。
- 当from_id缺省时，查询方向为prev则从结束时间往前查，查询方向为向后则从起始时间往后查；即查询创建时间大于等于起始时间，且小于等于结束时间的财务记录数据。
- 无论查询方向是向前还是向后，返回的数据都是按id倒序。
- 当start_time或end_time填写值不符合取值范围，则报错参数不合法。
- 仅支持查询90天内数据。

#### 查询案例如下（特殊错误情况未罗列）如当前时间为"2020-07-31"：

| start_time | end_time | from_id  | size | direct | 查询结果 |
|-----|------|-----|-----|-----|-----|
| 缺省，取10天前（2020-07-21） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | prev | 查询最近10天的数据，从当前时间开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取60天前（2020-06-01） | 50天前（2020-06-11） | 缺省 | 20条 | prev | 查询60天前到50天前之间的数据，从50天前开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 5天前（2020-07-26） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | prev | 查询最近5天的数据，从当前时间开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 20天前（2020-07-11） | 10天前（2020-07-21） | 缺省 | 20条 | prev | 查询20天前到10天前之间的数据，从10天前开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取10天前（2020-07-21） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | next | 查询最近10天的数据，从10天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取60天前（2020-06-01） | 50天前（2020-06-11） | 缺省 | 20条 | next | 查询60天前到50天前之间的数据，从60天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 5天前（2020-07-26） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | next | 查询最近5天的数据，从5天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 20天前（2020-07-11） | 10天前 （2020-07-21）| 缺省 | 20条 | next | 查询20天前到10天前之间的数据，从20天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取10天前（2020-07-21） | 缺省，取当前时间 （2020-07-31）|  1000  | 20条 | prev | 查询最近10天的数据，从成交id为1000的数据开始往前查20条更旧的数据，成交id为1000的数据排在第一条，越新的数据排在越前    |
| 20天前 （2020-07-11）| 10天前 （2020-07-21） | 1000 | 20条 | next | 查询20天前到10天前之间的数据，从成交id为1000的数据开始往后查20条更新的数据，成交id为1000的数据排在最后一条，越新的数据排在越前       |

> Response:

```json
                                
{
    "status": "ok",
    "data": {
        "financial_record": [
            {
                "id": 3657420903,
                "symbol": "ADA",
                "type": 34,
                "amount": -50,
                "ts": 1604301623306,
                "contract_code": "ADA"
            },
            {
                "id": 3657420101,
                "symbol": "ADA",
                "type": 6,
                "amount": -0.020181634712411705,
                "ts": 1604301416067,
                "contract_code": "ADA201225"
            }
        ],
        "remain_size": 22,
        "next_id": 3657309434
    },
    "ts": 1604305081144
}                              
```
### 返回参数

| 参数名称    | 是否必须 | 类型      | 描述            | 取值范围  |
| --------------------- | ---- | ------- | ------------- | ---------------------------------------- |
| status  <img width=250/>   | true <img width=250/> | string  | 请求处理结果 <img width=1000/>   | "ok" , "error"                           |
| ts                    | true | long    | 响应生成时间点，单位：毫秒 |                                          |
| \<data\>              | true    |  object       | 字典类型          |                                          |
| \<financial_record\>  | true     |  object array       |               |                                          |
| id                    | true | long    |    流水id（品种唯一）           |                                          |
| ts                    | true | long    | 创建时间          |                                          |
| symbol                | true | string  | 品种代码          | "BTC","ETH"...                           |
| contract_code                | true | string  | 合约代码          | "BTC200919"...                           |
| type                  | true | int     | 交易类型          | 3:平多; 4:平空; 5:开仓手续费-吃单; 6:开仓手续费-挂单; 7:平仓手续费-吃单; 8:平仓手续费-挂单; 9:交割平多; 10:交割平空; 11:交割手续费; 12:强制平多; 13:强制平空; 14:从币币转入; 15:转出至币币; 16:结算未实现盈亏-多仓; 17:结算未实现盈亏-空仓; 19:穿仓分摊; 26:系统; 28:活动奖励; 29:返利; 30:资金费-收入; 31:资金费-支出; 34:转出到子账号合约账户; 35:从子账号合约账户转入; 36:转出到母账号合约账户; 37:从母账号合约账户转入; |
| amount                | true | decimal | 金额            |                                          |
| \</financial_record\> |     |         |               |                                          |
| remain_size           | true | int  | 剩余数据条数（在时间范围内，因受到数据条数限制而未查询到的数据条数）   |                                          |
| next_id           | true | long     | 下一条数据的流水id（仅在查询结果超过数据条数限制时才有值）            |                                          |
| \</data\>             |      |         |      |     |

#### 备注：

 - 当查询结果超过数据条数限制时，next_id为下一条数据的流水id（查询方向为prev时，next_id为下一页查询的第一条数据；查询方向为next时，next_id为下一页查询的最后一条数据）


## 查询用户结算记录

 - POST `/api/v1/contract_user_settlement_records`
 
### 请求参数

|  参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol     | true   | string  | 品种代码                        | "BTC","ETH"...  |
| start_time | false  | long    | 起始时间（时间戳，单位毫秒）        |  取值范围：[(当前时间 - 90天), 当前时间] ，默认取当前时间- 90天   |
| end_time   | false  | long    | 结束时间（时间戳，单位毫秒）        | 取值范围：(start_time, 当前时间]，默认取当前时间  |
| page_index |false   |	int	    | 页码                             |不填默认第1页	           |
| page_size	 |false   |	int	    | 页大小,不填默认20，不得多于50（超过则按照50进行查询）     | [1-50]  |


#### 备注：
 - 默认按时间倒序查询，新数据排在前。
 - 起始时间与结束时间不符合取值范围时，报错1067，参数不合法。
 - 查询结算开始时间在起始时间之后，结束时间之前的用户结算记录数据。
 - 该接口仅支持用户查询最近90天的数据。
 
> Response: 

```json

{
    "status": "ok",
    "data": {
        "total_page": 13,
        "current_page": 1,
        "total_size": 13,
        "settlement_records": [
            {
                "symbol": "ADA",
                "margin_balance_init": 436.415907066107795161,
                "margin_balance": 436.795604223274725677,
                "settlement_profit_real": 0.379697157166930517,
                "settlement_time": 1604044800130,
                "clawback": 0,
                "delivery_fee": 0,
                "offset_profitloss": 13.25977319159553892,
                "fee": -0.565357129977092573,
                "fee_asset": "ADA",
                "positions": [
                    {
                        "symbol": "ADA",
                        "contract_code": "ADA201225",
                        "direction": "buy",
                        "volume": 2,
                        "cost_open": 0.098,
                        "cost_hold_pre": 0.098,
                        "cost_hold": 0.092423,
                        "settlement_profit_unreal": -12.31471890445151583,
                        "settlement_price": 0.092423,
                        "settlement_type": "settlement"
                    }
                ]
            }
        ]
    },
    "ts": 1604305358564
}

```
### 返回参数

| 参数名称                   | 是否必须 | 类型      | 描述                 | 取值范围                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | 请求处理结果             |                                          |
| \<data\> | true     |  object      |                    |                                          |
| \<settlement_records\> | true     |  object   array    |                    |                                          |
| symbol     | true   | string  | 品种代码                 | "BTC","ETH"... |
| margin_balance_init        | true | decimal | 本期初始账户权益         |                                          |
| margin_balance        | true | decimal | 本期结算后账户权益         |                                          |
| settlement_profit_real        | true | decimal | 本期结算已实现盈亏            |                                          |
| settlement_time     | true   | long  | 本期结算时间，交割时为交割时间                |   |
| clawback        | true | decimal |   本期分摊费用         |         |
| delivery_fee        | true | decimal | 本期交割手续费（多空仓位汇总值），仅有仓位进行交割时该字段才有值           |                                          |
| offset_profitloss        | true | decimal | 本期平仓盈亏           |                                          |
| fee        | true | decimal | 本期交易手续费           |                                          |
| fee_asset        | true | string | 手续费币种      |                                          |
| \<positions\> | true     |  object   array    |                    |                                          |
| symbol     | true   | string  | 品种代码                 | "BTC","ETH"... |
| contract_code     | true   | string  | 合约代码                 |  "BTC200619" ... |
| direction            | true | string  | 仓位方向  |     "buy":买 "sell":卖                                     |
| volume               | true | decimal | 本期结算前持仓量（张）              |                                          |
| cost_open            | true | decimal | 开仓均价             |                                          |
| cost_hold_pre            | true | decimal | 本期结算前持仓均价             |                                          |
| cost_hold            | true | decimal | 本期结算后持仓均价             |                                          |
| settlement_profit_unreal        | true | decimal | 本期结算未实现盈亏            |                                          |
| settlement_price        | true | decimal | 本期结算价格，交割时即为交割价格            |                                          |
| settlement_type        | true | string |   结算类型          |     settlement：结算；delivery：交割；      |
| \</positions\>            |      |         |                    |                                          |
| \</settlement_records\>            |      |         |                    |                                          |
| total_page        | true | int | 总页数   |                |
| current_page        | true | int | 当前页   |                |
| total_size        | true | int | 总条数   |                |
| \</data\>            |      |         |                    |                                          |
| ts                     | true | long    | 时间戳                |                                          |

#### 说明：
- settlement_time本期结算时间为结算开始时间。
- 只要用户曾有过资金，就会有结算记录。若查询的用户没有结算记录，则直接返回空数据（data为空数组）

## 查询用户当前的下单量限制

- POST `/api/v1/contract_order_limit`

>  Request:

```json
{
    "symbol":"btc",
    "order_price_type":"limit"
}
``` 
 
### 请求参数

  参数名称               |   是否必须   |  类型  |  描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 symbol <img width=250/> | false <img width=250/> | string <img width=250/> | 品种代码 <img width=1000/>	 | 支持大小写,"BTC","ETH"...，如果缺省，默认返回所有品种 |
 order_price_type | true  | string | 订单报价类型 | "limit":限价，"opponent":对手价，"lightning":闪电平仓，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档，"fok":FOK订单，"ioc":IOC订单,"opponent_ioc"： 对手价-IOC下单，"lightning_ioc"：闪电平仓-IOC下单，"optimal_5_ioc"：最优5档-IOC下单，"optimal_10_ioc"：最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单,"opponent_fok"： 对手价-FOK下单，"lightning_fok"：闪电平仓-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |

> Response:

```json

{
    "status": "ok",
    "data": {
        "order_price_type": "limit",
        "list": [
            {
                "symbol": "ADA",
                "types": [
                    {
                        "contract_type": "this_week",
                        "open_limit": 6000,
                        "close_limit": 12000
                    },
                    {
                        "contract_type": "next_week",
                        "open_limit": 6000,
                        "close_limit": 12000
                    },
                    {
                        "contract_type": "quarter",
                        "open_limit": 6000,
                        "close_limit": 12000
                    },
                    {
                        "contract_type": "next_quarter",
                        "open_limit": 6000,
                        "close_limit": 12000
                    }
                ]
            }
        ]
    },
    "ts": 1604306946036
}

```

### 返回参数

 参数名称                |  是否必须 |  类型  |  描述            |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
 \<data\> |  |  |  |  |    
 order_price_type | true  | string | 订单报价类型 | "limit":限价，"opponent":对手价，"lightning":闪电平仓，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档，"fok":FOK订单，"ioc":IOC订单 |
 \<list\> |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 \<types\> |  |  |  |  |
 contract_type  | true | string | 合约类型 | 当周:"this_week", 次周:"next_week", 当季:"quarter", 次季:"next_quarter" |
 open_limit | true | long | 合约开仓单笔下单量最大值 |  |
 close_limit | true | long | 合约平仓单笔下单量最大值 |  |
 \</types\>  |  |  |  |  |
 \</list\>  |  |  |  |  |
 \</data\> |  |  |  |  |

## 查询用户当前的手续费费率

- POST `/api/v1/contract_fee`
 
### 请求参数

  参数名称                |  是否必须 |  类型  |   描述             |  取值范围      |
----------------------- | -------- | ------- | ------------------ | -------------- |
symbol | false | string | 品种代码	 | 支持大小写,"BTC","ETH"...，如果缺省，默认返回所有品种 |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "ADA",
            "open_maker_fee": "0.0002",
            "open_taker_fee": "0.0004",
            "close_maker_fee": "0.0002",
            "close_taker_fee": "0.0004",
            "delivery_fee": "0.0005",
            "fee_asset": "ADA"
        }
    ],
    "ts": 1604307012954
}

```

### 返回参数

  参数名称                |  是否必须  |  类型   |  描述            |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
 \<data\> |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 fee_asset | true  | string | 手续费币种 | "BTC","ETH"... |
 open_maker_fee | true | string | 开仓挂单的手续费费率，小数形式 | |
 open_taker_fee | true | string | 开仓吃单的手续费费率，小数形式 | |
 close_maker_fee | true | string | 平仓挂单的手续费费率，小数形式 | |
 close_taker_fee | true | string | 平仓吃单的手续费费率，小数形式 | |
 delivery_fee | true | string | 交割的手续费费率，小数形式 | |
 \</data\>  |  |  |  |  |

## 查询用户当前的划转限制

- POST `/api/v1/contract_transfer_limit`
 
### 请求参数

  参数名称                |  是否必须  |  类型   |    描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 symbol | false | string | 品种代码	 | 支持大小写,"BTC","ETH"...，如果缺省，默认返回所有品种 |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "ADA",
            "transfer_in_max_each": 1500000000,
            "transfer_in_min_each": 16,
            "transfer_out_max_each": 150000000,
            "transfer_out_min_each": 0.000001,
            "transfer_in_max_daily": 15000000000,
            "transfer_out_max_daily": 3000000000,
            "net_transfer_in_max_daily": 7500000000,
            "net_transfer_out_max_daily": 1500000000
        }
    ],
    "ts": 1604307084954
}
```

### 返回参数

  参数名称                |  是否必须  |  类型  |   描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 status | true | string | 请求处理结果	 | "ok" , "error" |
 ts | true  | long | 响应生成时间点，单位：毫秒 |  |
 \<data\> |  |  |  |  |
 symbol | true  | string | 品种代码 | "BTC","ETH"... |
 transfer_in_max_each | true | decimal | 单笔最大转入量 |  |
 transfer_in_min_each | true | decimal | 单笔最小转入量 |  |
 transfer_out_max_each | true | decimal | 单笔最大转出量 |  |
 transfer_out_min_each | true | decimal | 单笔最小转出量 |  |
 transfer_in_max_daily | true | decimal | 单日累计最大转入量 |  |
 transfer_out_max_daily | true | decimal | 单日累计最大转出量 |  |
 net_transfer_in_max_daily | true | decimal | 单日累计最大净转入量 |  |
 net_transfer_out_max_daily | true | decimal | 单日累计最大净转出量 |  |
 \</data\>  |  |  |  |  |

## 用户持仓量限制的查询

- POST `/api/v1/contract_position_limit`
  
### 请求参数

  参数名称               |  是否必须 |  类型  |  描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 symbol | false | string | 品种代码	 | 支持大小写,"BTC","ETH"...，如果缺省，默认返回所有品种 |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "ADA",
            "list": [
                {
                    "contract_type": "this_week",
                    "buy_limit": 60000,
                    "sell_limit": 60000
                },
                {
                    "contract_type": "next_week",
                    "buy_limit": 60000,
                    "sell_limit": 60000
                },
                {
                    "contract_type": "quarter",
                    "buy_limit": 60000,
                    "sell_limit": 60000
                },
                {
                    "contract_type": "next_quarter",
                    "buy_limit": 60000,
                    "sell_limit": 60000
                },
                {
                    "contract_type": "all",
                    "buy_limit": 240000,
                    "sell_limit": 240000
                }
            ]
        }
    ],
    "ts": 1604307195501
}

```

### 返回参数

  参数名称                |   是否必须   |  类型   |   描述              |   取值范围        |
----------------------- | -------- | ------- | ------------------ | -------------- |
status | true | string | 请求处理结果	 | "ok" , "error" |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<data\> |  |  |  |  |
symbol | true  | string | 品种代码 | "BTC","ETH"... |
\<list\> |  |  |  |  |
contract_type| true | string | 合约类型 | 当周:"this_week", 次周:"next_week", 当季:"quarter"，次季：“next_quarter”， 所有合约:“all” |
buy_limit | true | decimal | 合约多仓持仓的最大值，单位为张 |  |
sell_limit | true | decimal | 合约空仓持仓的最大值，单位为张 |  |
\</list\> |  |  |  |  |
\</data\> |  |  |  |  |

## 查询用户账户和持仓信息

- POST `/api/v1/contract_account_position_info`
  
### 请求参数

  参数名称               |  是否必须 |  类型  |  描述             |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 symbol | true | string | 品种代码	 | 支持大小写,"BTC","ETH"... |

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "ADA",
            "margin_balance": 405.226124145843792312,
            "margin_position": 10.300252356182726476,
            "margin_frozen": 0,
            "margin_available": 394.925871789661065836,
            "profit_real": 16.336169922800328615,
            "profit_unreal": 2.09434999976873802,
            "risk_rate": 39.141378262699244579,
            "withdraw_available": 386.795604223274725677,
            "liquidation_price": null,
            "lever_rate": 10,
            "adjust_factor": 0.2,
            "margin_static": 403.131774146075054292,
            "positions": [
                {
                    "symbol": "ADA",
                    "contract_code": "ADA201225",
                    "contract_type": "quarter",
                    "volume": 1,
                    "available": 1,
                    "frozen": 0,
                    "cost_open": 0.0991,
                    "cost_hold": 0.0991,
                    "profit_unreal": 2.09434999976873802,
                    "profit_rate": 0.20755008497708193,
                    "lever_rate": 10,
                    "position_margin": 10.300252356182726476,
                    "direction": "sell",
                    "profit": 2.09434999976873802,
                    "last_price": 0.097085
                }
            ]
        }
    ],
    "ts": 1604307305267
}
```

### 返回参数

属性 | 数据类型 | 是否必填 | 说明   |
-----  | -----  | -----  | -----  |
status   | true   | string  | 请求处理结果  "ok" , "error" |
ts       | long | long    | 响应生成时间点，单位：毫秒        |                |
\<data\> |    true    |  object array       |                      |                |
symbol | string | true | 合约品种                                    |
margin_balance | decimal | true | 账户权益                            |
margin_position | decimal | true | 持仓保证金                          |
margin_frozen | decimal | true | 冻结保证金                            |
margin_available | decimal | true | 可用保证金                         |
profit_real | decimal | true | 已实现盈亏                              |
profit_unreal | decimal | true | 未实现盈亏                            |
risk_rate | decimal | true | 保证金率                                 |
withdraw_available | decimal | true | 可划转数量                       |
liquidation_price | decimal | true | 预估爆仓价                        |
lever_rate | int | true | 杠杆倍数                                |
adjust_factor | float | true | 调整系数                             |
margin_static | decimal  | true  | 静态权益                         |
\<positions\> |              |          |                            |
symbol | string | true | 合约品种                                                                        |
contract_code |  string | true  | 合约代码	"BTC180914" ...                                               |
contract_type  | string |  true | 合约类型	当周:"this_week", 次周:"next_week", 当季:"quarter", 次季:"next_quarter"                  |
volume  | decimal  |  true | 持仓量                                                                     |
available  |  decimal |  true  | 可平仓数量                                                               |
frozen  |  decimal |  true | 冻结数量                                                                    |
cost_open  |  decimal |  true | 开仓均价                                                                 |
cost_hold | decimal  |  true | 持仓均价                                                                  |
profit_unreal | decimal  | true  | 未实现盈亏                                                             |
profit_rate | decimal  | true  | 收益率                                                                |
profit |  decimal |  true | 收益                                                                      |
position_margin |  decimal |  true | 持仓保证金                                                          |
lever_rate | int | true | 杠杆倍数                                                                    |
direction | string  | true  | 仓位方向  "buy":买，即多仓  "sell":卖，即空仓                                |
last_price | decimal  | true  | 最新价                                                                 |
\</positions\>                  |              |          |                            |
\</data\>               |              |          |                            |

## 母子账户划转

- POST `/api/v1/contract_master_sub_transfer`

> Request:

```json
{
	"sub_uid": "123456789",
	"symbol": "BTC",
	"amount": "123",
	"type": "master_to_sub"
}
```

### 请求参数

| 参数名称   | 是否必须  | 类型     | 描述   | 取值范围    |
| ------ | ----- | ------ | ---- | ---------------------------- |
| sub_uid | true | long | 子账号uid	 |  |
| symbol | true | string | 品种代码 | 支持大小写,"BTC","ETH"... |
| amount | true | decimal | 划转金额 ||
| type | true | string | 划转类型 | 仅支持小写,master_to_sub：母账户划转到子账户， sub_to_master：子账户划转到母账户 |
| client_order_id | false | long | 客户自己填写和维护的订单号 | 必须为数字,请注意必须小于等于9223372036854775807 |

### 备注：
 - 母账户与每个子账户相互划转限频10次/分钟。
 - client_order_id仅在8小时内有效，即8小时内同一个用户同一个划转路径无法使用相同的client_order_id进行二次划转（比如母账户发起母转子，使用client_order_id=1，则8小时内无法继续使用client_order_id=1进行母转子；但是可以用client_order_id=1进行子转母。）。

> Response:

```json

{
    "status": "ok",
    "data": {
        "order_id": "772874532490125313"
    },
    "ts": 1604309247876
}

```

### 返回参数

| 参数名称          | 是否必须 | 类型      | 描述              | 取值范围                                     |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | 请求处理结果          | "ok" , "error"                           |
| ts            | true | long    | 响应生成时间点，单位：毫秒   |                                          |
| \<data\>      | true     |  object        |      |   |
| order_id        | true | string  | 划转订单ID            |  |
| client_order_id | false | long | 用户下单时填写的客户端订单ID，没填则不返回	| 
| \</data\>     |      |         |         |   |

## 获取母账户下的所有母子账户划转记录

- POST `/api/v1/contract_master_sub_transfer_record`


### 请求参数

| 参数名称   | 是否必须  | 类型     | 描述   | 取值范围      |
| ------ | ----- | ------ | ---- | ---------------------------- |
| symbol | true | string | 品种代码 | 支持大小写, "BTC","ETH"... |
| transfer_type | false | string | 划转类型，不填查询全部类型,【查询多类型中间用，隔开】 | 34:转出到子账号合约账户 35:从子账号合约账户转入  |
| create_date | true | int | 日期 | 可随意输入正整数，如果参数超过90则默认查询90天的数据 |
| page_index | false | int | 页码，不填默认第1页 |  |
| page_size | false | int | 不填默认20，不得多于50 | [1-50] |

> Response:

```json

{
    "status": "ok",
    "data": {
        "total_page": 1,
        "current_page": 1,
        "total_size": 2,
        "transfer_record": [
            {
                "id": 3657499070,
                "symbol": "ADA",
                "transfer_type": 34,
                "amount": -1,
                "ts": 1604309247860,
                "sub_uid": "123456789",
                "sub_account_name": "tom"
            },
            {
                "id": 3657420904,
                "symbol": "ADA",
                "transfer_type": 34,
                "amount": -50,
                "ts": 1604301623314,
                "sub_uid": "123456789",
                "sub_account_name": "tom"
            }
        ]
    },
    "ts": 1604309883224
}
```

### 返回参数

| 参数名称          | 是否必须 | 类型      | 描述  | 取值范围 |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | 请求处理结果          | "ok" , "error"                           |
| ts            | true | long    | 响应生成时间点，单位：毫秒   |                                          |
| \<data\>      | true     |  object        |      |   |
| \<transfer_record\>      | true     |  object array      |      |   |
| id        | true | long  | 划转订单ID            |  |
| ts        | true | long  | 创建时间            |  |
| symbol        | true | string  | 品种代码  |"BTC","ETH"...  |
| sub_uid        | true | string  | 子账户UID            |  |
| sub_account_name        | true | string  | 子账户登录名            |  |
| transfer_type        | true | int  | 划转类型            | 从子账号合约账户转入：35，转出到子账号合约账户:34 |
| amount        | true | decimal  | 金额            |  |
| \</transfer_record\>     |      |         |         |   |
| total_page        | true | int  | 总页数            |  |
| current_page        | true | int  | 当前页            |  |
| total_size        | true | int  | 总条数            |  |
| \</data\>     |      |         |         |   |


## 获取用户的API指标禁用信息

- GET `/api/v1/contract_api_trading_status`


### 请求参数
 
 无
### Response:

| 参数名称          | 是否必须 | 类型      | 描述  | 取值范围 |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | 请求处理结果          | "ok" , "error"                           |
| ts            | true | long    | 响应生成时间点，单位：毫秒   |                                          |
| \<data\>      | true     |  array object        |      |   |
| is_disable        | true | long  | 是否被禁用ID            | 1：被禁用中，0：没有被禁用 |
| order_price_types        | true | string  | 触发禁用的订单价格类型，多个订单价格类型以英文逗号分割，例如：“limit,post_only,FOK,IOC”          |  |
| disable_reason        | true | string  | 触发禁用的原因，表示当前的禁用是由哪个指标触发  | "COR":撤单率（Cancel Order Ratio），“TDN”：总禁用次数（Total Disable Number）  |
| disable_interval        | true | long  | 禁用时间间隔，单位：毫秒            |  |
| recovery_time        | true | long  | 计划恢复时间，单位：毫秒            |  |
| \<COR>       | true | dict object  | 表示撤单率的指标（Cancel Order Ratio） |
| orders_threshold        | true | long  | 委托单笔数的阈值            |  |
| orders        | true | long  | 用户委托单笔数的实际值           |  |
| invalid_cancel_orders        | true | long  | 用户委托单中的无效撤单笔数           |  |
| cancel_ratio_threshold        | true | decimal  | 撤单率的阈值            |  |
| cancel_ratio        | true | decimal  | 用户撤单率的实际值           |  |
| is_trigger        | true | int  | 用户是否触发该指标           | 	1：已经触发，0：没有触发 |
| is_active        | true | int  | 该指标是否开启          | 1：已启用，0：未启用
| \</COR>       |  |   |  |
| \<TDN>       | true | dict object  | 表示总禁用次数的指标（Total Disable Number）|
| disables_threshold        | true | long  | 总禁用次数的阈值         |  |
| disables        | true | long  | 总禁用次数的实际值         |  | 
| is_trigger        | true | long  | 用户是否触发该指标           | 	1：已经触发，0：没有触发 |
| is_active        | true | long  | 该指标是否开启          | 1：已启用，0：未启用
| \</TDN>       |  |   |  |
| \</data\>     |      |         |         |   |

 > 例子：
 
 ```json
  {
  "status": "ok",
  "data":
  [{
      "is_disable": 1,   //是否被禁用
      "order_price_types": "limit,post_only,FOK,IOC",  // 触发禁用的订单价格类型
      "disable_reason":"COR",  // 触发禁用的原因
      "disable_interval": 5,  // 禁用时间间隔
      "recovery_time": 1, // 计划恢复时间
      "COR":  //撤单率的指标（Cancel Order Ratio）
       {
           "orders_threshold": 150,  //委托单笔数的阈值
           "orders": 150,  //用户委托单笔数的实际值
           "invalid_cancel_orders": 150,  //委托单中的无效撤单笔数 
           "cancel_ratio_threshold": 0.98,   //撤单率的阈值
           "cancel_ratio": 0.98,   //用户撤单率的实际值
           "is_trigger": 1,  //用户是否触发该指标
           "is_active": 1   //该指标是否开启
      } ,
      "TDN":  //总禁用次数的指标（Total  Disable Number）
       {
           "disables_threshold": 3,  //总禁用次数的阈值
           "disables": 3,  //总禁用次数的实际值
           "is_trigger": 1,  //用户是否触发该指标
           "is_active": 1   //该指标是否开启
      } 
   }],
 "ts": 158797866555
}


 ```

## 查询用户可用杠杆倍数

- POST `/api/v1/contract_available_level_rate`


### 请求参数
 
| 参数名称          | 是否必须 | 类型      | 描述  | 取值范围 |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| symbol        | false | string  | 品种代码（大小写不敏感，均支持），不填默认返回所有品种的实际可用杠杆倍数 | 比如"BTC","ETH"

### Response:

| 参数名称          | 是否必须 | 类型      | 描述  | 取值范围 |
| ------------- | ---- | ------- | --------------- | ---------------------------------------- |
| status        | true | string  | 请求处理结果          | "ok" , "error"                           |
| ts            | true | long    | 响应生成时间点，单位：毫秒   |                                          |
| \<data\>      | true     |  array object        |      |   |
| symbol        | true | string  | 品种            | 比如 "BTC" |
| available_level_rate  | true | string  | 实际可用杠杆倍数，多个以英文逗号隔开            | 比如 "1,5,10" |
| \</data\>     |      |         |         |   |

> 回复例子:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "ADA",
            "available_level_rate": "1,2,3,5,10,20,30,50,75"
        }
    ],
    "ts": 1604312615051
}
```

# 合约交易接口

## 合约下单 

###  示例

- POST  `/api/v1/contract_order`

>  Request:

```json
{
    "contract_code": "bch210326",
    "direction": "buy",
    "offset":"open",
    "price":360,
    "lever_rate":75,
    "volume": 1,
    "order_price_type":"opponent",
    "tp_trigger_price": 450,
    "tp_order_price": 450,
    "tp_order_price_type": "optimal_5",
    "sl_trigger_price": 330,
    "sl_order_price": 330,
    "sl_order_price_type": "optimal_5"
}
```

###  请求参数

参数名  |  参数类型    |  必填   |  描述  |
-------------------- |  -------------- |  ----------  | ---------------------------------------------------------------  |
symbol  |    string  |    false  | 支持大小写,"BTC","ETH"...  |
contract_type  |  string  |    false  | 合约类型 ("this_week":当周 "next_week":下周 "quarter":当季 "next_quarter":次季)  |
contract_code  |  string  |    false  |  BTC180914  |
client_order_id |   long  |  false  |  客户自己填写和维护，必须为数字,请注意必须小于等于9223372036854775807  |
price  |  decimal  |   false  |  价格  |
volume  |    long  |  true  |  委托数量(张)  |
direction  |  string  |    true  |  "buy":买 "sell":卖  |
offset  |    string  |    true  |  "open":开 "close":平  |
lever_rate  |  int  | true  |  杠杆倍数[“开仓”若有10倍多单，就不能再下20倍多单, "平仓"可以不填杠杆倍数;首次使用高倍杠杆(>20倍)，请使用主账号登录web端同意高倍杠杆协议后，才能使用接口下高倍杠杆(>20倍)]  |
order_price_type |  string  |    true  |  订单报价类型 "limit":限价，"opponent":对手价 ，"post_only":只做maker单,post only下单只受用户持仓数量限制,"optimal_5"：最优5档，"optimal_10"：最优10档，"optimal_20"：最优20档，"ioc":IOC订单，"fok"：FOK订单, "opponent_ioc"： 对手价-IOC下单，"optimal_5_ioc"：最优5档-IOC下单，"optimal_10_ioc"：最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单,"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |
tp_trigger_price          | decimal | false | 止盈触发价格                  |                            |
tp_order_price   | decimal | false | 	止盈委托价格（最优N档委托类型时无需填写价格）                  |  |
tp_order_price_type   | string | false | 止盈委托类型  不填默认为limit; 限价：limit ，最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20            |
sl_trigger_price          | decimal | false | 止损触发价格                  |                            |
sl_order_price   | decimal  | false | 	止损委托价格（最优N档委托类型时无需填写价格）                  |  |
sl_order_price_type   | string  | false | 止损委托类型  不填默认为limit; 限价：limit ，最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20            |


###  备注

如果contract_code填了值，那就按照contract_code去下单，如果contract_code没有填值，则按照symbol+contract_type去下单。

对手价下单price价格参数不用传，对手价下单价格是买一和卖一价,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档下单price价格参数不用传，"limit":限价，"post_only":只做maker单 需要传价格，"fok"：全部成交或立即取消，"ioc":立即成交并取消剩余。

Post only(也叫maker only订单，只下maker单)每个周期合约的开仓/平仓的下单数量限制为500000，同时也会受到用户持仓数量限制。

若存在持仓，那么下单时杠杆倍数必须与持仓杠杆相同，否则下单失败。若需使用新杠杆下单，则必须先使用切换杠杆接口将持仓杠杆切换成功后再下单。

只有开仓订单才支持设置止盈止损。

止盈触发价格为设置止盈单必填字段，止损触发价格为设置止损单必填字段；若缺省触发价格字段则不会设置对应的止盈单或止损单。

###   开平方向

开多：买入开多(direction用buy、offset用open)

平多：卖出平多(direction用sell、offset用close)

开空：卖出开空(direction用sell、offset用open)

平空：买入平空(direction用buy、offset用close)

> Response:

```json

{
    "status": "ok",
    "data": {
        "order_id": 773119326353580033,
        "order_id_str": "773119326353580033"
    },
    "ts": 1604367611267
}
```

###  返回参数

参数名称  |   是否必须   |  类型   |  描述  |  取值范围  |
------------------- | -------------- | ---------- | -------------------------------------------- | ---------------- |
status  |   true  |  string  |  请求处理结果  |  "ok" , "error"  |
\<data\> |     |    |    |    |
order_id  |  true  |  long  |  订单ID  |    | 
order_id_str  |  true  |  string  |  string类型订单ID  |    | 
client_order_id  | true  |  int |  用户下单时填写的客户端订单ID，没填则不返回  | 
\</data\> |     |    |    |    |
ts  |  true  |  long  |  响应生成时间点，单位：毫秒  |    |   

### 备注

order_id返回是18位，nodejs和javascript默认解析18有问题，nodejs和javascript里面JSON.parse默认是int，超过18位的数字用json-bigint的包解析。

## 合约批量下单 

- POST  `/api/v1/contract_batchorder`

>  Request:

```json
{
    "orders_data": [
        {
            "contract_code": "bch210326",
            "direction": "buy",
            "offset": "open",
            "price": 360,
            "lever_rate": 75,
            "volume": 1,
            "order_price_type": "opponent",
            "tp_trigger_price": 450,
            "tp_order_price": 450,
            "tp_order_price_type": "optimal_5",
            "sl_trigger_price": 330,
            "sl_order_price": 330,
            "sl_order_price_type": "optimal_5"
        },
        {
            "contract_code": "bch210326",
            "direction": "buy",
            "offset": "open",
            "price": 360,
            "lever_rate": 75,
            "volume": 1,
            "order_price_type": "post_only",
            "tp_trigger_price": 450,
            "tp_order_price": 450,
            "tp_order_price_type": "optimal_5",
            "sl_trigger_price": 330,
            "sl_order_price": 330,
            "sl_order_price_type": "optimal_5"
        }
    ]
}
```

###  请求参数

参数名  |    参数类型   |  必填   |  描述  |
---------------------------------- | -------------- |  ---------- | -------------------------------------------------------------- |
 orders_data  | List\<Object\>   |  一次最多10个订单  |    |  

### orders_data参数对象详情：

参数名  |    参数类型   |  必填   |  描述  |
---------------------------------- | -------------- |  ---------- | -------------------------------------------------------------- |
symbol  |   string  |    false  | 支持大小写,"BTC","ETH"...  |
contract_type  |  string  |    false  | 合约类型: "this_week":当周 "next_week":下周 "quarter":当季 "next_quarter":次季  |
contract_code  |  string  |    false  | BTC180914  |
client_order_id  |  long  |  false  |  客户自己填写和维护，必须为数字,请注意必须小于等于9223372036854775807   |
price  |  decimal  |   false  |  价格  |
volume  |  long  |  true  |  委托数量(张)  |
direction  |  string  |    true  |  "buy":买 "sell":卖  |
offset  |  string  |    true  |  "open":开 "close":平  |
leverRate  |   int  | true  |  杠杆倍数[“开仓”若有10倍多单，就不能再下20倍多单;首次使用高倍杠杆(>20倍)，请使用主账号登录web端同意高倍杠杆协议后，才能使用接口下高倍杠杆(>20倍)]  |
orderPriceType |  string  |    true  |  订单报价类型 "limit":限价，"opponent":对手价 ，"post_only":只做maker单,post only下单只受用户持仓数量限制,"optimal_5"：最优5档，"optimal_10"：最优10档，"optimal_20"：最优20档，"ioc":IOC订单，"fok"：FOK订单,"opponent_ioc"： 对手价-IOC下单，"optimal_5_ioc"：最优5档-IOC下单，"optimal_10_ioc"：最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单,"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单  |
tp_trigger_price          | decimal | false | 止盈触发价格                  |                            |
tp_order_price   | decimal | false | 	止盈委托价格（最优N档委托类型时无需填写价格）                  |  |
tp_order_price_type   | string | false | 止盈委托类型  不填默认为limit; 限价：limit ，最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20            |
sl_trigger_price          | decimal | false | 止损触发价格                  |                            |
sl_order_price   | decimal  | false | 	止损委托价格（最优N档委托类型时无需填写价格）                  |  |
sl_order_price_type   | string  | false | 止损委托类型  不填默认为limit; 限价：limit ，最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20            |

###  备注

如果contract_code填了值，那就按照contract_code去下单，如果contract_code没有填值，则按照symbol+contract_type去下单。

对手价下单price价格参数不用传，对手价下单价格是买一和卖一价,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档下单price价格参数不用传，"limit":限价，"post_only":只做maker单 需要传价格，"fok"：全部成交或立即取消，"ioc":立即成交并取消剩余。

若存在持仓，那么下单时杠杆倍数必须与持仓杠杆相同，否则下单失败。若需使用新杠杆下单，则必须先使用切换杠杆接口将持仓杠杆切换成功后再下单。

只有开仓订单才支持设置止盈止损。

止盈触发价格为设置止盈单必填字段，止损触发价格为设置止损单必填字段；若缺省触发价格字段则不会设置对应的止盈单或止损单。

请注意：一次最多允许10个订单。

> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "index": 1,
                "err_code": 1037,
                "err_msg": "The leverage is invalid. Please contact the customer service."
            }
        ],
        "success": [
            {
                "order_id": 773120304138219520,
                "index": 2,
                "order_id_str": "773120304138219520"
            }
        ]
    },
    "ts": 1604367844388
}
```

###  返回参数

参数名称  |  是否必须   |  类型   |  描述  |  取值范围  |
----------------------------- | -------------- | ---------- | -------------------------------------------- | ---------------- |
status  |   true  |  string  |  请求处理结果  | "ok" , "error"  |
\<data\>          |    |    |    |     |
\<errors\>  |    |    |    |     |
index  |    true  |  int  |   订单索引  |    |
err_code  |  true  |  int  |   错误码  |    |
err_msg  | true  |  string  |  错误信息  |    |
\</errors\>  |    |    |    |     |
\<success\>  |    |    |    |     |
index  |    true  |  int  |   订单索引  |    |
order_id  |  true  |  long  |  订单ID  |    | 
order_id_str  |  true  |  string  |  订单ID  |    | 
client_order_id  |  true  |  long  |  用户下单时填写的客户端订单ID，没填则不返回  | 
\</success\>  |    |    |    |    |
\</data\>  |    |    |    |    |
ts  |  true  |  long  |  响应生成时间点，单位：毫秒  |

### 备注

order_id返回是18位，nodejs和javascript默认解析18有问题，nodejs和javascript里面JSON.parse默认是int，超过18位的数字用json-bigint的包解析。

## 撤销订单 

###  示例

- POST `/api/v1/contract_cancel`

>  Request:

```json
{
    "order_id":"634696656176029696,634693443368525824",
    "symbol":"btc"
}
```

###  请求参数

参数名称  |   是否必须   |  类型   |  描述  |
------------------- | -------------- | ---------- | -------------------------------------------------------------- |
order_id         |  false (请看备注)  |  string  |  订单ID(多个订单ID中间以","分隔,一次最多允许撤消10个订单)  |
client_order_id  |  false (请看备注)  |  string  |  客户订单ID(多个订单ID中间以","分隔,一次最多允许撤消10个订单)  |
symbol  |   true  |  string  |  支持大小写,"BTC","ETH"...  |

#### 备注：

 - order_id和client_order_id都可以用来撤单，至少要填写一个,同时只可以设置其中一种，如果设置了两种，默认以order_id来撤单。

 - 撤单接口返回结果只代表撤单命令发送成功，建议根据订单查询接口查询订单的状态来确定订单是否已真正撤销。

 - client_order_id，24小时有效，超过24小时的订单根据client_order_id将查询不到。

> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "order_id": "769206471845261312",
                "err_code": 1061,
                "err_msg": "This order doesnt exist."
            }
        ],
        "successes": "773120304138219520"
    },
    "ts": 1604367997451
} 
```

###  返回参数

参数名称  |  是否必须  |  类型  |  描述  |  取值范围  |
---------------------------- | -------------- | ---------- | -------------------------------------------------- | ---------------- |
status  |  true  |  string  |  请求处理结果  | "ok" , "error"  | 
\<data\>  |    |    |    |    |  
\<errors\>  |    |    |    |    |  
order_id  |    true  |  string  |  订单ID  |    |   
err_code  |   true  |  int  |   错误码  |    |   
err_msg  |  true  |  string  |  错误信息  |    | 
\</errors\>  |    |    |    |    |
successes  |   true  |  string  |  撤销成功的订单的order_id或client_order_id列表  |   |
\</data\>  |    |    |    |    |
ts  |  true  |  long  |  响应生成时间点，单位：毫秒  |   |


## 全部撤单 

###  示例

- POST  `/api/v1/contract_cancelall`

>  Request:

```json
{
    "symbol":"btc",
    "contract_code":"btc200925",
    "contract_type":"quarter"
}
```

###  请求参数

参数名称    |  是否必须    |  类型    |  描述  |
-------------- | -------------- | ---------- | ---------------------------- |
symbol  |    true  |  string   |  品种代码，支持大小写，如"BTC","ETH"...  |
contract_code  |    false  |  string  |  合约code  |
contract_type  |    false  |  string  |  合约类型  |
direction | false  | string | 买卖方向（不填默认全部）  "buy":买 "sell":卖 |
offset | false  | string | 开平方向（不填默认全部）"open":开 "close":平  |

### 备注 
 - 只传symbol，撤销该品种下所有周期的合约
 - 只要有contract_code，则撤销该code的合约
 - 只传symbol+contract_type， 则撤销二者拼接所成的合约订单
 - direction与offset可只填其一，只填其一则按对应的条件去撤单。（如用户只传了direction=buy，则撤销所有买单，包括开仓和平仓）
 
> Response:(多笔订单返回结果(成功订单ID,失败订单ID))
    
```json

{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "773120045672095744,773120045684678656"
    },
    "ts": 1604369127577
}
```

###  返回参数

参数名称  |  是否必须   |  类型  |  描述  |  取值范围  |
---------------------------- | -------------- | ---------- | ---------------------------- | ---------------- |
status  |  true  |  string  |  请求处理结果  | "ok" , "error"  | 
\<data\>  |    |    |    |    |  
\<errors\>  |    |    |    |    |
order_id  |    true  |  string  |  订单id  |   | 
err_code  |    true  |  int  |   订单失败错误码  |   |   
err_msg  |  true  |  string  |   订单失败信息  |    | 
\</errors\>    |    |    |    |    |
successes  |    true  |  string  |  成功的订单  |    |   
\</data\>    |    |    |    |    |
ts  | true  |  long  |  响应生成时间点，单位：毫秒  |   | 

## 切换杠杆

- POST `/api/v1/contract_switch_lever_rate`

#### 备注

- 只有在单个品种下只有持仓，且没有挂单的场景下，才可以切换该品种当前的倍数。

- 接口限制请求次数为每3秒一次。

###  请求参数

| **参数名称**                | **是否必须** | **类型**  | **描述**             | **取值范围**       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | true | string | 品种代码	 | "BTC","ETH"... |
| lever_rate | true | int | 要切换的杠杆倍数。[首次使用高倍杠杆(>20倍)，请使用主账号登录web端同意高倍杠杆协议后，才能使用接口下高倍杠杆(>20倍)] | |

> Response:

```json

正确：

{
    "status": "ok",
    "data": {
        "symbol": "ada",
        "lever_rate": 20
    },
    "ts": 1604369902689
}
错误：

{
    "status": "error",
    "err_code": 1037,
    "err_msg": "The leverage is invalid. Please contact the customer service.",
    "ts": 1604369954194
}
```

### 返回参数

| 参数名称                   | 是否必须 | 类型      | 描述                 | 取值范围                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | 响应状态: ok,error            |                                          |
| \<data\> | false     |  object      |                    |                                          |
| symbol               | false | string    |  品种代码      |                                          |
| lever_rate               | false | int    | 切换成功后的杠杆倍数      |                                          |
| \</data\>            |      |         |                    |                                          |
| err_code | false | int | 错误码| |
| err_msg| false| string | 错误信息| |
| ts                     | true | long    | 时间戳                |   


## 获取合约订单信息

###  示例

- POST  `/api/v1/contract_order_info`

###  请求参数

>  Request:

```json
{
    "order_id":"773119326353580033,634693443368525824",
    "symbol":"btc"
}
```

参数名称  |    是否必须    |  类型    |  描述  |
------------------- | -------------- | ---------- | ------------------------------------------------------------- |
order_id  |  false（请看备注）  |  string  |  订单ID(多个订单ID中间以","分隔,一次最多允许查询50个订单)  |
client_order_id   |  false（请看备注） |  string  |  客户订单ID(多个订单ID中间以","分隔,一次最多允许查询50个订单)  |
symbol  |   true  |  string  |  支持大小写，"BTC","ETH"...  |

###  备注：

- 最多只能查询 4 小时内的撤单信息。

- order_id和client_order_id至少要填写一个。

- order_id和client_order_id都可以用来查询，同时只可以设置其中一种，如果设置了两种，默认以order_id来查询。每天结算或周五交割后，会把结束状态的订单（5部分成交已撤单 6全部成交 7已撤单）删除掉。

- client_order_id，24小时有效，超过24小时的订单根据client_order_id将查询不到。

> Response:

```json

{
    "status": "ok",
    "data": [
        {
            "symbol": "ADA",
            "contract_code": "ADA201225",
            "contract_type": "quarter",
            "volume": 1,
            "price": 0.0933,
            "order_price_type": "post_only",
            "order_type": 1,
            "direction": "sell",
            "offset": "open",
            "lever_rate": 10,
            "order_id": 773119326353580033,
            "client_order_id": null,
            "created_at": 1604367611263,
            "trade_volume": 1,
            "trade_turnover": 10,
            "fee": -0.021436227224008574,
            "trade_avg_price": 0.0933,
            "margin_frozen": 0,
            "profit": 0,
            "status": 6,
            "order_source": "api",
            "order_id_str": "773119326353580033",
            "fee_asset": "ADA",
            "liquidation_type": "0",
            "canceled_at": 0,
            "is_tpsl": 0,
            "real_profit": 0
        }
    ],
    "ts": 1604370179844
}
```

###  返回数据

  参数名称  |    是否必须   |  类型   |  描述  |  取值范围  |
-------------------------- | -------------- | ---------- | --------------------------------------------------------------------------------------------  | ---------------------------------------------------- |
status  |  true  |  string  |  请求处理结果  |  "ok" , "error"  |
\<data\>  |    |    |    |    | 
symbol  |  true  |  string  |  品种代码  |    |  
contract_type  |  true  |  string  |  合约类型  |  当周:"this_week", 次周:"next_week", 当季:"quarter",次季:"next_quarter"  |
contract_code  |  true  |  string  |  合约代码  | "BTC180914" ...  |
volume  |  true  |  decimal    |  委托数量  |    | 
price   |  true  |  decimal    |  委托价格  |    | 
order_price_type  |    true  |  string  |  订单报价类型  | 订单报价类型 订单报价类型 "limit":限价，"opponent":对手价 ，"post_only":只做maker单,post only下单只受用户持仓数量限制,"optimal_5"：最优5档，"optimal_10"：最优10档，"optimal_20"：最优20档，"ioc":IOC订单，"fok"：FOK订单,  |  
direction  |  true  |  string  |  买卖方向  |  "buy":买 "sell":卖  |
offset  |  true  |  string  |  开平方向 |  "open":开 "close":平  |
lever_rate  |  true  |  int  |   杠杆倍数  |  1\\5\\10\\20  |
order_id  |  true  |  long  |  订单ID  |    | 
order_id_str  |  true  |  string  |  String类型订单ID  |    | 
client_order_id  |  true  |  long  |  客户订单ID  |    |  
created_at  |  true  |  long  |  创建时间  |    |
canceled_at  |  true  |  long  |  撤单时间  |    |
trade_volume    |  true  |  decimal  |    成交数量  |    |
trade_turnover  |  true  |  decimal  |   成交总金额  |    |    
fee  |   true  |  decimal  |     手续费  |     |   
trade_avg_price  |  true  |  decimal  |    成交均价  |    | 
margin_frozen    |  true  |  decimal  |    冻结保证金  |     |   
profit  |  true  |  decimal  |  平仓盈亏（使用持仓均价计算，不包含仓位跨结算的已实现盈亏。）  |    |
status  |  true  |  int  |   订单状态  |  (1准备提交 2准备提交 3已提交 4部分成交 5部分成交已撤单 6全部成交 7已撤单 11撤单中)  |  
order_type    |  true  |  int  |  订单类型  |    1:报单 、 2:撤单 、 3:强平、4:交割              |
order_source  |  true  |  string  |  订单来源  |  （system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发、tpsl:止盈止损触发） |   
fee_asset  |  true  |  string  |  手续费币种  |  （"BTC","ETH"...） |   
liquidation_type | true | string     | 强平类型  |  0:非强平类型，1：多空轧差， 2:部分接管，3：全部接管       |                                          |
is_tpsl | true | int     | 是否设置止盈止损  | 1：是；0：否      |   
real_profit | true | decimal | 真实收益（使用开仓均价计算，包含仓位跨结算的已实现盈亏。）  |  |                                     |
\</data\>  |    |    |    |    |
ts  |    true  |  long  |  时间戳  |  |   

#### 备注：
 - 真实收益为开仓均价和成交价计算得出（订单的真实收益为订单下每笔成交的真实收益之和）。
 - 只有在2021年1月30日0点后创建的订单，真实收益（real_profit）字段才会有值。存量数据均为0。

## 获取订单明细信息

###  示例

- POST `/api/v1/contract_order_detail`

>  Request:

```json
{
    "created_at":1593765713010,
    "order_id":727181510507044864,
    "order_type":1,
    "page_index":1,
    "page_size":20,
    "symbol":"BTC"
}
```

###  请求参数

参数名称    |  是否必须     |  类型    |  描述  |
-------------- | -------------- | ---------- | ------------------------ |
symbol  |    true  |  string  |  支持大小写,"BTC","ETH"...  |
order_id  | true  |  long  |   订单id  |
created_at  |  false  |  long  |   下单时间戳  |
order_type  |  false  |  int  |   订单类型，1:报单 、 2:撤单 、 3:强平、4:交割  |
page_index  |    false  |  int  |   第几页,不填第一页  |
page_size  |  false  |  int  |   不填默认20,不得多于50  |

### 备注

获取订单明细接口查询撤单数据时，如果传“created_at”和“order_type”参数则能查询最近6小时数据，如果不传“created_at”和“order_type”参数只能查询到最近2小时数据。

order_id返回是18位，nodejs和javascript默认解析18有问题，nodejs和javascript里面JSON.parse默认是int，超过18位的数字用json-bigint的包解析。

created_at使用13位long类型时间戳（包含毫秒时间），如果输入准确的时间戳，查询性能将会提升。例如:"2019/10/18 10:26:22"转换为时间戳为：1571365582123。也可以直接从contract_order下单接口返回的ts中获取时间戳查询对应的订单。

created_at禁止传0。

> Response:

```json

{
    "status": "ok",
    "data": {
        "symbol": "ADA",
        "contract_code": "ADA201225",
        "contract_type": "quarter",
        "instrument_price": 0,
        "final_interest": 0,
        "adjust_value": 0,
        "lever_rate": 10,
        "direction": "sell",
        "offset": "open",
        "volume": 1,
        "price": 0.0933,
        "created_at": 1604367611263,
        "canceled_at": 0,
        "order_source": "api",
        "order_price_type": "post_only",
        "margin_frozen": 0,
        "profit": 0,
        "trades": [
            {
                "trade_id": 113887800667,
                "trade_price": 0.0933,
                "trade_volume": 1,
                "trade_turnover": 10,
                "trade_fee": -0.021436227224008574,
                "created_at": 1604368087894,
                "role": "maker",
                "real_profit": 0,
                "profit": 0,
                "id": "113887800667-773119326353580033-1"
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1,
        "liquidation_type": "0",
        "fee_asset": "ADA",
        "order_id": 773119326353580033,
        "order_id_str": "773119326353580033",
        "client_order_id": null,
        "order_type": "1",
        "status": 6,
        "trade_avg_price": 0.0933,
        "trade_turnover": 10,
        "trade_volume": 1,
        "is_tpsl": 0,
        "real_profit": 0,
        "fee": -0.021436227224008574
    },
    "ts": 1604370259827
}
```

###  返回数据

参数名称  |  是否必须   |  类型   |  描述  |  取值范围  |
----------------------------- | -------------- | ---------- | --------------------------------------------- | ------------------------------------------------------ |
status  |   true  |  string  |  请求处理结果  | "ok" , "error"  |
\<data\>  |    |    |    |    | 
symbol  |   true  |  string  |  品种代码  |    | 
contract_type  |  true  |  string  |  合约类型  |  当周:"this_week", 次周:"next_week", 当季:"quarter",次季:"next_quarter"  |
contract_code  |  true  |  string  |  合约代码  |  "BTC180914" ...  |
lever_rate  |   true  |  int  |   杠杆倍数  |  1,5,10,20  |
direction  |  true  |  string  |  买卖方向  | "buy":买 "sell":卖 |  
offset  |     true  |  string  | 开平方向 |  "open":开 "close":平  |
volume  |     true  |  decimal    |  委托数量  |    | 
price  |      true  |  decimal    |  委托价格  |    | 
created_at  |   true  |  long    |    创建时间  |    |
canceled_at | true | long |  撤单时间   |      |
order_source  | true  |  string  |  订单来源  | （system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发、tpsl:止盈止损触发）  | 
order_price_type  | true  |  string  |  订单报价类型  |  订单报价类型 "limit":限价，"opponent":对手价 ，"post_only":只做maker单,post only下单只受用户持仓数量限制,"optimal_5"：最优5档，"optimal_10"：最优10档，"optimal_20"：最优20档，"ioc":IOC订单，"fok"：FOK订单,   |  
margin_frozen  |  true  |  decimal    |  冻结保证金  |    |    
profit  |   true  |  decimal    |  订单总平仓盈亏（使用持仓均价计算，不包含仓位跨结算的已实现盈亏。）  |     |
total_page  |   true  |  int  |   总共页数  |    |
current_page  | true  |  int  |   当前页数  |    | 
total_size  |   true  |  int  |   总条数  |    |   
instrument_price  |   true  |  decimal  |   爆仓单合约价格  |    |   
final_interest  |   true  |  decimal  |   爆仓时合约权益  |    |   
adjust_value  |   true  |  decimal  |   爆仓时调整系数  |    |  
fee_asset  |  true  |  string  |  手续费币种  |  （"BTC","ETH"...） |  
liquidation_type   | true | string     | 强平类型 | 0:非强平类型，1：多空轧差， 2:部分接管，3：全部接管       |                                          |
order_id  |  true  |  long  |  订单ID  |    | 
order_id_str  |  true  |  string  |  String类型订单ID  |    | 
client_order_id  |  true  |  long  |  客户订单ID  |    |  
trade_volume    |  true  |  decimal  |    成交数量  |    |
trade_turnover  |  true  |  decimal  |   成交总金额  |    |    
fee  |   true  |  decimal  |     手续费  |     |   
trade_avg_price  |  true  |  decimal  |    成交均价  |    | 
status  |  true  |  int  |   订单状态  |  (1准备提交 2准备提交 3已提交 4部分成交 5部分成交已撤单 6全部成交 7已撤单 11撤单中)  |  
order_type    |  true  |  int  |  订单类型  |    1:报单 、 2:撤单 、 3:强平、4:交割              |
is_tpsl    |  true  |  int  |  是否设置止盈止损  |    1：是；0：否            |
real_profit | true | decimal | 订单总真实收益（使用开仓均价计算，包含仓位跨结算的已实现盈亏。）  |  |
\<trades\>   |    |    |    |    | 
id               | true     | string    | 全局唯一的交易标识               |              |
trade_id  |  true  |  long  | 与api/v1/contract_matchresults返回结果中的match_id一样，是撮合结果id， 非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id    |    |    
trade_price  |  true  |  decimal  |  撮合价格  |    |
trade_volume  | true  |  decimal  |  成交量  |    |  
trade_turnover  |    true  |  decimal  |  成交金额  |    | 
trade_fee  |   true  |  decimal  |  成交手续费  |    |    
role  |   true  |  string  |  taker或maker  |   | 
created_at  |   true  |  long  |  创建时间  |    | 
real_profit | true | decimal | 该笔成交的真实收益（使用开仓均价计算，包含仓位跨结算的已实现盈亏。）  |  |
profit  |   true  |  decimal    |  该笔成交的平仓盈亏（使用持仓均价计算，不包含仓位跨结算的已实现盈亏。）  |     |
\</trades\>  |    |    |    |    |   
\</data\>  |    |     |    |    |
ts  |  true  |  long  |  时间戳  |     |

#### 备注：
 - 真实收益为开仓均价和成交价计算得出（订单的真实收益为订单下每笔成交的真实收益之和）。
 - 只有在2021年1月30日0点后创建的订单以及对应的成交，真实收益字段（real_profit）才会有值。存量数据均为0。

## 获取合约当前未成交委托 

###  示例

- POST `/api/v1/contract_openorders`  

###  请求参数

  参数名称   |  是否必须    |  类型    |  描述  |  默认值    |  取值范围  |
-------------- | -------------- | ---------- | ------------------------ | ------------ | ---------------- |
symbol  |    true  |  string  |  品种代码  |     | 支持大小写, "BTC","ETH"...  |
page_index   |  false  |  int  |   页码，不填默认第1页  |  1  |     | 
page_size  |  false  |  int  |   不填默认20，不得多于50 | 20 | [1-50]   |
sort_by  | false | string    |  排序字段，不填默认按创建时间倒序  |   created_at     | “created_at”(按照创建时间倒序)，“update_time”(按照更新时间倒序)   |
trade_type  | false | int    |  交易类型，不填默认查询全部    |  0    | 0:全部,1:买入 开多,2: 卖出开空,3: 买入平空,4: 卖出平多。   |
> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "ADA",
                "contract_code": "ADA201225",
                "contract_type": "quarter",
                "volume": 1,
                "price": 0.0925,
                "order_price_type": "post_only",
                "order_type": 1,
                "direction": "buy",
                "offset": "close",
                "lever_rate": 20,
                "order_id": 773131315209248768,
                "client_order_id": null,
                "created_at": 1604370469629,
                "trade_volume": 0,
                "trade_turnover": 0,
                "fee": 0,
                "trade_avg_price": null,
                "margin_frozen": 0,
                "profit": 0,
                "status": 3,
                "order_source": "web",
                "order_id_str": "773131315209248768",
                "fee_asset": "ADA",
                "liquidation_type": null,
                "canceled_at": null,
                "is_tpsl": 0,
                "update_time": 1606975980467,
                "real_profit": 0
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1
    },
    "ts": 1604370488518
}
```

###  返回参数

参数名称  |   是否必须  |  类型   |  描述  |   取值范围  |
-------------------------- | -------------- | ---------- | --------------------------------------------------------------- | ------------------------------------------------------ |
status  |  true  |  string  |  请求处理结果  |    |
\<data\>   |    |    |    |    |   
\<orders\>  |    |    |    |    |  
symbol  |  true  |  string  |  品种代码  |    |  
contract_type  |  true  |  string  |  合约类型  |  当周:"this_week", 次周:"next_week", 当季:"quarter",次季:"next_quarter"  |
contract_code  |  true  |  string  |  合约代码  |  "BTC180914" ...  |
volume  |  true  |  decimal    |  委托数量  |    |
price   |  true  |  decimal    |  委托价格  |    |   
order_price_type  |    true  |  string  |  订单报价类型 |  "limit":限价，"opponent":对手价 ，"post_only":只做maker单,post only下单只受用户持仓数量限制  |
order_type  |  true  |  int  |   订单类型  | 1:报单 、 2:撤单 、 3:强平、4:交割  |
direction  |  true  |  string  |  买卖方向  |  "buy":买 "sell":卖  |   
offset  |  true  |  string  |  开平方向  | "open":开 "close":平   |  
lever_rate  |  true  |  int  |   杠杆倍数  |   1,5,10,20  |
order_id  |  true  |  long  |  订单ID  |    |
order_id_str  |  true  |  string  |  String订单ID  |    |
client_order_id  |  true  |  long  |  客户订单ID  |    |
created_at  |  true  |  long  |  订单创建时间  |    |
trade_volume  |   true  |  decimal    |  成交数量  |    |  
trade_turnover  | true  |  decimal    |  成交总金额  |     | 
fee  |   true  |  decimal    |  手续费  |    |
trade_avg_price  |  true |  decimal    |  成交均价  |    |  
margin_frozen  |  true  |  decimal    |  冻结保证金  |    | 
profit  |  true  |  decimal   | 平仓盈亏（使用持仓均价计算，不包含仓位跨结算的已实现盈亏。） |    |  
is_tpsl  |  true  |  int   | 是否设置止盈止损  | 1：是；0：否   |  
status  |  true  |  int  |   订单状态  |  (3未成交， 4部分成交， 5部分成交已撤单， 6全部成交， 7已撤单)  |  
order_source|   true  |  string  |  订单来源| （system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发、tpsl:止盈止损触发） |
fee_asset  |  true  |  string  |  手续费币种  |  （"BTC","ETH"...） |  
update_time | true | Long | 订单更新时间，单位：毫秒  | |
real_profit | true | decimal | 真实收益（使用开仓均价计算，包含仓位跨结算的已实现盈亏。）  |  |
\</orders\>  |    |    |    |    |
total_page  |  true  |  int  |   总页数  |    |
current_page  |   true  |  int  |   当前页  |    |
total_size  |  true  |  int  |   总条数  |    |
\</data\>  |    |    |    |    |
ts  |    true  |  long  |  时间戳  |    |

#### 备注：
 - 真实收益为开仓均价和成交价计算得出（订单的真实收益为订单下每笔成交的真实收益之和）。
 - 只有在2021年1月30日0点后创建的订单，真实收益（real_profit）字段才会有值。存量数据均为0。

## 获取合约历史委托

###  示例

- POST `/api/v1/contract_hisorders` 

> Request:

```json
{
    "symbol": "BTC",
    "trade_type": 0,
    "type": 1,
    "status": "0,3,4,5",
    "create_date": 1,
    "page_index": 1,
    "page_size": 20,
    "contract_code": "BTC180914",
    "order_type": "limit"
}

```

###  请求参数

参数名称   |  是否必须   |  类型    |  描述  |  默认值    |  取值范围  |
-------------- | -------------- | ---------- |------------------------ | ------------ | ------------------------------------------------------------------------------------------------------ |
symbol  |    true  |  string  |  品种代码  | |  支持大小写,"BTC","ETH"...  |
trade_type  |   true  |  int  |   交易类型  |  |   0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多,5: 卖出强平,6: 买入强平,7:交割平多,8: 交割平空, 11:减仓平多，12:减仓平空  |
type  |  true  |  int  |   类型  |  | 1:所有订单,2:结束状态的订单  |
status  |    true  |  string  |   订单状态  |  | 可查询多个状态，"3,4,5" , 0:全部,3:未成交, 4: 部分成交,5: 部分成交已撤单,6: 全部成交,7:已撤单  |
create_date |  true  |  int  |   日期  |  |  可随意输入正整数, ，如果参数超过90则默认查询90天的数据|
page_index  |  false  |  int  |  页码，不填默认第1页  |  1  | 
page_size  |  false  |  int   |  每页条数，不填默认20,不得多于50  |  20  | [1-50]  |
contract_code  |  false  |  string   |  合约代码  |    |   |
order_type  |  false  |  string  |   订单类型  |    | 1：限价单、3：对手价、4：闪电平仓、5：计划委托、6：post_only、7：最优5档、8：最优10档、9：最优20档、10：fok、11：ioc |
sort_by | false  | string | 排序字段（降序），不填默认按照create_date降序 | create_date |  "create_date"：按订单创建时间进行降序，"update_time"：按订单更新时间进行降序|

### 备注

- 所有已撤销且无成交的API限价订单记录只保留最近2小时。


> Response:

```json
 
{
    "status": "ok",
    "data": {
        "orders": [
            {
                "order_id": 773131315209248768,
                "contract_code": "ADA201225",
                "symbol": "ADA",
                "lever_rate": 20,
                "direction": "buy",
                "offset": "close",
                "volume": 1,
                "price": 0.0925,
                "create_date": 1604370469629,
                "update_time": 1604370469629,
                "order_source": "web",
                "order_price_type": 6,
                "order_type": 1,
                "margin_frozen": 0,
                "profit": 0,
                "contract_type": "quarter",
                "trade_volume": 0,
                "trade_turnover": 0,
                "fee": 0,
                "trade_avg_price": 0,
                "status": 3,
                "order_id_str": "773131315209248768",
                "fee_asset": "ADA",
                "liquidation_type": "0",
                "is_tpsl": "0",
                "real_profit": 0
            }
        ],
        "total_page": 19,
        "current_page": 1,
        "total_size": 19
    },
    "ts": 1604370617322
}
```

###  返回参数

参数名称  |  是否必须   |  类型    |  描述  |  取值范围  |
---------------------------- | -------------- | ---------- | --------------------------------------------- | ------------------------------------------------------ |
status  <img width=250/> |  true <img width=250/> |  string  |  请求处理结果 <img width=1000/> |    |  
\<data\>  |    |    |    |    | 
\<orders\>  |    |    |    |    | 
order_id  |    true  |  long  |  订单ID  |  
order_id_str  |    true  |  string  |  String类型订单ID  |  
symbol  |  true  |  string  |  品种代码  |
contract_type  |    true  |  string  |  合约类型  | 当周:"this_week", 次周:"next_week", 当季:"quarter", 次季:"next_quarter"  |
contract_code  |    true  |  string  |  合约代码  | "BTC180914" ...  |
lever_rate  |  true  |  int  |   杠杆倍数  |  1,5,10,20  |
direction  |    true  |  string  | 买卖方向 |  "buy":买 "sell":卖  |  
offset  |  true  |  string  |  开平方向  |  "open":开 "close":平  |
volume  |  true  |  decimal    |  委托数量  |    |
price  |   true  |  decimal    |  委托价格  |    | 
create_date   |  true  |  long    |  创建时间  |    | 
update_time   |  true  |  long    |  订单的更新时间  |    | 
order_source  |  true  |  string  |  订单来源  | （system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发、tpsl:止盈止损触发） | 
order_price_type  |  true  |  int  |  订单报价类型 |  1：限价单（limit），2：市价单（market），3：对手价（opponent），4：闪电平仓（lightning），5：计划委托（trigger），6：post_only ，7：最优5档（optimal_5） ，8：最优10档（optimal_10） ，9：最优20档（optimal_20），10：FOK ，11：IOC ，12：对手价_IOC（opponent_ioc），13：闪电平仓_IOC（lightning_ioc），14：最优5档_IOC（optimal_5_ioc），15：最优10档_IOC（optimal_10_ioc），16：最优20档_IOC（optimal_20_ioc），17：对手价_FOK（opponent_fok），18：闪电平仓_FOK（lightning_fok），19：最优5档_FOK（optimal_5_fok），40：最优10档_FOK（optimal_10_fok），41：最优20档_FOK（optimal_20_fok）。 |  
margin_frozen  |    true  |  decimal    |  冻结保证金  |    |    
profit  |  true  |  decimal    |  平仓盈亏（使用持仓均价计算，不包含仓位跨结算的已实现盈亏。）  |    |
trade_volume  |  true  |  decimal    |  成交数量  |    | 
trade_turnover  |   true  |decimal    |  成交总金额  |    |    
fee  |  true  |  decimal    |  手续费  |    |   
trade_avg_price  | true  |  decimal    |  成交均价  |    | 
status  |  true  |  int  |   订单状态  | 3:未成交, 4: 部分成交,5: 部分成交已撤单,6: 全部成交,7:已撤单   | 
order_type  |  true  |  int  |   订单类型  |  1:报单 、 2:撤单 、 3:强平、4:交割  |
fee_asset  |  true  |  string  |  手续费币种  |  （"BTC","ETH"...） |  
liquidation_type  | true | string     | 强平类型 |  0:非强平类型，1：多空轧差， 2:部分接管，3：全部接管       |   |
is_tpsl  | true | int     | 是否设置止盈止损 |  1：是；0：否       |   |
real_profit | true | decimal | 真实收益（使用开仓均价计算，包含仓位跨结算的已实现盈亏。）  |  |
\</orders\>  |    |    |     |     |  
total_page    |  true  |  int  |   总页数  |   |   
current_page  |  true  |  int  |   当前页  |   |   
total_size  |  true  |  int  |   总条数  |    |  
\</data\>|    |    |     |     |
ts  |  true  |  long  |  时间戳  |    |

#### 备注：
 - 真实收益为开仓均价和成交价计算得出（订单的真实收益为订单下每笔成交的真实收益之和）。
 - 只有在2021年1月30日0点后创建的订单，真实收益（real_profit）字段才会有值。存量数据均为0。
 - order_id返回是18位，nodejs和javascript默认解析18有问题，nodejs和javascript里面JSON.parse默认是int，超过18位的数字用json-bigint的包解析。

## 组合查询合约历史委托

 - POST `/api/v1/contract_hisorders_exact`
 
###  请求参数

| 参数名称        | 是否必须  | 类型     | 描述              | 取值范围   |
| ----------- | ----- | ----------- | ---------------------------------------- | ------ |
| symbol  <img width=250/>  | true <img width=250/> | string | 品种代码  <img width=1000/>   | "BTC","ETH"...                           |
| trade_type  | true  | int    | 交易类型        | 0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多,5: 卖出强平,6: 买入强平,7:交割平多,8: 交割平空, 11:减仓平多，12:减仓平空 |
| type        | true  | int    | 类型          | 1:所有订单,2:结束状态的订单                         |
| status      | true  | string    | 订单状态        | 可查询多个状态，"3,4,5" , 0:全部,3:未成交, 4: 部分成交,5: 部分成交已撤单,6: 全部成交,7:已撤单 |
| contract_code      | false  | string    | 合约代码      |  |
| order_price_type      | false  | string    |   订单报价类型        | 订单报价类型 "limit":限价，"opponent":对手价 ，"post_only":只做maker单,post only下单只受用户持仓数量限制,"optimal_5"：最优5档，"optimal_10"：最优10档，"optimal_20"：最优20档，"ioc":IOC订单，"fok"：FOK订单, "opponent_ioc"： 对手价-IOC下单，"optimal_5_ioc"：最优5档-IOC下单，"optimal_10_ioc"：最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单,"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |
| start_time   | false  | long    | 起始时间（时间戳，单位毫秒）        | 详见备注    |
| end_time   | false  | long    | 结束时间（时间戳，单位毫秒）        |  详见备注   |
| from_id    | false | long    | 查询起始id（取返回数据的query_id字段）	   |                     |
| size     | false | int    | 数据条数，默认取20，最大50    |   [1-50]           |
| direct     | false | string    |  查询方向   |   prev 向前；next 向后；默认值取prev                          |

#### 备注：

- 所有已撤销且无成交的API限价订单记录只保留最近2小时。
- 起始与结束时间取值说明：
   - start_time：取值范围为[(当前时间 - 90天)，当前时间] ；默认值取clamp（end_time - 10天，当前时间-90天，当前时间-10天），即时间最远取当前时间-90天，最近取当前时间-10天。
   - end_time：取值范围为：[(当前时间 - 90天)，above++)]，若大于当前时间则直接取当前时间；若填写了start_time，则end_time必须大于start_time。默认值直接取当前时间。
- 当from_id缺省时，查询方向为prev则从结束时间往前查，查询方向为向后则从起始时间往后查；即查询创建时间大于等于起始时间，且小于等于结束时间的历史委托数据。
- 无论查询方向是向前还是向后，返回的数据都是按query_id倒序。
- 当start_time或end_time填写值不符合取值范围，则报错参数不合法。
- 仅支持查询90天内数据。

#### 查询案例如下（特殊错误情况未罗列）如当前时间为"2020-07-31"：

| start_time | end_time | from_id  | size | direct | 查询结果 |
|-----|------|-----|-----|-----|-----|
| 缺省，取10天前（2020-07-21） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | prev | 查询最近10天的数据，从当前时间开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取60天前（2020-06-01） | 50天前（2020-06-11） | 缺省 | 20条 | prev | 查询60天前到50天前之间的数据，从50天前开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 5天前（2020-07-26） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | prev | 查询最近5天的数据，从当前时间开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 20天前（2020-07-11） | 10天前（2020-07-21） | 缺省 | 20条 | prev | 查询20天前到10天前之间的数据，从10天前开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取10天前（2020-07-21） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | next | 查询最近10天的数据，从10天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取60天前（2020-06-01） | 50天前（2020-06-11） | 缺省 | 20条 | next | 查询60天前到50天前之间的数据，从60天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 5天前（2020-07-26） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | next | 查询最近5天的数据，从5天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 20天前（2020-07-11） | 10天前 （2020-07-21）| 缺省 | 20条 | next | 查询20天前到10天前之间的数据，从20天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取10天前（2020-07-21） | 缺省，取当前时间 （2020-07-31）|  1000  | 20条 | prev | 查询最近10天的数据，从成交id为1000的数据开始往前查20条更旧的数据，成交id为1000的数据排在第一条，越新的数据排在越前    |
| 20天前 （2020-07-11）| 10天前 （2020-07-21） | 1000 | 20条 | next | 查询20天前到10天前之间的数据，从成交id为1000的数据开始往后查20条更新的数据，成交id为1000的数据排在最后一条，越新的数据排在越前       |

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "query_id": 113957564277,
                "order_id": 773135295142658048,
                "contract_code": "ADA201225",
                "symbol": "ADA",
                "lever_rate": 20,
                "direction": "buy",
                "offset": "open",
                "volume": 1,
                "price": 0.092,
                "create_date": 1604371418518,
                "order_source": "web",
                "order_price_type": "post_only",
                "order_type": 1,
                "margin_frozen": 0,
                "profit": 0,
                "contract_type": "quarter",
                "trade_volume": 1,
                "trade_turnover": 10,
                "fee": -0.021739130434782608,
                "trade_avg_price": 0.092,
                "status": 6,
                "order_id_str": "773135295142658048",
                "fee_asset": "ADA",
                "liquidation_type": "0",
                "is_tpsl": 0,
                "real_profit": 0
            }
        ],
        "remain_size": 19,
        "next_id": 113956362239
    },
    "ts": 1604371805794
}
```
###  返回参数

| 参数名称                   | 是否必须 | 类型      | 描述     | 取值范围                                     |
| ---------------------- | ---- | ------- | ------ | ---------------------------------------- |
| status    <img width=250/>       | true <img width=250/> | string  | 请求处理结果 <img width=1000/> |                                          |
| \<data\>| true     |   object      |        |     |
| \<orders\> |  true    |  object array       |        |     |
| query_id               | true | long    | 查询id，可作为下一次查询请求的from_id字段   |                                          |
| order_id               | true | long    | 订单ID   |                                          |
| order_id_str             | true | string    | string格式的订单ID                                     |      |
| symbol                 | true | string  | 品种代码   |                                          |
| contract_type          | true | string  | 合约类型   | 当周:"this_week", 次周:"next_week", 当季:"quarter"，次季度：“next_quarter” |
| contract_code          | true | string  | 合约代码   | "BTC180914" ...                          |
| lever_rate             | true | int     | 杠杆倍数   |                   |
| direction              | true | string  | 买卖方向   | "buy":买 "sell":卖                         |
| offset                 | true | string  | 开平方向   | "open":开 "close":平                       |
| volume                 | true | decimal | 委托数量   |                                          |
| price                  | true | decimal | 委托价格   |                                          |
| create_date            | true | long    | 创建时间   |                                          |
| order_source           | true | string  | 订单来源   | （system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发、tpsl:止盈止损触发）  |
| order_price_type      | true  | string    |   订单报价类型        | 订单报价类型 "limit":限价，"opponent":对手价 ，"post_only":只做maker单,post only下单只受用户持仓数量限制,"optimal_5"：最优5档，"optimal_10"：最优10档，"optimal_20"：最优20档，"ioc":IOC订单，"fok"：FOK订单, "opponent_ioc"： 对手价-IOC下单，"optimal_5_ioc"：最优5档-IOC下单，"optimal_10_ioc"：最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单,"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |
| margin_frozen          | true | decimal | 冻结保证金  |                                          |
| profit                 | true | decimal | 平仓盈亏（使用持仓均价计算，不包含仓位跨结算的已实现盈亏。）     |                                          |
| trade_volume           | true | decimal | 成交数量   |                                          |
| trade_turnover         | true | decimal | 成交总金额  |                                          |
| fee                    | true | decimal | 手续费    |                                          |
| trade_avg_price        | true | decimal | 成交均价   |                                          |
| status                 | true | int     | 订单状态   |     1准备提交 2准备提交 3已提交 4部分成交 5部分成交已撤单 6全部成交 7已撤单 11撤单中                                     |
| order_type             | true | int     | 订单类型   | 1:报单 、 2:撤单 、 3:强平、4:交割                  |
| fee_asset         | true | string  | 手续费币种       |  （"BTC","ETH"...）      |
| liquidation_type              | true | string     | 强平类型        |  0:非强平类型，1：多空轧差， 2:部分接管，3：全部接管 |
| is_tpsl              | true | int     | 是否设置止盈止损   | 1：是；0：否  |
| real_profit | true | decimal | 真实收益（使用开仓均价计算，包含仓位跨结算的已实现盈亏。）  |  |
| \</orders\>     |      |         |        |                          |
| remain_size           | true | int  | 剩余数据条数（在时间范围内，因受到数据条数限制而未查询到的数据条数）   |                                          |
| next_id           | true | long     | 下一条数据的query_id（仅在查询结果超过数据条数限制时才有值）            |                                          |
| \</data\>            |      |         |        |                                          |
| ts                     | true | long    | 时间戳    |                                          |

#### 备注：
 - 真实收益为开仓均价和成交价计算得出（订单的真实收益为订单下每笔成交的真实收益之和）。
 - 只有在2021年1月30日0点后创建的订单，真实收益（real_profit）字段才会有值。存量数据均为0。
 - 当查询结果超过数据条数限制时，next_id为下一条数据的query_id（查询方向为prev时，next_id为下一页查询的第一条数据；查询方向为next时，next_id为下一页查询的最后一条数据）


## 获取历史成交记录

### 实例

- POST `/api/v1/contract_matchresults`

>  Request:

```json
{
    "symbol":"btc",
    "trade_type":0,
    "create_date":20,
    "contract_code":"btc200925",
    "page_index":1,
    "page_size":20
}
```

### 请求参数

 参数名称    | 是否必须 | 类型 |  描述        |  默认值 | 取值范围                             |
 ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
 symbol      | true     | string | 品种代码          |         | 支持大小写,"BTC","ETH"...                           |
 trade_type  | true     | int    | 交易类型          |         | 0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多,5: 卖出强平,6: 买入强平 |
 create_date | true     | int    | 日期            |         | 可随意输入正整数，如果参数超过90则默认查询90天的数据                            |
 contract_code      | false     | string | 合约code          |         |                          |
 page_index  | false    | int    | 页码，不填默认第1页    |        |                                          |
 page_size   | false    | int    | 不填默认20，不得多于50 | 20      |       [1-50]                             |

> Response: 

```json

{
    "status": "ok",
    "data": {
        "trades": [
            {
                "match_id": 113891764710,
                "order_id": 773135295142658048,
                "symbol": "ADA",
                "contract_type": "quarter",
                "contract_code": "ADA201225",
                "direction": "buy",
                "offset": "open",
                "trade_volume": 1,
                "trade_price": 0.092,
                "trade_turnover": 10,
                "trade_fee": -0.021739130434782608,
                "offset_profitloss": 0,
                "create_date": 1604371703183,
                "role": "Maker",
                "order_source": "web",
                "order_id_str": "773135295142658048",
                "fee_asset": "ADA",
                "real_profit": 0,
                "id": "113891764710-773135295142658048-1"
            }
        ],
        "total_page": 16,
        "current_page": 1,
        "total_size": 16
    },
    "ts": 1604371918571
}                                             
```    

### 返回参数
 
 参数名称              |  是否必须 |  类型  |  描述             |  取值范围     |
 ---------------------- | -------- | ------- | ------------------ | ------------ |
 status    <img width=250/>      | true <img width=250/>    | string  | 请求处理结果 <img width=1000/>            |              |
 \<data\>  |          |         |                    |              |
 \<trades\>  |          |         |                    |              |
 id               | true     | string    | 全局唯一的交易标识               |              |
 match_id               | true     | long    | 撮合结果id, 与订单ws推送orders.$symbol以及撮合订单ws推送matchOrders.$symbol推送结果中的trade_id是相同的，非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id             |              |
 order_id               | true     | long    | 订单ID               |              |
 order_id_str               | true     | string    | String类型订单ID               |              |
 symbol                 | true     | string  | 品种代码               |              |
 order_source           | true     | string  | 订单来源    | （system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发、tpsl:止盈止损触发）  |
 contract_type          | true     | string  | 合约类型               | 当周:"this_week", 次周:"next_week", 当季:"quarter", 次季:"next_quarter" |
 contract_code          | true     | string  | 合约代码               |  "BTC180914" ...       |
 direction              | true     | string  | "buy":买 "sell":卖         |              |
 offset                 | true     | string  | "open":开 "close":平           |              |
 trade_volume           | true     | decimal | 累计成交数量               |              |
 trade_price                  | true     | decimal | 成交价格               |              |
 trade_turnover                  | true     | decimal | 本笔成交金额               |              |
 create_date            | true     | long    | 成交时间               |              |
 offset_profitloss                 | true     | decimal | 平仓盈亏（使用持仓均价计算，不包含仓位跨结算的已实现盈亏。）                 |              |
 trade_fee                    | true     | decimal | 成交手续费                |              |
 role                   |   true    |       string  |  taker或maker  |         |
 fee_asset  |  true  |  string  |  手续费币种  |  （"BTC","ETH"...） | 
 real_profit | true | decimal | 真实收益（使用开仓均价计算，包含仓位跨结算的已实现盈亏。）  |  |
 \</trades\>              |          |         |                    |              |
 total_page             | true     | int     | 总页数                |              |
 current_page           | true     | int     | 当前页                |              |
 total_size             | true     | int     | 总条数                |              |
 \</data\>            |          |         |                    |              |
 ts                     | true     | long    | 时间戳                |              |

### 备注
 - 真实收益为开仓均价和成交价计算得出（订单的真实收益为订单下每笔成交的真实收益之和）。
 - 只有在2021年1月30日0点后创建的订单对应的成交，真实收益字段（real_profit）才会有值。存量数据均为0。
 - order_id返回是18位，nodejs和javascript默认解析18有问题，nodejs和javascript里面JSON.parse默认是int，超过18位的数字用json-bigint的包解析。


## 组合查询历史成交记录接口

 - POST `/api/v1/contract_matchresults_exact`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol        | true  | string | 品种代码          | "BTC","ETH"...                           |
| trade_type    | true  | int    | 交易类型        | 0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多,5: 卖出强平,6: 买入强平 |
| contract_code | false  | string | 合约code     |                                          |
| start_time   | false  | long    | 起始时间（时间戳，单位毫秒）        | 详见备注    |
| end_time   | false  | long    | 结束时间（时间戳，单位毫秒）        |  详见备注   |
| from_id    | false | long    | 查询起始id（取返回数据的query_id字段）    |                     |
| size     | false | int    | 数据条数,默认取20，最大50     |       [1-50]             |
| direct     | false | string    |  查询方向   |   prev 向前；next 向后；默认值取prev                          |

#### 备注：
- 起始与结束时间取值说明：
   - start_time：取值范围为[(当前时间 - 90天)，当前时间] ；默认值取clamp（end_time - 10天，当前时间-90天，当前时间-10天），即时间最远取当前时间-90天，最近取当前时间-10天。
   - end_time：取值范围为：[(当前时间 - 90天)，above++)]，若大于当前时间则直接取当前时间；若填写了start_time，则end_time必须大于start_time。默认值直接取当前时间。
- 当from_id缺省时，查询方向为prev则从结束时间往前查，查询方向为向后则从起始时间往后查；即查询成交时间大于等于起始时间，且小于等于结束时间的成交数据。
- 无论查询方向是向前还是向后，返回的数据都是按query_id倒序。
- 当start_time或end_time填写值不符合取值范围，则报错参数不合法。
- 仅支持查询90天内数据。

#### 查询案例如下（特殊错误情况未罗列）如当前时间为"2020-07-31"：
| start_time | end_time | from_id  | size | direct | 查询结果 |
|-----|------|-----|-----|-----|-----|
| 缺省，取10天前（2020-07-21） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | prev | 查询最近10天的数据，从当前时间开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取60天前（2020-06-01） | 50天前（2020-06-11） | 缺省 | 20条 | prev | 查询60天前到50天前之间的数据，从50天前开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 5天前（2020-07-26） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | prev | 查询最近5天的数据，从当前时间开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 20天前（2020-07-11） | 10天前（2020-07-21） | 缺省 | 20条 | prev | 查询20天前到10天前之间的数据，从10天前开始往前查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取10天前（2020-07-21） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | next | 查询最近10天的数据，从10天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取60天前（2020-06-01） | 50天前（2020-06-11） | 缺省 | 20条 | next | 查询60天前到50天前之间的数据，从60天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 5天前（2020-07-26） | 缺省，取当前时间（2020-07-31） | 缺省 | 20条 | next | 查询最近5天的数据，从5天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 20天前（2020-07-11） | 10天前 （2020-07-21）| 缺省 | 20条 | next | 查询20天前到10天前之间的数据，从20天前开始往后查20条数据，返回数据按创建时间倒序，越新的数据排在越前    |
| 缺省，取10天前（2020-07-21） | 缺省，取当前时间 （2020-07-31）|  1000  | 20条 | prev | 查询最近10天的数据，从成交id为1000的数据开始往前查20条更旧的数据，成交id为1000的数据排在第一条，越新的数据排在越前    |
| 20天前 （2020-07-11）| 10天前 （2020-07-21） | 1000 | 20条 | next | 查询20天前到10天前之间的数据，从成交id为1000的数据开始往后查20条更新的数据，成交id为1000的数据排在最后一条，越新的数据排在越前       |

> Response: 

```json

{
    "status": "ok",
    "data": {
        "trades": [
            {
                "query_id": 2424420723,
                "match_id": 113891764710,
                "order_id": 773135295142658048,
                "symbol": "ADA",
                "contract_type": "quarter",
                "contract_code": "ADA201225",
                "direction": "buy",
                "offset": "open",
                "trade_volume": 1,
                "trade_price": 0.092,
                "trade_turnover": 10,
                "trade_fee": -0.021739130434782608,
                "offset_profitloss": 0,
                "create_date": 1604371703183,
                "role": "Maker",
                "order_source": "web",
                "order_id_str": "773135295142658048",
                "fee_asset": "ADA",
                "real_profit": 0,
                "id": "113891764710-773135295142658048-1"
            }
        ],
        "remain_size": 15,
        "next_id": 2424413094
    },
    "ts": 1604372202243
}                 
```
### 返回参数

| 参数名称                   | 是否必须 | 类型      | 描述                 | 取值范围                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | 请求处理结果             |                                          |
| \<data\> | true     |  object      |                    |                                          |
| \<trades\> | true     |  object  array     |                    |                                          |
| id               | true | string    | 全局唯一的交易标识       |   |
| query_id               | true | long    |  查询id，可作为下一次查询请求的from_id字段      |                                          |
| match_id               | true | long    | 撮合结果id, 与订单ws推送orders.$symbol以及撮合订单ws推送matchOrders.$symbol推送结果中的trade_id是相同的，非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id      |                                          |
| order_id               | true | long    | 订单ID               |                                          |
| order_id_str           | true | string    | string格式的订单ID               |       |
| symbol                 | true | string  | 品种代码               |                                          |
| contract_type          | true | string  | 合约类型               | 当周:"this_week", 次周:"next_week", 当季:"quarter"，次季度：“next_quarter” |
| contract_code          | true | string  | 合约代码               | "BTC180914" ...                          |
| direction              | true | string  |  买卖方向  |       "buy":买 "sell":卖                                   |
| offset                 | true | string  | 开平方向 |    "open":开 "close":平          |
| trade_volume           | true | decimal | 成交数量               |                                          |
| trade_price            | true | decimal | 成交价格               |                                          |
| trade_turnover         | true | decimal | 成交总金额              |                                          |
| create_date            | true | long    | 成交时间               |                                          |
| offset_profitloss      | true | decimal | 平仓盈亏（使用持仓均价计算，不包含仓位跨结算的已实现盈亏。）               |                                          |
| trade_fee             | true | decimal | 成交手续费              |                                          |
| role                   | true | string  | taker或maker        |                                          |
| fee_asset         | true | string  | 手续费币种       |  （"BTC","ETH"...）      |
| real_profit | true | decimal | 真实收益（使用开仓均价计算，包含仓位跨结算的已实现盈亏。）  |  |
| order_source           | true | string  | 订单来源   |  （system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发、tpsl:止盈止损触发）   |
| \</trades\>            |      |         |                    |                                          |
| remain_size           | true | int  | 剩余数据条数（在时间范围内，因受到数据条数限制而未查询到的数据条数）   |                                          |
| next_id           | true | long     | 下一条数据的query_id（仅在查询结果超过数据条数限制时才有值）            |                                          |
| \</data\>            |      |         |                    |                                          |
| ts                     | true | long    | 时间戳                |                                          |

#### 备注：
 - 真实收益为开仓均价和成交价计算得出（订单的真实收益为订单下每笔成交的真实收益之和）。
 - 只有在2021年1月30日0点后创建的订单对应的成交，真实收益字段（real_profit）才会有值。存量数据均为0。
 - 当查询结果超过数据条数限制时，next_id为下一条数据的query_id（查询方向为prev时，next_id为下一页查询的第一条数据；查询方向为next时，next_id为下一页查询的最后一条数据）


## 闪电平仓下单

- POST `/api/v1/lightning_close_position`

### 请求参数

   参数名称                |   是否必须  |   类型  |    描述            |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
 symbol | false | string | 品种代码	 | 支持大小写,"BTC","ETH"... |
 contract_type | false | string | 合约类型 | “this_week”:当周，“next_week”:次周，“quarter”:当季, "next_quarter":次季|
 contract_code | false | string | 合约代码 | BTC190903 |
 volume | true | long | 委托数量（张） |  |
 direction | true | string | “buy”:买，“sell”:卖 |  |
 client_order_id | false | long | （API）客户自己填写和维护，必须保持唯一,请注意必须小于等于9223372036854775807  |  |
 order_price_type | false | string | 订单报价类型 |不填，默认为“闪电平仓”，"lightning"：闪电平仓，"lightning_fok"：闪电平仓-FOK,"lightning_ioc"：闪电平仓-IOC |

### 说明

 - 如果contract_code填了值，那就按照contract_code去下单，如果contract_code没有填值，则按照symbol+contract_type去下单。

 - 闪电平仓，是指在对手价平仓的基础上，实行'最优30档'成交，即用户发出的平仓订单能够迅速以30档范围内对手方价格进行成交，未成交部分自动转为限价委托单。

> Response:

```json

{
    "status":"ok",
    "data":{
        "order_id":633766664829804544,
        "order_id_str":"633766664829804544",
        "client_order_id":9086
    },
    "ts":158797866555
}
```


### 返回参数

  参数名称                |   是否必须  |  类型   |  描述            |   取值范围       |
----------------------- | -------- | ------- | ------------------ | -------------- |
status | true | string | 请求处理结果	 | "ok" :成功, "error"：失败 |
ts | true  | long | 响应生成时间点，单位：毫秒 |  |
\<data\> |  |  |  | 字典 |
order_id | true  | long | 订单ID[全局唯一] |  |
order_id_str | true  | string | String类型订单ID |  |
client_order_id | false | long | 用户自己的订单id |  |
\</data\> |  |  |  |  |


> 错误信息：

```json

{
    "status": "error",
    "err_code": 1048,
    "err_msg": "Insufficient close amount available.",
    "ts": 1604372431440
}
```

# 合约策略订单接口

## 合约计划委托下单

- POST `/api/v1/contract_trigger_order`

### 备注

  - 如果contract_code填了值，那就按照contract_code去下单，如果contract_code没有填值，则按照symbol+contract_type去下单；
  
  - optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档下单order_price价格参数不用传，"limit":限价需要传价格。
  
  - 若存在持仓，那么下单时杠杆倍数必须与持仓杠杆相同，否则下单失败。若需使用新杠杆下单，则必须先使用切换杠杆接口将持仓杠杆切换成功后再下单。
  
  - 该接口的限频次数为1秒5次。
   
 >  Request:
 
 ```json

 {
     "contract_code":"btc200925",
     "contract_type":"quarter",
     "direction":"BUY",
     "lever_rate":5,
     "offset":"OPEN",
     "order_price":10000,
     "order_price_type":"limit",
     "symbol":"btc",
     "trigger_price":10000,
     "trigger_type":"ge",
     "volume":1
 }
 ```
 
### 请求参数

|  参数名称                 |   是否必须   |   类型    |    描述              |   取值范围       |
| ----------------------- | -------- | ------- | ------------------ | -------------- |
| symbol | false | string | 品种代码	 | 支持大小写,"BTC","ETH"... |
| contract_type | false | string | 合约类型 | “this_week”:当周，“next_week”:次周，“quarter”:当季, "next_quarter":次季|
| contract_code | false | string | 合约代码 | BTC190903 |
| trigger_type | true | string | 触发类型： ge大于等于(触发价比最新价大)；le小于(触发价比最新价小) |  |
| trigger_price | true | decimal | 触发价，精度超过最小变动单位会报错 |  |
| order_price | true | decimal | 委托价，精度超过最小变动单位会报错 |  |
| order_price_type | false | string | 委托类型： 不填默认为limit; 限价：limit ，最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20 |  |
| volume | true | long | 委托数量(张) |  |
| direction | true | string | buy:买 sell:卖 |  |
| offset | true | string | open:开 close:平 |  |
| lever_rate | true | int | 杠杆倍数[开仓若有10倍多单，就不能再下20倍多单;首次使用高倍杠杆(>20倍)，请使用主账号登录web端同意高倍杠杆协议后，才能使用接口下高倍杠杆(>20倍)] |  |

> 正确的返回:

```json

{
    "status": "ok",
    "data": {
        "order_id": 28312412,
        "order_id_str": "28312412"
    },
    "ts": 1604372634548
}
```


> 错误的返回:

```json

{
    "status": "error",
    "err_code": 1037,
    "err_msg": "The leverage is invalid. Please contact the customer service.",
    "ts": 1605495536623
}
```

### 返回参数

| 属性 | 数据类型 | 是否必填 | 说明
| -----  | -----  | -----  | -----
| status | string | true | 响应状态: ok,error
| err_code | int | false | 错误码
| err_msg | string| false | 错误信息
| \<data\> | list  | false | 返回数据-泛型，支持各种返回的数据格式类型
| order_id | long | true | 订单ID : 全局唯一
| order_id_str | string | true | 字符串类型的订单ID
| \</data\> |  |  |
| ts | long| true | 时间戳 


## 合约计划委托撤单

- POST `/api/v1/contract_trigger_cancel`

### 请求参数

| 属性 | 数据类型 | 是否必填 |  说明  |
| -----  | -----  | -----  | ----- |
|  symbol |  string  |  true  |  支持大小写,BTC,LTC...  |
|  order_id  |  string  |  true  |  用户订单ID（多个订单ID中间以","分隔,一次最多允许撤消10个订单 ）|

#### 备注
 - 该接口的限频次数为1秒5次。

> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [
            {
                "order_id": "28312406",
                "err_code": 1061,
                "err_msg": "This order doesnt exist."
            }
        ],
        "successes": "28312412"
    },
    "ts": 1604372746401
}
```

### 返回参数

| 参数名称              | 是否必须 | 类型 | 描述                  | 取值范围   |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status                     | true         | string   | 请求处理结果               | "ok" , "error" |
| \<data\> |              |          |                            |                |
| \<errors\>  |              |          |                            |                |
| order_id                   | true         | string   | 订单id                     |                |
| err_code                   | true         | int      | 订单失败错误码             |                |
| err_msg                    | true         | string      | 订单失败信息               |                |
| \</errors\>                  |              |          |                            |                |
| successes                  | true         | string   | 成功的订单                 |                |
| \</data\>                  |              |          |                            |                |
| ts                         | true         | long     | 响应生成时间点，单位：毫秒 |  |


## 合约计划委托全部撤单

- POST `/api/v1/contract_trigger_cancelall`

### 请求参数

| 属性 | 数据类型 | 是否必填 |说明
| -----  | -----  |  -----  | ----- |
|  symbol  |  string  |  true  |  支持大小写,BTC、LTC...  |
|  contract_code  |  string  |  false  |  合约代码,"BTC180914" ...  |
|  contract_type  |  string  |  false  |  合约类型	当周:"this_week", 次周:"next_week", 当季:"quarter", 次季:"next_quarter"  |
| direction | string  | false | 买卖方向（不填默认全部） "buy":买 "sell":卖 |
| offset | string  | false | 开平方向（不填默认全部）"open":开 "close":平  |

### 备注

- 只传symbol，撤销该品种下所有周期的合约

- 只要有contract_code，则撤销该code的合约

- 传symbol+contract_type， 则撤销二者拼接所成的合约订单

- direction与offset可只填其一，只填其一则按对应的条件去撤单。（如用户只传了direction=buy，则撤销所有买单，包括开仓和平仓）

- 该接口的限频次数为1秒5次。

> Response:

```json

{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "28312413,28312414"
    },
    "ts": 1604373863946
}

```

### 返回参数

| 参数名称              | 是否必须 | 类型 | 描述                  | 取值范围   |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status                     | true         | string   | 请求处理结果               | "ok" , "error" |
| \<data\> |              |          |                            |                |
| \<errors\>  |              |          |                            |                |
| order_id                   | true         | string   | 订单id                     |                |
| err_code                   | true         | int      | 订单失败错误码             |                |
| err_msg                    | true         | string      | 订单失败信息               |                |
| \</errors\>                  |              |          |                            |                |
| successes                  | true         | string   | 成功的订单                 |                |
| \</data\>                  |              |          |                            |                |
| ts                         | true         | long     | 响应生成时间点，单位：毫秒 |   |


## 获取计划委托当前委托

- POST `/api/v1/contract_trigger_openorders`

### 请求参数

| 属性 | 数据类型 | 是否必填 |说明
| -----  | -----   | -----  | ----- |
|  symbol  |  string  |  true  |  支持大小写,BTC,LTC... |
|  contract_code|  string  |  false  | 支持大小写,合约code  |
|  page_index  |  int   |  false  |  第几页，不填默认第一页  | 
|  page_size   |  int   |  false  |  不填默认20，不得多于50  |
|  trade_type  |  int  | false   |  交易类型，不填默认查询全部 0:全部,1:买入 开多,2: 卖出开空,3: 买入平空,4: 卖出平多。   |

> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "ADA",
                "contract_code": "ADA201225",
                "contract_type": "quarter",
                "trigger_type": "le",
                "volume": 1,
                "order_type": 1,
                "direction": "buy",
                "offset": "open",
                "lever_rate": 20,
                "order_id": 28312415,
                "order_id_str": "28312415",
                "order_source": "api",
                "trigger_price": 0.0895,
                "order_price": 0.0895,
                "created_at": 1604374041289,
                "order_price_type": "limit",
                "status": 2
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 1
    },
    "ts": 1604374215911
}
```

### 返回参数

| 参数名称              | 类型 | 是否必须 | 描述                  | 取值范围   |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status   |  string        |  true  | 请求处理结果               | "ok" , "error" |
| \<data\> |        object       |   true      |                   |                |
| total_page   | int | true | 总页数
| current_page | int | true | 当前页
| total_size   | int | true | 总条数
| \<orders\>  |              |          |                            |                |
| symbol |string| true |合约品种
| contract_code | string | true | 合约代码  |
| contract_type | string | true | 合约类型  |
| trigger_type | string | true | 触发类型 |  `ge`大于等于；`le`小于等于  |
| volume | decimal | true | 委托数量  |
| order_type | int | true | 订单类型 | 1、报单  2、撤单  |
| direction | string | true | 订单方向 |  [买(buy),卖(sell)]  |
| offset | string | true | 开平标志 |  [开(open),平(close)]  |
| lever_rate | int | true | 杠杆倍数 |  1，5，10，20  |
| order_id | int | true | 计划委托单订单ID  |
| order_id_str | string | true | 字符串类型的订单ID   |
| order_source | string | true | 订单来源  | （system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发） |
| trigger_price | decimal | true | 触发价 |
| order_price | decimal | true | 委托价  |
| created_at | long | true | 订单创建时间  |
| order_price_type | string | true | 订单报价类型 |  "limit":限价，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档 |
| status | int | true | 订单状态 | 1:准备提交、2:已提交、3:报单中、8：撤单未找到、9：撤单中、10：失败' |
| \</orders\>                  |              |          |                            |                |
| \</data\> |        |         |                   |                |
| ts   |  long         | true    | 响应生成时间点，单位：毫秒 |   |


## 获取计划委托历史委托

- POST `/api/v1/contract_trigger_hisorders`

### 请求参数

|   参数名称    |   是否必须   |   类型   |   描述               |   默认值   |   取值范围  |
| ------- | ------- | ------- | -------- | ------- | -------- |
| symbol        | true         | string   | 品种代码               |            | 支持大小写,"BTC","ETH"... |
| contract_code | false        | string   | 合约code               |            | EOS190118         |
| trade_type        | true         | int      | 交易类型               |            | 0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多；后台是根据该值转换为offset和direction，然后去查询的； 其他值无法查询出结果 |
| status        | true         | string      | 订单状态               |            | 多个以英文逗号隔开，计划委托单状态：0:全部（表示全部结束状态的订单）、4:已委托、5:委托失败、6:已撤单 |
| create_date   | true         | int      | 日期                   |            | 可随意输入正整数，如果参数超过90则默认查询90天的数据      |
| page_index    | false        | int      | 页码，不填默认第1页    | 1          |   |
| page_size     | false        | int      | 不填默认20，不得多于50 | 20         |  [1-50] |
| sort_by | false  | string | 排序字段（降序），不填默认按照created_at降序 | created_at  |  "created_at"：按订单创建时间进行降序，"update_time"：按订单更新时间进行降序|

### 备注

- 默认查询 已完成订单（type对应状态范围 4、5、6）；


> Response:

```json

{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "ADA",
                "contract_code": "ADA201225",
                "contract_type": "quarter",
                "trigger_type": "le",
                "volume": 1,
                "order_type": 1,
                "direction": "buy",
                "offset": "open",
                "lever_rate": 20,
                "order_id": 28312415,
                "order_id_str": "28312415",
                "relation_order_id": "773147284987842560",
                "order_price_type": "limit",
                "status": 4,
                "order_source": "api",
                "trigger_price": 0.0895,
                "triggered_price": 0.089497,
                "order_price": 0.0895,
                "created_at": 1604374041289,
                "triggered_at": 1604374277082,
                "order_insert_at": 1604374277124,
                "update_time": 1604374277124,
                "canceled_at": 0,
                "fail_code": null,
                "fail_reason": null
            }
        ],
        "total_page": 4,
        "current_page": 1,
        "total_size": 4
    },
    "ts": 1604374349086
}
```

### 返回参数

| 参数名称              | 类型  | 是否必须 | 描述                  | 取值范围   |
| -------------------------- | ------------ | -------- | -------------------------- | -------------- |
| status | string         | true   | 请求处理结果               | "ok" , "error" |
| \<data\> |  object       |  true        |     返回数据                      |                |
| total_page   | int | true | 总页数
| current_page | int | true | 当前页
| total_size   | int | true | 总条数
| \<orders\>  |              |          |                            |                |
| symbol |string| true |合约品种
| contract_code | string | true | 合约代码
| contract_type | string | true | 合约类型
| trigger_type | string | true | 触发类型  |  `ge`大于等于；`le`小于等于
| volume | decimal | true | 委托数量
| order_type | int | true | 订单类型  | 1、报单  2、撤单
| direction | string | true | 订单方向  |  [买(buy),卖(sell)]
| offset | string | true | 开平标志  |  [开(open),平(close)]
| lever_rate | int | true | 杠杆倍数 |   1,5,10,20
| order_id | int | true | 计划委托单订单ID
| order_id_str | string | true | 字符串类型的订单ID 
| relation_order_id | string | true | 该字段为关联限价单的订单id，未触发前数值为-1
| order_price_type | string | true | 订单报价类型  |  "limit":限价，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档
| status | int | true | 订单状态  |  (4:报单成功、5:报单失败、6:已撤单 )
| order_source | string | true | 来源  | （system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发）
| trigger_price | decimal | true | 触发价
| triggered_price | decimal | true | 被触发时的价格
| order_price | decimal | true | 委托价
| created_at | long | true | 订单创建时间
| triggered_at | long | true | 触发时间
| order_insert_at | long | true | 下order单时间
| canceled_at | long | true |撤单时间
| update_time | long | true |订单更新时间，单位：毫秒
| fail_code | int | true | 被触发时下order单失败错误码
| fail_reason | string | true |被触发时下order单失败原因
| \</orders\> |        |      |                            |                |
| \<data\> |   |    |     |
| ts    |  long         |  true   | 响应生成时间点，单位：毫秒 |   |


## 对仓位设置止盈止损订单

 - POST `/api/v1/contract_tpsl_order`

> Request

```json
{
    "contract_code": "BTC210326",
    "direction": "sell",
    "volume": 1,
    "tp_trigger_price": 35000,
    "tp_order_price": 35000,
    "tp_order_price_type": "optimal_5",
    "sl_trigger_price": "29000",
    "sl_order_price": "29000",
    "sl_order_price_type": "optimal_5"
}
```

### 请求参数

| 参数名称            | 是否必须  | 类型     | 描述                    | 取值范围                                     |
| --------------- | ----- | ------ | --------------------- | ---------------------------------------- |
| symbol          | false | string | 品种代码                  | "BTC","ETH"...                           |
| contract_type   | false | string | 合约类型                  | “this_week”:当周，“next_week”:次周，“quarter”:当季，“next_quarter”：次季度 |
| contract_code   | false | string | 合约代码    | BTC190903                                |
| direction | true | string | 买卖方向| buy:买入平空 sell:卖出平多  |
| volume | true | decimal |委托数量(张)|  |
| tp_trigger_price          | false | decimal | 止盈触发价格                  |                            |
| tp_order_price   | false | decimal | 	止盈委托价格（最优N档委托类型时无需填写价格）                  |  |
| tp_order_price_type   | false | string | 止盈委托类型    |    不填默认为limit; 限价：limit ，最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20            |
| sl_trigger_price          | false | decimal | 止损触发价格                  |                            |
| sl_order_price   | false | decimal | 	止损委托价格（最优N档委托类型时无需填写价格）                  |  |
| sl_order_price_type   | false | string | 止损委托类型    |    不填默认为limit; 限价：limit ，最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20            |

### 备注
 - 如果contract_code填了值，那就按照contract_code去下单，如果contract_code没有填值，则按照symbol+contract_type。
 - 止盈触发价格和止损触发价格至少填写一个，当触发价格未填写时则不会下该类型止盈止损单。
 - 止盈止损订单都为平仓单。
 - 该接口的限频次数为1秒5次。


> Response: 

```json
{
    "status": "ok",
    "data": {
        "tp_order": {
            "order_id": 796083080824655872,
            "order_id_str": "796083080824655872"
        },
        "sl_order": {
            "order_id": 796083080824655873,
            "order_id_str": "796083080824655873"
        }
    },
    "ts": 1609842596990
}
```
> Error Response

```json
{
    "status": "error",
    "err_code": 1066,
    "err_msg": "contract_code cannot be empty.",
    "ts": 1604369954194
}
```

### 返回参数

| 参数名称            | 是否必须  | 类型     | 描述                            | 取值范围                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status                     | true         | string   | 请求处理结果               | "ok" , "error" |
| ts |  true  | long | 时间戳 | |
| \<data\> |  false  | object | 成功处理返回的数据，下单失败时不返回  | |
| \<tp_order\>  |  true  | object |   止盈单下单结果   | |
| order_id  |  true  | long | 止盈订单ID   | |
| order_id_str |  true  | string | 止盈订单ID（字符串格式）   | |
| \</tp_order\>  |   | |      | |
| \<sl_order\>  |  true  | object |   止损单下单结果   | |
| order_id  |  true  | long | 止损订单ID   | |
| order_id_str |  true  | string | 止损订单ID（字符串格式）   | |
| \</sl_order\>  |   | |      | |
| \</data\> |   | |  | |
| err_code  |  false  | int | 错误码（下单失败才出现）  | |
| err_msg |  false  | string | 错误信息（下单失败才出现）   | |

#### 备注
 - 只设置了止盈或止损时，则对应返回的sl_order/tp_order则为空。


## 止盈止损订单撤单

 - POST `/api/v1/contract_tpsl_cancel`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol          | true | string | 品种代码                  | "BTC","ETH"...                           |
| order_id | true | string | 止盈止损订单ID（多个订单ID中间以","分隔,一次最多允许撤消10个订单 ）|    |

#### 备注

 - 该接口的限频次数为1秒5次。

> Response: 

```json
{
    "status": "ok",
    "data": {
        "errors": [
            {
                "order_id": "796085144275423232",
                "err_code": 1061,
                "err_msg": "This order doesnt exist."
            }
        ],
        "successes": "796085144275423233"
    },
    "ts": 1609843174529
}
```
### 返回参数

| 参数名称            | 是否必须  | 类型     | 描述                            | 取值范围                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status          | true  | string | 请求处理结果                        | "ok" :成功, "error"：失败 |
| \<data\>        |   true    |   object     |                               | 字典                   |
| \<errors\>        |   true    |   object     |                               | 字典                   |
| order_id        | true  | string | 止盈止损订单ID[全局唯一] |                      |
| err_code              | false  | long   | 错误码                |                      |
| err_msg              | false  | string   | 错误信息               |                      |
| \</errors\>       |       |        |     |  |
| successes              | true  | string   | 成功的订单                 |     |
| \</data\>       |       |        |     |  |
| ts              | true  | long   | 响应生成时间点，单位：毫秒                 |     |


## 止盈止损订单全部撤单

 - POST `/api/v1/contract_tpsl_cancelall`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol          | false | string | 品种代码                  | "BTC","ETH"...                           |
| contract_code | false | string | 合约代码|  "BTC180914" ...  |
| contract_type | false | string | 合约类型 |  当周:"this_week", 周:"next_week", 当季:"quarter"，次季度：“next_quarter”  |
| direction | false  | string | 买卖方向（不填默认全部）  |  "buy":买 "sell":卖 |

#### 备注：
 - 只传symbol，则撤销该品种下该订单类型的所有周期合约的止盈止损订单
 - 只要有contract_code，则撤销该code的合约的止盈止损订单
 - 只传symbol+contract_type， 则撤销二者拼接所成的合约止盈止损订单
 - 该接口的限频次数为1秒5次。

> Response

```json
{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "796083080824655872,796083080824655873,796084255502405632,796084255502405633"
    },
    "ts": 1609843284024
}
```

### 返回参数

| 参数名称                   | 是否必须 | 类型      | 描述                 | 取值范围                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status          | true  | string | 请求处理结果                        | "ok" :成功, "error"：失败 |
| \<data\>        |   true    |   object     |                               | 字典                   |
| \<errors\>        |   true    |   object     |                               | 字典                   |
| order_id        | true  | string | 止盈止损订单ID[全局唯一] |                      |
| err_code              | false  | long   | 错误码                |                      |
| err_msg              | false  | string   | 错误信息               |                      |
| \</errors\>       |       |        |     |  |
| successes              | true  | string   | 成功的订单                 |     |
| \</data\>       |       |        |     |  |
| ts              | true  | long   | 响应生成时间点，单位：毫秒                 |     |


## 查询止盈止损订单当前委托

 - POST `/api/v1/contract_tpsl_openorders`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol          | true | string | 品种代码                  | "BTC","ETH"...                           |
| contract_code | false | string | 合约代码,"BTC180914" ...|    |
| page_index | false | int | 第几页，不填默认第一页|    |
| page_size | false | int | 不填默认20，不得多于50| [1-50]   |
| trade_type  | false | int    |  交易类型，不填默认查询全部         | 0:全部,3: 买入平空,4: 卖出平多。   |

> Response

```json
{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "BTC",
                "contract_code": "BTC210326",
                "contract_type": "quarter",
                "volume": 1,
                "order_type": 1,
                "direction": "sell",
                "order_id": 796097507233927168,
                "order_id_str": "796097507233927168",
                "order_source": "api",
                "trigger_type": "ge",
                "trigger_price": 35000,
                "order_price": 0,
                "created_at": 1609846036501,
                "order_price_type": "optimal_5",
                "status": 2,
                "tpsl_order_type": "tp",
                "source_order_id": null,
                "relation_tpsl_order_id": "796097507233927169"
            }
        ],
        "total_page": 1,
        "current_page": 1,
        "total_size": 2
    },
    "ts": 1609846316344
}
```

### 返回参数

| 参数名称            | 是否必须  | 类型     | 描述                            | 取值范围                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status          | true  | string | 请求处理结果                        | "ok" :成功, "error"：失败 |
| \<data\>        |   true    |   object     |                               | 字典                   |
| total_page        | true | int | 总页数   |                |
| total_size        | true | int | 总条数   |                |
| current_page        | true | int | 当前页   |                |
| \<orders\>        |   true    |   object array    |                               |     |
| symbol                 | true | string  | 品种代码               |                                          |
| contract_type          | true | string  | 合约类型               | 当周:"this_week", 次周:"next_week", 当季:"quarter" ，次季度：“next_quarter” |
| contract_code          | true | string  | 合约代码               | "BTC180914" ...                          |
| volume                 | true | decimal  | 委托数量 |      |
| order_type           | true | int | 订单类型 | 1、报单 2、撤单               |                                         
| tpsl_order_type            | true | string | 止盈止损类型                |           “tp”:止盈单；"sl"：止损单        |
| direction            | true | string | 买卖方向                |           买入平空："buy",卖出平多："sell"         |
| order_id      | true | long | 止盈止损订单ID                |                                          |
| order_id_str             | true | string | 字符串类型的止盈止损订单ID              |                                          |
| order_source      | true | string  | 来源        |                                          |
| order_price	      | true | decimal  |  委托价	       |                                          |
| trigger_type              | true | string  | 触发类型 | ge大于等于；le小于等于  |             
| trigger_price         | true | decimal | 触发价              |                      |
| created_at        | true  | long | 订单创建时间 |                      |
| order_price_type        | true  | string | 订单报价类型  |  限价："limit"， 最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20        |
| status        | true  | int | 订单状态： |     1:未生效、2:等待委托、3:委托中、4:委托成功、5:委托失败、6:已撤单、8：撤单未找到、9：撤单中、10：失败 、11：已失效     |
| source_order_id        | true  | string |  源限价单的订单id（下单设置的止盈止损订单该字段才有值，表示当前止盈止损单由哪个限价单触发的） |       |
| relation_tpsl_order_id        | true  | string |  关联的止盈止损单id（用户同时设置止盈止损单时，该字段才有值，否则数值为-1） |       |
| \</orders\>       |       |        |     |  |
| \</data\>       |       |        |     |  |
| ts              | true  | long   | 响应生成时间点，单位：毫秒                 |     |


## 查询止盈止损订单历史委托

 - POST `/api/v1/contract_tpsl_hisorders`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol          | true | string | 品种代码                  | "BTC","ETH"...                           |
| contract_code | false | string | 合约代码,"BTC180914" ...|    |
| status | true | string | 订单状态| 多个以英文逗号隔开，止盈止损订单状态：0:全部（表示全部结束状态的订单）、4:委托成功、5:委托失败、6:已撤单、11：已失效   |
| create_date | true | long | 日期| 可随意输入正整数，如果参数超过90则默认查询90天的数据   |
| page_index | false | int | 第几页，不填默认第一页|    |
| page_size | false | int | 不填默认20，不得多于50|  [1-50]  |
| sort_by | false  | string | 排序字段（降序），不填默认按照created_at降序 |  "created_at"：按订单创建时间进行降序，"update_time"：按订单更新时间进行降序|

> Response

```json
{
    "status": "ok",
    "data": {
        "orders": [
            {
                "symbol": "BTC",
                "contract_code": "BTC210326",
                "contract_type": "quarter",
                "volume": 1,
                "order_type": 1,
                "tpsl_order_type": "sl",
                "direction": "sell",
                "order_id": 796085144275423233,
                "order_id_str": "796085144275423233",
                "order_source": "api",
                "trigger_type": "le",
                "trigger_price": 29000,
                "order_price": 0,
                "created_at": 1609843088942,
                "order_price_type": "optimal_5",
                "status": 6,
                "source_order_id": null,
                "relation_tpsl_order_id": "796085144275423232",
                "canceled_at": 1609843174692,
                "fail_code": null,
                "fail_reason": null,
                "triggered_price": null,
                "relation_order_id": "-1",
                "update_time": 1609843200693
            }
        ],
        "total_page": 6,
        "current_page": 1,
        "total_size": 6
    },
    "ts": 1609846686146
}

```

### 返回参数

| 参数名称            | 是否必须  | 类型     | 描述                            | 取值范围                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status          | true  | string | 请求处理结果                        | "ok" :成功, "error"：失败 |
| \<data\>        |   true    |   object     |                               | 字典                   |
| total_page        | true | int | 总页数   |                |
| total_size        | true | int | 总条数   |                |
| current_page        | true | int | 当前页   |                |
| \<orders\>        |   true    |   object array    |                               |     |
| symbol                 | true | string  | 品种代码               |                                          |
| contract_type          | true | string  | 合约类型               | 当周:"this_week", 次周:"next_week", 当季:"quarter" ，次季度：“next_quarter” |
| contract_code          | true | string  | 合约代码               | "BTC180914" ...                          |
| volume                 | true | decimal  | 委托数量 |      |
| order_type           | true | int | 订单类型 | 1、报单 2、撤单               |                                          
| tpsl_order_type            | true | string | 止盈止损类型                |           “tp”:止盈单；"sl"：止损单        |
| direction            | true | string | 买卖方向                |           买入平空："buy",卖出平多："sell"         |
| order_id      | true | long | 止盈止损订单ID                |                                          |
| order_id_str             | true | string | 字符串类型的止盈止损订单ID              |                                          |
| order_source      | true | string  | 来源        |                                          |
| order_price         | true | decimal | 委托价              |                      |
| trigger_type              | true | string  | 触发类型    |  ge大于等于；le小于等于  |             
| trigger_price         | true | decimal | 触发价              |                      |
| created_at        | true  | long | 订单创建时间 |                      |
| order_price_type        | true  | string | 订单报价类型  |  限价："limit"， 最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20        |
| status        | true  | int | 订单状态： |     1:未生效、2:等待委托、3:委托中、4:委托成功、5:委托失败、6:已撤单、8：撤单未找到、9：撤单中、10：失败 、11：已失效     |
| source_order_id        | true  | string |  源限价单的订单id（下单设置的止盈止损订单该字段才有值，表示当前止盈止损单由哪个限价单触发的） |       |
| relation_tpsl_order_id        | true  | string |  关联的止盈止损单id（用户同时设置止盈止损单时，该字段才有值，否则数值为-1） |       |
| canceled_at        | true  | long | 撤单时间 |                      |
| fail_code        | true  | int | 被触发时下order单失败错误码 |                      |
| fail_reason        | true  | string | 被触发时下order单失败原因 |                      |
| triggered_price   | true | decimal | 被触发时的价格                |  |
| relation_order_id          | true | string |  该字段为关联限价单的关联字段，未触发前数值为-1	           |                       |
| update_time | true  | long | 订单更新时间，单位：毫秒 |  |
| \</orders\>       |       |        |     |  |
| \</data\>       |       |        |     |  |
| ts              | true  | long   | 响应生成时间点，单位：毫秒                 |     |



## 查询开仓单关联的止盈止损订单详情

 - POST `/api/v1/contract_relation_tpsl_order`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol          | true | string | 品种代码                  | "BTC","ETH"...                           |
| order_id | true | long |  开仓订单ID  |    |

> Response

```json
{
    "status": "ok",
    "data": {
        "symbol": "BTC",
        "contract_code": "BTC210326",
        "contract_type": "quarter",
        "volume": 1,
        "price": 30000,
        "order_price_type": "post_only",
        "direction": "buy",
        "offset": "open",
        "lever_rate": 75,
        "order_id": 796097782841643008,
        "order_id_str": "796097782841643008",
        "client_order_id": null,
        "created_at": 1609846102202,
        "trade_volume": 0,
        "trade_turnover": 0,
        "fee": 0,
        "trade_avg_price": null,
        "margin_frozen": 0.000044444444444444,
        "profit": 0,
        "status": 3,
        "order_type": 1,
        "order_source": "api",
        "fee_asset": "BTC",
        "canceled_at": 0,
        "tpsl_order_info": [
            {
                "volume": 1,
                "direction": "sell",
                "tpsl_order_type": "tp",
                "order_id": 796097782845837312,
                "order_id_str": "796097782845837312",
                "trigger_type": "ge",
                "trigger_price": 31000,
                "order_price": 0,
                "created_at": 1609846102212,
                "order_price_type": "optimal_5",
                "relation_tpsl_order_id": "796097782845837313",
                "status": 1,
                "canceled_at": 0,
                "fail_code": null,
                "fail_reason": null,
                "triggered_price": null,
                "relation_order_id": "-1"
            },
            {
                "volume": 1,
                "direction": "sell",
                "tpsl_order_type": "sl",
                "order_id": 796097782845837313,
                "order_id_str": "796097782845837313",
                "trigger_type": "le",
                "trigger_price": 29100,
                "order_price": 0,
                "created_at": 1609846102212,
                "order_price_type": "optimal_5",
                "relation_tpsl_order_id": "796097782845837312",
                "status": 1,
                "canceled_at": 0,
                "fail_code": null,
                "fail_reason": null,
                "triggered_price": null,
                "relation_order_id": "-1"
            }
        ]
    },
    "ts": 1609847008041
}
```

### 返回参数

| 参数名称            | 是否必须  | 类型     | 描述                            | 取值范围                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status          | true <img width=250/>  | string <img width=250/> | 请求处理结果  <img width=1000/>      | "ok" :成功, "error"：失败 |
| \<data\>        |   true    |   object     |                               | 字典                   |
| symbol               | true | string  | 品种代码   |                                          |
| contract_type        | true | string  | 合约类型   | 当周:"this_week", 周:"next_week", 当季:"quarter" ，次季度：“next_quarter”  |
| contract_code        | true | string  | 合约代码   | "BTC180914" ...                          |
| volume               | true | decimal | 委托数量   |                                          |
| price                | true | decimal | 委托价格   |                                          |
| order_price_type     | true | string  | 订单报价类型 | "limit":限价，"opponent":对手价，"post_only":只做maker单,post only下单只受用户持仓数量限制，"lightning":闪电平仓，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档，"fok":FOK订单，"ioc":IOC订单, "opponent_ioc": 对手价-IOC下单，"lightning_ioc": 闪电平仓-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"lightning_fok"：闪电平仓-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |
| direction            | true | string  | 买卖方向   | "buy":买 "sell":卖                         |
| offset               | true | string  | 开平方向   | "open":开 "close":平                       |
| lever_rate           | true | int     | 杠杆倍数   |                         |
| order_id             | true | long    | 订单ID   |                                          |
| order_id_str             | true | string    | String类型订单ID   |                                          |
| client_order_id      | true | long    | 客户订单ID |                                          |
| created_at           | true | long    | 创建时间   |                                          |
| trade_volume         | true | decimal | 成交数量   |                                          |
| trade_turnover       | true | decimal | 成交总金额  |                                          |
| fee                  | true | decimal | 手续费    |                                          |
| trade_avg_price      | true | decimal | 成交均价   |                                          |
| margin_frozen        | true | decimal | 冻结保证金  |                                          |
| profit               | true | decimal | 平仓盈亏（使用持仓均价计算，不包含仓位跨结算的已实现盈亏。）    |                                          |
| status               | true | int     | 订单状态   | (1准备提交 2准备提交 3已提交 4部分成交 5部分成交已撤单 6全部成交 7已撤单 11撤单中) |
| order_type           | true | int  | 订单类型   | 1:报单 、 2:撤单 、 3:强平、4:交割                  |
| order_source         | true | string  | 订单来源   | （system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发） |
| fee_asset         | true | string  | 手续费币种   | （"BTC","ETH"...）|
| canceled_at               | true     | long    |撤单时间           |  |
| \<tpsl_order_info\>  |  true  | object array |  关联的止盈止损单信息    | |
| volume                 | true | decimal  | 委托数量  |      |
| tpsl_order_type            | true | string | 止盈止损类型                |           “tp”:止盈单；"sl"：止损单        |
| direction            | true | string | 买卖方向                |           买入平空："buy",卖出平多："sell"         |
| order_id      | true | long | 止盈止损订单ID                |                                          |
| order_id_str             | true | string | 字符串类型的止盈止损订单ID             |                                          |
| trigger_type              | true | string  | 触发类型 |  ge大于等于；le小于等于  |             
| trigger_price         | true | decimal | 触发价              |                      |
| created_at        | true  | long | 订单创建时间  |                      |
| order_price_type        | true  | string | 订单报价类型  |  限价："limit"， 最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20        |
| order_price	      | true | decimal  |  委托价	       |                                          |
| status        | true  | int | 订单状态 |     1:未生效、2:等待委托、3:委托中、4:委托成功、5:委托失败、6:已撤单、8：撤单未找到、9：撤单中、10：失败' 、11：已失效、12、未生效-已结束        |
| relation_tpsl_order_id        | true  | string |  关联的止盈止损单id（用户同时设置止盈止损单时，该字段才有值，否则数值为-1） |       |
| canceled_at        | true  | long | 撤单时间 |                      |
| fail_code        | true  | int | 被触发时下order单失败错误码 |                      |
| fail_reason        | true  | string | 被触发时下order单失败原因 |                      |
| triggered_price   | true | decimal | 被触发时的价格                |  |
| relation_order_id          | true | string |  该字段为关联限价单的关联字段，未触发前数值为-1	           |                       |
| \</tpsl_order_info\>  |   | |      | |
| \</data\>       |       |        |     |  |
| ts              | true  | long   | 响应生成时间点，单位：毫秒                 |     |


## 跟踪委托订单下单

 - POST `/api/v1/contract_track_order`

### 请求参数
| 参数名称            | 是否必须  | 类型     | 描述                    | 取值范围                                     |
| --------------- | ----- | ------ | --------------------- | ---------------------------------------- |
| symbol          | false（请看备注） | string | 品种代码                  | "BTC","ETH"...                           |
| contract_type   | false（请看备注） | string | 合约类型                  | “this_week”:当周，“next_week”:次周，“quarter”:当季，“next_quarter”：次季度 |
| contract_code   | false（请看备注） | string | 合约代码    | BTC190903                                |
| direction | true | string | 买卖方向| buy:买 sell:卖  |
| offset | true | string | 开平方向|   open:开 close:平  |
| lever_rate | false | int | 杠杆倍数，开仓操作为必填，平仓操作为非必填|    |
| volume | true | decimal |委托数量(张)|  |
| callback_rate          | true | decimal | 回调幅度              |  如：0.01 表示1%，不可小于0.001（0.1%）                         |
| active_price   | true | decimal | 激活价格                 |  |
| order_price_type | true | string | 委托类型 |  最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20，理论价格：formula_price  |

#### 备注：
 - 委托类型为理论价格，表示跟踪委托触发成功后，以下单以来市场最低（最高）价的（1 ± 回调幅度）作为委托价（精度为币种最小变动单位，截断）向市场下委托类型为limit的订单。
 - 无论是最优N档还是理论价格下单，都不能保证订单能完全成交，主要取决于市场情况。
 - symbol+contract_type和contract_code必填其一，只要填写了contract_code就直接取contract_code。
 - 该接口的限频次数为1秒5次。

> Response

```json
{
    "status": "ok",
    "data": {
        "order_id": 825041038916751360,
        "order_id_str": "825041038916751360"
    },
    "ts": 1616746712203
}
```

### 返回参数

| 参数名称            | 是否必须  | 类型     | 描述                            | 取值范围                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status                     | true         | string   | 请求处理结果               | "ok" , "error" |
| ts |  true  | long | 时间戳 | |
| \<data\> |  true  | object | 成功处理返回的数据  | |
| order_id  |  true  | long | 跟踪委托订单ID[全局唯一]   | |
| order_id_str |  true  | string | 字符串类型的跟踪委托订单ID   | |
| \</data\> |   | |  | |



## 跟踪委托订单撤单

 - POST `/api/v1/contract_track_cancel`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol          | true | string | 品种代码                  | "BTC","ETH"...                           |
| order_id | true | string | 用户跟踪委托订单ID（多个订单ID中间以","分隔,一次最多允许撤消10个订单 ）|    |

#### 备注
 - 该接口的限频次数为1秒5次。

> Response: 

```json
{
    "status": "ok",
    "data": {
        "errors": [
            {
                "order_id": "825041038916751361",
                "err_code": 1061,
                "err_msg": "This order doesnt exist."
            }
        ],
        "successes": "825041038916751360"
    },
    "ts": 1616746795262
}
```

### 返回参数
| 参数名称            | 是否必须  | 类型     | 描述                            | 取值范围                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status          | true  | string | 请求处理结果                        | "ok" :成功, "error"：失败 |
| \<data\>        |   true    |   object     |                               | 字典                   |
| \<errors\>        |   true    |   object     |                               | 字典                   |
| order_id        | true  | string | 跟踪委托订单ID[全局唯一] |                      |
| err_code              | false  | long   | 错误码                |                      |
| err_msg              | false  | string   | 错误信息               |                      |
| \</errors\>       |       |        |     |  |
| successes              | true  | string   | 成功的订单                 |     |
| \</data\>       |       |        |     |  |
| ts              | true  | long   | 响应生成时间点，单位：毫秒                 |     |


## 跟踪委托订单全部撤单

 - POST `/api/v1/contract_track_cancelall`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol          | true | string | 品种代码                  | "BTC","ETH"...                           |
| contract_code | false | string | 合约代码|  "BTC180914" ...  |
| contract_type | false | string | 合约类型 |  当周:"this_week", 周:"next_week", 当季:"quarter"，次季度：“next_quarter”  |
| direction | false  | string | 买卖方向（不填默认全部）  |  "buy":买 "sell":卖 |
| offset | false  | string | 开平方向（不填默认全部）  | "open":开 "close":平  |

#### 备注：
 - 只传symbol，撤该该品种下该订单类型的所有周期合约的跟踪委托订单
 - 只要有contract_code，则撤销该code的合约的跟踪委托订单
 - 只传symbol+contract_type， 则撤销二者拼接所成的合约跟踪委托订单
 - direction与offset可只填其一，只填其一则按对应的条件去撤单。（如用户只传了direction=buy，则撤销所有买单，包括开仓和平仓）
 - 该接口的限频次数为1秒5次。
 
> Response: 

```json
{
    "status": "ok",
    "data": {
        "errors": [],
        "successes": "825041902725271552,825042030290833408,825042223069433856"
    },
    "ts": 1616747043604
}
```

### 返回参数

| 参数名称                   | 是否必须 | 类型      | 描述                 | 取值范围                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status          | true  | string | 请求处理结果                        | "ok" :成功, "error"：失败 |
| \<data\>        |   true    |   object     |                               | 字典                   |
| \<errors\>        |   true    |   object     |                               | 字典                   |
| order_id        | true  | string | 跟踪委托订单ID[全局唯一] |                      |
| err_code              | false  | long   | 错误码                |                      |
| err_msg              | false  | string   | 错误信息               |                      |
| \</errors\>       |       |        |     |  |
| successes              | true  | string   | 成功的订单                 |     |
| \</data\>       |       |        |     |  |
| ts              | true  | long   | 响应生成时间点，单位：毫秒                 |     |


## 跟踪委托订单当前委托

 - POST `/api/v1/contract_track_openorders`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol          | true | string | 品种代码                  | "BTC","ETH"...                           |
| contract_code | false | string | 合约代码,"BTC180914" ...|    |
| trade_type | false  | int | 交易类型（不填默认查询全部）  |  0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多 |
| page_index | false | int | 第几页，不填默认第一页|    |
| page_size | false | int | 不填默认20，不得多于50| [1-50]   |

> Response: 

```json
{
    "status":"ok",
    "data":{
        "orders":[
            {
                "symbol":"BTC",
                "contract_type":"quarter",
                "contract_code":"BTC210326",
                "volume":1,
                "order_type":1,
                "direction":"sell",
                "offset":"close",
                "lever_rate":75,
                "order_id":825042343047499776,
                "order_id_str":"825042343047499776",
                "order_source":"api",
                "created_at":1616747023128,
                "order_price_type":"formula_price",
                "status":2,
                "callback_rate":0.003,
                "active_price":54323,
                "is_active":0
            }
        ],
        "total_page":1,
        "current_page":1,
        "total_size":3
    },
    "ts":1616747242096
}
```

### 返回参数

| 参数名称            | 是否必须  | 类型     | 描述                            | 取值范围                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status          | true  | string | 请求处理结果                        | "ok" :成功, "error"：失败 |
| \<data\>        |   true    |   object     |                               | 字典                   |
| total_page        | true | int | 总页数   |                |
| total_size        | true | int | 总条数   |                |
| current_page        | true | int | 当前页   |                |
| \<orders\>        |   true    |   object array    |                               |     |
| symbol                 | true | string  | 品种代码               |                                          |
| contract_type          | true | string  | 合约类型               | 当周:"this_week", 次周:"next_week", 当季:"quarter" ，次季度：“next_quarter” |
| contract_code          | true | string  | 合约代码               | "BTC180914" ...                          |
| volume                 | true | decimal  | 委托数量 |      |
| order_type           | true | int | 订单类型：1、报单 2、撤单               |                                          |
| direction            | true | string | 买卖方向                |           买："buy",卖："sell"         |
| offset         | true | string | 开平方向              |                  开："open",平："close"        |
| lever_rate            | true | int    | 杠杆倍数               |                                       |
| order_id      | true | long | 跟踪委托订单ID                |                                          |
| order_id_str             | true | string | 字符串类型的跟踪委托订单ID              |                                          |
| order_source      | true | string  | 来源        |                                          |
| created_at        | true  | long | 订单创建时间 |                      |
| order_price_type        | true  | string | 订单报价类型  |  最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20，理论价格：formula_price    |
| status        | true  | int | 订单状态： |     2:等待委托、4:已委托、5:委托失败、6:已撤单              |
| callback_rate          | true | decimal | 回调幅度           |  如：0.01 表示1%                         |
| active_price   | true | decimal | 激活价格             |  |
| is_active   | true | int | 激活价格是否已激活             |  1：已激活；0：未激活|
| \</orders\>       |       |        |     |  |
| \</data\>       |       |        |     |  |
| ts              | true  | long   | 响应生成时间点，单位：毫秒                 |     |


## 跟踪委托订单历史委托

 - POST `/api/v1/contract_track_hisorders`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| symbol          | true | string | 品种代码                  | "BTC","ETH"...                           |
| contract_code | false | string | 合约代码,"BTC180914" ...|    |
| status | true | string | 订单状态| 多个以英文逗号隔开，跟踪委托订单状态：0:全部（表示全部结束状态的订单）、4:已委托、5:委托失败、6:已撤单   |
| trade_type | true  | int | 交易类型  |  0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多 |
| create_date | true | long | 日期| 可随意输入正整数，如果参数超过90则默认查询90天的数据   |
| page_index | false | int | 第几页，不填默认第一页|    |
| page_size | false | int | 不填默认20，不得多于50|  [1-50]  |
| sort_by | false | string | 排序字段（降序），不填默认按照created_at降序 |  "created_at"：按订单创建时间进行降序，"update_time"：按订单更新时间进行降序  |

> Response: 

```json
{
    "status":"ok",
    "data":{
        "orders":[
            {
                "symbol":"BTC",
                "contract_type":"quarter",
                "contract_code":"BTC210326",
                "triggered_price":null,
                "volume":1,
                "order_type":1,
                "direction":"buy",
                "offset":"close",
                "lever_rate":75,
                "order_id":825042223069433856,
                "order_id_str":"825042223069433856",
                "order_source":"api",
                "created_at":1616746994523,
                "update_time":1616747101872,
                "order_price_type":"formula_price",
                "status":6,
                "canceled_at":1616747044182,
                "fail_code":null,
                "fail_reason":null,
                "callback_rate":0.003,
                "active_price":52323,
                "is_active":0,
                "market_limit_price":null,
                "formula_price":null,
                "real_volume":0,
                "relation_order_id":"-1"
            }
        ],
        "total_page":1,
        "current_page":1,
        "total_size":5
    },
    "ts":1616747533336
}
```

### 返回参数

| 参数名称            | 是否必须  | 类型     | 描述                            | 取值范围                 |
| --------------- | ----- | ------ | ----------------------------- | -------------------- |
| status          | true  | string | 请求处理结果                        | "ok" :成功, "error"：失败 |
| \<data\>        |   true    |   object     |                               | 字典                   |
| total_page        | true | int | 总页数   |                |
| total_size        | true | int | 总条数   |                |
| current_page        | true | int | 当前页   |                |
| \<orders\>        |   true    |   object array    |                               |     |
| symbol                 | true | string  | 品种代码               |                                          |
| contract_type          | true | string  | 合约类型               | 当周:"this_week", 次周:"next_week", 当季:"quarter" ，次季度：“next_quarter” |
| contract_code          | true | string  | 合约代码               | "BTC180914" ...                          |
| volume                 | true | decimal  | 委托数量 |      |
| order_type           | true | int | 订单类型：1、报单 2、撤单               |                                          |
| direction            | true | string | 买卖方向                |           买："buy",卖："sell"         |
| offset         | true | string | 开平方向              |                  开："open",平："close"        |
| lever_rate            | true | int    | 杠杆倍数               |                                       |
| order_id      | true | long | 跟踪委托订单ID                |                                          |
| order_id_str             | true | string | 字符串类型的跟踪委托订单ID              |                                          |
| order_source      | true | string  | 来源        |                                          |
| created_at        | true  | long | 订单创建时间 |                      |
| update_time        | true  | long | 订单更新时间，单位毫秒 |                      |
| order_price_type        | true  | string | 订单报价类型  |   最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20 ，理论价格：formula_price        |
| status        | true  | int | 订单状态： |    2:等待委托、4:已委托、5:委托失败、6:已撤单          |
| canceled_at        | true  | long | 撤单时间 |                      |
| fail_code        | true  | int | 被触发时下order单失败错误码 |                      |
| fail_reason        | true  | string | 被触发时下order单失败原因 |                      |
| callback_rate          | true | decimal | 回调幅度             |  如：0.01 表示1%                         |
| active_price   | true | decimal | 激活价格           |  |
| is_active   | true | int | 激活价格是否已激活             |  1：已激活；0：未激活|
| market_limit_price   | true | decimal |  市场最低/最高价（买入则为市场最低价、卖出则为市场最高价）           |  |
| formula_price   | true | decimal | 理论价格（市场最低（最高）价的（1 ± 回调幅度））           |  |
| real_volume   | true | decimal | 实际委托数量                |  |
| triggered_price   | true | decimal | 被触发时的价格           |  |
| relation_order_id          | true | string |  该字段为关联限价单的关联字段，未触发前数值为-1	           |                       |
| \</orders\>       |       |        |     |  |
| \</data\>       |       |        |     |  |
| ts              | true  | long   | 响应生成时间点，单位：毫秒                 |     |


# 合约划转接口

## 现货-交割合约账户间进行资金的划转

### 实例

- POST `https://api.huobi.pro/v1/futures/transfer`

### 备注

此接口用户币币现货账户与交割合约账户之间的资金划转。

从现货现货账户转至交割合约账户，类型为`pro-to-futures`; 从交割合约账户转至现货账户，类型为`futures-to-pro`

该接口的访问频次的限制为1秒/1次。

注意：请求地址为火币Global地址

现货与交割合约划转接口，所有划转的币的精度是8位小数。

### 请求参数

  参数名称   |  是否必须    |  类型   |  描述      |  取值范围  |
--------------  | --------------  | ---------- |  ------------------------  |  ------------------------------------------------------------------------------------------------------  |
currency  |    true  |  string  |  币种,不区分大小写  |   e.g. btc,eth  |
amount  |   true  |  decimal  |   划转金额  |      |
type  |  true  |  string  |   划转类型   |  从合约账户到现货账户：“futures-to-pro”，从现货账户到合约账户： “pro-to-futures”  |

> Response:

```json

正确的返回：
{
    "status": "ok",
    "data": 179697972
}
错误的返回：
{
    "status": "error",
    "data": null,
    "err-code": "base-currency-error",
    "err-msg": "The current coin does not exist."
}

```

###  返回参数

参数名称  |  是否必须     |  类型    |  描述  |  取值范围  |
------------------ |  -------------- |  ---------- |  ---------------------  |  -----------------------------  |
status  |  true  |   string  |  状态  |  ok, error  |  
data  |    true  |   long    |    生成的划转订单id  |  |
err-code  |  true  |   string  |  错误码  |  具体错误码请见列表  |
err-msg  |    true  |  string  |  错误消息  |  具体错误码请见列表  |

## err-code列表

err-code | err-msg(中文） | err-msg(English)  |  补充说明   |
------------------ | ------------------------------------ | --------------------------------  |  ----------------------------------- |
base-msg  |    |    |  其他错误，具体的err-msg, 请参照对应的错误消息列表  |
base-currency-error  |  币种无效  |  The currency is invalid  |           |
frequent-invoke  |  操作过于频繁，请稍后重试。（如果超过1分钟10次，系统返回该error-code） |  the operation is too frequent. Please try again later  |  如果请求次数超过1分钟10次，系统返回该error-code    |
banned-by-blacklist  |  黑名单限制  |  Blacklist restriction  |             |
dw-insufficient-balance  |  可划转余额不足，最大可划转 {0}。（币币账户的余额不足。） |  Insufficient balance. You can only transfer {0} at most.  |  币币账户的余额不足。     |
dw-account-transfer-unavailable  |  转账暂时不可用  |  account transfer unavailable  |  该接口暂时不可用     |
dw-account-transfer-error  |  由于其他服务不可用导致的划转失败  |  account transfer error  |              |
dw-account-transfer-failed  |  划转失败。请稍后重试或联系客服 |  Failed to transfer. Please try again later.  |  由于系统异常导致的划转失败         |
dw-account-transfer-failed-account-abnormality  |  账户异常，划转失败。请稍后重试或联系客服  |  Account abnormality, failed to transfer。Please try again later.  |               |

## base-msg对应的err-msg列表

err-msg(中文） |  err-msg(English)  |  补充说明   |
------------------------------------  |  --------------------------------  |  ------------------------- |
用户没有入金权限  |  Unable to transfer in currently. Please contact customer service  |           |
用户没有出金权限  |  Unable to transfer out currently. Please contact customer service  |          |
合约状态异常，无法出入金  |  Abnormal contracts status. Can’t transfer  |            |
子账号没有入金权限，请联系客服  |  Sub-account doesn't own the permissions to transfer in. Please contact customer service  |         |
子账号没有出金权限，请联系客服  |  Sub-account doesn't own the permissions to transfer out. Please contact customer service  |        |
子账号没有划转权限，请登录主账号授权  |  The sub-account does not have transfer permissions. Please login main account to authorize  |       |
可划转余额不足  |  Insufficient amount available  |  合约账户的余额不足       |
单笔转出的数量不能低于{0}{1}  |  The single transfer-out amount must be no less than {0}{1}  |       |
单笔转出的数量不能高于{0}{1}  |  The single transfer-out amount must be no more than {0}{1}  |       |
单笔转入的数量不能低于{0}{1}  |  The single transfer-in amount must be no less than {0}{1}  |         |
单笔转入的数量不能高于{0}{1}  |  The single transfer-in amount must be no more than {0}{1}  |         |
您当日累计转出量超过{0}{1}，暂无法转出  |  Your accumulative transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being   |         |
您当日累计转入量超过{0}{1}，暂无法转入  |  Your accumulative transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being   |           |
您当日累计净转出量超过{0}{1}，暂无法转出  |  Your accumulative net transfer-out amount is over the daily maximum, {0}{1}. You can't transfer out for the time being   |          |
您当日累计净转入量超过{0}{1}，暂无法转入  |  Your accumulative net transfer-in amount is over the daily maximum, {0}{1}. You can't transfer in for the time being   |            |
超过平台当日累计最大转出量限制，暂无法转出  |  The platform's accumulative transfer-out amount is over the daily maximum. You can't transfer out for the time being   |              |
超过平台当日累计最大转入量限制，暂无法转入  |  The platform's accumulative transfer-in amount is over the daily maximum. You can't transfer in for the time being   |                |
超过平台当日累计最大净转出量限制，暂无法转出  |  The platform's accumulative net transfer-out amount is over the daily maximum. You can't transfer out for the time being   |         |
超过平台当日累计最大净转入量限制，暂无法转入  |  The platform's accumulative net transfer-in amount is over the daily maximum. You can't transfer in for the time being   |           |
划转失败，请稍后重试或联系客服  |  Transfer failed. Please try again later or contact customer service   |                     |
服务异常，划转失败，请稍后再试  |  Abnormal service, transfer failed. Please try again later   |                           |
您尚未开通合约交易，无访问权限  |  You don’t have access permission as you have not opened contracts trading   |                    |
合约品种不存在  |  This contract type doesn't exist.  |  没有相应币种的合约       |

    

# 合约Websocket简介

## 接口列表

| 权限类型  |   接口数据类型   |  请求方法   |  类型    |  描述                     |  需要验签       |    
----------- | ------------------ | ------------------ |---------- |---------------------------- |--------------|
| 读取    |  市场行情接口 | market.$symbol.kline.$period                   | sub  | 订阅 KLine 数据               |       否      |
| 读取    |  市场行情接口 | market.$symbol.kline.$period                    | req  | 请求 KLine 数据               |       否      |
| 读取    |  市场行情接口 | market.$symbol.depth.$type                      | sub  | 订阅 Market Depth 数据        |       否      |
| 读取    |  市场行情接口 | market.$symbol.depth.size_${size}.high_freq     | sub  | 订阅 Market Depth增量推送数据 |       否      |
| 读取    |  市场行情接口 | market.$symbol.bbo                              | sub  | 买一卖一逐笔行情推送         |       否      |
| 读取    |  市场行情接口 | market.$symbol.detail                           | sub  | 订阅 Market detail 数据       |       否      |
| 读取    |  市场行情接口 | market.$symbol.trade.detail                     | req  | 请求 Trade detail 数据        |       否      |
| 读取    |  市场行情接口 | market.$symbol.trade.detail                     | sub  | 订阅 Trade Detail 数据        |       否      |
| 读取    |  指数与基差接口 | market.$symbol.basis.$period.$basis_price_type  | sub  | 订阅基差数据                  |       否      |
| 读取    |  指数与基差接口 | market.$symbol.basis.$period.$basis_price_type  | req  | 请求基差数据                  |       否      |
| 读取    |  指数与基差接口 | market.$symbol.index.$period           | sub  | 订阅(sub)指数K线数据           |       否      |
| 读取    |  指数与基差接口 | market.$symbol.index.$period            | req  | 请求(req)指数K线数据          |       否      |
| 读取    |  指数与基差接口 | market.$symbol.mark_price.$period           | sub  | 订阅标记价格K线数据          |       否      |
| 读取    |  指数与基差接口 | market.$symbol.mark_price.$period           | req  | 请求标记价格K线数据          |       否      |
| 读取    |  交易接口 | public.$symbol.liquidation_orders               | sub  | 订阅强平订单数据（免鉴权）    |       否      |
| 读取    |  交易接口 | public.$symbol.contract_info                    | sub  | 订阅合约信息变动数据（免鉴权）|       否      |
| 读取    |  交易接口	 | orders.$symbol                                  | sub  | 订阅订单成交数据              |    是       |
| 读取    |  资产接口	 | accounts.$symbol                                | sub  | 订阅资产变动数据              |    是       |
| 读取    |  资产接口	 | positions.$symbol                               | sub  | 订阅持仓变动更新数据          |    是       |
| 读取    |  交易接口	 | matchOrders.$symbol                             | sub  | 订阅撮合订单成交数据          |    是       |
| 读取    |  交易接口	 | trigger_order.$symbol                             | sub  | 订阅计划委托订单更新ws推送   |    是       |
| 读取    |  系统状态接口   |  public.$service.heartbeat  |        sub  | 订阅系统状态更新  | 否  | 


## 合约订阅地址

 合约站行情请求以及订阅地址为：wss://api.hbdm.com/ws
 
 合约站订单推送订阅地址：wss://api.hbdm.com/notification

 合约站指数K线及基差数据订阅地址：wss://api.hbdm.com/ws_index
 
 合约站系统状态更新订阅地址：wss://api.hbdm.com/center-notification
 
 如果api.hbdm.com域名访问不了，可使用：
 
 合约站行情请求以及订阅地址为：wss://api.btcgateway.pro/ws
 
 合约站订单推送订阅地址：wss://api.btcgateway.pro/notification

 合约站指数K线及基差数据订阅地址：wss://api.btcgateway.pro/ws_index
 
 合约站系统状态更新订阅地址：wss://api.btcgateway.pro/center-notification
 
 如果对合约订单推送订阅有疑问，可以参考[Demo](https://github.com/huobiapi/Futures-Java-demo)
 
### 备注

 如果api.hbdm.com无法访问，可以使用api.btcgateway.pro来做调试，AWS服务器用户推荐使用api.hbdm.vn； 
 
## 访问次数限制

公开行情接口和用户私有接口都有访问次数限制

- 普通用户，需要密钥的私有接口，每个UID 3秒最多 72 次请求(交易接口3秒最多 36 次请求，查询接口3秒最多 36次请求) (该UID的所有币种和不同到期日的合约的所有私有接口共享该限制)

- 其他非行情类的公开接口，比如获取指数信息，限价信息，交割结算、平台持仓信息等，所有用户都是每个IP3秒最多120次请求（所有该IP的非行情类的公开接口请求共享3秒120次的额度）

- 行情类的公开接口，比如：获取K线数据、获取聚合行情、市场行情、获取行情深度数据、获取指数k线、获取基差数据、获取市场最近成交记录：

    （1） restful接口：同一个IP, 所有业务（交割合约、币本位永续合约和USDT本位永续合约）总共1秒最多800个请求

    （2） websocket：req请求，同一时刻最多请求50次；sub请求，无限制，服务器主动推送数据

- WebSocket私有订单成交推送接口(需要API KEY验签)

    一个UID最多同时建立30个私有订单推送WS链接。该用户在一个品种(包含该品种的所有周期的合约)上，仅需要维持一个订单推送WS链接即可。

    注意: 订单推送WS的限频，跟用户RESTFUL私有接口的限频是分开的，相互不影响。
    
- websocket 1秒同时最多发40个sub请求。

api接口response中的header返回以下字段

- ratelimit-limit： 单轮请求数上限，单位：次数

- ratelimit-interval：请求数重置的时间间隔，单位：毫秒

- ratelimit-remaining：本轮剩余可用请求数，单位：次数

- ratelimit-reset：请求数上限重置时间，单位：毫秒 
 
# WebSocket心跳以及鉴权接口

## 市场行情心跳

- WebSocket Server 发送心跳：

`{"ping": 18212558000}`

- WebSocket Client 应该返回：

`{"pong": 18212558000}`

注：WebSocket Client 和 WebSocket Server 建立连接之后，WebSocket Server 每隔 `5s`（这个频率可能会变化） 会向 WebSocket Client 发起一次心跳，WebSocket Client 忽略心跳 5 次后，WebSocket Server 将会主动断开连接；WebSocket Client发送最近2次心跳message中的其中一个`ping`的值，WebSocket Server都会保持WebSocket连接。

## 订单推送心跳

- WebSocket API 支持单向心跳，Server 发起 ping message，Client 返回 pong message。 WebSocket Server 发送心跳:

`{`

   `"op": "ping",`
    
   `"ts": "1492420473058"`
    
`}`

- WebSocket Client 应该返回:

`{`

   `"op": "pong"`
    
   `"ts": "1492420473058"`
    
`}`

### 备注：

- "pong"操作返回数据里面的"ts"的值为"ping"推送收到的"ts"值

- WebSocket Client 和 WebSocket Server 建⽴立连接之后，WebSocket Server 每隔 5s(这个频率可能会变化) 会向 WebSocket Client 发起⼀一次⼼心跳，WebSocket Client 忽略心跳 5 次后，WebSocket Server 将会主动断开连接。

- 异常情况WebSocket Server 会返回错误信息，比如：

`{`

   `"op": "pong"`
    
   `"ts": "1492420473027",`
    
   `"err-code": 2011`
    
   `"err-msg": “详细出错信息”`
    
`}`

## 订单推送访问地址

- 统一服务地址

  `wss://api.hbdm.com/notification`
  
### 备注

 如果api.hbdm.com无法访问，可以使用api.btcgateway.pro来做调试，AWS服务器用户推荐使用api.hbdm.vn；  
  
正常ws请求连接不能同时超过30个

### 数据压缩

WebSocket API 返回的所有数据都进⾏了 GZIP 压缩，需要 client 在收到数据之后解压

### 请求与响应数据说明

- 字符编码：UTF-8

- 大小写敏感，包含所有参数名和返回值

- 数据类型：使用JSON传输数据

- 所有请求数据都有固定格式，具体接口说明文档中只会重点介绍非通用部分，

> 请求数据结构如下:

```

   {
  "op": string, // 必填;Client 请求的操作类型(Server 会原样返回)，详细操作
  类型列列表请参考附录
  "cid": string, // 选填;当前请求唯一 ID(Client 自⽣成并保证本地唯一性，
  Server 会原样返回) 
  // 其余必填/可选字段
  }

```

> 所有响应/推送数据都会以固定的结构返回，具体接口说明文档中只会重点介绍data部分，请求响应数据结构如下:

```
   
  {
  "op": string, // 必填;本次响应 Client 请求的操作类型
  "cid": string, // 选填;Client 请求唯一 ID
  "ts": long, // 必填;Server 应答时本地时间戳
  "err-code": int, // 必填;响应码，0 代表成功;非0 代表出错，详细响应码列表请参考错误码表。
  "err-msg": string, 只在出错情况下有此信息，表明详细的出错信息 
  "data": object // 选填;返回数据对象，请求处理成功时有效
  }
  
 ```

>  推送数据结构如下:

```

  {
  "op": "string", // 必填;Server 推送的操作类型，详细操作类型列表请参考附录
  "ts": long, // 必填;Server 推送时本地时间戳
  "data": object // 必填;返回数据对象
  }
  
```

## 服务方主动断开连接

在建连和鉴权期间，如果出错，服务方会主动断开连接，在关闭之前推送数据结构如下,

`{`

  `"op": "close", // 表明是服务⽅方主动断开连接`
   
  `"ts": long   // Server 推送时本地时间戳`
  
`}`


## 服务方返回错误，但不断开连接

鉴权成功后，在客户方提供非法Op或者某些内部错误的情况下，服务方会返回错误，但并不断开连接

`{`

  `"op": "error", // 表明是收到非法op或者内部错误 `
  
  `"ts": long// Server 推送时本地时间戳`
  
`}`

## 鉴权-Authentication

用户自⼰在火币网⽣成Access Key和Secret Key，Secret Key由用户自⼰保存，⽤户需提供Access Key。目前关于 apikey 申请和修改，请在“账户 - API 管理 ” 创建新API Key 填写备注(可选择绑定 ip)点击创建。其中 Access Key 为 API 访问密钥，Secret Key 为用户对请求进⾏签名的密钥(仅申请时可见)。用户按规则生成签名(Signature)。 

交易功能 websocket 版本接⼝建立连接时首先要做鉴权操作，具体格式如下，

重要提示：这两个密钥与账号安全紧密相关，无论何时都请勿向其它人透露。 

### 鉴权请求数据格式

`{`

  `"op": "auth",`
  
  `"type": "api",`
  
  `"AccessKeyId": "e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx",`
  
  `"SignatureMethod": "HmacSHA256",`
  
  `"SignatureVersion": "2",`
  
  `"Timestamp": "2017-05-11T15:19:30",`
  
  `"Signature": "4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=",`
  
`}`


### 鉴权请求数据格式说明

| 字段名称         | 类型   | 说明                                                         |
| --------------- | ----- | ----------------------------------------------------------- |
| op               | string | 必填；操作名称，鉴权固定值为auth                             |
| type             | string | 必填；认证方式 api表示接口认证，ticket 表示终端认证          |
| cid              | string | 选填；Client请求唯一ID                                       |
| AccessKeyId      | string | type的值为api时必填；API 访问密钥, 您申请的 APIKEY 中的 AccessKey |
| SignatureMethod  | string | type的值为api时必填；签名方法, 用户计算签名的基于哈希的协议，此处使用 HmacSHA256 |
| SignatureVersion | string | type的值为api时必填；签名协议的版本，此处使用 2              |
| Timestamp        | string | type的值为api时必填；时间戳, 您发出请求的时间 (UTC 时区) 。在查询请求中包含此值有助于防止第三方截取您的请求。如:2017-05-11T16:22:06。再次强调是 (UTC 时区) |
| Signature        | string | type的值为api时必填；签名, 计算得出的值，用于确保签名有效和未被篡改 |
| ticket           | string | type的值为ticket时必填；登陆时返回                           |

#### 注意：

- 为了减少已有用户的接入工作量，此处使用了与REST接口同样的签名算法进行鉴权。

- 请注意大小写

- 当type为api时，参数op，type，cid，Signature不参加签名计算

- 此处签名计算中请求方法固定值为`GET`,其余值请参考REST接口签名算法文档

#### 步骤：

示例例参数签名(Signature)计算过程如下，

- 规范要计算签名的请求 因为使用 HMAC 进⾏签名计算时，使⽤不同内容计算得到的结果会完全
  不同。所以在进⾏签名计算前，请先对请求进⾏规范化处理。

- 请求方法(GET 或 POST)，后面添加换行符 `\n` 。

  `GET\n`

- 添加小写的访问地址，后面添加换行符`\n`。

  `api.hbdm.com\n`

- 访问方法的路径，后面添加换行符`\n`。

  `/notification\n`

- 按照ASCII码的顺序对参数名进行排序(使⽤ UTF-8 编码，且进⾏了 URI 编码，十六进制字符必须
  大写，如‘:’会被编码为'%3A'，空格被编码为'%20')。例如，下面是请求参数的原始顺序，进⾏过
  编码后。

  `AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`
  

- 按照以上顺序，将各参数使用字符’&’连接。 
 
- 组成最终的要进行签名计算的字符串如下:
  
  计算签名，将以下两个参数传入加密哈希函数: 要进行签名计算的字符串，进行签名的密钥(SecretKey) 
  
  得到签名计算结果并进行 Base64编码
  
  将上述值作为参数Signature的取值添加到 API 请求中。 将此参数添加到请求时，必须将该值进⾏URI编码。

### 鉴权应答数据格式说明

| 名称     | 类型    | 说明                                                 |
| ------- | ------ | --------------------------------------------------- |
| op       | string  | 必填；操作名称，鉴权固定值为 auth                    |
| type     | string  | 必填；根据请求的参数进行返回。                       |
| cid      | string  | 选填；请求时携带则会返回。                           |
| err-code | int | 成功返回 0, 失败为其他值，详细响应码列列表请参考附录 |
| err-msg  | string  | 可选，若出错表示详细错误信息                         |
| ts       | long    | 服务端应答时间戳                                     |
| user-id  | string    | ⽤户 id                                              |

> 鉴权成功应答数据示例

```json
 
{
  "op": "auth",
  "type":"api",
  "ts": 1489474081631,
  "err-code": 0,
  "data": {
    "user-id": "12345678"
  }
}

```

> 鉴权失败应答返回数据示例

```json

{
"op": "auth",
"type":"api",
"ts": 1489474081631, 
"err-code": xxxx,
"err-msg": "详细的错误信息"
}

```
 
 
# WebSocket市场行情接口

## 订阅 KLine 数据

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：

`{`

  `"sub": "market.$symbol.kline.$period",`

  `"id": "id generate by client"`

`}`

> 正确订阅请求参数的例子：

```json

    {
    "sub": "market.BTC_CQ.kline.1min",
    "id": "id1"
    }

```

### 请求参数
  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  sub  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.kline.$period，详细参数见sub订阅参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id     |            |  

### sub订阅参数说明

  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |   取值范围  
--------------| -----------------| ---------- |----------| ------------  | --------------------------------------------------------------------------------  |
  symbol  |       true         |  string  |   交易对   |               |  支持大小写，如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约 , "BTC_NQ"表示次季度合约 。支持使用合约code来订阅 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。|
  period    |     true          | string   |  K线周期     |            |  仅支持小写，1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon  |

#### 备注
 - 支持查询已下市四周内的合约的K线数据（即到期日在过去最近四周的合约），可输入已下市四周内的合约的合约代码进行查询K线数据。

> 之后每当 KLine 有更新时，client 会收到数据，例子:

```json

{
    "ch":"market.BTC_CW.kline.1min",
    "ts":1604385120328,
    "tick":{
        "id":1604385120,
        "mrid":113842458873,
        "open":13436.12,
        "close":13436.12,
        "high":13436.12,
        "low":13436.12,
        "amount":0,
        "vol":0,
        "count":0
    }
}
```

### 返回参数

 参数名称  |    是否必须   |   类型  |   描述   |
-------------- | -----------------  | ---------- |  -------------- |
  ch  |       true         |  string  |   请求参数   | 
  ts    |     true          | long   |  响应生成时间点，单位：毫秒     |           
  \<tick\>    |               |    |      |            | 
  id    |     true          | long   |  K线id,也就是K线时间戳，K线起始时间    |            
  mrid    |     true          | long   |  订单ID     |            
  vol    |     true          | decimal   |  成交量张数。 值是买卖双边之和 |            
  count    |     true          | decimal   |   成交笔数。 值是买卖双边之和 |            
  open    |     true          | decimal   |  开盘价    |            
  close    |     true          | decimal   |  收盘价,当K线为最晚的一根时，是最新成交价     |            
  low    |     true          | decimal   |  最低价    |            
  high    |     true          | decimal   |  最高价    |            
  amount    |     true          | decimal   |  成交量(币), 即 sum(每一笔成交量(张) * 单张合约面值/该笔成交价)。 值是买卖双边之和 |            
  \</tick\>    |               |     |      |          


## 请求 KLine 数据

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：


`{`
   
  `"req": "market.$symbol.kline.$period",`
        
  `"id": "id generated by client",`

  `"from": " type: long, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒",`
        
  `"to": "type: long, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒，必须比 from 大"`

`}`

> 请求 KLine 数据请求参数的例子：

```json

    {
    "req": "market.BTC_CQ.kline.1min",
    "id": "id4",
    "from":1571000000,
    "to":1573098606
    }
    
```

### 请求参数
  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  req  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.kline.$period，详细参数见req请求参数说明     |              |  
  id   |     false          | string   |  业务方自主生成的id      |          |  
  from   | true | long  |  开始时间 | | |
  to      | true | long | 结束时间 | | |
  
### req请求参数说明

  参数名称  |    是否必须   |   类型  |   描述   |    默认值    |   取值范围
-------- | -------- | ------ | ------ | ------- |---------------------------------------- 
  symbol | true | string |交易对 | |支持大小写，如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季度合约"。支持使用合约code来订阅 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。|
  period | true | string | K线周期 | | 仅支持小写，1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon|

  
#### 备注

[t1, t5] 假设有 t1  ~ t5 的K线：

from: t1, to: t5, return [t1, t5].

from: t5, to: t1, which t5  > t1, return [].

from: t5, return [t5].

from: t3, return [t3, t5].

to: t5, return [t1, t5].

from: t which t3  < t  <t4, return [t4, t5].

to: t which t3  < t  <t4, return [t1, t3].

from: t1 and to: t2, should satisfy 1325347200  < t1  < t2  < 2524579200.

一次最多2000条。

### 返回参数  

  参数名称  |    是否必须   |   类型  |   描述   |
-------------- | -----------------  | ---------- |  -------------- |
  rep  |       true         |  string  |   请求参数   | 
  status  |       true         |  string  |   状态   | 
  id  |       true         |  string  |   请求id   | 
  wsid    |     true          | long   |  wsid     |           
  \<data\>    |               |    |      |            | 
  id    |     true          | long   |  K线id,也就是K线时间戳，K线起始时间    |            
  vol    |     true          | decimal   |  成交量张数。 值是买卖双边之和 |            
  count    |     true          | decimal   |  成交笔数。 值是买卖双边之和 |            
  open    |     true          | decimal   |    开盘价   |            
  close    |     true          | decimal   |  收盘价,当K线为最晚的一根时，是最新成交价     |            
  low    |     true          | decimal   |  最低价    |            
  high    |     true          | decimal   |  最高价    |            
  amount    |     true          | decimal   |  成交量(币), 即 sum(每一笔成交量(张) * 单张合约面值/该笔成交价)。 值是买卖双边之和 |            
  \</data\>    |               |     |      |          

  

> 请求成功返回数据的例子：

```json
    
{
    "id":"id4",
    "rep":"market.BTC_CQ.kline.15min",
    "wsid":498385304,
    "status":"ok",
    "data":[
        {
            "id":1599667200,
            "open":10262.31,
            "close":10244.93,
            "low":10234.84,
            "high":10282,
            "amount":1849.4984536479908439463088799853871134642,
            "vol":189634,
            "count":5342
        },
        {
            "id":1599668100,
            "open":10244.94,
            "close":10242.07,
            "low":10216.55,
            "high":10244.94,
            "amount":1586.9623024248859129381285787325037896282,
            "vol":162334,
            "count":4375
        }
    ]
}
    
```

## 订阅 Market Depth 数据

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：

`{`

  `"sub": "market.$symbol.depth.$type",`

  `"id": "id generated by client"`

`}`

> 正确订阅请求参数的例子：

```json

    {
    "sub": "market.BTC_CQ.depth.step0",
    "id": "id5"
    }

```

### 请求参数
  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  sub  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.depth.$type，详细参数见sub订阅参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id     |            |  

### sub订阅参数说明

  参数名称   |  是否必须    |  类型     |  描述      |  默认值     |  取值范围  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
  symbol         |  true           |  string     |  交易对            |        |  支持大小写，如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季度合约". 支持使用合约code来订阅 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。 |
  type           |  true           |  string     |  Depth 类型        |        |  获得150档深度数据，使用step0, step1, step2, step3, step4, step5, step14, step15 （step1至step15是进行了深度合并后的深度），使用step0时，不合并深度获取150档数据;获得20档深度数据，使用 step6, step7, step8, step9, step10, step11, step12, step13（step7至step13是进行了深度合并后的深度），使用step6时，不合并深度获取20档数据  |

### 备注

- 合并深度时，一定报价精度内的市场挂单将予以合并显示。合并深度仅改变显示方式，不改变实际成交价格。

- step1至step5,step14,step15是进行了深度合并后的150档深度数据，step7至step13是进行了深度合并后的20档深度数据，对应精度如下：

- Depth类型字段对应精度如下：

| 档位 | Depth 类型 | 精度 |
|----|----|----|
|150档 |step0 | 不合并 |
|150档 |step1|0.00001|
|150档 |step2|0.0001|
|150档 |step3|0.001|
|150档 |step4|0.01|
|150档 |step5|0.1|
|150档 |step14|1|
|150档 |step15|10|
|20档 |step6 | 不合并 |
|20档 |step7|0.00001|
|20档 |step8|0.0001|
|20档 |step9|0.001|
|20档 |step10|0.01|
|20档 |step11|0.1|
|20档 |step12|1|
|20档 |step13|10|

> 之后每当 depth 有更新时，client 会收到数据，例子：

```json

{
    "ch":"market.BTC_CQ.depth.step6",
    "ts":1604385453899,
    "tick":{
        "mrid":113842765361,
        "id":1604385453,
        "bids":[
            [
                13584.33,
                1483
            ],
            [
                13584,
                1
            ]
        ],
        "asks":[
            [
                13584.34,
                126
            ],
            [
                13584.35,
                24
            ]
        ],
        "ts":1604385453896,
        "version":1604385453,
        "ch":"market.BTC_CQ.depth.step6"
    }
}
```

### 返回参数

参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
ch | true |  string | 数据所属的 channel，格式： market.$symbol.depth.$type  | | 
ts | true | long | 数据进入行情服务器时间戳，单位：毫秒 | |
\<tick\>    |               |    |      |            | 
mrid  | true| long | 订单ID | 
id  | true| long | tick ID | 
asks | false | object |卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序 | | 
bids | false| object | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序 | | 
ts | true | long | 深度生成时间戳，100MS生成一次，单位：毫秒 | |
version | true | long | 版本号 | |
ch | true |  string | 数据所属的 channel，格式：market.$symbol.depth.$type | | 
 \</tick\>    |               |    |      |            | | 


##  订阅Market Depth增量数据

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来请求数据:

`{`

`"sub": "market.$symbol.depth.size_${size}.high_freq",`

`"data_type":"incremental",`

`"id": "id generated by client"`

`}`

> 正确订阅请求参数的例子：

```json

{
"sub": "market.btc_cw.depth.size_20.high_freq",
"data_type":"incremental",
"id": "id generated by client"
}
```
### 订阅参数
  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  sub  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.depth.size_${size}.high_freq，详细参数见sub订阅参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id      |           |  
  data_type   |  false     |  string     |  Depth 类型        |    数据类型，不填默认为全量数据，"incremental"：增量数据，"snapshot"：全量数据 |
 
 
### sub订阅参数说明
  参数名称   |  是否必须    |  类型     |  描述      |  默认值     |  取值范围  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
 symbol         |  true           |  string     |  交易对            |        | 支持大小写， 交易对,"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示BTC次季度合约。支持使用合约code来订阅 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。  |
 size           |  true           |  string     |  档位数       |        |  20:表示20档不合并的深度，150:表示150档不合并的深度  |

> response：

```json

{
    "ch":"market.BTC_CQ.depth.size_20.high_freq",
    "tick":{
        "asks":[
            [
                13576.41,
                2627
            ],
            [
                13576.53,
                122
            ]
        ],
        "bids":[
            [
                13576.4,
                1648
            ],
            [
                13574.17,
                398
            ]
        ],
        "ch":"market.BTC_CQ.depth.size_20.high_freq",
        "event":"snapshot",
        "id":113842925649,
        "mrid":113842925649,
        "ts":1604385634838,
        "version":330099154
    },
    "ts":1604385634838
}
```

### 返回参数

参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
ch | true |  string | 数据所属的 channel，格式： market.$symbol.depth.size_${size}.high_freq | | 
ts | true | long | 进入行情服务器系统时间点，单位：毫秒 | |
\<tick\>    |               |    |      |            | 
mrid  | true| long | 订单ID | 
id  | true| long | tick ID | 
asks | true | object |卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序 | | 
bids | true| object | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序 | | 
ts | true | long | 系统检测orderbook时间点，单位：毫秒 | |
version | true | long | 版本号 | |
ch | true |  string | 数据所属的 channel，格式： market.$symbol.depth.size_${size}.high_freq | | 
event | true |  string | 事件类型；"update":更新，表示推送买卖各20档或150档不合并深度的增量数据；"snapshot":快照值，表示推送买卖各20档或150档不合并深度的全量数据 | | 
\</tick\>    |               |    |      |            | | 

### Note
1、	当"data_type"为incremental时，首次推送的"event"为"snapshot"的数据，且当重新发送订阅请求时，首次返回都是"snapshot"的数据；

2、深度即可以按照合约周期订阅，也可以按照合约代码订阅，行情系统在进行数据计算时，需要更新对应类型的数据；

3、version（版本号），是自增的序号，每次增加1，不管是增量还是全量数据,每个连接是唯一的。多个websocket连接的version是可能不同的。

4、每30ms检查一次orderbook，如果有更新，则推送，如果没有更新，则不推送。

5、如果是增量数据，要自己维护好本地的orderbook bids\asks 数据。

  

##  订阅买一卖一逐笔行情数据(BBO)

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来请求数据:

{

    "sub": "market.$symbol.bbo",

    "id": "id generated by client"

}

> 正确订阅请求参数的例子：

```json

{
    "sub": "market.BTC_CQ.bbo",
    "id": "id generated by client"
}
```

### 请求参数
  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  sub  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.bbo，详细参数见sub订阅参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id      |           |  

### sub订阅参数说明
  参数名称   |  是否必须    |  类型     |  描述      |  默认值     |  取值范围  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
 symbol         |  true           |  string     |  交易对            |        | 交易对（大小写不敏感，均支持）,如“BTC190412”表示BTC品种下，到期日为2019年04月12日的合约，"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约，"BTC_NQ"表示BTC次季度合约。支持使用合约code来订阅 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。  |

> Response：

```json

{
    "ch":"market.BTC_CQ.bbo",
    "ts":1604385767803,
    "tick":{
        "mrid":113843014986,
        "id":1604385767,
        "bid":[
            13579.06,
            1488
        ],
        "ask":[
            13579.07,
            1535
        ],
        "ts":1604385767803,
        "version":113843014986,
        "ch":"market.BTC_CQ.bbo"
    }
}
```

### 返回参数

参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
-------- | -------- | -------- |  --------------------------------------- | -------------- | 
ch | true |  string | 数据所属的 channel，格式： market.$symbol.bbo | | 
ts | true | long | 进入行情服务器系统时间点，单位：毫秒 | |
 \<tick\>    |               |    |      |            | 
mrid  | true| long | 订单ID | 
id  | true| long | tick ID | 
ask | false | object |卖盘,[price(挂单价), vol(此价格挂单张数)]| | 
bid | false| object | 买盘,[price(挂单价), vol(此价格挂单张数)]| | 
ts | true | long | 系统检测orderbook时间点，单位：毫秒 | |
version | true | long | 版本号 | |
ch | true |  string | 数据所属的 channel，格式： market.$symbol.bbo | | 
 \</tick\>    |               |    |      |            | | 

### 说明

1、当买一价、买一量、卖一价、卖一量，其中任一数据发生变化时，进行逐笔推送；

2、如果同一时刻有多个买一卖一的价格/单量的变化，直接用最新的买一卖一进行推送；

3、由于客户端网络等原因导致接收数据失败，服务端会丢弃旧的队列数据；

4、version（版本号），直接取撮合id，保证全局唯一并且最新的推送版本号都是数值最大的。
  


## 订阅 Market Detail 数据 

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来请求数据:

`{`

`"sub": "market.$symbol.detail",`

`"id": "id generated by client"`

`}`

> 订阅 Market Detail 数据请求参数的例子：

```json

    {
     "sub": "market.BTC_CQ.detail",
     "id": "id6"
    }

```

### 请求参数
  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  sub  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.detail，详细参数见sub订阅参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id      |           |  

### sub订阅参数说明
  参数名称   |  是否必须    |  类型     |  描述      |  默认值     |  取值范围  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
 symbol         |  true           |  string     |  交易对            |        | 支持大小写， 交易对,"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季度合约。支持使用合约code来订阅 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。  |

> 请求成功返回数据的例子：

```json

{
    "ch":"market.BTC_CQ.detail",
    "ts":1604385863717,
    "tick":{
        "id":1604385840,
        "mrid":113843084999,
        "open":13607.17,
        "close":13589,
        "high":13830.63,
        "low":13411.89,
        "amount":261417.4288915740193389700120854767791857974,
        "vol":35572590,
        "count":586972,
        "bid":[
            13579.06,
            1488
        ],
        "ask":[
            13579.07,
            1535
        ]
    }
}
```

### 返回参数

参数名称     |  是否必须    |   数据类型     |  描述  |
-------------- |  -------------- |  -------------- |  ----------------------------------------------------------  |
ch  |  true  |  string  |    数据所属的 channel，格式： market.$symbol.detail |     
ts  |  true  |  long  |    响应生成时间点，单位：毫秒  |    
\<tick\>    |               |    |      |           
id  |  true  |  long  |    ID  |    
mrid  |  true  |  long  |    订单ID  |    
open  |  true  |  decimal  |    开盘价  |     
close  |  true  |  decimal  |    收盘价,当K线为最晚的一根时，是最新成交价  |    
high  |  true  |  decimal  |    最高价  |     
low  |  true  |  decimal  |    最低价  |     
amount  |  true  |  decimal  |    成交量(币), 即 sum(每一笔成交量(张) * 单张合约面值/该笔成交价)。 值是买卖双边之和  |   
vol  |  true  |  decimal  |   成交量（张）。 值是买卖双边之和 |     
count  |  true  |  decimal  |   成交笔数。 值是买卖双边之和  |   
ask  |  true  |  array  |   [卖1价,卖1量(张)]  | 
bid  |  true  |  array  |   [买1价,买1量(张)]  |   
\</tick\>    |               |    |      |           

#### 备注
 - 买一卖一并非实时更新，会存在部分延迟（500ms左右）。


## 请求 Trade Detail 数据

### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来请求数据：

`{`
     
   `"req": "market.$symbol.trade.detail",`
    
   `"id": "id generated by client"//目前这个字段可以不传，暂时没有用到，不管传啥都返回null`
    
   `"size": "Number of data"//数据条数，最多50条，不填默认50`

`}`


> 请求 Trade Detail 数据请求参数的例子：

```json


    {
     "req": "market.BTC_CQ.trade.detail",
     "size": 10,
     "id": "id8"
    }

```


### 请求参数

  参数名称   |  是否必须    |  类型     |  描述      |  取值范围     | 
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ | 
 req         |  true           |  string     |  请求数据的主题，该接口固定为：market.$symbol.trade.detail，详细参数见req请求参数说明           |        | 
 id         |  false           |  string     |  业务方自主生成的ID         |        | 
 size         |  false           |  int     |  数据条数，最多50条，不填默认50            |   [1,50]     | 


### req请求参数说明
  参数名称   |  是否必须    |  类型     |  描述      |  默认值     |  取值范围  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
 symbol         |  true           |  string     |  交易对            |        | 支持大小写， 交易对,"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季度合约"。支持使用合约code来订阅 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。  |

仅返回当前 Trade Detail

> 请求成功返回数据的例子：

```json

{
    "data":[
        {
            "amount":"4",
            "ts":1604386167285,
            "id":1138433247400000,
            "price":"13586.25",
            "direction":"buy",
            "quantity": "0.0013"
        },
        {
            "amount":"20",
            "ts":1604386167469,
            "id":1138433248730000,
            "price":"13586.25",
            "direction":"buy",
            "quantity": "0.0157"
        }
    ],
    "id":"id8",
    "rep":"market.BTC_CQ.trade.detail",
    "status":"ok",
    "ts":1604386202755
}
```

### 返回参数

参数名称     |  是否必须   |  类型   |  描述  |  默认值   | 
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ | 
rep  |  true  |  string  |  数据所属的 channel，格式： market.$symbol.trade.detail  |  |   
status  |  true  |  string  |  返回状态  |  |   
id  |  true  |  string  | 请求 ID  |   |    
 \<data\>    |               |    |      | 
id  |  true  |  long  |  成交唯一id（品种唯一）  |   |    
price  |  true  |  string  |  价格  |   |    
amount  |  true  |  string  | 成交量(张)。 值是买卖双边之和 |   |    
direction  |  true  |  string  |  买卖方向，即taker(主动成交)的方向 |   |    
ts  |  true  |  long  |  订单成交时间  |   |    
quantity  |  true  |  string  |  成交量（币）  |   |   
 \</data\>    |               |    |      | 
ts  |  true  |  long  |  发送时间  |   |   

#### 备注
- 2021年2月3日 21:00:00 后返回参数才会有quantity字段。


## 订阅 Trade Detail 数据 

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：

`{`
 
  `"sub": "market.$symbol.trade.detail",`
    
  `"id": "id generated by client"`
    
`}`

> 正确订阅请求参数的例子：

```json

    {
     "sub": "market.BTC_CQ.trade.detail",
     "id": "id7"
    }
    
```
### 请求参数

  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  sub  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.trade.detail，详细参数见sub订阅参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id      |           |  

### sub订阅参数说明
  参数名称   |  是否必须    |  类型     |  描述      |  默认值     |  取值范围  |
  -------------- |   -------------- |  ---------- |  ------------ |  ------------ |  ---------------------------------------------------------------------------------  |
 symbol         |  true           |  string     |  交易对            |        | 支持大小写， 交易对,"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季度合约"，支持使用合约code来订阅 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。  |


> 之后每当 Trade Detail 有更新时，client 会收到数据，例子：

```json

{
    "ch":"market.BTC_CQ.trade.detail",
    "ts":1604386599136,
    "tick":{
        "id":113843672389,
        "ts":1604386599123,
        "data":[
            {
                "amount":120,
                "ts":1604386599123,
                "id":1138436723890000,
                "price":13562.5,
                "direction":"sell",
                "quantity": 0.157
            },
            {
                "amount":2,
                "ts":1604386599123,
                "id":1138436723890001,
                "price":13562.5,
                "direction":"sell",
                "quantity": 0.00152
            }
        ]
    }
}
```

### 返回参数

参数名称     |  是否必须   |  类型   |  描述  |  默认值   | 
--------------  | --------------  | ----------  | ---------------------------------------------------------  | ------------ | 
ch  |  true  |  string  |  数据所属的 channel，格式： market.$symbol.trade.detail  |  |   
ts  |  true  |  long  |  发送时间  |   |    
\<tick\>    |               |    |      | 
id  |  true  |  long  |  订单唯一id（品种唯一）  |   |    
ts  |  true  |  long  |  tick数据戳  |   |    
\<data\>    |               |    |      | 
amount  |  true  |  decimal  |  数量（张）。 值是买卖双边之和 |   |    
ts  |  true  |  long  | 订单时间戳  |   |    
id  |  true  |  long  | 成交唯一id（品种唯一）  |   |    
price  |  true  |  decimal  |  价格  |   |    
direction  |  true  |  string  |  买卖方向，即taker(主动成交)的方向 |   |  
quantity  |  true  |  decimal  |  成交量（币）  |   |    
\</data\>    |               |    |      | 
\</tick\>    |               |    |      | 



# WebSocket指数与基差数据接口

 指数与基差数据订阅ws地址：wss://api.hbdm.com/ws_index 

## 订阅(sub)指数K线数据

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：

`{`

  `"sub": "market.$symbol.index.$period",`

  `"id": "id generate by client"`

`}`

> 正确订阅请求参数的例子：

```json

    {
    "sub": "market.BTC-USD.index.1min",
    "id": "id1"
    }

```
### 请求参数
  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  sub  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.index.$period，详细参数见sub订阅参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id      |           |  

### sub订单参数说明
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | 指数标识          |         | 支持大小写，"BTC-USD","ETH-USD"...                           |
| period          | true     | string  | K线类型               |         | 仅支持小写,1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |


### 备注
  - 当指数有变化时会推送;
  
  - 指数无变化时会根据订阅的周期推送；


> 之后每当 KLine 有更新时，client 会收到数据

```json

{
    "ch":"market.BTC-USD.index.1min",
    "ts":1604387688243,
    "tick":{
        "id":1604387640,
        "open":"13419.4325",
        "close":"13420.3325",
        "high":"13424.4925",
        "low":"13419.4325",
        "amount":"0",
        "vol":"0",
        "count":0
    }
}
```
### 返回参数
| **参数名称**    | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| -----------  | ------ | ------------- | ------- | ---------------------------------------- |
| ch      | string | 数据所属的 channel，格式： market.$symbol.index.$period |                | |
| ts      | long | 响应生成时间点，单位：毫秒                   |                | |
| \<tick\>      | object array |                 |                | |
| id | string | 指数K线id,也就是K线时间戳，K线起始时间  |
| vol | string  | 成交量张数为0             |
| count | decimal  | 成交笔数为0              |
| open | string  | 开盘指数价               |
| close | string  | 收盘指数价              |
| low | string  |  最低指数价             |
| high | string  | 最高指数价               |
| amount | string  | 数值为0              |
| \</tick\>      |   |   |   |


## 请求(req)指数K线数据

### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来请求数据：

`{`
     
   `"req": "market.$symbol.index.$period",`
    
   `"id": "id generated by client",`

   `"from": "type: long, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒",`
   
   `"to": "type: long, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒，必须比 from 大",`
    
`}`

> 正确订阅请求参数的例子:

```json

    {
    "req": "market.btc-usd.index.1min",
    "id": "id4",
    "from":1571000000,
    "to":1573098606
    }
```

### 请求参数

  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  req  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.index.$period，详细参数见req请求参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id      |           |  
  from     | true     | long  | 开始时间,2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒               |         |  
  to       | true     | long  | 结束时间, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒，必须比 from 大              |         | 

### req请求参数说明：
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | 指数标识          |         |支持大小写, "BTC-USD","ETH-USD"...                           |
| period          | true     | string  | K线类型               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |


### 说明：
- 一次返回最多2000条数据；

> 请求成功返回数据的例子：

```json

{
    "id":"id4",
    "rep":"market.BTC-USD.index.60min",
    "wsid":915217437,
    "status":"ok",
    "data":[
        {
            "id":1604160000,
            "open":13862.65,
            "close":13832.615,
            "low":13822.41,
            "high":13890.2225,
            "amount":0,
            "vol":0,
            "count":0
        },
        {
            "id":1604163600,
            "open":13832.7725,
            "close":13788.6625,
            "low":13751.9075,
            "high":13833.41,
            "amount":0,
            "vol":0,
            "count":0
        }
    ]
}
```

### 返回参数
| **参数名称**    | **类型** | **描述**        | **取值范围**       |
| -----------  | ------ | ------------- | --------------------- |
| req     |  string | 数据所属的 channel，格式：market.$symbol.index.$period  |                | |
| status |  string | 请求处理结果                          | "ok" , "error" | |
| id     |  string | 业务方id       |                | |
| wsid     |  long | wsid           |                | |
| ts     |  long | 响应生成时间点，单位：毫秒                   |                | |
| \<data\>    |    object array    |    |                | |
| id | decimal | 指数K线id,也就是K线时间戳，K线起始时间  |
| vol | decimal  | 成交量张数为0             |
| count | decimal  | 成交笔数为0              |
| open | decimal  | 开盘指数价               |
| close | decimal  | 收盘指数价              |
| low | decimal  |  最低指数价             |
| high | decimal  | 最高指数价               |
| amount | decimal  | 数值为0              |
| \</data\>    |    object array    |    |   



## 订阅(sub)基差数据

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：

`{`

  `"sub": "market.$symbol.basis.$period.$basis_price_type",`

  `"id": "id generate by client"`

`}`

> 正确订阅请求参数的例子：

```json

    {
    "sub": "market.BTC_CW.basis.1min.open",
    "id": "id1"
    }

```
### 请求参数
  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  sub  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.basis.$period.$basis_price_type，详细参数见sub订阅参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id      |           |  


### sub订阅参数说明：
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | 合约名称          |         | 支持大小写，如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季合约"                          |
| period          | true     | string  | 周期               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |
| basis_price_type     | false     | string  | 基差价格类型，表示在周期内计算基差使用的价格类型              |    不填，默认为使用开盘价 （open）    |    开盘价：open，收盘价：close，最高价：high，最低价：low，平均价=（最高价+最低价）/2：average   |

 - 备注：次季度的基差数据在2020/6/15 14:00:00后才开始生成

> 之后每当基差有更新时，client 会收到数据，例子

```json

{
    "ch":"market.BTC_CW.basis.5min.close",
    "ts":1604387856115,
    "tick":{
        "id":1604387700,
        "index_price":"13434.5075",
        "contract_price":"13454.01",
        "basis":"19.5025",
        "basis_rate":"0.0014516721212147151654052074480586653"
    }
}
```

### 返回参数

| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch     | true | string | 数据所属的 channel，格式：market.$symbol.basis.$period.$basis_price_type |                | |
| \<tick\> |   true   |    object array    |     |                | |
| id | true | long | 唯一标识 |  |
| contract_price | true | string | 合约最新成交价 |  |
| index_price | true | string | 指数基准价，与基差价格类型匹配 |  |
| basis | true | string | 基差=合约基准价 - 指数基准价 |  |
| basis_rate | true | string | 基差率=基差/指数基准价 |  |
| \</tick\> |  |  |  | 
| ts     | true | long | 响应生成时间点，单位：毫秒                   |                | |


## 请求(req)基差数据

### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来请求数据：

`{`
     
   `"req": "market.$symbol.basis.$period.$basis_price_type",`
    
   `"id": "id generated by client",`

   `"from": "type: long, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒",`
   
   `"to": "type: long, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒，必须比 from 大",`
    
`}`

> 正确订阅请求参数的例子:

```json

    {
    "req": "market.btc_cw.basis.1min.open",
    "id": "id4",
    "from":1571000000,
    "to":1573098606
    }
```

### 请求参数

  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  sub  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.basis.$period.$basis_price_type，详细参数见req请求参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id      |           |  
 from          | true     | long  | 开始时间,2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒               |         |    
 to          | true     | long  | 结束时间, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒，必须比 from 大              |         |   

### req请求参数说明：
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true     | string | 合约名称          |         | 支持大小写，如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约, "BTC_NQ"表示次季合约"                          |
| period          | true     | string  | 周期               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1mon     |
| basis_price_type     | false     | string  | 基差价格类型，表示在周期内计算基差使用的价格类型              |    不填，默认为使用开盘价 （open）    |    开盘价：open，收盘价：close，最高价：high，最低价：low，平均价=（最高价+最低价）/2：average   |


### 说明：
- 一次返回最多2000条数据；

> 请求成功返回数据的例子：

```json

{
    "data":[
        {
            "basis":"20.357500000000073",
            "basis_rate":"0.0014671752201438544",
            "contract_price":"13895.66",
            "id":1604160000,
            "index_price":"13875.3025"
        },
        {
            "basis":"20.13249999999971",
            "basis_rate":"0.001454177342461542",
            "contract_price":"13864.73",
            "id":1604160300,
            "index_price":"13844.5975"
        }
    ],
    "id":"id4",
    "rep":"market.BTC_CW.basis.5min.close",
    "status":"ok",
    "ts":1604387965575,
    "wsid":3823737955
}
```

### 返回参数

| **参数名称**    | **是否必须** | **类型** | **描述**        |  **取值范围**                                 |
| ----------- | -------- | ------ | ------------- |  ---------------------------------------- |
| req     | true | string | 数据所属的 channel，格式：market.$symbol.basis.$period.$basis_price_type |                | |
| status | true | string | 请求处理结果                          | "ok" , "error" | |
| id     | true | string | 业务方id       |                | |
| wsid     | true | long | wsid           |                | |
| ts     | true | long | 响应生成时间点，单位：毫秒                   |                | |
| \<data\> |   true   |    object array    |     |                | |
| id | true |  long | 唯一标识 |  |
| contract_price | true |  string | 合约最新成交价 |  |
| index_price | true |  string | 指数基准价，与基差价格类型匹配 |  |
| basis | true |  string | 基差=合约基准价 - 指数基准价 |  |
| basis_rate | true |  string | 基差率=基差/指数基准价 |  |
| \</data\> |    |       |     |             


## 订阅标记价格K线数据

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：

`{`

  `"sub": "market.$symbol.mark_price.$period",`

  `"id": "id generate by client"`

`}`

> 正确订阅请求参数的例子：

```json

    {
    "sub": "market.BTC_CW.mark_price.1min",
    "id": "id1"
    }

```
### 请求参数
  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  sub  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.mark_price.$period，详细参数见sub订阅参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id      |           |  

### sub订单参数说明
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true | string  | 合约标识 |   | 如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约 ，"BTC_NQ"表示BTC次季度合约季度合约。支持使用合约code来查询数据， 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。 |
| period      | true     | string  | K线类型               |         | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1week, 1mon     |


> 每当标记价格有更新时，client 会收到数据，例子

```json
{
    "ch":"market.BTC_CW.mark_price.15min",
    "ts":1615773631266,
    "tick":{
        "id":1615773600,
        "open":"60533.89",
        "close":"60603.01",
        "high":"60603.01",
        "low":"60533.89",
        "amount":"0",
        "vol":"0",
        "count":"0"
    }
}
```
### 返回参数：
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| ch     | true | string | 数据所属的 channel|                | |
| \<tick\> |   true   |    object array    |               |                | |
| id     | true | long | k线id        |                | |
| vol     | true | string | 成交量(张)，数值为0        |                | |
| count     | true | string | 成交笔数，数值为0        |                | |
| open     | true | string | 开盘值        |                | |
| close     | true | string | 收盘值       |                | |
| low     | true | string | 最低值        |                | |
| high     | true | string | 最高值       |                | |
| amount     | true | string | 成交量(币), 数值为0        |                | |
| \</tick>            |      |        |               |                | |
| ts     | true | number | 响应生成时间点，单位：毫秒                   |                | |


## 请求标记价格K线数据

### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来请求数据：

`{`
     
   `"req": "market.$symbol.mark_price.$period",`
    
   `"id": "id generated by client",`

   `"from": "type: long 单位：秒",`
   
   `"to": "type: long 单位：秒，必须比 from 大",`
    
`}`

> 正确订阅请求参数的例子:

```json

    {
    "req": "market.BTC_CW.mark_price.1imin",
    "id": "id4",
    "from":1571000000,
    "to":1573098606
    }
```

### 请求参数
  参数名称  |   是否必须   |   类型    |   描述   |    默认值  |  
--------------| -----------------| ---------- |----------| ------------  | 
  req  |       true         |  string  |  需要订阅的主题，该接口固定为：market.$symbol.mark_price.$period，详细参数见req请求参数说明    |               |  
  id   |     false          | string   |  业务方自主生成的id      |           |  
  from     | true     | long  | 开始时间，单位：秒               |         |  
  to       | true     | long  | 结束时间，单位：秒，必须比 from 大              |         | 

### req请求参数说明：
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| symbol      | true  | string  | 合约标识 |   | 如"BTC_CW"表示BTC当周合约，"BTC_NW"表示BTC次周合约，"BTC_CQ"表示BTC当季合约 ，"BTC_NQ"表示BTC次季度合约季度合约。支持使用合约code来查询数据， 例如："BTC200918"(当周)，"BTC200925"(次周)，"BTC201225"(季度)，"BTC210326"(次季度)。 |
| period      | true  | string  | K线类型  |   | 1min, 5min, 15min, 30min, 60min,4hour,1day, 1week, 1mon     |


### 说明：
- 一次返回最多2000条数据；

> 请求成功返回数据的例子：

```json
{
    "id":"id4",
    "rep":"market.BTC_CW.mark_price.15min",
    "wsid":2998253842,
    "ts":1615773843201,
    "status":"ok",
    "data":[
        {
            "id":1615651200,
            "open":"60284.67",
            "close":"60362.04",
            "low":"60270.85",
            "high":"60468.55",
            "amount":"0",
            "vol":"0",
            "count":"0"
        }
    ]
}
```

### 返回参数：
| **参数名称**    | **是否必须** | **类型** | **描述**        | **默认值** | **取值范围**                                 |
| ----------- | -------- | ------ | ------------- | ------- | ---------------------------------------- |
| rep     | true | string | 数据所属的 channel|                | |
| status | true | string | 请求处理结果                         | | "ok" , "error" | 
| id     | true | string | 业务方id       |                | |
| wsid     | true | long | wsid           |                | |
| ts     | true | number | 响应生成时间点，单位：毫秒                   |                | |
| \<data\> |   true   |    object array    |               |                | |
| id     | true | long | k线id        |                | |
| vol     | true | string | 成交量(张)，数值为0        |                | |
| count     | true | string | 成交笔数，数值为0        |                | |
| open     | true | string | 开盘值        |                | |
| close     | true | string | 收盘值      |                | |
| low     | true | string | 最低值        |                | |
| high     | true | string | 最高值      |                | |
| amount     | true | string | 成交量(币), 数值为0        |                | |
| \</data\>            |      |        |               |                | |

#### 备注
 - 标记价格于2021-3-15上线后才有数据。此前是没有历史数据的请悉知。


# WebSocket订单和用户数据接口

## 订阅订单成交数据（sub）

成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

### 订阅请求数据格式

`{`
  
  `“op”: “sub”,`
  
  `"cid": "id generated by client”,`
  
  `“topic": "orders.$symbol”`

`}`

> 正确的订阅请求:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "orders.btc"
}

```

### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| ------- | ----- | ------------------------------------------ |
| op       | string | 必填；操作名称，订阅固定值为sub             |
| cid      | string | 选填;Client 请求唯一 ID                     |
| topic    | string | 必填；订阅主题名称，orders.$symbol;  symbol支持大小写，比如：BTC,ETH ;当 $symbol值为 * 时代表订阅所有品种; |

- 备注：postOnly的报单收到的WS推送要么是报单成功，状态为3，要么是7，已撤单。

> 成交详情通知数据格式说明

```json

{
    "op":"notify",
    "topic":"orders.ada",
    "ts":1604388667226,
    "symbol":"ADA",
    "contract_type":"quarter",
    "contract_code":"ADA201225",
    "volume":1,
    "price":0.0905,
    "order_price_type":"post_only",
    "direction":"sell",
    "offset":"open",
    "status":6,
    "lever_rate":20,
    "order_id":773207641127878656,
    "order_id_str":"773207641127878656",
    "client_order_id":null,
    "order_source":"web",
    "order_type":1,
    "created_at":1604388667146,
    "trade_volume":1,
    "trade_turnover":10,
    "fee":-0.022099447513812154,
    "trade_avg_price":0.0905,
    "margin_frozen":0,
    "profit":0,
    "is_tpsl": 0,
    "real_profit": 0,
    "trade":[
        {
            "trade_fee":-0.022099447513812154,
            "fee_asset":"ADA",
            "trade_id":113913755890,
            "id":"113913755890-773207641127878656-1",
            "trade_volume":1,
            "trade_price":0.0905,
            "trade_turnover":10,
            "created_at":1604388667194,
            "real_profit": 0,
            "profit":0,
            "role":"maker"
        }
    ],
    "canceled_at":0,
    "fee_asset":"ADA",
    "uid":"123456789",
    "liquidation_type":"0"
}
```

### 成交推送返回数据格式说明

| 字段名称                | 类型    | 说明                                                         |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op                      | string  | 必填;操作名称，推送固定值为 notify;                          |
| topic                   | string  | 必填;推送的主题                                              |
| uid                   | string  | 必填;账户ID                                              |
| ts                      | long    | 服务端应答时间戳                                             |
| symbol                  | string  | 品种ID                                                       |
| contract_type           | string  | 合约类型                                                     |
| contract_code           | string  | 合约代码                                                     |
| volume                  | decimal | 委托数量                                                     |
| price                   | decimal | 委托价格                                                     |
| order_price_type        | string  | 订单报价类型 "limit":限价，"opponent":对手价，"post_only":只做maker单,post only下单只受用户持仓数量限制，"lightning":闪电平仓，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档，"fok":FOK订单，"ioc":IOC订单, "opponent_ioc": 对手价-IOC下单，"lightning_ioc": 闪电平仓-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"lightning_fok"：闪电平仓-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单                 |
| direction               | string  | "buy":买 "sell":卖                                           |
| offset                  | string  | "open":开 "close":平                                         |
| status                  | int     | 订单状态(1准备提交 2准备提交 3已提交 4部分成交 5部分成交已撤单 6全部成交 7已撤单) |
| lever_rate              | int     | 杠杆倍数                                                     |
| order_id                | long    | 订单ID                                                       |
| order_id_str            | string   | 订单ID                                                       |
| client_order_id         | long    | 客户订单ID                                                   |
| order_source            | string     | 订单来源（system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发、tpsl:止盈止损触发） |
| order_type              | int     | 订单类型  1:报单 、 2:撤单 、 3:强平、4:交割                 |
| created_at              | long    | 订单创建时间                                                 |
| canceled_at              | long    | 订单撤单时间                                                 |
| trade_volume            | decimal | 总成交数量                                                     |
| trade_turnover          | decimal | 成交总金额                                                   |
| fee                     | decimal | 手续费                                                       |
| fee_asset               | string | 手续费币种                                                       |
| trade_avg_price         | decimal | 成交均价                                                     |
| margin_frozen           | decimal | 冻结保证金                                                   |
| profit                  | decimal | 订单总平仓盈亏（使用持仓均价计算，不包含仓位跨结算的已实现盈亏。）     |
| liquidation_type | string     | 强平类型 0:非强平类型，1：多空轧差， 2:部分接管，3：全部接管  |
| is_tpsl | int     | 是否设置止盈止损，1：是；0：否  |
| real_profit  | decimal | 订单总真实收益（使用开仓均价计算，包含仓位跨结算的已实现盈亏。）  |  |
| \<trade\>  |   list     |                                                              |
| id            | string| 	全局唯一的交易标识                                                       |
| trade_id                | long    | 撮合结果id,与api/v1/contract_matchresults返回结果中的match_id一样， 非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id                                                  |
| trade_volume            | decimal | 成交量                                                       |
| trade_price             | decimal | 撮合价格                                                     |
| trade_fee               | decimal | 成交手续费                                                   |
| trade_turnover          | decimal | 成交金额                                                     |
| created_at              | long    | 成交创建时间                                                 |
| role                    | string  | taker或maker                                                 |
| real_profit             | decimal | 该笔成交的真实收益（使用开仓均价计算，包含仓位跨结算的已实现盈亏。）  |  |
| profit                  | decimal | 该笔成交的平仓盈亏（使用持仓均价计算，不包含仓位跨结算的已实现盈亏。）    |
| fee_asset  | string | 手续费币种  |
| \</trade\>                  |         |                                                             |

#### 备注：
 - 真实收益为开仓均价和成交价计算得出（订单的真实收益为订单下每笔成交的真实收益之和）。
 - 只有在2021年1月30日0点后创建的订单以及对应的成交，真实收益字段（real_profit）才会有值。存量数据均为0。

## 取消订阅订单成交数据（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

`{`

  `“op”: “unsub”,`
  
  `“topic": "orders.$symbol”,`
  
  `"cid": "id generated by client”,`
  
`}`

> 正确的取消订阅请求:

```json

{
  "op": "unsub",
  "topic": "orders.btc",
  "cid": "40sG903yz80oDFWr"
}

```

### 取消订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                               |
| ------- | ----- | ------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 必填;待取消订阅主题名称:orders.$symbol; symbol支持大小写，比如:BTC,ETH ;  当 $symbol值为 * 时代表取消订阅所有品种; |


### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| orders.*       | orders.*        | 允许   |
| orders.symbol1 | orders.*        | 允许   |
| orders.symbol1 | orders.symbol1  | 允许   |
| orders.symbol1 | orders.symbol2  | 不允许 |
| orders.*       | orders.symbol1  | 不允许 |

## 订阅订单撮合数据（sub）

成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

### 订阅请求数据格式

`{`
  
  `“op”: “sub”,`
  
  `"cid": "cid”,`
  
  `“topic": "matchOrders.$symbol”`

`}`

> 正确的订阅请求:

``` json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "matchOrders.btc"
}

```

### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| ------- | ----- | ------------------------------------------ |
| op       | string | 必填；操作名称，订阅固定值为sub             |
| cid      | string | 选填;Client 请求唯一 ID                     |
| topic    | string | 必填，订阅主题名称:matchOrders.$symbol;  symbol支持大小写，比如：BTC，ETH ; 当 $symbol值为 * 时代表订阅所有品种; |

#### 备注：
- postOnly的报单收到的WS推送要么是报单成功，状态为3，要么是7，已撤单;
- 撮合完成后就将订单的更新信息推送给客户端;
- 交割订单不走撮合不走清算，所以撮合后不推送，清算后也不推送；
- 强平以及轧差订单不会推送；
- 外部划转或内部转账订单不作为订单推送；
- 通常情况下，撮合完成后的推送要比清算完成后的推送快，但不能保证撮合完成后的推送一定比清算完成后的推送更快;
- 撮合后的推送，假设1个matchresult包含N笔成交，包括1个taker和N个maker，那最多推送N+1笔；
- 如果遇到推送的status状态为9或者10，可以直接忽略。

> 成交详情通知数据格式说明


```json

{
    "op":"notify",
    "topic":"matchOrders.ada",
    "ts":1604388667219,
    "symbol":"ADA",
    "contract_code":"ADA201225",
    "contract_type":"quarter",
    "status":6,
    "order_id":773207641127878656,
    "order_id_str":"773207641127878656",
    "client_order_id":null,
    "order_type":1,
    "created_at":1604388667146,
    "trade":[
        {
            "trade_id":113913755890,
            "id":"113913755890-773207641127878656-1",
            "trade_volume":1,
            "trade_price":0.0905,
            "trade_turnover":10,
            "created_at":1604388667194,
            "role":"maker"
        }
    ],
    "uid":"123456789",
    "volume":1,
    "trade_volume":1,
    "direction":"sell",
    "offset":"open",
    "lever_rate":20,
    "price":0.0905,
    "order_source":"web",
    "is_tpsl": 0,
    "order_price_type":"post_only"
}
```

### 成交推送返回数据格式说明

| 字段名称                | 类型    | 说明                                                         |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op                      | string  | 操作名称，推送固定值为 notify;                          |
| topic                   | string  | 推送的主题                                              |
| uid                   | string  | 账户UID                                              |
| ts                      | long    | 服务端应答时间戳                                             |
| symbol                  | string  | 品种ID                                                       |
| contract_type           | string  | 合约类型                                                     |
| contract_code           | string  | 合约代码                                                     |
| status                  | int     | 订单状态(1准备提交 2准备提交 3已提交 4部分成交 5部分成交已撤单 6全部成交 7已撤单) |
| order_id                | long    | 订单ID                                                       |
| order_id_str            | string   | 订单ID                                                       |
| client_order_id   |  long |  客户端订单ID  | 
| order_type              | int     | 订单类型  1:报单 、 2:撤单 、 3:强平、4:交割                 |
| trade_volume            | decimal | 订单已成交数量                                                       |
| volume            | decimal | 订单总委托数量                                                       |
| \<trade\> |   list      |                                                              |
| id            | string| 全局唯一交易标识	                                                       |
| trade_id                | long    | 撮合结果id，与api/v1/contract_matchresults返回结果中的match_id一样, 非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id                                                  |
| trade_volume            | decimal | 成交量                                                       |
| trade_price             | decimal | 撮合价格                                                     |
| trade_turnover          | decimal | 成交金额                                                     |
| created_at              | long    | 创建时间                                                 |
| role             | string  | taker或maker                                                 |
| \</trade\>                  |         |                                                             |
| direction              | string    | 	买卖方向: "buy":买 "sell":卖                                 |
| offset              | string    |	开平方向:  "open":开 "close":平                                 |
| lever_rate              | int    | 	杠杆倍数                                                 |
| price              | decimal    | 委托价格	                                                 |
| created_at              | long    | 创建时间                                                 |
| is_tpsl              | int    | 是否设置止盈止损，1：是；0：否                                                 |
| order_source              | string    | 订单来源（system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发、tpsl:止盈止损触发）|
| order_price_type              | string    | 订单报价类型: "limit":限价，"opponent":对手价 ，"post_only":只做maker单,post only下单只受用户持仓数量限制,"optimal_5"：最优5档，"optimal_10"：最优10档，"optimal_20"：最优20档，"ioc":IOC订单，"fok"：FOK订单,"opponent_ioc": 对手价-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单     |


## 取消订阅订单撮合数据（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

`{`

  `“op”: “unsub”,`
  
  `“topic": "matchOrders.btc”,`
  
  `"cid": "id generated by client”,`
  
`}`

> 正确的取消订阅请求:

```json

{
  "op": "unsub",
  "topic": "matchOrders.$symbol",
  "cid": "40sG903yz80oDFWr"
}

```

### 取消订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                               |
| ------- | ----- | ------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 必填;待取消订阅主题名:matchOrders.$symbol;  symbol支持大小写，比如:BTC,ETH ; 当 $symbol值为 * 时代表取消订阅所有品种; |


### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| matchOrders.*       | matchOrders.*        | 允许   |
| matchOrders.symbol1 | matchOrders.*        | 允许   |
| matchOrders.symbol1 | matchOrders.symbol1  | 允许   |
| matchOrders.symbol1 | matchOrders.symbol2  | 不允许 |
| matchOrders.*       | matchOrders.symbol1  | 不允许 |


## 订阅资产变动数据（sub）

成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

### 订阅请求数据格式

`{`

  `"op": "sub",`
  
  `"cid": "id generated by client”,`
  
  `“topic": "accounts.$symbol”`

`}`

> 正确的订阅请求:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "accounts.btc"
}

```

### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| ------- | ----- | ------------------------------------------ |
| op       | string | 必填；操作名称，订阅固定值为sub             |
| cid      | string | 选填;Client 请求唯一 ID                     |
| topic    | string | 必填；订阅主题名称: accounts.$symbol;  symbol支持大小写，比如：BTC，ETH  ; 当 $symbol值为 * 时代表订阅所有品种; |

> 当资产有更新时，返回的参数示例如下:

```json

{
    "op":"notify",
    "topic":"accounts.ada",
    "ts":1604388667226,
    "event":"order.match",
    "data":[
        {
            "symbol":"ADA",
            "margin_balance":446.417641681222726716,
            "margin_static":445.554085945257745136,
            "margin_position":11.049723756906077348,
            "margin_frozen":0,
            "margin_available":435.367917924316649368,
            "profit_real":21.627049781983019459,
            "profit_unreal":0.86355573596498158,
            "risk_rate":40.000796572150656768,
            "liquidation_price":0.018674308027108984,
            "withdraw_available":423.927036163274725677,
            "lever_rate":20,
            "adjust_factor":0.4
        }
    ],
    "uid":"123456789"
}
```

### 返回参数字段说明

| 字段名称                | 类型    | 说明                                                         |
| ----------------------- | ------- | ------------------------------------------------------------ |
| op                      | string  | 必填;操作名称，推送固定值为 notify;                          |
| topic                   | string  | 必填;推送的主题                                              |
| uid                   | string  | 账户UID                                              |
| ts                        | long  | 响应生成时间点，单位：毫秒                           |
| event                     | string  | 资产变化通知相关事件说明，比如订单创建开仓(order.open) 、订单成交(order.match)（除开强平和结算交割）、结算交割(settlement)、订单强平成交(order.liquidation)（对钆和接管仓位）、订单撤销(order.cancel) 、合约账户划转（contract.transfer)（包括外部划转）、系统（contract.system)、其他资产变化(other)、切换杠杆（switch_lever_rate）、初始资金（init）                            |
| \<data\>                  | list    |          |                                   |
| symbol                    | string    | 品种代码 ,"BTC","ETH"...，                                             |
| margin_balance            | decimal  | 账户权益                                                       |
| margin_static             | decimal  | 静态权益                                                     |
| margin_position           | decimal  | 持仓保证金（当前持有仓位所占用的保证金）                                                     |
| margin_frozen             | decimal | 冻结保证金                                                     |
| margin_available          | decimal | 可用保证金                                                     |
| profit_real               | decimal  | 已实现盈亏                |
| profit_unreal             | decimal  | 未实现盈亏                                          |
| risk_rate                 | decimal  |保证金率                                        |
| liquidation_price         | decimal     | 预估爆仓价 |
| withdraw_available        | decimal     | 可划转数量                                                     |
| lever_rate                | decimal    | 杠杆倍数                                                       |
| adjust_factor                | decimal    | 调整系数                                                       |
| \</data\>                     |   |          |                                   |


### 备注:
  - 每 5 秒进行一次定期推送，由定期推送触发的数据中 event 参数值为“snapshot”，表示由系统定期推送触发。如果 5 秒内已经触发过推送，则该品种跳过该次定期推送。

## 取消订阅资产变动数据（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

`{`

  `“op”: “unsub”,`
  
  `“topic": "accounts.$symbol”,`
  
  `"cid": "id generated by client”,`

`}`

> 正确的取消订阅请求:

```json

{
  "op": "unsub",
  "topic": "accounts.btc",
  "cid": "40sG903yz80oDFWr"
}

```

### 取消订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                               |
| ------- | ----- | ------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 必填;待取消订阅主题名称: accounts.$symbol;  symbol支持大小写,比如：BTC，ETH ; 当 $symbol值为 * 时代表取消订阅所有品种; |


### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| accounts.*       | accounts.*        | 允许   |
| accounts.symbol1 | accounts.*        | 允许   |
| accounts.symbol1 | accounts.symbol1  | 允许   |
| accounts.symbol1 | accounts.symbol2  | 不允许 |
| accounts.*       | accounts.symbol1  | 不允许 |


## 订阅持仓变动更新数据（sub）

成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

### 订阅请求数据格式

`{`

  `“op”: “sub”,`
  
  `"cid": "id generated by client”,`
  
  `“topic": "positions.$symbol”`

`}`

> 正确的订阅请求:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "positions.btc"
}

```

### 订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                        |
| ------- | :----- | :------------------------------------------ |
| op       | string | 必填；操作名称，订阅固定值为sub             |
| cid      | string | 选填;Client 请求唯一 ID                     |
| topic    | string | 必填；订阅主题名称:positions.$symbol; symbol支持大小写,比如:BTC,ETH ;  当 $symbol值为 * 时代表订阅所有品种|

> 当持仓有更新时，返回的参数示例如下

```json

{
    "op":"notify",
    "topic":"positions.ada",
    "ts":1604388667226,
    "event":"order.match",
    "data":[
        {
            "symbol":"ADA",
            "contract_code":"ADA201225",
            "contract_type":"quarter",
            "volume":1,
            "available":1,
            "frozen":0,
            "cost_open":0.0905,
            "cost_hold":0.0905,
            "profit_unreal":0,
            "profit_rate":0,
            "profit":0,
            "position_margin":5.524861878453038674,
            "lever_rate":20,
            "direction":"sell",
            "last_price":0.0905
        }
    ],
    "uid":"123456789"
}

`````

### 返回参数说明


| 字段名称                | 类型    | 说明                                                         |
| ----------------------- | ------- | ------------------------------------------------------- |
| op                      | string  | 必填;操作名称，推送固定值为 notify;                          |
| topic                   | string  | 必填;推送的主题                                              |
| uid                   | string  | 账户ID                                              |
| ts                     | long  | 响应生成时间点，单位：毫秒                           |
| event                  | string  | 持仓变化通知相关事件说明，比如订单创建平仓(order.close) 、订单成交(order.match)（除开强平和结算交割）、结算交割(settlement)、订单强平成交(order.liquidation)（对钆和接管仓位）、订单撤销(order.cancel)、切换杠杆（switch_lever_rate） 、初始持仓（init）、由系统定期推送触发（snapshot）。                               |
| \<data\>               | list  |          |                                   |
| symbol                 | string    | 品种代码 ,"BTC","ETH"...，                                             |
| contract_code          | string  | 合约代码                                                       |
| contract_type          | string  | 合约类型,当周:"this_week", 次周:"next_week", 当季:"quarter", 次季:"next_quarter", 已下市：“delivered”                                                    |
| volume                 | decimal  | 持仓量                                                     |
| available              | decimal | 可平仓数量                                                     |
| frozen                 | decimal | 冻结数量                                                      |
| cost_open              | decimal  | 开仓均价                |
| cost_hold              | decimal  | 持仓均价                                          |
| profit_unreal          | decimal  |未实现盈亏                                        |
| profit_rate            | decimal     | 收益率 |
| profit                 | decimal     | 收益                                                     |
| position_margin        | decimal    | 持仓保证金                                                       |
| lever_rate             | decimal     | 杠杆倍数                                                      |
| direction              | string    | 仓位方向  "buy":买，即多仓  "sell":卖，即空仓                    |
| last_price              | decimal    | 最新成交价                                                     |
| \</data\>                     |   |          |                                   |


### 备注

 - 每 5 秒进行一次定期推送，由定期推送触发的数据中 event 参数值为“snapshot”，表示由系统定期推送触发。如果 5 秒内已经触发过推送，则该品种跳过该次定期推送。
 
 - 当用户持仓量为0时使用切换杠杆的接口，持仓推送接口不会推送"switch_lever_rate"。

## 取消订阅持仓变动更新数据（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

`{`

  `“op”: “unsub”,`
  
  `“topic": "positions.$symbol”,`
  
  `"cid": "id generated by client”,`

`}`

> 正确的取消订阅请求:

```json

{
  "op": "unsub",
  "topic": "positions.btc",
  "cid": "40sG903yz80oDFWr"
}

```

### 取消订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                               |
| ------- | ------- | ------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 必填；待取消订阅主题名称:positions.$symbol;  symbol支持大小写,比如:BTC,ETH ;  当 $symbol值为 * 时代表取消订阅所有品种 |

### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| positions.*       | positions.*        | 允许   |
| positions.symbol1 | positions.*        | 允许   |
| positions.symbol1 | positions.symbol1  | 允许   |
| positions.symbol1 | positions.symbol2  | 不允许 |
| positions.*       | positions.symbol1  | 不允许 |


##  订阅强平订单数据(免鉴权)（sub）

### 订阅强平订单数据格式

`{`

  `“op”: “sub”,`
  
  `“topic": "public.$symbol.liquidation_orders”,`
  
  `"cid": "id generated by client”,`

`}`

> 正确的订阅请求:

```json

{
  "op": "sub",
  "cid": "40sG903yz80oDFWr",
  "topic": "public.BTC.liquidation_orders"
}

```

### 请求参数
| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | 订阅固定值为sub	 |  |
| cid | false| string | Client 请求唯一 ID	 | |
| topic | true| string |必填;订阅主题名称:public.$symbol.liquidation_orders; 订阅某个品种下的强平订单信息；$symbol为品种代码（BTC、ETH），如果值为 * 时代表订阅所有品种; symbol支持大小写| |

> 当有订单被爆仓账户接管后，返回的参数示例如下：

```json

{
    "op":"notify",
    "topic":"public.BTC.liquidation_orders",
    "ts":1580815422403,
    "data":[
        {
            "contract_code": "BTC201225",
            "symbol": "BTC",
            "direction": "buy",
            "offset": "close",
            "volume": 26,
            "price": 19674.96,
            "created_at": 1606293144641,
            "amount": 0.132147663832607537
        }
    ]
}
```

### 返回参数说明
| 参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
| -------- | -------- | -------- |  --------------------------------------- | -------------- | 
| op   | true | string  | 操作名称，推送固定值为 notify;    |   |
| topic   | true | string  | 推送的主题   |   |
| ts   | true | long  | 服务端应答时间戳   |   |
| \<data\> | true | array object |  | |
| symbol   | true | string  | 品种代码  |  "BTC","ETH"...  |
| contract_code   | true | string  | 合约代码  |   |
| direction   | true | string  | 仓位方向 | "buy":买 "sell":卖    |
| offset   | true | string  | 开平方向 | "open":开 "close":平    |
| volume   | true | decimal  | 强平数量（张）  |   |
| amount   | true | decimal  | 	强平数量（币）  |   |
| price   | true | decimal  | 破产价格  |   |
| created_at   | true | long  | 订单创建时间  |   |
| \</data\> | | |  | |



## 取消订阅强平订单(免鉴权)（unsub）

### 取消订阅强平订单数据格式

`{`

  `“op”: “unsub”,`
  
  `“topic": "public.$symbol.liquidation_orders”,`
  
  `"cid": "id generated by client”,`

`}`

> 正确的取消订阅请求:

```json

{
  "op": "unsub",
  "topic": "public.EOS.liquidation_orders",
  "cid": "40sG903yz80oDFWr"
}

```

### 取消订阅请求参数

| 字段名称 | 类型   | 说明                                               |
| ------- | ------- | ------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 必填;订阅主题名称:public.$symbol.liquidation_orders; symbol支持大小写 比如:BTC,ETH ; 当 $symbol值为 * 时代表取消订阅所有品种 |


### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| public.*.liquidation_orders      | public.*.liquidation_orders        | 允许   |
| public.$symbol.liquidation_orders | public.*.liquidation_orders        | 允许   |
| public.symbol1.liquidation_orders | public.symbol1.liquidation_orders  | 允许   |
| public.symbol1.liquidation_orders | public.symbol2.liquidation_orders  | 不允许 |
| public.*.liquidation_orders      | public.symbol1.liquidation_orders  | 不允许 |

## 订阅合约信息变动(免鉴权)（sub）

成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

  `{`
  
  `"op": "sub",`
  
  `"cid": "40sG903yz80oDFWr",`
  
  `"topic": "public.$symbol.contract_info"`
  
  `}`

> 正确的取消订阅请求:

```json

{
  "op": "sub",
  "topic": "public.btc.contract_info",
  "cid": "40sG903yz80oDFWr"
}

```

### 请求参数

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | 必填；订阅固定值为sub	 |  |
| cid | false| string | 选填；Client 请求唯一 ID	 | |
| topic | true| string |必填；订阅主题名称:public.$symbol.contract_info; 订阅某个品种下的合约变动信息；$symbol为品种代码（BTC、ETH），如果值为 * 时代表订阅所有品种; symbol支持大小写; | |

### 返回的参数为：

```json

{
    "op":"notify",
    "topic":"public.btc.contract_info",
    "ts":1604389592693,
    "event":"snapshot",
    "data":[
        {
            "symbol":"BTC",
            "contract_code":"BTC201106",
            "contract_type":"this_week",
            "contract_size":100,
            "price_tick":0.01,
            "delivery_date":"20201106",
            "create_date":"20201016",
            "delivery_time": "1610091600000",
            "settlement_time": "1608968400000",
            "contract_status":1
        },
        {
            "symbol":"BTC",
            "contract_code":"BTC201113",
            "contract_type":"next_week",
            "contract_size":100,
            "price_tick":0.01,
            "delivery_date":"20201113",
            "create_date":"20201023",
            "delivery_time": "1610091600000",
            "settlement_time": "1608968400000",
            "contract_status":1
        },
        {
            "symbol":"BTC",
            "contract_code":"BTC201225",
            "contract_type":"quarter",
            "contract_size":100,
            "price_tick":0.01,
            "delivery_date":"20201225",
            "create_date":"20200612",
            "delivery_time": "1610091600000",
            "settlement_time": "1608968400000",
            "contract_status":1
        },
        {
            "symbol":"BTC",
            "contract_code":"BTC210326",
            "contract_type":"next_quarter",
            "contract_size":100,
            "price_tick":0.01,
            "delivery_date":"20210326",
            "create_date":"20200904",
            "delivery_time": "1610091600000",
            "settlement_time": "1608968400000",
            "contract_status":1
        }
    ]
}
```

### 返回参数

| 参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
| -------- | -------- | -------- |  --------------------------------------- | -------------- |
| op | true |  string | 操作名称，推送固定值为 notify | |
| topic | true |  string | 推送的主题 | |
| ts     | true | long    | 响应生成时间点，单位：毫秒    |     |
| event | true  | string | 通知相关事件说明 |   订阅成功返回的初始合约信息（init），合约信息字段变化触发（update），系统定期推送触发（snapshot）  |
| \<data\> |   true   |  object array   |   |   |
| symbol  | true | string  | 品种代码  | "BTC","ETH"...   |
| contract_code   | true | string  | 合约代码 |  "BTC200626" ...   |
| contract_type   | true | string  | 合约类型 |  当周:"this_week", 次周:"next_week", 当季:"quarter".   |
| contract_size  | true | decimal | 合约面值，即1张合约对应多少美元 | 10, 100... |
| price_tick  | true | decimal | 合约价格最小变动精度 | 0.001, 0.01... |
| delivery_date  | true | string  | 合约交割日期    | 时间戳，如"20200327"  |
| create_date   | true | string  | 合约上市日期    | 如"20180706" |
| settlement_time   | true | long  | 下次结算时间（毫秒时间戳）    |   |
| delivery_time   | true | long  | 交割时间（毫秒时间戳）    |   |
| contract_status      | true | int     | 合约状态  |  0:已下市、1:上市、2:待上市、3:停牌，4:暂停上市中、5:结算中、6:交割中、7:结算完成、8:交割完成、9:暂停交易中  |
| \</data\>   |      |         |        |       |

### 说明：
- 合约信息变动WS推送接口有定期推送逻辑，每60秒进行一次定期推送，由定期推送触发的数据中event参数值为“snapshot”，表示由系统定期推送触发。如果60秒内已经触发过推送，则跳过该次定期推送。
- 订阅成功时，会立即推送一条最新的合约信息，event为init。
- 订阅成功后，当合约信息任何一个字段发生变化时推送最新合约信息，多个字段同时变化时仅推送一条最新合约信息，event为update。
- 当合约状态流转为“交割完成”时，合约下次结算时间为空字符串。
- 当周合约进入交割后，就不会推送该合约信息。
- 只有状态为1：上市，才能够正常交易，其他状态不可交易；

## 取消订阅合约信息变动(免鉴权)（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅请求数据格式

  `{`
  
  `"op": "unsub",`
  
  `"topic": "public.$symbol.contract_info",`
  
  `"cid": "id generated by client",`
  
  `}`
 
> 正确的取消订阅请求:

```json
                                 
{                                    
  "op": "unsub",                     
  "topic": "public.btc.contract_info",   
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  
 
### 取消订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                               |
| :------- | :----- | :------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 必填;待取消订阅主题名称:public.$symbol.contract_info;  symbol支持大小写，比如:BTC,ETH ; 当 $symbol值为 * 时代表取消订阅所有合约代码; |

### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| public.*.contract_info       | public.*.contract_info       | 允许   |
| public.symbol1.contract_info | public.*.contract_info        | 允许   |
| public.symbol1.contract_info | public.symbol1.contract_info | 允许   |
| public.symbol1.contract_info | public.symbol2.contract_info  | 不允许 |
| public.*.contract_info       | public.symbol1.contract_info  | 不允许 |

## 订阅计划委托订单更新

### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

  `{`
  
  `"op": "sub",`
  
  `"cid": "id generated by client",`
  
  `"topic": "trigger_order.$symbol"`
  
  `}`

> request
 
```json
                                 
{                                    
  "op": "sub",                     
  "topic": "trigger_order.BTC",   
  "cid": "40sG903yz80oDFWr"          
}                                    
``` 
### 请求参数

| 参数名称   | 是否必须 | 类型     | 描述   |
| ------ | ---- | ------ | -------- |
| op | true | string | 必填；订阅固定值为sub	 |  
| cid | false| string | 选填；Client 请求唯一 ID	 | 
| topic | true| string | 必填；订阅主题名称:trigger_order.$symbol; 订阅某个品种下的计划委托订单更新信息；$symbol为品种代码（BTC、ETH），如果值为 * 时代表订阅所有品种; symbol支持大小写; | 

> 返回示例:

```json

{
    "op":"notify",
    "topic":"trigger_order.ADA",
    "ts":1604390110568,
    "event":"order",
    "uid":"123456789",
    "data":[
        {
            "symbol":"ADA",
            "contract_code":"ADA201225",
            "contract_type":"quarter",
            "trigger_type":"le",
            "volume":1,
            "order_type":1,
            "direction":"buy",
            "offset":"close",
            "lever_rate":20,
            "order_id":28312417,
            "order_id_str":"28312417",
            "relation_order_id":"-1",
            "order_price_type":"limit",
            "status":2,
            "order_source":"web",
            "trigger_price":0.09,
            "triggered_price":null,
            "order_price":0.09,
            "created_at":1604390110565,
            "triggered_at":0,
            "order_insert_at":0,
            "canceled_at":0,
            "fail_code":null,
            "fail_reason":null
        }
    ]
}
``` 
 
### 返回参数说明：
| 参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
| -------- | -------- | -------- |  --------------------------------------- | -------------- |
| op | true |  string | 操作名称，推送固定值为 notify | |
| topic | true |  string | 推送的主题，与订阅的入参一样 | |
| ts     | true | long    | 响应生成时间点，单位：毫秒    |     |
| uid   | true | string  | 用户uid  |    |
| event | true  | string | 通知相关事件说明 |   计划委托订单下单成功（order），计划委托撤单成功（cancel），计划委托触发成功（trigger_success），计划委托触发失败（trigger_fail）  |
| \<data\> |   true   |  object array   |   |   |
| symbol                 | true | string  | 品种代码               |                                          |
| contract_type          | true | string  | 合约类型               | 当周:"this_week", 次周:"next_week", 当季:"quarter"，次季度：“next_quarter”  |
| contract_code          | true | string  | 合约代码               | "BTC180914" ...                          |
| trigger_type              | true | string  | 触发类型  | ge大于等于；le小于等于  |              |
| volume                 | true | decimal  | 委托数量 |      |
| order_type           | true | int | 订单类型              |  1、报单     |
| direction            | true | string | 买卖方向               |             买："buy",卖："sell"          |
| offset         | true | string | 开平方向             |                                开："open",平："close"            |
| lever_rate            | true | int    | 杠杆倍数              |                         |
| order_id      | true | long | 计划委托单订单ID                |                                          |
| order_id_str             | true | string | 字符串类型的订单ID              |                                          |
| relation_order_id             | true | string | 该字段为关联限价单的关联字段，未触发前数值为-1  |         |
| order_price_type        | true  | string | 订单报价类型 |                  "limit":限价，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档     |
| status        | true  | int | 订单状态|    2:已提交、4:报单成功、5:报单失败、6:已撤单    |
| order_source      | true | string  | 来源        | （system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发）    |
| trigger_price         | true | decimal  | 触发价       |       |
| triggered_price         | true | decimal  | 被触发时的价格       |       |
| order_price           | true | decimal  | 委托价   |                                          |
| created_at        | true  | long | 订单创建时间 |                      |
| triggered_at        | true  | long | 触发时间 |                      |
| order_insert_at        | true  | long | 下order单时间 |                      |
| canceled_at        | true  | long | 撤单时间 |                      |
| fail_code        | true  | int | 被触发时下order单失败错误码 |                      |
| fail_reason        | true  | string | 被触发时下order单失败原因（英文） |                      |
| \</data\>   |      |         |        |       |

#### 说明：


- 订单状态系统处理的中间态不进行推送，比如报单中和撤单中；具体通知事件说明映射如下：
   -  当订单状态流转到2（已提交），event通知事件为order（计划委托订单下单成功）；
   -  当订单状态流转到4（报单成功），event通知事件为trigger_success（计划委托触发成功）；
   -  当订单状态流转到6（已撤单），event通知事件为cancel（计划委托撤单成功）；
   -  当订单状态流转到5（报单失败），event通知事件为trigger_fail（计划委托触发失败）；
- 订阅时，单品种无法重复订阅，全品种订阅可覆盖单品种的订阅，订阅全品种后无法订阅单品种；

## 取消订阅计划委托订单更新（unsub）

成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

### 取消订阅计划委托订单更新

  `{`
  
  `"op": "unsub",`
  
  `"topic": "trigger_order.$symbol",`
  
  `"cid": "id generated by client",`
  
  `}`
 
> 正确的取消订阅请求:

```json
                                 
{                                    
  "op": "unsub",                     
  "topic": "trigger_order.*",   
  "cid": "40sG903yz80oDFWr"          
}                                    
```                                  
 
### 取消订阅请求数据格式说明

| 字段名称 | 类型   | 说明                                               |
| :------- | :----- | :------------------------------------------------- |
| op       | string | 必填;操作名称，订阅固定值为 unsub;                 |
| cid      | string | 选填;Client 请求唯一 ID                            |
| topic    | string | 必填;待取消订阅主题名称:trigger_order.$symbol; symbol支持大小写，比如:BTC,ETH ; 当 $symbol值为 * 时代表取消订阅所有合约代码; |

### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(unsub) | 规则   |
| -------------- | --------------- | ------ |
| trigger_order.*       | trigger_order.*       | 允许   |
| trigger_order.symbol1 | trigger_order.*       | 允许   |
| trigger_order.symbol1 | trigger_order.symbol1 | 允许   |
| trigger_order.symbol1 | trigger_order.symbol2  | 不允许 |
| trigger_order.*       | trigger_order.symbol1  | 不允许 |


# WebSocket系统状态更新接口

 - 系统状态更新订阅WS地址：wss://api.hbdm.com/center-notification

## 订阅系统状态更新

### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来请求数据：

  `{`
  
      `"op": "sub",`
  
      `"cid": "id generated by client",`
  
      `"topic ": "public.$service.heartbeat"`
  
  `} `

> 数据请求参数的例子：

```json

{
	"op": "sub",
	"cid": "id generated by client",
	"topic": "public.futures.heartbeat"
}
```

### 请求参数:
| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | 必填;订阅固定值为sub	 |  |
| cid | false| string | 选填;Client 请求唯一 ID	 | |
| topic | true| string | 必填;订阅主题名称:public.$service.heartbeat; 订阅交割合约的系统状态信息 | |

### sub订阅参数说明:
| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| service | true | string | 业务代码	 | futures：交割 |


> 返回示例:

```json

{
    "op": "notify",
    "topic": "public.futures.heartbeat",
    "event": "init",
    "ts":1580815422403,
    "data":{
        "heartbeat": 0,
        "estimated_recovery_time": 1408076414000
    }
}

```

### 返回参数说明：
| 参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
| -------- | -------- | -------- |  --------------------------------------- | -------------- | 
| op   | true | string  | 操作名称，推送固定值为 notify;    |   |
| topic   | true | string  | 推送的主题   |   |
| event   | true | string  | 通知相关事件说明   |  订阅成功返回的初始系统状态信息（init），系统状态变化触发（update） |
| ts   | true | long  | 服务端应答时间戳   |   |
| \<data\> |  |  |  | |
| heartbeat | true | int | 系统状态	 |  1是可用，0为不可用(即停服维护)   |
| estimated_recovery_time | true | long |  系统预估恢复时间，单位：毫秒	 |  当系统状态为可用时，返回空值 |
| \</data\> | | |  | |

### 备注

- 这个推送由于是轮询判断状态的，所以推送可能存在1—2秒的延迟。


# WebSocket附录

## 操作类型（OP）说明

| 类型   | 描述                 |
| ------ | -------------------- |
| ping   | ⼼跳发起(server)     |
| pong   | 心跳应答             |
| auth   | 鉴权                 |
| sub    | 订阅消息             |
| unsub  | 取消订阅消息         |
| notify | 推送订阅消息(server) |

## 主题（topic）类型说明

| 类型           | 使用操作类型 | 描述                                                         |
| -------------- | ------------ | ------------------------------------------------------------ |
| orders.$symbol | sub,unsub    | 订阅、取消订阅指定交易易对的订单变更更消息，当 $symbol 值为 * 时代表订阅所有交易易对 |

## 响应码（Err-Code）说明

| 返回码 | 返回描述                                 |
| ------ | ---------------------------------------- |
| 0      | Request successfully.                    |
| 2001   | Invalid authentication.                  |
| 2002   | Authentication required.                 |
| 2003   | Authentication failed.                   |
| 2004   | Number of visits exceeds limit.          |
| 2005   | Connection has been authenticated.       |
| 2007 | You don’t have access permission as you have not opened contracts trading. |
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
