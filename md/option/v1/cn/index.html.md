---
title: 火币期权合约 API 文档

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.hbg.com/zh-cn/apikey/'>  创建 API Key </a>  
includes:

search: True

---

# 简介

## 期权合约API简介

欢迎使用火币期权合约 API！ 你可以使用此 API 获得市场行情数据，进行交易，并且管理你的账户。

在文档的右侧是代码示例，目前我们仅提供针对 `shell` 的代码示例。

你可以通过选择上方下拉菜单的版本号来切换文档对应的 API 版本，也可以通过点击右上方的语言按钮来切换文档语言。


## 做市商项目

<aside class="notice">  
做市商项目不支持点卡抵扣、VIP、交易量相关活动以及任何形式的返佣活动。
</aside>  

欢迎有优秀 maker 策略交易量大的用户参与长期合约做市商项目。如果您的火币交割合约账户中有折合大于 3 BTC 资产，或火币币本位永续合约账户中有折合大于 3 BTC 资产，或火币期权合约账户中有折合大于 3 BTC 资产，或火币USDT本位永续合约账户中有大于 100000 USDT 资产，请提供以下信息到 dm_mm@huobi.com（做市商项目不支持点卡抵扣、VIP、交易量相关活动以及任何形式的返佣活动）:

1. 提供火币 UID （需不存在返佣关系的 UID）；
2. 提供其他交易平台 maker 交易量截图证明（比如30天内成交量，或者 VIP 等级等）；


# 更新日志

## 1.0.6 2021年5月17日 【修改：母子账户划转（新增选填入参：client_order_id）】

### 1、修改母子账户划转接口（新增选填入参：client_order_id）
 - 接口名称：母子账户划转
 - 接口类型：私有接口
 - 接口URL：/option-api/v1/option_master_sub_transfer

## 1.0.5 2021年2月26日 【新增：获取账户总资产估值接口。修改获取合约最高限价和最低限价接口（支持用户所有入参都不填，接口返回所有当前上市合约的限价数据。）、修改获取市场最近成交记录接口（支持用户所有入参都不填，接口返回所有当前上市合约的最近成交数据；当用户不传入参时， 返参ch值为market.*trade.detail。在返参tick下新增字段：contract_code。）】

### 1、新增获取账户总资产估值接口
 - 接口名称：获取账户总资产估值
 - 接口类型：私有接口
 - 接口URL：/option-api/v1/option_balance_valuation

### 2、修改获取合约最高限价和最低限价接口（支持用户所有入参都不填，接口返回所有当前上市合约的限价数据。）
 - 接口名称：获取合约最高限价和最低限价
 - 接口类型：共公接口
 - 接口URL：/option-api/v1/option_price_limit

### 3、修改获取市场最近成交记录接口（支持用户所有入参都不填，接口返回所有当前上市合约的最近成交数据；当用户不传入参时， 返参ch值为market.*trade.detail。在返参data下新增字段：contract_code。）
 - 接口名称：获取市场最近成交记录
 - 接口类型：共公接口
 - 接口URL：/option-ex/market/trade

## 1.0.4 2021年2月5日【新增：批量设置子账户交易权限接口、批量获取子账户资产信息接口。修改：获取市场最近成交记录接口、批量获取最近的交易记录接口、订阅 Trade Detail 数据接口、请求 Trade Detail 数据接口】

### 1、新增批量设置子账户交易权限接口
 - 接口名称：批量设置子账户交易权限
 - 接口类型：私有接口
 - 接口URL：/option-api/v1/option_sub_auth

### 2、新增批量获取子账户资产信息接口
 - 接口名称：批量获取子账户资产信息
 - 接口类型：私有接口
 - 接口URL：/option-api/v1/option_sub_account_info_list

### 3、修改获取市场最近成交记录接口（返参data参数下新增quantity，表示成交量（币）。计算公式：成交量（币） = 成交量（张）* 合约面值。返参data参数下新增trade_turnover，表示成交额（计价币种）。计算公式：成交额（计价币种） = 成交量（张）* 合约面值 * 成交价格。）
 - 接口名称：获取市场最近成交记录
 - 接口类型：公共接口
 - 接口URL：/option-ex/market/trade

### 4、修改批量获取最近的交易记录接口（返参data参数下新增quantity，表示成交量（币）。计算公式：成交量（币） = 成交量（张）* 合约面值。返参data参数下新增trade_turnover，表示成交额（计价币种）。计算公式：成交额（计价币种） = 成交量（张）* 合约面值 * 成交价格。）
 - 接口名称：批量获取最近的交易记录
 - 接口类型：公共接口
 - 接口URL：/option-ex/market/history/trade

### 5、修改订阅 Trade Detail 数据接口（返参data参数下新增quantity，表示成交量（币）。计算公式：成交量（币） = 成交量（张）* 合约面值。返参data参数下新增trade_turnover，表示成交额（计价币种）。计算公式：成交额（计价币种） = 成交量（张）* 合约面值 * 成交价格。）
 - 接口名称：订阅 Trade Detail 数据
 - 接口类型：公共接口
 - 订阅地址：market.$contract_code.trade.detail

### 6、修改请求 Trade Detail 数据接口（返参data参数下新增quantity，表示成交量（币）。计算公式：成交量（币） = 成交量（张）* 合约面值。返参data参数下新增trade_turnover，表示成交额（计价币种）。计算公式：成交额（计价币种） = 成交量（张）* 合约面值 * 成交价格。）
 - 接口名称：请求 Trade Detail 数据
 - 接口类型：公共接口
 - 订阅地址：market.$contract_code.trade.detail

## 1.0.3 2020年01月29日 【修改：全部撤单接口、计划委托全部撤单接口、合约当前未成交委托接口、计划委托当前委托接口，修改：计划委托订单的订单ID由原本的自然数自增ID 改为长度为 18 位的唯一标识ID。推荐使用下单后返回的 order_id_str（字符串类型的订单 ID），避免发生长度过大而被系统截断的情况。】

### 1、修改全部撤单接口（请求参数新增 2 个选填字段:direction，表示买卖方向，不填默认撤销全部。参数可选值为“buy”:买，“sell”:卖。offset，表示开平方向，不填默认撤销全部。参数可 选值为“open”:开仓，“close”:平仓。）
 - 接口名称：全部撤单
 - 接口类型：私有接口
 - 接口URL：/option-api/v1/option_cancelall

### 2、修改计划委托全部撤单接口（请求参数新增 2 个选填字段:direction，表示买卖方向，不填默认撤销全部。参数可选值为“buy”:买，“sell”:卖。offset，表示开平方向，不填默认撤销全部。参数可 选值为“open”:开仓，“close”:平仓。）
 - 接口名称：计划委托全部撤单
 - 接口类型：私有接口
 - 接口URL：/option-api/v1/option_trigger_cancelall

### 3、获取合约当前未成交委托接口（请求参数新增 2 个选填字段:sort_by，表示排序字段，不填默认按创建时间倒序。参数可选值为“created_at”(按照创建时间倒序)，“update_time”(按照更新时间倒 序)。trade_type，表示交易类型，不填默认查询全部。参数可选值为 0:全部,1:买入 开多,2: 卖出开空,3: 买入平空,4: 卖出平多。返回参数中的 orders 下新增以下字段:update_time(订单更新时间，单位毫秒)。）
 - 接口名称：获取合约当前未成交委托
 - 接口类型：私有接口
 - 接口URL：/option-api/v1/option_openorders 

### 4、查询计划委托当前委托接口（请求参数新增选填字段:trade_type，表示交易类型，不填默认查询全部。参数可选值为 0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多。）
 - 接口名称：查询计划委托当前委托
 - 接口类型：私有接口
 - 接口URL：/option-api/v1/option_trigger_openorders

## 1.0.2 2021年01月12号 【修改获取当前可用合约总持仓量、修改获取合约历史委托接口、修改获取计划委托历史委托接口、修改订阅Market Detail数据】

### 1、修改获取当前可用合约总持仓量（在返回参数data中新增trade_volume：最近24小时成交量（张），trade_amount：最近24小时成交量（币）trade_turnover：最近24小时成交额、这三个字段 ）
 - 接口名称: 获取当前可用合约总持仓量
 - 接口类型: 公共接口
 - 接口URL: /option-api/v1/option_open_interest

### 2、修改订阅Market Detail数据（在返参tick中新增ask表示卖一，bid表示买一。）
 - 接口名称: 订阅Market Detail数据
 - 接口类型: 公共接口
 - 订阅主题: market.$contract_code.detail

### 3、修改获取合约历史委托接口（新增入参：sort_by(表示：排序字段，可选值为“create_date”，“update_time”)。新增返回参数：update_time（表示：订单的更新时间））
 - 接口名称: 获取合约历史委托接口	
 - 接口类型: 私有接口
 - 接口URL: /option-api/v1/option_hisorders

### 4、修改获取计划委托历史委托接口（新增入参：sort_by(表示：排序字段，可选值为“created_at”，“update_time”)。新增返回参数：update_time（表示：订单的更新时间））
 - 接口名称: 获取计划委托历史委托	
 - 接口类型: 私有接口
 - 接口URL: /option-api/v1/option_trigger_hisorders


## 1.0.1 2020年10月10日 【新增：订阅系统状态更新推送的 WebSocket 接口】

### 1、新增订阅系统状态更新推送的 WebSocket 接口
  - 接口名称：订阅系统状态更新
  - 接口类型: 公共接口
  - 订阅主题：public.$service.heartbeat

## 1.0.0 2020年9月1日18:00(GMT+8)

# 合约交易接入说明

## 合约交易接口列表

### 接口列表

| 权限类型 | 接口数据类型    | 接口                                           | 请求方式 | 接口描述                     | 需要验签  |            
| -------- | -------- |-------- | ---------------------------------------------- | -------- | ---------------------------- | 
| 读取   | 基础信息接口 | /option-api/v1/option_contract_info                     | GET      | 获取合约信息                     |  否        
| 读取   | 基础信息接口 |  /option-api/v1/option_index                            | GET      | 获取合约指数信息                  |  否       
| 读取   | 基础信息接口 |  /option-api/v1/option_price_limit                      | GET      | 获取合约最高限价和最低限价          |  否     
| 读取   | 基础信息接口 |  /option-api/v1/option_market_index                     | GET      | 查询合约市场指标                  |  否       
| 读取   | 基础信息接口 | /option-api/v1/option_open_interest                     | GET      | 获取当前可用合约总持仓量            |  否     
| 读取   | 基础信息接口 | /option-api/v1/option_delivery_price                    | GET      | 获取预估交割价                    |  否       
| 读取   | 基础信息接口 | /option-api/v1/option_his_open_interest                 | GET      | 获取平台持仓量                    |  否       
| 读取   | 基础信息接口 | /option-api/v1/option_api_state                         | GET      | 查询系统状态                      |  否       
| 读取   | 市场行情接口 | /option-ex/market/depth                                 | GET      | 获取行情深度数据                   |  否      
| 读取   | 市场行情接口 | /option-ex/market/history/kline                         | GET      | 获取K线数据                       |  否       
| 读取   | 市场行情接口 | /option-ex/market/detail/merged                         | GET      | 获取聚合行情                       |  否      
| 读取   | 市场行情接口 | /option-ex/market/trade                                 | GET      | 获取市场最近成交记录                |  否     
| 读取   | 市场行情接口 | /option-ex/market/history/trade                         | GET      | 批量获取最近的交易记录              |  否    
| 读取   |  资产接口    | /option-api/v1/option_balance_valuation                | POST     |  获取账户总资产估值                  |  是  |
| 读取   | 资产接口     | /option-api/v1/option_account_info                     | POST     | 获取用户账户信息                    | 是       
| 读取   | 资产接口     | /option-api/v1/option_position_info                    | POST     | 获取用户持仓信息                    | 是   
| 交易   |  账户接口    |  /option-api/v1/option_sub_auth                |    POST       |       批量设置子账户交易权限       |  是  |    
| 读取   | 账户接口     | /option-api/v1/option_sub_account_list                 | POST     | 查询母账户下所有子账户资产信息         | 是  
| 读取   |  账户接口    |  /option-api/v1/option_sub_account_info_list   |    POST       |       批量获取子账户资产信息      |  是  |
| 读取   | 账户接口     | /option-api/v1/option_sub_account_info                 | POST     | 查询母账户下的单个子账户资产信息       | 是    
| 读取   | 账户接口     | /option-api/v1/option_sub_position_info                | POST     | 查询母账户下的单个子账户持仓信息       | 是    
| 读取   | 账户接口     | /option-api/v1/option_financial_record                 | POST     | 查询用户财务记录                     | 是      
| 读取   | 账户接口     | /option-api/v1/option_order_limit                      | POST     | 获取用户当前的下单量限制              | 是     
| 读取   | 账户接口     | /option-api/v1/option_fee                              | POST     | 获取用户当前的手续费费率               | 是    
| 读取   | 账户接口     | /option-api/v1/option_transfer_limit                   | POST     | 获取用户当前的划转限制                | 是     
| 读取   | 账户接口     | /option-api/v1/option_position_limit                   | POST     | 获取用户当前的持仓量限制               | 是    
| 读取   | 账户接口     | /option-api/v1/option_account_position_info            | POST     | 获取用户资产和持仓信息                 | 是    
| 交易   | 账户接口     | /option-api/v1/option_master_sub_transfer              | POST     | 母子账户划转                         | 是      
| 读取   | 账户接口     | /option-api/v1/option_master_sub_transfer_record       | POST     | 获取母账户下的所有母子账户划转记录       | 是  
| 读取   | 账户接口     | /option-api/v1/option_api_trading_status               | GET      | 获取用户API指标禁用信息                | 是    
| 交易   | 交易接口     | /option-api/v1/option_order                            | POST     | 合约下单                             | 是      
| 交易   | 交易接口     | /option-api/v1/option_batchorder                       | POST     | 批量下单                             | 是      
| 交易   | 交易接口     | /option-api/v1/option_cancel                           | POST     | 撤销订单                             | 是      
| 交易   | 交易接口     | /option-api/v1/option_cancelall                        | POST     | 撤销全部单                            | 是     
| 读取   | 交易接口     | /option-api/v1/option_order_info                       | POST     | 获取用户的订单信息                     | 是    
| 读取   | 交易接口     | /option-api/v1/option_order_detail                     | POST     | 获取用户的订单明细信息                  | 是   
| 读取   | 交易接口     | /option-api/v1/option_openorders                       | POST     | 获取用户的当前未成交委托                | 是   
| 读取   | 交易接口     | /option-api/v1/option_hisorders                        | POST     | 获取用户的历史委托                     | 是    
| 读取   | 交易接口     | /option-api/v1/option_matchresults                     | POST     | 获取用户的历史成交记录                  | 是   
| 交易   | 账户接口     | /option-api/v1/option_lightning_close_position         | POST     | 闪电平仓下单                          | 是     
| 交易   | 账户接口     | /option-api/v1/option_trigger_order                    | POST     | 计划委托下单                          | 是     
| 交易   | 账户接口     | /option-api/v1/option_trigger_cancel                   | POST     | 计划委托撤单                          | 是     
| 交易   | 账户接口     | /option-api/v1/option_trigger_cancelall                | POST     | 计划委托全部撤单                      | 是     
| 读取   | 账户接口     | /option-api/v1/option_trigger_openorders               | POST     |获取计划委托当前委托                    | 是    
| 读取   | 账户接口     | /option-api/v1/option_trigger_hisorders                | POST     | 获取计划委托历史委托                   | 是    
| 交易   | 账户接口     | https://api.huobi.pro/v2/account/transfer              | POST     |  现货-期权合约账户间进行资金的划转        | 是 

## 访问地址

访问地址 | 适用站点 | 适用功能 | 适用交易对 |
------ | ---- | ---- | ------ |
https://api.hbdm.com| 火币合约|   API     | 火币合约的交易品种  |

### 备注

 如果api.hbdm.com无法访问，可以使用api.btcgateway.pro来做调试，AWS服务器用户推荐使用api.hbdm.vn；


## 签名认证

### 签名说明

API 请求在通过 internet 传输的过程中极有可能被篡改，为了确保请求未被更改，除公共接口（基础信息，行情数据）外的私有接口均必须使用您的 API Key 做签名认证，以校验参数或参数值在传输途中是否发生了更改。

一个合法的请求由以下几部分组成：

- 方法请求地址：即访问服务器地址 api.hbdm.com，比如 api.hbdm.com/option-api/v1/option_order。

- API 访问密钥（AccessKeyId）：您申请的 API Key 中的 Access Key。

- 签名方法（SignatureMethod）：用户计算签名的基于哈希的协议，此处使用 HmacSHA256。

- 签名版本（SignatureVersion）：签名协议的版本，此处使用2。

- 时间戳（Timestamp）：您发出请求的时间 (UTC 时区) (UTC 时区) (UTC 时区) 。如：2017-05-11T16:22:06。在查询请求中包含此值有助于防止第三方截取您的请求。

- 必选和可选参数：每个方法都有一组用于定义 API 调用的必需参数和可选参数。可以在每个方法的说明中查看这些参数及其含义。 请一定注意：对于 GET 请求，每个方法自带的参数都需要进行签名运算； 对于 POST 请求，每个方法自带的参数不进行签名认证，即 POST 请求中需要进行签名运算的只有 AccessKeyId、SignatureMethod、SignatureVersion、Timestamp 四个参数，其它参数放在 body 中。

- 签名：签名计算得出的值，用于确保签名有效和未被篡改。


### 创建 API Key

您可以在 <a href='https://www.hbg.com/zh-cn/apikey/'>  这里 </a>   创建 API Key。

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

`https://api.hbdm.com/option-api/v1/option_order?`

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
/option-api/v1/option_order\n
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

`/option-api/v1/option_order\n`

`AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30`


#### 8. 用上一步里生成的 “请求字符串” 和你的密钥 (Secret Key) 生成一个数字签名

`4F65x5A2bLyMWVQj3Aqp+B4w+ivaA7n5Oi2SuYtCJ9o=`

1. 将上一步得到的请求字符串和 API 私钥作为两个参数，调用HmacSHA256哈希函数来获得哈希值。

2. 将此哈希值用base-64编码，得到的值作为此次接口调用的数字签名。

#### 9. 将生成的数字签名加入到请求的路径参数里

最终，发送到服务器的 API 请求应该为

`https://api.hbdm.com/option-api/v1/option_order?AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-11T15%3A19%3A30&Signature=4F65x5A2bLyMWVQj3Aqp%2BB4w%2BivaA7n5Oi2SuYtCJ9o%3D`

1. 把所有必须的认证参数添加到接口调用的路径参数里

2. 把数字签名在URL编码后加入到路径参数里，参数名为“Signature”。

## 访问次数限制

* 交割合约、币本位永续合约、期权合约和USDT本位永续合约都分开限频

* 公开行情接口和用户私有接口都有访问次数限制

* 普通用户，需要密钥的私有接口，每个UID 3秒最多 48 次请求(交易接口3秒最多 24 次请求，查询接口3秒最多 24 次请求) (该UID的所有币种和不同到期日的合约的所有私有接口共享该限制) 。<a href=https://docs.huobigroup.com/docs/option/v1/cn/#ab0b26742c>查看API接口类型列表(其中读取即查询,交易即交易)</a>

* 其他非行情类的公开接口，比如获取指数信息，限价信息，交割结算、平台持仓信息等，所有用户都是每个IP3秒最多60次请求（所有该IP的非行情类的公开接口请求共享3秒60次的额度）

- 行情类的公开接口，比如：获取K线数据、获取聚合行情、市场行情、获取市场最近成交记录：

    （1） restful接口：同一个IP, 所有业务（交割合约、币本位永续合约、期权合约和USDT本位永续合约）总共1秒最多800个请求

    （2） websocket：req请求，同一时刻最多请求50次；sub请求，无限制，服务器主动推送数据
    
- WebSocket私有订单成交推送接口(需要API KEY验签)

     一个UID最多同时建立30个私有订单成交推送WS链接。该用户在一个品种(包含该品种的所有周期的合约)上，仅需要维持一个订单推送WS链接即可。
   
     注意: 订单推送WS的限频，跟用户RESTFUL私有接口的限频是分开的，相互不影响。

- 查询与交易API接口返回的header中会有限频信息。比如：查询订单信息接口(/option-api/v1/option_account_info)，返回的header中的ratelimit-limit即查询接口的总限制频率次数，ratelimit-remaining即查询接口的剩余总限制频率次数。下单接口(/option-api/v1/option_order)，返回的header中的ratelimit-limit即交易接口的总限制频率次数，ratelimit-remaining即交易接口的剩余总限制频率次数。 <a href=https://docs.huobigroup.com/docs/option/v1/cn/#ab0b26742c>查看API接口类型列表(其中读取即查询,交易即交易)</a> 

- 所有API接口返回数据中增加限频信息

  将在api接口response中的header返回以下字段：
  
  ratelimit-limit： 单轮请求数上限，单位：次数
  
  ratelimit-interval：请求数重置的时间间隔，单位：毫秒
  
  ratelimit-remaining：本轮剩余可用请求数，单位：次数
  
  ratelimit-reset：请求数上限重置时间，单位：毫秒
  
- 一个uid对应计划委托下单接口请求1秒5次、一个uid对应计划委托撤单接口请求1秒5次、一个uid对应计划委托全部撤单接口请求1秒5次。

## 撤单率限制【暂未启用】

- 当用户通过API在10分钟内特定订单价格类型的委托单总笔数大于或等于2500笔时，系统会自动计算撤单率，如果撤单率大于99%，则禁止该用户通过API特定价格类型进行下单5分钟（如果下单会报：1084  您的合约API挂单接口被禁用,请于{0} (GMT+8) 后再试）；

- 当API用户在1小时的总禁用次数达到3次时，则禁止用户通过API特定价格类型进行下单30分钟（如果下单会报：1084  您的合约API挂单接口被禁用,请于{0} (GMT+8) 后再试），待解禁恢复访问后，总禁用次数重置，且之前周期统计过的次数不计入新周期的总禁用次数;

- 其他客户端挂撤单以及API撤单将不受影响，每次禁用会以短信和邮件形式通知；

- 被禁用的API下单类型仅包括：限价委托、Post_only、FOK、IOC四种订单价格类型，其他下单方式如lightning（闪电平仓下单），opponent(对手价下单)，optimal_5（最优5档），optimal_10(最优10档下单），optimal_20（最优20档下单），opponent_ioc（对手价-IOC下单），lightning_ioc（闪电平仓-IOC下单），optimal_5_ioc（最优5档-IOC下单），optimal_10_ioc（最优10档-IOC下单），optimal_20_ioc（最优20档-IOC下单），opponent_fok（对手价-FOK下单），lightning_fok（闪电平仓-FOK下单），optimal_5_fok（最优5档-FOK下单），optimal_10_fok（最优10档-FOK下单），optimal_20_fok（最优20档-FOK下单）等在禁用期间将仍然可用；

- 禁用期间下单类型为被禁用的四种类型时，接口返回信息header中会包括字段："recovery-time：禁用的恢复时间戳"，单位为毫秒，表示禁用结束时间，可恢复访问的时间戳；如果不在禁用期间，header中不返回该字段；

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

当该业务系统停服维护期间，除了以下提供给用户查询系统状态的接口能够正常使用外（<a href='https://docs.huobigroup.com/docs/option/v1/cn/#bef5ec9210'>获取当前系统状态</a>），该业务所有rest接口都会固定返回响应报文:`{"status": "maintain"}`。websocket推送接口在停服维护时，除了WebSocket系统状态更新的推送接口可以正常调用外（<a href='https://docs.huobigroup.com/docs/option/v1/cn/#websocket-5'>WebSocket系统状态更新接口</a>），其他推送接口都会返回1006的错误码。

>Response

```json
{
    "status": "maintain"
}
``` 

#### 接口为：
 - 查询系统是否可用：https://api.hbdm.com/heartbeat/

除了以上rest接口获取系统维护停服信息外，也可以通过订阅WebSocket系统状态更新接口获取系统维护停服信息

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
| option_heartbeat             | int                   | 期权合约 1: 可用 0: 不可用(即停服维护) 
| option_estimated_recovery_time             | long                   | null: 正常. 期权合约预计恢复时间，单位：毫秒.
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
        "option_heartbeat":1,
        "option_estimated_recovery_time":null,
        "linear_swap_heartbeat":1,
        "linear_swap_estimated_recovery_time":null
    },
    "ts":1557714418033
}
```  

## 获取当前系统时间戳

 get `https://api.hbdm.com/api/v1/timestamp`

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

### 1、option-api/v1/option_hisorders 历史委托查询接口：

- 为了保证时效性和降低延迟，强烈建议用户使用option-api/v1/option_order_info获取用户订单信息接口来查询订单信息，获取合约订单信息接口从内存里面查询，无延迟，接口响应速度更快。

- 如果用户一定要使用option-api/v1/option_hisorders 历史委托查询接口，请尽量输入更多的查询条件，trade_type（推荐传0查询全部）、type、status、create_date尽量都输入，并且查询日期create_date参数输入尽量小的整数，最好只查询一天的数据；

 
### 2、option-api/v1/option_matchresults 获取历史成交记录接口：

- 为了提升查询的性能和响应速度，查询条件 trade_type（推荐传0查询全部） 、contract_code 、create_date 尽量都输入，并且create_date输入尽量小的整数，最好只查询一天的数据；

 
### 3、option-api/v1/option_financial_record 查询用户财务记录接口：

- 为了提升查询的性能和响应速度，查询条件type（推荐不填查询全部）、create_date，尽量都输入，并且查询日期create_date参数输入尽量小的整数，最好只查询一天的数据；

 
### 4、option-api/v1/option_order_detail 获取订单明细接口：

- 请求参数没有带上created_at等参数查询订单时，可能会发生查询结果延迟。建议您在使用此接口时请求字段带上：created_at（下单时间戳）和 order_type(订单类型，默认填1)，会直接查询数据库，查询结果会更及时。

- 查询条件created_at使用13位long类型时间戳（包含毫秒时间），如果输入准确的时间戳，查询性能将会提升。

- 例如:"2019/10/18 10:26:22"转换为时间戳为：1571365582123。也可以直接从option_order下单接口返回报文中的ts中获取时间戳作为参数查询接口option-api/v1/option_order_detail获取订单明细，同时created_at禁止传0；；

 
### 5、订阅Market Depth 数据的WebSocket：

- 获得150档深度数据，使用step0, step1, step2, step3, step4, step5, step14, step15；

- 获得20档深度数据，使用 step6, step7, step8, step9, step10, step11, step12, step13；

- 由于每100ms推送一次150档全量数据，数据量比较大，如果客户端网络带宽不足或者处理不及时，webSocket断开可能比较频繁，强烈建议使用step6, step7, step8, step9, step10, step11, step12, step13 取20档数据。比如订阅20档数据

`{`

  `"sub": "market.BTC-USDT-200925-C-10000.depth.step6",`

  `"id": "id5"`

`}`
 

- 我们也推荐使用增量订阅市场深度数据，增量深度数据有20档不合并数据和150档不合并数据，首次或者重连都推送全量数据，之后会推送增量数据，每30MS检查一次，如果有更新则推送，没有更新则不推送。需要维护好本地的深度数据。

`{`

  `"sub": "market.BTC-USDT-200925-C-10000.depth.size_20.high_freq",`

  `"data_type":"incremental",`

  `"id": "id1"`

`}`
 

### 6、option-api/v1/option_order合约下单和option-api/v1/option_batchorder合约批量下单接口：

- 推荐传参数client_order_id（用户级别唯一），主要防止下单和批量下单接口由于网络或其它原因接口超时或者没有返回，可以根据client_order_id通过请求接口option-api/v1/option_order_info来快速获取订单是否下单正常或者快速获取订单信息。

### 7、服务器部署最佳选择：

- 建议您将服务器放置在AWS东京C区，并且使用api.hbdm.vn域名，能有效减少网络断连与网络超时情况。


## 代码实例

- <a href='https://github.com/hbdmapi/hbdm_Python'> Python </a>  

- <a href='https://github.com/hbdmapi/huobi_option_Java'> Java </a> 

- <a href='https://github.com/hbdmapi/huobi_futures_Postman'>Postman</a>

### 备注：期权代码使用方式与交割与永续合约类似，其他语言demo可以参考交割与永续合约

## 策略DEMO

- <a href='https://github.com/hbdmapi/hbdm_Python/tree/master/examples/huobi_option_mm'> Python </a> 


# 常见问题

## 接入验签相关

### Q1: 期权API Key和现货是否同一个？

期权API Key和现货API Key是同一个，两个是一样的。您可以在 <a href='https://www.hbg.com/zh-cn/apikey/'>  这里 </a>   创建 API Key。

### Q2: 为什么经常出现断线、超时的错误？

如果是在大陆网络环境去请求API接口，网络连接很不稳定，很容易出现超时。建议使用AWS东京C区服务器进行访问。

国内网络可以使用api.btcgateway.pro或者api.hbdm.vn来进行调试,如果仍然无法请求，请在国外服务器上进行运行。

### Q3: 为什么WebSocket总是断开连接？

由于网络环境不同，很容易导致websocket断开连接(websocket: close 1006 (abnormal closure))，目前最佳实践是建议您将服务器放置在AWS东京C区，并且使用api.hbdm.vn域名；同时需要做好断连重连操作；行情心跳与订单心跳均需要按照《Websocket心跳以及鉴权接口》的行情心跳与订单心跳回复不同格式的Pong消息：<a href='https://docs.huobigroup.com/docs/option/v1/cn/#472585d15d'>  这里</a>  。以上操作可以有效减少断连情况。

### Q4: api.hbdm.com与api.hbdm.vn有什么区别？

api.hbdm.vn域名使用的是AWS的CDN服务，理论上AWS服务器用户使用此域名会更快更稳定；api.hbdm.com域名使用的是Cloudflare的CDN服务。

### Q5: 为什么签名认证总返回失败(403:Verification failure [校验失败]) ？

期权签名过程和永续以及交割签名过程类似，除了参考以下注意事项外，请参照期权、永续或者交割的demo代码来验证签名是否成功，demo代码验证通过后，再去核对您自己的签名代码。币本位永续的demo代码在 <a href='https://docs.huobigroup.com/docs/coin_margined_swap/v1/cn/#2cff7db524'>  这里 </a>   查看。交割的demo代码在<a href='https://docs.huobigroup.com/docs/dm/v1/cn/#2cff7db524'>  这里</a>  查看。期权的demo代码在<a href='https://docs.huobigroup.com/docs/option/v1/cn/#2cff7db524'>  这里</a>  查看。USDT本位永续的demo代码在 <a href='https://docs.huobigroup.com/docs/usdt_swap/v1/cn/#2cff7db524'>  这里 </a>   查看。

1. 检查 API Key 是否有效，是否复制正确

2. 是否有绑定 IP 白名单

3. 检查时间戳是否是 UTC 时间

4. 检查参数是否按字母排序

5. 检查编码，使用 UTF-8 编码

6. 检查签名是否有 base64 编码

7. 对于 GET 请求，每个方法自带的参数都需要进行签名运算

8. 对于 POST 请求，每个方法自带的参数不进行签名认证

9. 检查签名结果是否有进行 URI 编码，十六进制字符必须大写，如 “:” 会被编码为 “%3A”  ，空 格被编码为 “%20”。

10. websocket构建签名与restful类似，websocket构建json请求的数据不需要URL编码。

11. 签名时所带Host应与请求接口时Host相同。如果您使用了代理，代理可能会改变请求Host，可以尝试去掉代理；您使用的网络连接库可能会把端口包含在Host内，可以尝试在签名用到的Host中包含端口，如“api.hbdm.com:443"。

12. Api Key 与 Secret Key中是否存在隐藏特殊字符，影响签名。

如果通过以上的方法还没找出签名失败的原因，可以通过专门验证签名的 <a href='https://github.com/hbdmapi/huobi_api_rules '>  demo </a> 来确认您的签名是在哪一步出现问题。

### Q6: 公开行情根据ip限速，需要私钥的根据uid限速是吗？

是的。私有的根据UID来限速，不是根据API—KEY限速，母子帐号是分开分别限速，互不影响。


## 行情及WS推送相关

### Q1: 全量行情orderbook订阅和增量orderbook订阅是多长时间推送？

全量orderbook深度推送(market.$contract_code.depth.$type)是100MS检查一次，有更新则推送，至少1秒会推送1次。增量orderbook深度推送(market.$contract_code.depth.size_${size}.high_freq)是30MS检查一次，有更新则推送，没有更新则不推送。

### Q2: 市场公开逐笔成交是多长时间推送？

市场公开逐笔成交market.$contract_code.trade.detail是有成交则推送。

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

订阅行情深度market.$contract_code.depth.$type,150档指当前盘口的买卖盘的订单，将价格顺序切分为150个小区间，统计每个小区间的挂单数；20档指当前盘口的买卖盘的订单，将价格顺序切分为20个小区间，统计每个小区间的挂单数。

### Q7: 获取行情深度数据中请求参数type的“合并深度”是什么意思？

订阅行情深度(market.$contract_code.depth.$type)：

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

订阅持仓推送："topic": "positions.btc-usdt"，推送的是最新的持仓（包括持仓量、可平仓数量、冻结数量），没有变化就不推送。

### Q9: websocket持仓订阅频道，未实现盈亏有变化会推送吗?

订阅持仓推送："topic": "positions.btc-usdt", 如果持仓有变动，包括开仓/平仓/交割等，会推送仓位变化，若只是单纯的未实现盈亏不会推送。

### Q10: WS中的market detail 和 trade detail 具体什么区别和含义?

Market Detail(market.$contract_code.detail)  是市场聚合行情，0.5s检测1次，有成交则推送。包含了此时间段的开盘价、收盘价、最高价、最低价和成交数量；Trade Detail(market.$contract_code.trade.detail) 是有成交更新就会推送，包括成交价格、成交数量和成交方向等数据。

### Q11: 订阅market depth增量数据返回参数的两个ts分别是什么？

增量depth订阅：market.$contract_code.depth.size_${size}.high_freq，外层ts是到行情服务器开始转发这笔数据的系统时间戳，里层ts是orderbook的检测时间点。

### Q12: 通过ws订阅market depth数据和market depth增量数据的区别是什么？订阅market depth增量数据多久推送一次？

market.$contract_code.depth.$type是全量数据，market.$contract_code.depth.size_${size}.high_freq是增量数据，全量数据是100ms检查一次，至少1秒推送1次；增量30MS检查1次，无更新不推送。

目前market depth增量数据market.$contract_code.depth.size_${size}.high_freq是30MS检测一次，不是随机检测，30m检查一次更新，但是有二台机同时进行，每两次的时间间隔最小可能是0，但30ms内最多推送6次，最大时间间隔无上限，30ms内最少推送次数为0。

### Q13: 增量数据market.$contract_code.depth.size_${size}.high_freq推送如何维护本地数据？

增量数据首次会推送全量数据，之后推送的为增量数据。

(1) 把增量的价格与上一个全量做比较，相同的价格把挂单量替换；

(2) 没有相同价格的添加到本地全量数据；

(3) 如果某个价格挂单没有了，会推送类似[8100, 0]这样的数据，把本地相同价格的移除；

(4) 同一个websocket连接，增量数据version是递增的；如果 version不递增，您需要重新订阅并重新维护本地全量数据；

### Q14: 订阅多个合约代码同一主题时, 需要多个 ws 连接吗?

对于交割合约、币永续、u永续、期权之间, 由于是不同的接口地址, 需要不同的 ws 连接

对于交割合约、币永续、u永续、期权各自里面, 只要接口地址是一样的, 一个 ws 连接即可. 

### Q15: 是否可以通过 ws 下单和撤单?

目前不支持 ws 下单和撤单

### Q16: 如何订阅订单状态?

a. 订单交易成功: ”订阅合约订单撮合数据（matchOrders.$symbol-$partition）"或"订阅订单成交数据（orders.$symbol-$partition）"

b. 订单撤单成功: 订阅"资产变动数据（accounts.$symbol）”

### Q17: ”订阅合约订单撮合数据（matchOrders.$symbol-$partition）"和"订阅订单成交数据（orders.$symbol-$partition）"的区别

两者推送的数据不一样, 订单成交数据（orders.$symbol-$partition）会比订单撮合数据（matchOrders.$symbol-$partition）字段多一些

通常情况下, 撮合完成后的推送(订单撮合数据“matchOrders.$symbol-$partition”)要比清算完成后的(订单成交数据“orders.$symbol-$partition”)推送快, 但不能保证撮合完成后的推送一定比清算完成后的推送更快;

强平以及轧差订单不会推送"订单撮合数据（matchOrders.$symbol-$partition）”

### Q18: "订阅 KLine 数据（market.$contract_code.kline.$period）”多久推送一次

有成交时, 500ms推送一次

无成交时, 根据订阅的周期推送

### Q19: 如何判断推送是否延迟

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

### Q1: API返回1004错误码是什么原因？

由于近段时间平台系统订单堆积情况比较严重，我们的技术人员正在努力解决和优化中，如果近段时间出现系统繁忙的情况或者出现以下提示：

{“status”:”error”,”err_code”:1004,”err_msg”:”System busy. Please try again later.”,”ts”: }

请您耐心等待，在此过程中请不要进行重复的下单和撤单，以避免造成重复下单以及对系统性能造成额外的压力，在此期间，建议您可以通过Web和APP端进行下单和撤单。

### Q2: 同样的order id 和 match id，可以有N多个Trade，比如，用户是一笔大的taker单，吃掉了N个maker的订单，那么，就会对应有N个trade，如何标识这些不同的trade？

订单明细信息接口option-api/v1/option_order_detail返回的的字段id是全局唯一的交易标识。如果一个maker单，分多次match掉的话是每次推送只推match的部分，撮合一笔推送一笔。

### Q3: API接口返回Connection Reset 或者 Max retris 或者 Timed out 是什么原因？

出现连接重置或者网络超时，一般是网络不稳定导致，可以尝试将服务器放置在AWS东京C区，并使用api.hbdm.vn来尝试，可以有效减少网络超时等错误。

### Q4: API接口下单时出错没有order_id如何来查询订单状态？

如果由于网络原因等API下单超时或者失败，没有返回order_id，可以通过下单时加入client_order_id自定义订单号来进行查询订单状态。

### Q5: WS 订阅私有账户，订单或者仓位一段时间，连接断开如何办？

WS订阅私有账户，订单，仓位时，请注意也要定时维护好心跳，与市场行情的心跳格式不同，详情请参照菜单《Websocket心跳以及鉴权接口》里的订单推送心跳。同时如果连接断开，请做好重连逻辑。

### Q6: 合约资产接口中的“获取合约订单信息”的订单状态1和2都是准备提交有什么不同？3已提交又是什么？

1是准备提交，2是定序的提交，是内部流程的提交。可以认为已经被系统接受了，在系统的流程中。3是已委托到市场。

### Q7: API有获取总资产BTC的接口吗？

没有的。

### Q8: API撤单成功为什么查询订单却是成交？

请注意撤单成功或者下单成功只代表您撤单命令或者下单命令的成功，并不代表订单已经撤销，您可以通过该接口option-api/v1/option_order_info去查询订单状态。

### Q9: API查询订单状态为10是否一定失败？

通过option-api/v1/option_order_info查询订单状态，如果status为10，表示订单失败，不会成功。

### Q10: API一般从撤单开始到撤单成功需要多久？

撤单命令执行成功一般几十ms，实际撤单状态要查询订单状态option-api/v1/option_order_info获取。

### Q11: 如何查询交易所系统状态

交易所系统常见的两种状态: 系统处于结算/交割；停机维护. 当系统处于这两种状态时, 调用 api 接口会返回响应的错误代码和错误信息

a.如何判断是否是结算/交割完成

通过"获取合约信息”接口: /option-api/v1/option_contract_info

在返回值中的 contract_status 来判断, 如果值为 1 表示已经结算/交割完成, 可以正常交易了

b.如何判断是否是停机维护

通过"查询系统是否可用”接口: https://api.hbdm.com/heartbeat/

或者"订阅系统状态更新”接口: "topic ": "public.$service.heartbeat"

在推送值中的 heartbeat 来判断, 如果值为 1 表示系统为可用, 可以正常连接了

### Q12: 是否支持双向持仓

支持的. 火币目前是支持同时持有空单和多单的

### Q13: 如何保证快速成交

火币合约目前是没有市价的. 为提高成交概率, 可以使用对手价: opponent, 最优5档: optimal_5, 最优10档: optimal_10, 最优20档: optimal_20. 其中最优20档的成交概率最大, 但是滑点也最大. 

需要注意的是, 以上下单价格方式, 不保证 100% 成交的. 系统执行下单时, 是获取当时时刻的对方 N 档价格, 进行下单的. 

### Q14: api 程序如何更快连接到交易所

推荐使用 AWS 东京 c 区服务器, 同时使用 api.hbdm.vn 域名连接

### Q15: 现货与合约之间, 划转报 Abnormal service 错误

a.检查请求地址是否为火币 Global 地址: api.huobi.pro

b.检查币的精度是否不超过 8 位小数

### Q16: 如何确认是否开仓/平仓成功

"合约下单（option-api/v1/option_order）”接口或者"合约批量下单（option-api/v1/option_batchorder）”接口下单成功后, 不代表已经开仓/平仓成功. 只是意味着服务器已经成功收到你的下单指令

查询是否开仓/平仓成功，可以使用返回的“order_id” 通过“获取合约订单信息（option-api/v1/option_order_info）” 或 “获取订单明细信息（option-api/v1/option_order_detail）”这两个接口来查询订单状态。当订单已经成交后，接口返回参数中的status 值为 6 （全部成交）。

但同时需要注意：

a.获取合约订单信息（option-api/v1/option_order_info）接口在系统结算或交割后，会把结束状态的订单（5部分成交已撤单 6全部成交 7已撤单）删除掉。

b.获取订单明细信息（option-api/v1/option_order_detail）接口存在延迟情况，所以查询时最好带上：created_at（下单时间戳）和 order_type(订单类型，默认填1)，会直接查询数据库，查询结果会更及时。


### Q17: 为什么系统自动撤单了?

下单时 order_price_type 为: IOC, FOK, Maker（post_only） 当盘口不满足条件时, 会自动撤单

post_only, 只做Maker（Post only）订单, 不会立刻在市场上成交, 如果委托会立即与已有委托成交, 那么该委托会被取消, 保证用户始终为Maker. 

IOC 订单, 若不能在市场上立即成交, 则未成交的部分立即取消. 

FOK 订单, 若不能全部成交则立即全部取消. 

### Q18: 如何获取用户当前资产最大可开张数

目前没有直接获取当前资产最大可开张数的接口. 

### Q19: order_id 和 order_id_str 是一样的吗?

order_id_str 是 order_id 的字符串格式, 两者的值是一样的

对于 18 位的 order_id, 在 nodejs 和 javascript 的 JSON.parse 默认是 int, 解析会有问题, 因此推荐使用 order_id_str

### Q20: 如何获取成交数据中的主买/主卖数量

"获取市场最近成交记录（/option-ex/market/trade）”接口或"sub": "market.$contract_code.trade.detail"订阅, 可以获取此数据, 其中: 

amount: 成交量(张), 买卖双边成交量之和

direction: 主动成交方向

### Q21: 获取K线数据时, from 和 to 的时间间隔是 2000 * period, 为什么获取的 data 为[]?

获取 K 线时, from 和 to 两个时间点是全都包含在内的, 因此是 2001 条数据. 此时数量超出了最大条数 2000. 所以返回 []

另外，当 from 和 to 的时间超过 2 年，返回的数据也会是 []

### Q22: 如何获取合约最新价格

a.调用"获取K线数据（/option-ex/market/history/kline）”接口, 任意 period, 返回数据的最后一条数据的 close 就是最新价. 

b.调用"获取市场最近成交记录（/option-ex/market/trade）”接口, 返回数据的 price 就是最新价

### Q23: API 升级会影响程序的运行吗?

一般情况, API 升级会部分影响 ws 断连, 请做好 ws 重连逻辑. 升级内容可以订阅升级公告: 

交割: https://status-dm.huobigroup.com/

币本位永续: https://status-swap.huobigroup.com/

USDT本位永续: https://status-linear-swap.huobigroup.com/


## 错误码相关

### Q1: 1030错误是什么原因？

如果您出现比如查询订单或者下单时遇到：{"status":"error","err_code":1030,"err_msg":"Abnormal service. Please try again later.","ts":1588093883199}类似错误，说明您的输入的请求参数值或者类型不对，请打印出您的request请求body及完整URL参数，并请一一核对对应API文档接口参数。常见的比如volume张数必须是整数。

### Q2: 1048错误是什么原因？

如果您出现{'index': 1, 'err_code': 1048, 'err_msg': 'Insufficient close amount available. '}类似错误，说明此时可平仓量不足，您平仓时需查询目前已有的仓位张数再去平仓。

1、检查平仓的张数是否过大（当有平仓的限价挂单时, 会占用可平仓位的张数, 建议您撤销这些挂单后再去重试）. 

2、检查仓位方向和开平方向（平多: 卖出平多(direction用sell、offset用close)、平空: 买入平空(direction用buy、offset用close)、闪电平仓只需传: direction（平多:sell、平空: buy））. 

3、止盈止损的挂单和计划委托的挂单, 不会占仓位数. 

### Q3: API返回1032错误码是什么原因？

1032代表您的访问次数超出限制， 期权合约、币本位永续合约、USDT本位永续合约和交割合约是分开限制频率，请查看合约交易接入说明中的访问次数限制，并且可以在api接口response中的header打印当前的频率限制次数来看是否超出限制频率。建议加大请求间隔延时避免超出限制频率。

## 如何更有效的解决问题

  您在反馈API错误时，需要附上您的请求URL，请求request的原始的完整body以及完整请求URL参数，服务器的回复response的原始完整log。如果是websocket订阅，需要您提供订阅的地址，订阅的主题，server推送的原始完整log。

  如果是订单相关问题，在使用API订单查询接口option-api/v1/option_order_info请求后保留返回的完整log，并提供您的UID以及订单号。

# 合约市场行情接口

## 获取合约信息 

###  示例

- GET `option-api/v1/option_contract_info`

```shell

curl "https://api.hbdm.com/option-api/v1/option_contract_info?contract_code=BTC-USDT-201225-C-13000"

```

###  请求参数

参数名称     |  是否必填   |  参数类型   |  描述  | 取值范围                                           |
---------------- |  -------------- |  ---------- |  ----------------------- |  ---------------- |
| symbol        | false    | string | 品种代码 | "BTC","ETH"，如果缺省，默认返回所有品种                         |
| trade_partition | false  | string | 交易分区，不填默认”USDT“ | "USDT"                                                        |
| contract_type | false    | string | 合约类型 | 当周:"this_week", 次周:"next_week", 季度:"quarter"             |
| contract_code   |  false   |  string | 合约代码       | BTC-USDT-201225-C-13000                             |


#### 备注： 

如果所有入参不填，默认查询USDT交易区下所有期权合约信息。若填写了合约代码，则优先按照合约代码查询；

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

###  返回参数

| 参数名称        | 是否必须 | 类型         | 描述                            | 取值范围                                                     |
| --------------- | -------- | ------------ | ------------------------------- | ------------------------------------------------------------ |
| status          | true     | string       | 请求处理结果                    | "ok" , "error"                                               |
| \<data\>            | true     | object array |                                 |                                                              |
| symbol          | true     | string       | 品种代码                        | "BTC","ETH"...                                               |
| trade_partition | true     | string       | 交易分区                        | "USDT"                                                       |
| contract_code   | true     | string       | 合约代码 （若行权价存在小数点，则用”+“表示小数点，如BTC当周看涨期权行权价为9002.35，则合约代码为BTC-USDT-200508-C-9002+35）         | "BTC-USDT-201225-C-13000"                                     |
| contract_type   | true     | string       | 合约类型                        | 当周:"this_week", 次周:"next_week", 季度:"quarter"           |
| contract_size   | true     | decimal      | 合约面值，即1张合约对应多少标的币    | 0.01...                                                   |
| price_tick      | true     | decimal      | 合约价格最小变动精度            | 0.001, 0.01...                                               |
| delivery_date   | true     | string       | 合约交割日期                    | 如"20200626"                                                 |
| create_date     | true     | string       | 合约上市日期                    | 如"20200515"                                                 |
| contract_status | true     | int          | 合约状态                        | 0:下市 1:上市 2:待上市 3:停牌 4:暂停上市中 5:结算中 6:交割中 7 结算完成 8 交割完成 9:暂停交易中 |
| option_right_type | true   | string       | 期权行权类型                  | C:看涨期权 P:看跌期权                                         |
| exercise_price  | true     | decimal      | 行权价                        | 如6622                                                        |
| delivery_asset  | true     | string       | 交割币种                      | 如"BTC"                                                      |
| quote_asset     | true     | string       | 报价币种                      | 如"USDT"                                                     |
| \</data\>           |          |              |                                 |                                                              |
| ts              | true     | long         | 响应生成时间点，单位：毫秒      |                                                              |



## 获取合约指数信息

###  示例

- GET `option-api/v1/option_index`

```shell

curl "https://api.hbdm.com/option-api/v1/option_index?symbol=BTC-USDT"

```


###  请求参数

| 参数名称 | 是否必须 | 类型   | 描述     | 取值范围                      |
| -------- | -------- | ------ | -------- | --------------------------- |
| symbol   | false    | string | 指数代码 | "BTC-USDT","ETH-USDT" |

>   Response:

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

###  返回参数

| 参数名称    | 是否必须 | 类型         | 描述                       | 取值范围       |
| ----------- | -------- | ------------ | -------------------------- | -------------- |
| status      | true     | string       | 请求处理结果               | "ok" , "error" |
| \<data\>        | true     | object array |                            |                |
| symbol      | true     | string       | 指数代码                   | "BTC-USDT","ETH-USDT" |
| index_price | true     | decimal      | 指数价格                   |                |
| index_ts    | true     | long         | 响应生成时间点，单位：毫秒 |                |
| \</data\>       |          |              |                            |                |
| ts          | true     | long         | 时间戳，单位：毫秒         |                |


## 获取合约最高限价和最低限价

###  示例

- GET `option-api/v1/option_price_limit`

```shell

curl "https://api.hbdm.com/option-api/v1/option_price_limit?contract_code=BTC-USDT-201225-C-13000"

```

###  请求参数

| 参数名称      | 是否必须 | 类型   | 描述     | 取值范围                                                     |
| ------------- | -------- | ------ | -------- | ------------------------------------------------------------ |
| contract_code |   false    | string | 合约代码,不填返回所有当前上市合约的限价数据 | BTC-USDT-201225-C-13000                                        |

>   Response:

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

###  返回参数

| 参数名称      | 是否必须 | 类型         | 描述                       | 取值范围                                                     |
| ------------- | -------- | ------------ | -------------------------- | ------------------------------------------------------------ |
| status        | true     | string       | 请求处理结果               | "ok"                                                         |
| \<data\>          | true     | object array |                            |                                                              |
| symbol        | true     | string       | 品种代码                   | "BTC","ETH"...                                               |
| trade_partition | true   | string       | 交易分区                   | "USDT"                                                       |
| contract_type | true     | string       | 合约类型                   | 当周:"this_week", 次周:"next_week", 季度:"quarter"            |
| contract_code | true     | string       | 合约代码                   | 如"BTC-USDT-201225-C-13000" ...                                |
| high_limit    | true     | decimal      | 最高买价                   |                                                              |
| low_limit     | true     | decimal      | 最低卖价                   |                                                              |
| \</data\>          |          |              |                            |                                                              |
| ts            | true     | long         | 响应生成时间点，单位：毫秒 |                                                              |


## 查询合约市场指标 

###  示例

- GET `option-api/v1/option_market_index`

```shell

curl "https://api.hbdm.com/option-api/v1/option_market_index?contract_code=BTC-USDT-201225-C-13000"

```


###  请求参数

| 参数名称      | 是否必须 | 类型   | 描述     | 取值范围                                                     |
| ------------- | -------- | ------ | -------- | ------------------------------------------------------------ |
| symbol        | false    | string | 品种代码 | "BTC","ETH"                                                   |
| trade_partition | false  | string | 交易分区，不填默认”USDT“ | "USDT"                                                        |
| contract_type | false    | string | 合约类型 | 当周:"this_week", 次周:"next_week", 季度:"quarter"             |
| option_right_type | false | string | 期权行权类型 | C:看涨期权 P:看跌期权                                     |
| contract_code | false    | string | 合约代码 | BTC-USDT-201225-C-13000                                       |

###  备注：
- 如果contract_code填了值，那就按照contract_code去查询；
- 如果contract_code没有填值，则按照symbol+trade_partition+contract_type+option_right_type去查询。

>   Response:

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

###  返回参数

| 参数名称      | 是否必须 | 类型         | 描述                       | 取值范围                                                     |
| ------------- | -------- | ------------ | -------------------------- | ------------------------------------------------------------ |
| status        | true     | string       | 请求处理结果               | "ok"                                                         |
| \<data\>          | true     | object array |                            |                                                              |
| symbol        | true     | string       | 品种代码                   | "BTC","ETH"...                                               |
| trade_partition | true   | string       | 交易分区                   | "USDT"                                                       |
| contract_code | true     | string       | 合约代码                   | 如"BTC-USDT-201225-C-13000" ...                               |
| contract_type | true     | string       | 合约类型                   | 当周:"this_week", 次周:"next_week", 季度:"quarter"            |
| option_right_type | true | string       | 期权行权类型               | C:看涨期权 P:看跌期权                                         |
| iv_last_price | true   | decimal      | 最新成交价隐含波动率        |                                                              |
| iv_ask_one    | true     | decimal      | 卖一价隐含波动率            |                                                              |
| iv_bid_one    | true     | decimal      | 买一价隐含波动率            |                                                              |
| iv_mark_price | true     | decimal      | 标记价格隐含波动率          |                                                              |
| delta         | true     | decimal      | DELTA                      |                                                              |
| gamma         | true     | decimal      | GAMMA                      |                                                              |
| theta         | true     | decimal      | THETA                      |                                                              |
| vega          | true     | decimal      | VEGA                       |                                                              |
| ask_one       | true     | decimal      | 卖一价                      |                                                              |
| bid_one       | true     | decimal      | 买一价                      |                                                              |
| last_price  | true     | decimal      | 最新成交价                  |                                                              |
| mark_price    | true     | decimal      | 标记价格                    |                                                              |
| \</data\>          |          |              |                            |                                                              |
| ts            | true     | long         | 响应生成时间点，单位：毫秒  |                                                               |


## 获取当前可用合约总持仓量

###  示例

- GET `/option-api/v1/option_open_interest`


```shell

curl "https://api.hbdm.com/option-api/v1/option_open_interest?contract_code=BTC-USDT-201225-C-13000"

```

###  请求参数

| 参数名称      | 是否必须 | 类型   | 描述          | 取值范围                                                      |
| ------------- | -------- | ------ | ----------- | --------------------------------------------------------------- |
| symbol        | false    | string | 品种代码    | "BTC","ETH"，如果缺省，默认返回所有品种                           |
| trade_partition | false  | string | 交易分区，不填默认”USDT“    | "USDT"                                                          |
| contract_type | false    | string | 合约类型    | this_week:当周 next_week:次周 quarter:季度                      |
| contract_code | false    | string | 合约代码    | BTC-USDT-201225-C-13000                                          |

#### 备注： 

 - 如果所有入参不填，默认查询USDT交易区下所有期权合约信息。若填写了合约代码，则优先按照合约代码查询；
 
>   Response:

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

###  返回参数

| 参数名称      | 是否必须 | 类型         | 描述                       | 取值范围                                                     |
| ------------- | -------- | ------------ | -------------------------- | ------------------------------------------------------------ |
| status        | true     | string       | 请求处理结果               | "ok" , "error"                                               |
| \<data\>          | true     | object array |                            |                                                              |
| symbol        | true     | string       | 品种代码                   | "BTC","ETH"...                                               |
| trade_partition | true   | string       | 交易分区                   | "USDT"                                                       |
| contract_code | true     | string       | 合约代码                   | 如"BTC-USDT-201225-C-13000"                                   |
| contract_type | true     | string       | 合约类型                   | 当周:"this_week", 次周:"next_week", 季度:"quarter"            |
| amount        | true     | decimal      | 持仓量(币)                 |                                                              |
| volume        | true     | decimal      | 持仓量(张)                 |                                                              |
| trade_amount  | true | decimal  | 最近24小时成交量（币）（当前时间-24小时）	     |  |
| trade_volume  | true | decimal    | 最近24小时成交量（张）（当前时间-24小时）	 |                |
| trade_turnover  | true | decimal    | 最近24小时成交额（当前时间-24小时） |                |
| \</data\>         |          |              |                            |                                                              |
| ts            | true     | long         | 响应生成时间点，单位：毫秒 |                                                              |



## 获取预估交割价

###  示例

- GET `/option-api/v1/option_delivery_price`

```shell

curl "https://api.hbdm.com/soption-api/v1/option_delivery_price?symbol=BTC"

```

###  请求参数

| 参数名称 | 是否必须 | 类型   | 描述     | 取值范围                            |
| -------- | -------- | ------ | -------- | --------------------------------- |
| symbol   | true     | string | 品种代码 | "BTC","ETH"...                     |
| trade_partition | false  | string | 交易分区，如果不填，默认为“USDT”  | "USDT"|

>   Response:

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

###  返回参数

| 参数名称       | 是否必须 | 类型         | 描述                       | 取值范围       |
| -------------- | -------- | ------------ | -------------------------- | -------------- |
| status         | true     | string       | 请求处理结果               | "ok" , "error" |
|  \<data\>           | true     | object array |                            |                |
| symbol         | true     | string       | 品种代码                   | "BTC","ETH"... |
| trade_partition | true    | string       | 交易分区                   | "USDT"         |
| delivery_price | true     | decimal      | 预估交割价                 |                |
| \</data\>          |          |              |                            |                |
| ts             | true     | long         | 响应生成时间点，单位：毫秒 |                |

## 获取平台持仓量

###  示例

- GET `option-api/v1/option_his_open_interest`

```shell

curl "https://api.hbdm.com/option-api/v1/option_his_open_interest?symbol=BTC&contract_type=this_week&period=60min&amount_type=1&option_right_type=C&trade_partition=USDT"

```

###  请求参数

| 参数名称      | 是否必须 | 类型   | 描述         | 取值范围                                                     |
| ------------- | -------- | ------ | ------------ | ------------------------------------------------------------ |
| symbol        | true     | string | 品种代码     | "BTC","ETH"...                                              |
| trade_partition | true   | string | 交易分区     | "USDT"                                                      |
| contract_type | true     | string | 合约类型     | 当周:"this_week", 次周:"next_week", 季度:"quarter"          |
| period        | true     | string | 时间周期类型 | 1小时:"60min"，4小时:"4hour"，12小时:"12hour"，1天:"1day"    |
| size          | false    | int    | 获取数量     | 默认为：48，取值范围 [1,200]                                 |
| amount_type   | true     | int    | 计价单位     | 1:张，2:币                                                   |
| option_right_type | true | string | 期权行权类型 | C:看涨期权 P:看跌期权                                         |

>   Response:

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

###  返回参数

| 参数名称      | 是否必须 | 类型         | 描述                       | 取值范围                                                     |
| ------------- | -------- | ------------ | -------------------------- | ------------------------------------------------------------ |
| status        | true     | string       | 请求处理结果               | "ok" , "error"                                               |
| ts            | true     | long         | 响应生成时间点，单位：毫秒 |                                                              |
| \<data\>          | true     | object       | 字典数据                   |                                                              |
| symbol        | true     | string       | 品种代码                   | "BTC","ETH"...                                      |
| trade_partition | true   | string       | 交易分区                   | "USDT"                                                      |
| contract_type | true     | string       | 合约类型                   | 当周:"this_week", 次周:"next_week", 季度:"quarter"           |
| option_right_type | true | string       | 期权行权类型               | C:看涨期权 P:看跌期权                                         |
| \<tick\>          | true     | object array |                            |                                                              |
| volume        | true     | decimal      | 持仓量                     |                                                              |
| amount_type   | true     | int          | 计价单位                   | 1:张，2:币                                                   |
| ts            | true     | long         | 统计时间                   |                                                              |
| \</tick\>         |          |              |                            |                                                              |
| \</data\>         |          |              |                            |                                                              |

### 注意：

  - tick字段：数组内的数据按照时间倒序排列；
  
  - data字段：字典类型。

## 查询系统状态

###  示例

- GET `option-api/v1/option_api_state`


```shell

curl "https://api.hbdm.com/option-api/v1/option_api_state"

```

###  请求参数

| 参数名称 | 是否必须 | 类型   | 描述     | 取值范围                                  |
| -------- | -------- | ------ | -------- | ----------------------------------------- |
| symbol        | false    | string | 品种代码 | "BTC","ETH"，"USDT",如果缺省，默认返回所有品种 |
| trade_partition | false  | string | 交易分区 | "USDT"，不填默认”USDT“                                |

#### 备注：
 - symbol为USDT时，返参仅表现USDT资产的划转权限，开仓、平仓以及撤单权限请直接忽略。

>   Response:

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

###  返回参数

| 参数名称            | 是否必须 | 类型         | 描述                                                   | 取值范围       |
| ------------------- | -------- | ------------ | ------------------------------------------------------ | -------------- |
| status              | true     | string       | 请求处理结果                                           | "ok" , "error" |
| ts                  | true     | long         | 响应生成时间点，单位：毫秒                             |                |
| \<data\>                | true     | object array |                                                        |                |
| symbol              | true     | string       | 品种代码                                               | "BTC","ETH"... |
| trade_partition     | true     | string       | 交易分区                                              | "USDT"          |
| open                | true     | int          | 开仓下单权限："1"表示可用，“0”表示不可用               |                |
| close               | true     | int          | 平仓下单权限："1"表示可用，“0”表示不可用               |                |
| cancel              | true     | int          | 撤单权限："1"表示可用，“0”表示不可用                   |                |
| transfer_in         | true     | int          | 从币币转入的权限："1"表示可用，“0”表示不可用           |                |
| transfer_out        | true     | int          | 转出至币币的权限："1"表示可用，“0”表示不可用           |                |
| master_transfer_sub | true     | int          | 母账户划转到子账户的权限："1"表示可用，“0”表示不可用    |                |
| sub_transfer_master | true     | int          | 子账户划转到母账户的权限："1"表示可用，“0”表示不可用    |                |
| \</data\>               |          |              |                                                      |                |

###  备注

- open，指交易权限中对应的“API-开仓-普通订单”的权限，开启为可用，关闭为不可用；

- close，指交易权限中对应的“API-平仓-普通订单”的权限，开启为可用，关闭为不可用；

- cancel，指交易权限中对应的“API-撤单-普通订单”的权限，开启为可用，关闭为不可用；

- transfer_in，指交易权限中对应的“其他-划转-从币币转入”的权限，开启为可用，关闭为不可用；

- transfer_out，指交易权限中对应的“其他-划转-转出至币币”的权限，开启为可用，关闭为不可用；

- master_transfer_sub，指交易权限中对应的“API-划转-母账户划转到子账户”的权限，开启为可用，关闭为不可用；

- sub_transfer_master，指交易权限中对应的“API-划转-子账户划转到母账户”的权限，开启为可用，关闭为不可用；

## 获取行情深度数据

###  示例

- GET `/option-ex/market/depth`

```shell

curl "https://api.hbdm.com/option-ex/market/depth?contract_code=BTC-USDT-201225-C-13000&type=step5"

```

###  请求参数：

| 参数名称  | 是否必须 | 类型 | 描述  | 取值范围 |
| ------------- | ------ | ----- | ---------------------------------------- | ---- |
| contract_code | true |  string| 合约代码 | "BTC-USDT-201225-C-13000" ...  |
| type   | true |  string| 深度类型 |  (150档数据)  step0, step1, step2, step3, step4, step5, step14, step15（合并深度1-5,14,15）；step0时，不合并深度, (20档数据)  step6, step7, step8, step9, step10, step11, step12, step13（合并深度7-13）；step6时，不合并深度     |

>   Response:

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

###  返回参数

| 参数名称   | 是否必须 | 数据类型   | 描述  | 取值范围           |
| ------ | ---- | ------ | --------------------------------------- | -------------- |
| ch     | true | string | 数据所属的 channel，格式：market.$contract_code.depth.type         |                |
| status | true | string | 请求处理结果                                  | "ok" , "error" |
| \<tick\>   |  true    |   object     |               |                |
| asks   | true | array | 卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序 |                |
| bids   | true | array | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序 |                |
| ch     | true | string | 数据所属的 channel，格式： market.period         |                |
| id     | true | long | 消息id        |                |
| mrid   | true | long | 订单ID                                    |                |
| ts   | true | long | 消息生成时间，单位：毫秒.  |                |
| version   | true | long | 版本                                    |                |
| \</tick\>              |      |        |               |                |
| ts     | true | long | 响应生成时间点，单位：毫秒 |                |



## 获取K线数据

- GET `/option-ex/market/history/kline`

```shell

curl "https://api.hbdm.com//option-ex/market/history/kline?period=1min&size=200&contract_code=BTC-USDT-201225-C-13000"

```

### 请求参数

| 参数名称   | 是否必须 | 类型      | 描述    | 取值范围 |
| ------ | ---- | ------- | ---- | ---------------------------------------- |
| contract_code | true | string  | 合约代码 |  "BTC-USDT-201225-C-13000" ...  |
| period | true | string  | K线类型   | 1min, 5min, 15min, 30min, 60min,4hour,1day,1week,1mon |
| size   | false | int | 获取数量，默认150 |  [1,2000]  |
| from   | false | long | 开始时间戳 10位 单位S |   |
| to   | false | ling | 结束时间戳 10位 单位S |  |

### 备注
- 1、size与from&to 必填其一，若全不填则返回空数据。
- 2、如果填写from，也要填写to。最多可获取连续两年的数据。
- 3、如果size、from、to 均填写，会忽略from、to参数。

>   Response:

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

### 返回参数

| 参数名称   | 是否必须 | 数据类型   | 描述                              | 取值范围           |
| ------ | ---- | ------ | ------------------------------- | -------------- |
| ch     | true | string | 数据所属的 channel，格式： market.period |                |
|  \<data\>   |   true   |    object array    |               |                |
| id     | true | long | K线ID,也就是K线时间戳，K线起始时间    |                |
| vol     | true | decimal | 成交量(张)，买卖双边成交量之和        |                |
| count     | true | decimal | 成交笔数        |                |
| open     | true | decimal | 开盘价        |                |
| close     | true | decimal | 收盘价,当K线为最晚的一根时，是最新成交价        |                |
| low     | true | decimal | 最低价        |                |
| high     | true | decimal | 最高价        |                |
| amount     | true | decimal | 成交量(币), 即 (成交量(张) * 单张合约面值)        |                |
| trade_turnover     | true | decimal | 成交额（即成交的权利金总额），即 sum（每一笔成交张数 * 合约面值 * 成交价格）       |                |
| \</data\>              |      |        |               |                |
| status | true | string | 请求处理结果                          | "ok" , "error" |
| ts     | true | long | 响应生成时间点，单位：毫秒                   |                |

## 获取聚合行情

- GET `/option-ex/market/detail/merged`

```shell

curl "https://api.hbdm.com/option-ex/market/detail/merged?contract_code=BTC-USDT-201225-C-13000"

```
###  请求参数

| 参数名称   | 是否必须 | 类型     | 描述  | 取值范围 |
| ------ | ---- | ------ | ---------------------------------------- | ---- |
| contract_code | true | string | 合约代码 | "BTC-USDT-201225-C-13000" ...   |

>   Response:

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

### 返回参数

| 参数名称   | 是否必须 | 数据类型   | 描述  | 取值范围           |
| ------ | ---- | ------ | ---------------------------------------- | -------------- |
| ch     | true | string | 数据所属的 channel，格式： market.$contract_code.detail.merged |                |
| status | true | string | 请求处理结果     | "ok" , "error" |
| \<tick\>   |true  | object | 开盘价和收盘价（从当天零点(UTC+8)开始）         |                |
| id   | true | long | K线ID,也就是K线时间戳  |                |
| amount   | true | decimal | 成交量(币), 即 (成交量(张) * 单张合约面值)（最近24（当前时间-24小时）小时成交量币）   |                |
| ask   | true | array | [卖1价,卖1量(张)] |                |
| bid   | true | array | [买1价,买1量(张)] |                |
| open     | true | string | 开盘价     |                |
| close     | true | string | 收盘价,当K线为最晚的一根时，是最新成交价       |                |
| count     | true | decimal | 成交笔数（最近24（当前时间-24小时）小时成交笔数）       |                |
| high   | true | string | 最高价                                    |                |
| low   | true | string | 最低价  |                |
| vol   | true | string | 成交量（张），买卖双边成交量之和（最近24（当前时间-24小时）小时成交量张）        |                |
| trade_turnover     | true | string | 成交额（即成交的权利金总额），即 sum（每一笔成交张数 * 合约面值 * 成交价格）（最近24（当前时间-24小时）小时成交额）       |                |
| ts   | true | long | 时间戳   |                |
| \</tick\>              |      |        |               |                |
| ts     | true | long | 响应生成时间点，单位：毫秒                            |                |

## 获取市场最近成交记录

- GET `/option-ex/market/trade`

```shell

curl "https://api.hbdm.com/option-ex/market/trade?contract_code=BTC-USDT-201225-C-13000"

```

### 请求参数

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围                                     |
| ------ | ---- | ------ | ---- |---------------------------------------- |
| contract_code | false | string | 合约代码,不填返回所有当前上市合约的最近成交数据 |  "BTC-USDT-201225-C-13000" ...  |

>   Response:

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

### 返回参数

| 参数名称   | 是否必须 | 类型     | 描述  | 取值范围         |
| ------ | ---- | ------ | ---------------------------------------- |------------ |
| ch     | true | string | 数据所属的 channel，格式： market.$contract_code.trade.detail |      |
| status | true | string |     | "ok","error" |
| \<tick\>      | true | object |           |      |
| id     | true | long | 订单唯一id（品种唯一）   |      |
| ts     | true | long | 最新成交时间       |      |
| \<data\>      | true | object array |        |      |
| amount     | true | string | 成交量(张)，买卖双边成交量之和       |      |
| direction     | true | string | 买卖方向，即taker(主动成交)的方向     |      |
| id     | true | long | 成交唯一id（品种唯一）      |      |
| price     | true | string | 成交价       |      |
| ts     | true | long | 成交时间       |      |
| quantity  | true | string | 成交量（币）       |     
| trade_turnover     | true | string | 成交额（计价币种）     |      |
| contract_code     | true | string | 合约代码     |      |
|\</data\>      |  |  |              |      |
|\</tick\>      |  |  |              |      |
| ts     | true | long | 发送时间       |      |



## 批量获取最近的交易记录

### 实例

- GET ` /option-ex/market/history/trade`

```shell

curl "https://api.hbdm.com/ /option-ex/market/history/trade?contract_code=BTC-USDT-201225-C-13000&size=10"

```

### 请求参数

| 参数名称   | 是否必须  | 数据类型   | 描述    | 取值范围   |
| ------ | ----- | ------ | --------- | ---------------------------------------- |
| contract_code | true  | string | 合约代码      |    "BTC-USDT-201225-C-13000" ... |
| size   | true | int   | 获取交易记录的数量      |  [1, 2000]   |

>   Response:

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

### 返回参数

| 参数名称   | 是否必须 | 数据类型   | 描述  | 取值范围         |
| ------ | ---- | ------ | ---------------------------------------- | ------------ |
| ch     | true | string | 数据所属的 channel，格式： market.$contract_code.trade.detail |              |
| \<data\>   | true | object array |           |      |       |
| \<data\>    | true | object array |           |      |       |
| amount     | true | decimal | 成交量(张)，买卖双边成交量之和       |      |            |
| direction     | true | string | 买卖方向，即taker(主动成交)的方向   |      |            |
| id     | true | long | 成交唯一id（品种唯一）    |      |            |
| price     | true | decimal | 成交价格       |      |            |
| ts     | true | long | 成交时间       |      |            |
| quantity  | true | decimal | 成交量（币）      |      |
| trade_turnover     | true | decimal | 成交额（计价币种）    |      |
|\</data\>      |  |  |              |      |            |
| id     | true | long | 订单唯一id（品种唯一）   |      |            |
| ts     | true | long | 最新成交时间       |      |            |
|\</data\>      |  |  |              |      |            |
| status | true | string |                                          | "ok"，"error" |
| ts     | true | long | 响应生成时间点，单位：毫秒                            |              |

#### 备注
- 2021年2月3日 21:00:00 后返回参数才会有quantity、trade_turnover字段。


# 合约资产接口

## 获取账户总资产估值

 - POST `/option-api/v1/option_balance_valuation`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| valuation_asset   | false  | string    |    资产估值币种，即按该币种为单位进行估值，不填默认"BTC"    |   "BTC","USD","USDT","CNY","EUR","GBP","VND","HKD","TWD","MYR","SGD","KRW","RUB","TRY"    |

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

### 返回参数

| 参数名称                   | 是否必须 | 类型      | 描述                 | 取值范围                                     |
| ---------------------- | ---- | ------- | ------------------ | ---------------------------------------- |
| status                 | true | string  | 请求处理结果             |                                          |
| \<data\> | true     |  object array      |                    |                                          |
| valuation_asset   | true  | string    |    资产估值币种，即按该币种为单位进行估值   |  "BTC","USD","USDT","CNY","EUR","GBP","VND","HKD","TWD","MYR","SGD","KRW","RUB","TRY"   |
| balance        | true | string |    资产估值       |         |
| \</data\>            |      |         |                    |                                          |
| ts                     | true | long    | 时间戳                |                                          |


## 获取用户账户信息

###  示例

- POST  `option-api/v1/option_account_info`

>   Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT"
}

```

###  请求参数

| 参数名称 | 是否必须 | 类型   | 描述     | 取值范围                                 |
| -------- | -------- | ------ | -------- | ---------------------------------------- |
| symbol   | false    | string | 资产品种 | "BTC"，"ETH"，"USDT"，如果缺省，默认返回所有资产品种    |
| trade_partition | false  | string |  交易分区，不填默认”USDT“ | "USDT"                              |

>   Response:

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

###  返回参数

| 参数名称           | 是否必须 | 类型         | 描述                                     | 取值范围       |
| ------------------ | -------- | ------------ | ---------------------------------------- | -------------- |
| status             | true     | string       | 请求处理结果                             | "ok" , "error" |
| ts                 | long     | long         | 响应生成时间点，单位：毫秒               |                |
| \<data\>               | true     | object array |                                          |                |
| symbol             | true     | string       | 资产品种                                 | "BTC","ETH","USDT" |
| trade_partition    | true     | string       | 交易分区                                 | "USDT"         |
| margin_balance     | true     | decimal      | 账户权益                                 |                |
| margin_position    | true     | decimal      | 履约保证金 |                |
| margin_frozen      | true     | decimal      | 冻结保证金（卖方）                             |                |
| margin_available   | true     | decimal      | 可用保证金                               |                |
| profit_real        | true     | decimal      | 已实现盈亏                               |                |
| profit_unreal      | true     | decimal      | 未实现盈亏                               |                |
| withdraw_available | true     | decimal      | 可划转数量                               |                |
| margin_static      | true     | decimal      | 静态权益                                 |                |
| premium_frozen     | true     | decimal      | 冻结权利金（买方）                               |                |
| fee_frozen         | true     | decimal      | 冻结手续费                               |                |
| fee_asset         | true     | string      | 手续费币种                               |                |
| premium_in         | true     | decimal      | 本周权利金收入                            |                |
| premium_out        | true     | decimal      | 本周权利金支出                            |                |
| delta              | true     | decimal      | DELTA                                    |                |
| gamma              | true     | decimal      | GAMMA                                    |                |
| theta              | true     | decimal      | THETA                                    |                |
| vega               | true     | decimal      | VEGA                                     |                |
| option_value       | true     | decimal      | 期权市值（单位为USDT）                                 |                |
| margin_asset       | true     | string       | 保证金币种                 | "BTC"，”ETH“，”USDT“ |
| \</data\>              |          |              |                                          |                |

### 备注：

- USDT资产是USDT交易区下所有品种期权共用的；

- USDT资产下的期权市值为USDT区下所有品种期权持仓的价值；BTC资产下的期权市值为BTC期权持仓的价值；ETH资产下的期权市值为ETH期权持仓的价值；

## 获取用户持仓信息

###  示例

- POST `option-api/v1/option_position_info`

>  Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "contract_code": "BTC-USDT-201225-C-13000"
}

```

###  请求参数

| 参数名称 | 是否必须 | 类型   | 描述     | 取值范围                                 |
| -------- | -------- | ------ | -------- | ---------------------------------------- |
| symbol   | false    | string | 品种代码 | "BTC","ETH"，如果缺省，默认返回所有品种    |
| trade_partition | false  | string | 交易分区 | "USDT"，不填默认”USDT“                               |
| contract_code | false | string | 合约代码 | "BTC-USDT-201225-C-13000" ...            |

>   Response:

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

###  返回参数

| 参数名称        | 是否必须 | 类型         | 描述                       | 取值范围                                                     |
| --------------- | -------- | ------------ | -------------------------- | ------------------------------------------------------------ |
| status          | true     | string       | 请求处理结果               | "ok" , "error"                                               |
| ts              | true     | long         | 响应生成时间点，单位：毫秒 |                                                              |
| \<data\>            | true     | object array |                            |                                                              |
| symbol          | true     | string       | 品种代码                   | "BTC","ETH"...                                               |
| trade_partition | true     | string       | 交易分区                   | "USDT"                                                       |
| contract_code   | true     | string       | 合约代码                   | "BTC-USDT-201225-C-13000" ...                                 |
| contract_type   | true     | string       | 合约类型                   | 当周:"this_week", 次周:"next_week", 季度:"quarter"            |
| volume          | true     | decimal      | 持仓量                     |                                                              |
| available       | true     | decimal      | 可平仓数量                 |                                                              |
| frozen          | true     | decimal      | 冻结数量                   |                                                              |
| cost_open       | true     | decimal      | 开仓均价                   |                                                              |
| cost_hold       | true     | decimal      | 持仓均价                   |                                                              |
| profit_unreal   | true     | decimal      | 未实现盈亏                 |                                                              |
| profit_rate     | true     | decimal      | 收益率                     |                                                              |
| profit          | true     | decimal      | 收益                       |                                                              |
| margin_position | true     | decimal      | 履约保证金             |                                                              |
| position_value  | true     | decimal      | 仓位价值                   |                                                              |
| direction       | true     | string       | "buy":买 "sell":卖         |                                                              |
| last_price      | true     | decimal      | 最新价                     |                                                              |
| delivery_date   | true     | string       | 到期日                     | 如"20200508"                                                 |
| option_right_type | true   | string       | 期权行权类型               | C:看涨期权 P:看跌期权                                         |
| exercise_price    | true   | decimal      | 行权价                     |                                                              |
| quote_asset     | true     | string       | 报单币种                   | "USDT"...                                                    |
| margin_asset    | true     | string       | 保证金币种                 | "BTC"，”ETH“，”USDT“                                         |
| \</data\>           |          |              |                            |                                                              |



## 批量设置子账户交易权限

 - POST `/option-api/v1/option_sub_auth`

### 请求参数

| 参数名称          | 是否必须  | 类型     | 描述   | 取值范围                                     |
| ------------- | ----- | ------ | ------------- | ---------------------------------------- |
| sub_uid | true  | string | 子账户uid (多个uid中间以","分隔,一次最多允许开通10个子账户)	    |                                          |
| sub_auth | true  | int |  子账户交易权限，1 开启，0关闭	    |                                          |

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

###  返回参数

| 参数名称                   | 是否必须 | 类型     | 描述                                 | 取值范围           |
| ---------------------- | ---- | ------ | ---------------------------------- | -------------- |
| status                 | true | string | 请求处理结果                             | "ok" , "error" |
| \<data\>            |  true    |       |                                    |                |
| \<errors\>            |  true    | object array       |                                    |                |
| sub_uid               | true | string | 开通失败的子账户uid                            |                |
| err_code               | true | int    | 错误码                                |                |
| err_msg                | true | string | 错误信息                               |                |
| \</errors\>              |      |        |                                    |                |
| successes              | true | string | 开通合约成功的子账户uid列表 |                |
| \</data\>              |      |        |                                    |                |
| ts                     | true | long   | 响应生成时间点，单位：毫秒                      |                |


## 查询母账户下所有子账户资产信息

- post `option-api/v1/option_sub_account_list`

>     Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT"
}

```

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述     | 取值范围                                    |
| -------- | -------- | ------ | -------- | ------------------------------------------- |
| symbol   | false    | string | 资产品种 | "BTC"，"ETH"，“USDT”，如果缺省，默认返回所有品种       |
| trade_partition | false  | string | 交易分区，不填默认”USDT“  | "USDT"                                 |


>    Response:

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

### 返回参数

| 参数名称          | 是否必须 | 类型         | 描述                       | 取值范围       |
| ----------------- | -------- | ------------ | -------------------------- | -------------- |
| status            | true     | string       | 请求处理结果               | "ok" , "error" |
| ts                | true     | long         | 响应生成时间点，单位：毫秒 |                |
| \<data\>              | true     | object array |                            |                |
| sub_uid           | true     | long         | 子账户UID                  |                |
| \<list\>              | true     | object array |                            |                |
| symbol            | true     | string       | 资产品种                   | "BTC","ETH","USDT" |
| trade_partition   | true     | string       | 交易分区                   | "USDT"         |
| margin_balance    | true     | decimal      | 账户权益                   |                |
| \</list\>             |          |              |                            |                |
| \</data\>             |          |              |                            |                |                   |                |

### 备注

  - 只返回已经开通合约交易的子账户数据.



## 批量获取子账户资产信息

 - POST `/option-api/v1/option_sub_account_info_list`

### 请求参数
| 参数名称   | 是否必须  | 类型     | 描述   |  取值范围       |
| ------ | ----- | ------ |  ---- | ------------------------------ |
| symbol   | false    | string | 资产品种 | "BTC"，"ETH"，“USDT”，如果缺省，默认返回所有品种       |
| trade_partition | false  | string | 交易分区，不填默认”USDT“ | "USDT"                                 |
| page_index  | false | int    | 第几页,不填默认第一页            |                                          |
| page_size   | false | int    | 不填默认20，不得多于50          |                                          |

#### 备注：
- 只返回已经开通合约交易的子账户数据.
- 子账户列表默认按照开通合约时间升序，先开通合约排在前面

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

### 返回参数

| 参数名称  | 是否必须 | 类型      | 描述     | 取值范围           |
| ----------------- | ---- | ------- | ------------- | -------------- |
| status                | true | string  | 请求处理结果        | "ok" , "error"                           |
| ts                    | true | long    | 响应生成时间点，单位：毫秒 |                                          |
| \<data\>              | true    |  object       | 字典类型          |                                          |
| \<sub_list\>  | true     |  object array       |               |                                          |
| sub_uid           | true | long    | 子账户UID        |                |
| \<account_info_list\>          |   true   |  object array       |               |                |
| symbol            | true     | string       | 资产品种                   | "BTC","ETH","USDT"... |
| trade_partition   | true     | string       | 交易分区                   | "USDT"         |
| margin_balance    | true     | decimal      | 账户权益                   |                |
| \</account_info_list\>         |      |         |               |                |
| \</sub_list\> |     |         |               |                                          |
| current_page          | true | int     | 当前页           |                                          |
| total_page            | true | int     | 总页数           |                                          |
| total_size            | true | int     | 总条数           |                                          |
| \</data\>             |      |         |      |     |



## 查询母账户下的单个子账户资产信息

- POST `option-api/v1/option_sub_account_info`

###  请求参数

>  Request:

```json

{
  "sub_uid": "123456789",
  "symbol": "BTC",
  "trade_partition": "USDT"
}

```

| 参数名称 | 是否必须 | 类型   | 描述        | 取值范围                                   |
| -------- | -------- | ------ | ----------- | ------------------------------------------ |
| symbol   | false    | string | 资产品种 | "BTC","ETH","USDT"，如果缺省，默认返回所有品种         |
| trade_partition | false  | string | 交易分区，不填默认”USDT“ | "USDT"                                   |
| sub_uid  | true     | string | 子账户的UID |                                            |

>  Response:

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

### 返回参数

| 参数名称           | 是否必须 | 类型         | 描述                                     | 取值范围                                            |
| ------------------ | -------- | ------------ | ---------------------------------------- | --------------------------------------------------- |
| status             | true     | string       | 请求处理结果                             | "ok" , "error"                                      |
| ts                 | true     | long         | 响应生成时间点，单位：毫秒               |                                                     |
| \<data\>               | true     | object array |                                          |                                                     |
| symbol             | true     | string       | 资产品种                                 | "BTC","ETH","USDT"...                                      |
| trade_partition    | true     | string       | 交易分区                                 | "USDT"                                              |
| margin_balance     | true     | decimal      | 账户权益                                 |                                                     |
| margin_position    | true     | decimal      | 履约保证金  |                                                     |
| margin_frozen      | true     | decimal      | 冻结保证金（卖方）                             |                                                     |
| margin_available   | true     | decimal      | 可用保证金                               |                                                     |
| profit_real        | true     | decimal      | 已实现盈亏                               |                                                     |
| profit_unreal      | true     | decimal      | 未实现盈亏                               |                                                     |
| withdraw_available | true     | decimal      | 可划转数量                               |                                                     |
| margin_static      | true     | decimal      | 静态权益                                 |                                                     |
| premium_frozen     | true     | decimal      | 冻结权利金（买方）                             |                                                     |
| fee_frozen         | true     | decimal      | 冻结手续费                             |                                                     |
| fee_asset         | true     | string      | 手续费币种                               |                |
| premium_in         | true     | decimal      | 本周权利金收入                            |                                                     |
| premium_out        | true     | decimal      | 本周权利金支出                            |                                                     |
| delta              | true     | decimal      | DELTA                                    |                                                     |
| gamma              | true     | decimal      | GAMMA                                    |                                                     |
| theta              | true     | decimal      | THETA                                    |                                                     |
| vega               | true     | decimal      | VEGA                                     |                                                     |
| option_value       | true     | decimal      | 期权市值（单位为USDT）                      |                                                     |
| margin_asset       | true     | string       | 保证金币种                                 | "BTC"，”ETH“，”USDT“  |
| \</data\>              |          |              |                                          |                                                     |

#### 备注


- USDT资产是交易区下所有品种期权共用的；

- USDT资产下的期权市值为USDT区下所有品种期权持仓的价值；BTC资产下的期权市值为BTC期权持仓的价值；ETH资产下的期权市值为ETH期权持仓的价值；

- 只能查询到开通合约交易的子账户信息；

- 子账户来过合约系统但是未开通合约交易也不返回对应的数据；

## 查询母账户下的单个子账户持仓信息

- POST `option-api/v1/option_sub_position_info`

>  Request:

```json

{
  "sub_uid": "123456789",
  "symbol": "BTC",
  "trade_partition": "USDT",
  "contract_code": "BTC-USDT-201225-C-13000"
}

```

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述        | 取值范围                                   |
| -------- | -------- | ------ | ----------- | ------------------------------------------ |
| symbol   | false    | string | 品种代码     | "BTC","ETH"，如果缺省，默认返回所有品种     |
| trade_partition | false  | string | 交易分区，不填默认”USDT“ | "USDT"                                   |
| contract_code | false | string | 合约代码   | 如"BTC-USDT-201225-C-13000" ...             |
| sub_uid  | true     | string | 子账户的UID |                                            |

>  Response:

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

### 返回参数

| 参数名称        | 是否必须 | 类型         | 描述                       | 取值范围                                                     |
| --------------- | -------- | ------------ | -------------------------- | ------------------------------------------------------------ |
| status          | true     | string       | 请求处理结果               | "ok" , "error"                                               |
| ts              | true     | long         | 响应生成时间点，单位：毫秒 |                                                              |
| \<data\>            | true     | object array |                            |                                                              |
| symbol          | true     | string       | 品种代码                   | "BTC","ETH"...                                               |
| trade_partition | true     | string       | 交易分区                   | "USDT"                                                       |
| contract_code   | true     | string       | 合约代码                   | "BTC-USDT-201225-C-13000" ...                                 |
| contract_type   | true     | string       | 合约类型                   | 当周:"this_week", 次周:"next_week", 季度:"quarter"            |
| volume          | true     | decimal      | 持仓量                     |                                                              |
| available       | true     | decimal      | 可平仓数量                 |                                                              |
| frozen          | true     | decimal      | 冻结数量                   |                                                              |
| cost_open       | true     | decimal      | 开仓均价                   |                                                              |
| cost_hold       | true     | decimal      | 持仓均价                   |                                                              |
| profit_unreal   | true     | decimal      | 未实现盈亏                 |                                                              |
| profit_rate     | true     | decimal      | 收益率                     |                                                              |
| profit          | true     | decimal      | 收益                       |                                                              |
| margin_position | true     | decimal      | 履约保证金              |                                                              |
| position_value  | true     | decimal      | 仓位价值                   |                                                              |
| direction       | true     | string       | 仓位方向                   | "buy":多 "sell":空                                           |
| last_price      | true     | decimal      | 最新价                     |                                                              |
| delivery_date   | true     | string       | 到期日                     | 如"20200508"                                                 |
| option_right_type | true   | string       | 期权行权类型               | C:看涨期权 P:看跌期权                                         |
| exercise_price    | true   | decimal      | 行权价                     |                                                              |
| quote_asset     | true     | string       | 报单币种                   | "USDT"...                                                    |
| margin_asset    | true     | string       | 保证金币种                 | "BTC"，”ETH“，”USDT“                                                   |
| \</data\>           |          |              |                            |                                                              |


## 查询用户财务记录

- POST `option-api/v1/option_financial_record`

>  Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT"
}
```

###  请求参数

| 参数名称    | 是否必须 | 类型        |  描述                              | 取值范围                                          |
| ----------- | -------- | ------   | -------------------------- | ------------------------------------------------------------ |
| symbol  <img width=300/>    | true <img width=250/>     | string <img width=250/>      | 资产品种   <img width=1000/>       |  "BTC","ETH","USDT"...     |
| trade_partition | false    | string |  交易分区，不填默认”USDT“                           |     "USDT"              |
| type        | false        | string | 不填查询全部类型,【查询多类型中间用，隔开】             |  1:开多; 2:开空; 3:平多; 4:平空; 5:开仓手续费-吃单; 6:开仓手续费-挂单; 7:平仓手续费-吃单; 8:平仓手续费-挂单; 9:交割平多; 10:交割平空; 11:交割手续费; 12:强制平多; 13:强制平空; 14:从币币转入; 15:转出至币币; 16:结算未实现盈亏-多仓; 17:结算未实现盈亏-空仓; 19:穿仓分摊; 26:系统; 28:活动奖励; 29:返利; 30:资金费-收入; 31:资金费-支出; 34:转出到子账号合约账户; 35:从子账号合约账户转入; 36:转出到母账号合约账户; 37:从母账号合约账户转入;     |
| create_date | false        | int    |  可随意输入正整数，如果参数超过90则默认查询90天的数据    |    [1,90]        |
| page_index  | false        | int    |  第几页,不填默认第一页                              |        |
| page_size   | false        | int    |  不填默认20，不得多于50                             |        |

>  Response:

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

### 返回参数

| 参数名称            | 是否必须 | 类型         |  描述                |   取值范围                                     |
| ------------------- | -------- | ------------ | ----------------------- | ----------------------------------- |
| status  <img width=300/>| true  <img width=250/>   | string <img width=250/> |  请求处理结果   <img width=1000/>       | "ok" , "error"  |
| ts                      | true     | long         |  响应生成时间点，单位：毫秒   |                                                           |
| \<data\>                | true     | object       | 字典类型                   |                                                              |
| \<financial_record\>    | true     | object array |                            |                                                              |
| id                      | true     | long         | 财务记录ID（品种唯一）                          |                                                              |
| ts                      | true     | long         | 创建时间                    |                                                               |
| symbol                  | true     | string       | 品种代码                    |  "BTC","ETH","USDT"...                                              |
| trade_partition         | true     | string       | 交易分区                    |  "USDT"                                                      |
| contract_code           | true     | string       | 合约代码                    |  "BTC-USDT-201225-C-13000"， ...                              |
| type                    | true     | int          | 交易类型                     |  1:开多; 2:开空; 3:平多; 4:平空; 5:开仓手续费-吃单; 6:开仓手续费-挂单; 7:平仓手续费-吃单; 8:平仓手续费-挂单; 9:交割平多; 10:交割平空; 11:交割手续费; 12:强制平多; 13:强制平空; 14:从币币转入; 15:转出至币币; 16:结算未实现盈亏-多仓; 17:结算未实现盈亏-空仓; 19:穿仓分摊; 26:系统; 28:活动奖励; 29:返利; 30:资金费-收入; 31:资金费-支出; 34:转出到子账号合约账户; 35:从子账号合约账户转入; 36:转出到母账号合约账户; 37:从母账号合约账户转入;          |
| amount                  | true     | decimal      | 金额                       |                                                               |
| \</financial_record\>   |          |              |                            |                                                               |
| current_page            | true     | int          | 当前页                     |                                                                |
| total_page              | true     | int          | 总页数                     |                                                                |
| total_size              | true     | int          | 总条数                     |                                                                |
| \</data\>               |          |              |                            |                                                                |

## 获取用户当前的下单量限制

- POST `option-api/v1/option_order_limit`

>  Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "order_price_type": "ioc"
}
```

### 请求参数

| 参数名称         | 是否必须 | 类型   |  描述                    |     取值范围                 |                                  
| ---------------- | -------- | ------ | -------------------------- | ------------------------------------------------------ |
| symbol           | false <img width=250/>   | string | 品种代码  <img width=1000/>       | "BTC","ETH"，如果缺省，默认返回所有品种                     |
| trade_partition  | false    | string | 交易分区，不填默认”USDT“                            | "USDT"   |
| order_price_type | true     | string | 订单报价类型  |  "limit":限价，"opponent":对手价，"lightning":闪电平仓，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档，"fok":FOK订单，"ioc":IOC订单, "opponent_ioc": 对手价-IOC下单，"lightning_ioc": 闪电平仓-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"lightning_fok"：闪电平仓-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单    |

>  Response:

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

### 返回参数

| 参数名称         |  是否必须  |  类型         |    取值范围                                                     | 描述                       |
| ----------------  | -------- | ------------ | -------------------------- | ------------------------------------------------------------ |
| status            | true  <img width=250/>   | string       |  请求处理结果   <img width=1000/>             |  "ok" , "error"   |
| ts                | true     | long         |  响应生成时间点，单位：毫秒                                     |                      |
| \<data\>          | true     | object       |                                                             |                                                              |
| order_price_type  | true     | string       | 订单报价类型                                                  |  "limit":限价，"opponent":对手价，"lightning":闪电平仓，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档，"fok":FOK订单，"ioc":IOC订单, "opponent_ioc": 对手价-IOC下单，"lightning_ioc": 闪电平仓-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"lightning_fok"：闪电平仓-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单              |
| \<list\>          | true     | object array |                                                             |                                                              |
| symbol            | true     | string       |  品种代码                                                    |  "BTC","ETH"...                                               |
| trade_partition   | true     | string       |  交易分区                                                    |  "USDT"                                                       | 
| \<types\>         | true     | object array |                                                             |                                                               |
| contract_type     | true     | string       |  合约类型                                                    |  当周:"this_week", 次周:"next_week", 季度:"quarter"             | 
| option_right_type | true     | string       |  期权行权类型                                                 |  C:看涨期权 P:看跌期权                                          |
| open_limit        | true     | long         |  合约开仓单笔下单量最大值                                       |                                                              |
| close_limit       | true     | long         |  合约平仓单笔下单量最大值                                       |                                                              |
| \</types\>        |          |              |                                                             |                                                              |
| \</list\>         |          |              |                                                             |                                                              |
| \</data\>         |          |              |                                                             |                                                              |

## 获取用户当前的手续费费率

- POST `option-api/v1/option_fee`

>  Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT"
}

```

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述     | 取值范围                                   |
| -------- | -------- | ------ | -------- | ------------------------------------------ |
| symbol   | false    | string | 品种代码 | "BTC","ETH"，如果缺省，默认返回所有品种      |
| trade_partition | false  | string | 交易分区，不填默认”USDT“ | "USDT"                                |

>  Response:

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

### 返回参数

| 参数名称        | 是否必须 | 类型         | 描述                           | 取值范围       |
| --------------- | -------- | ------------ | ------------------------------ | -------------- |
| status          | true     | string       | 请求处理结果                   | "ok" , "error" |
| ts              | true     | long         | 响应生成时间点，单位：毫秒     |                |
| \<data\>            | true     | object array |                                |                |
| symbol          | true     | string       | 资产品种                        | "BTC","ETH"，"USDT"... |
| trade_partition | true     | string       | 交易分区                        | "USDT"         |
| fee_asset         | true     | string      | 手续费币种                               |                |
| open_maker_fee  | true     | string       | 开仓挂单的手续费/手续费率，小数形式 |                |
| open_taker_fee  | true     | string       | 开仓吃单的手续费/手续费率，小数形式 |                |
| close_maker_fee | true     | string       | 平仓挂单的手续费/手续费率，小数形式 |                |
| close_taker_fee | true     | string       | 平仓吃单的手续费/手续费率，小数形式 |                |
| call_delivery_fee    | true     | string       | 看涨合约交割的手续费/手续费率，小数形式     |                |
| put_delivery_fee    | true     | string       | 看跌合约交割的手续费/手续费率，小数形式     |                |
| fee_rate_type   | true     | int          | 费率类型 1:相对费用,2:绝对费用（相对费用取手续费率；绝对费用取手续费，单位为USDT） |                |
| max_trade_in_fee_rate | true | string     | 交易所手续费收取上限（比率），小数形式 |               |
| max_trade_out_fee_rate | true | string    | 交易所手续费支出上限（比率），小数形式 |               |
| max_delivery_fee_rate | true   | string      | 交割手续费上限（比率），小数形式      |               |
| \</data\>           |          |              |                               |                |

### 备注：

  - 当费率类型为”相对费用“时，则手续费按手续费率收取，即为权利金 * 对应的手续费率；当 费率类型为”绝对费用“时，则手续费固定按每张多少计价货币收取，但不能超过手续费收取/支出上限（即权利金 * 手续费收取上限比率）；
  
  - 比如：在USDT交易区的BTC期权下，open_maker_fee（开仓挂单的手续费/手续费率）值为0.4，那么在相对费用时表示开仓手续费率为40%，在绝对费用时表示开仓每张期权合约手续费为0.4USDT。

## 获取用户当前的划转限制

- POST `option-api/v1/option_transfer_limit`

>  Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT"
}

```

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述     | 取值范围                                   |
| -------- | -------- | ------ | -------- | ------------------------------------------ |
| symbol   | false    | string | 品种代码 | "BTC","ETH"，如果缺省，默认返回所有品种      |
| trade_partition | false  | string | 交易分区，不填默认”USDT“ | "USDT"                                |

>  Response:

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

### 返回参数

| 参数名称                   | 是否必须 | 类型         | 描述                       | 取值范围       |
| -------------------------- | -------- | ------------ | -------------------------- | -------------- |
| status                     | true     | string       | 请求处理结果               | "ok" , "error" |
| ts                         | true     | long         | 响应生成时间点，单位：毫秒 |                |
| \<data\>                       | true     | object array |                            |                |
| symbol                     | true     | string       | 品种代码                  | "BTC","ETH"...  |
| trade_partition            | true     | string       | 交易分区                  | "USDT"          |
| transfer_in_max_each       | true     | decimal      | 单笔最大转入量             |                |
| transfer_in_min_each       | true     | decimal      | 单笔最小转入量             |                |
| transfer_out_max_each      | true     | decimal      | 单笔最大转出量             |                |
| transfer_out_min_each      | true     | decimal      | 单笔最小转出量             |                |
| transfer_in_max_daily      | true     | decimal      | 单日累计最大转入量         |                |
| transfer_out_max_daily     | true     | decimal      | 单日累计最大转出量         |                |
| net_transfer_in_max_daily  | true     | decimal      | 单日累计最大净转入量       |                |
| net_transfer_out_max_daily | true     | decimal      | 单日累计最大净转出量       |                |
| \</data\>                      |          |              |                            |                |

## 获取用户当前的持仓量限制

- post `option-api/v1/option_position_limit`

>  Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT"
}

```

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述     | 取值范围                                   |
| -------- | -------- | ------ | -------- | ------------------------------------------ |
| symbol   | false    | string | 品种代码 | "BTC","ETH"，如果缺省，默认返回所有品种      |
| trade_partition | false  | string | 交易分区，不填默认”USDT“ | "USDT"                                |

>  Response:

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

### 返回参数

| 参数名称      | 是否必须 | 类型         | 描述                           | 取值范围                                                     |
| ------------- | -------- | ------------ | ------------------------------ | ------------------------------------------------------------ |
| status        | true     | string       | 请求处理结果                   | "ok" , "error"                                               |
| ts            | true     | long         | 响应生成时间点，单位：毫秒     |                                                              |
| \<data\>          | true     | object array |                                |                                                              |
| symbol        | true     | string       | 品种代码                        | "BTC","ETH"...                                               |
| trade_partition | true   | string       | 交易分区                        | "USDT"                                                       |
| \<list\>          | true     | object array |                                |                                                              |
| option_right_type | true | string       | 期权行权类型                    | C-看涨(call)，P-看跌(put)                                     |
| contract_type | true     | string       | 合约类型                       | 当周:"this_week", 次周:"next_week", 季度:"quarter"，所有合约:“all” |
| buy_limit     | true     | decimal      | 合约多仓持仓的最大值，单位为张 |                                                              |
| sell_limit    | true     | decimal      | 合约空仓持仓的最大值，单位为张 |                                                              |
| \</list\>         |          |              |                                |                                                              |
| \</data\>         |          |              |                                |                                                              |

## 获取用户资产和持仓信息

- post `option-api/v1/option_account_position_info`

>  Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT"
}

```

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述     | 取值范围                                 |
| -------- | -------- | ------ | -------- | ---------------------------------------- |
| symbol   | true     | string | 资产品种 | "BTC","ETH","USDT"...                            |
| trade_partition | false  | string | 交易分区，不填默认”USDT“ | "USDT"                              |

### 备注：

  - 若请求BTC资产，则返回BTC资产信息以及BTC期权下所有持仓信息；若请求USDT资产，则仅返回USDT资产信息，持仓信息为空。
  
  - USDT资产下的期权市值为USDT区下所有品种期权持仓的价值；BTC资产下的期权市值为BTC期权持仓的价值；ETH资产下的期权市值为ETH期权持仓的价值；
  

>  Response:

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

### 返回参数
| 参数名称           | 是否必须 | 类型         | 描述                       | 取值范围                                           |
| ------------------ | -------- | ------------ | -------------------------- | -------------------------------------------------- |
| status             | true     | string       | 请求处理结果               | "ok" , "error"                                     |
| ts                 | long     | long         | 响应生成时间点，单位：毫秒 |                                                    |
| \<data\>             | true     | object array |                            |                                                    |
| symbol             | true     | string       | 资产品种                   | "BTC","ETH","USDT"...                              |
| trade_partition    | true     | string       | 交易分区                   | "USDT"                                             |
| margin_balance     | true     | decimal      | 账户权益                   |                                                    |
| margin_position    | true     | decimal      | 履约保证金                 |                                                    |
| margin_frozen      | true     | decimal      | 冻结保证金（卖方）         |                                                    |
| margin_available   | true     | decimal      | 可用资金                   |                                                    |
| profit_real        | true     | decimal      | 已实现盈亏                 |                                                    |
| profit_unreal      | true     | decimal      | 未实现盈亏                 |                                                    |
| withdraw_available | true     | decimal      | 可划转数量                 |                                                    |
| margin_static      | true     | decimal      | 静态权益                   |                                                    |
| premium_frozen     | true     | decimal      | 冻结权利金（买方）         |                                                    |
| fee_frozen         | true     | decimal      | 冻结手续费                 |                                                    |
| fee_asset          | true     | string       | 手续费币种                 |                                                    |
| premium_in         | true     | decimal      | 本周权利金收入             |                                                    |
| premium_out        | true     | decimal      | 本周权利金支出             |                                                    |
| delta              | true     | decimal      | DELTA                      |                                                    |
| gamma              | true     | decimal      | GAMMA                      |                                                    |
| theta              | true     | decimal      | THETA                      |                                                    |
| vega               | true     | decimal      | VEGA                       |                                                    |
| option_value       | true     | decimal      | 期权市值（单位为USDT）         |                                                    |
| margin_asset       | true     | string       | 保证金币种                 | "BTC"，”ETH“，”USDT“                               |
| \<positions\>        | true     | object array |                            |                                                    |
| symbol             | true     | string       | 品种代码                   | "BTC","ETH"...                                     |
| trade_partition    | true     | string       | 交易分区                   | "USDT"                                             |
| contract_code      | true     | string       | 合约代码                   | "BTC-USDT-201225-C-13000"                           |
| contract_type      | true     | string       | 合约类型                   | 当周:"this_week", 次周:"next_week", 季度:"quarter" |
| volume             | true     | decimal      | 持仓量                     |                                                    |
| available          | true     | decimal      | 可平仓数量（张）           |                                                    |
| frozen             | true     | decimal      | 冻结数量（张）             |                                                    |
| cost_open          | true     | decimal      | 开仓均价                   |                                                    |
| cost_hold          | true     | decimal      | 持仓均价                   |                                                    |
| profit_unreal      | true     | decimal      | 未实现盈亏                 |                                                    |
| profit_rate        | true     | decimal      | 收益率                     |                                                    |
| profit             | true     | decimal      | 收益                       |                                                    |
| margin_position    | true     | decimal      | 履约保证金                 |                                                    |
| position_value     | true     | decimal      | 仓位价值                   |                                                    |
| direction          | true     | string       | "buy":买 "sell":卖         |                                                    |
| last_price         | true     | decimal      | 最新价                     |                                                    |
| delivery_date      | true     | string       | 到期日                     | 如"20200508"                                       |
| option_right_type  | true     | string       | 期权行权类型               | C:看涨期权 P:看跌期权                              |
| exercise_price     | true     | decimal      | 行权价                     |                                                    |
| quote_asset        | true     | string       | 报单币种                   | "USDT"...                                          |
| margin_asset       | true     | string       | 保证金币种                 | "BTC"，”ETH“，”USDT“                               |
| \</positions\>       |          |              |                            |                                                    |
| \</data\>            |          |              |                            |                                                    |


## 母子账户划转

- post `option-api/v1/option_master_sub_transfer`

>  Request:

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

| 参数名称 | 是否必须 | 类型    | 描述      | 取值范围                                                     |
| -------- | -------- | ------- | --------- | ------------------------------------------------------------ |
| sub_uid  | true     | long    | 子账号uid |                                                              |
| symbol   | true     | string  | 资产品种  | "BTC","ETH,"USDT"...                                                |
| trade_partition | true   | string | 交易分区 | "USDT"                                                     |
| amount   | true     | decimal | 划转金额  |                                                              |
| type     | true     | string  | 划转类型  | master_to_sub：母账户划转到子账户， sub_to_master：子账户划转到母账户 |
| client_order_id | false | long | 客户自己填写和维护的订单号 | 必须为数字,请注意必须小于等于9223372036854775807 |

#### 备注
 - 母账户与每个子账户相互划转限频10次/分钟。
 - 即8小时内同一个用户同一个划转路径无法使用相同的client_order_id进行二次划转（比如母账户发起母转子，使用client_order_id=1，则8小时内无法继续使用client_order_id=1进行母转子；但是可以用client_order_id=1进行子转母。）。

>  Response:

```json

{
    "status": "ok",
    "data": {
        "order_id": "775309101143093248"
    },
    "ts": 1604889694272
}

```

### 返回参数

| 参数名称 | 是否必须 | 类型   | 描述                       | 取值范围       |
| -------- | -------- | ------ | -------------------------- | -------------- |
| status   | true     | string | 请求处理结果               | "ok" , "error" |
| ts       | true     | long   | 响应生成时间点，单位：毫秒 |                |
| \<data\>     | true     | object |                            |                |
| order_id | true     | long   | 划转订单ID                 |                |
| client_order_id | false | long | 用户下单时填写的客户端订单ID，没填则不返回	| 
| \</data\>    |          |        |                            |                |



## 获取母账户下的所有母子账户划转记录

- get `option-api/v1/option_master_sub_transfer_record`

>  Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "transfer_type": "34",
  "create_date": 7
}
```

### 请求参数

| 参数名称      | 是否必须 | 类型   | 描述                                                  | 取值范围                                             |
| ------------- | -------- | ------ | ----------------------------------------------------- | ---------------------------------------------------- |
| symbol        | true     | string | 资产品种                                              | "BTC","ETH","USDT"...                                       |
| trade_partition | false   | string | 交易分区，不填默认”USDT“                                              | "USDT"                                               |
| transfer_type | false    | string | 划转类型，不填查询全部类型,【查询多类型中间用，隔开】 | 34:转出到子账号合约账户 35:从子账号合约账户转入      |
| create_date   | true     | int    | 日期                                                  | 可随意输入正整数，如果参数超过90则默认查询90天的数据 |
| page_index    | false    | int    | 页码，不填默认第1页                                   | 1                                                    |
| page_size     | false    | int    | 不填默认20，不得多于50                                | 20                                                   |

>  Response:

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

### 返回参数:

| 参数名称           | 是否必须 | 类型         | 描述                       | 取值范围                                          |
| ------------------ | -------- | ------------ | -------------------------- | ------------------------------------------------- |
| status             | true     | string       | 请求处理结果               | "ok" , "error"                                    |
| ts                 | true     | long         | 响应生成时间点，单位：毫秒 |                                                   |
| \<data\>               | true     | object       |                            |                                                   |
| \<transfer_record\>    | true     | object array |                            |                                                   |
| id                 | true     | long         | 划转订单ID                 |                                                   |
| ts                 | true     | long         | 创建时间                   |                                                   |
| symbol             | true     | string       | 资产品种                   | "BTC","ETH","USDT"...                                    |
| trade_partition    | true     | string       | 交易分区                   | "USDT"                                            |
| sub_uid            | true     | string       | 子账户UID                  |                                                   |
| sub_account_name   | true     | string       | 子账户登录名               |                                                   |
| transfer_type      | true     | int          | 划转类型                   | 35:从子账号合约账户转入; 34:转出到子账号合约账户; |
| amount             | true     | decimal      | 金额                       |                                                   |
| \</transfer_record\>   |          |              |                            |                                                   |
| total_page         | true     | int          | 总页数                     |                                                   |
| current_page       | true     | int          | 当前页                     |                                                   |
| total_size         | true     | int          | 总条数                     |                                                   |
| \</data\>              |          |              |                            |                                                   |

## 获取用户API指标禁用信息

- get `option-api/v1/option_api_trading_status`

### 请求参数
无

>  Response:

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

### 返回参数:

| 参数名称               | 是否必须 | 类型    | 描述                                                         | 取值范围                                                     |
| ---------------------- | -------- | ------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status                 | true     | string  | 请求处理结果                                                 | "ok" , "error"                                               |
| ts                     | true     | long    | 响应生成时间点，单位：毫秒                                   |                                                              |
| \<data\>                   | true     | object  |                                                              |                                                              |
| is_disable             | true     | int     | 是否被禁用                                                   | 1：被禁用中，0：没有被禁用                                   |
| order_price_types      | true     | string  | 触发禁用的订单价格类型，多个订单价格类型以英文逗号分割，例如：“limit,post_only,FOK,IOC” |                                                              |
| disable_reason         | true     | string  | 触发禁用的原因，表示当前的禁用是由哪个指标触发               | "COR":撤单率（Cancel Order Ratio），“TDN”：总禁用次数（Total Disable Number） |
| disable_interval       | true     | long    | 禁用时间间隔，单位：毫秒                                     |                                                              |
| recovery_time          | true     | long    | 计划恢复时间，单位：毫秒                                     |                                                              |
| \<COR\>                    | true     | object  | 表示撤单率的指标（Cancel Order Ratio）                       |                                                              |
| orders_threshold       | true     | long    | 委托单笔数的阈值                                             |                                                              |
| orders                 | true     | long    | 用户委托单笔数的实际值                                       |                                                              |
| invalid_cancel_orders  | true     | long    | 用户委托单中的无效撤单笔数                                   |                                                              |
| cancel_ratio_threshold | true     | decimal | 撤单率的阈值                                                 |                                                              |
| cancel_ratio           | true     | decimal | 用户撤单率的实际值                                           |                                                              |
| is_trigger             | true     | int     | 用户是否触发该指标                                           | 1：已经触发，0：没有触发                                     |
| is_active              | true     | int     | 该指标是否开启                                               |                                                              |
| \</COR\>                   |          |         |                                                              |                                                              |
| \<TDN\>                    | true     | object  | 表示总禁用次数的指标（Total Disable Number）                 |                                                              |
| disables_threshold     | true     | long    | 总禁用次数的阈值                                             |                                                              |
| disables               | true     | long    | 总禁用次数的实际值                                           |                                                              |
| is_trigger             | true     | int     | 用户是否触发该指标                                           | 1：已经触发，0：没有触发                                     |
| is_active              | true     | int     | 该指标是否开启                                               |                                                              |
| \</TDN\>                   |          |         |                                                              |                                                              |
| \</data\>                  |          |         |                                                              |                                                              |



# 合约交易接口

## 合约下单 

###  示例

- POST  `option-api/v1/option_order`

>  Request:

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

###  请求参数

| 参数名           | 是否必须 | 参数类型 | 描述                                             | 取值范围                                                     |
| ---------------- | -------- | ----- | ------------------------------------------------ | ------------------------------------------------------------ |
| contract_code     | true <img width=250/>  | string  <img width=250/>  | 合约代码   <img width=1000/>                    | BTC-USDT-201225-C-13000                                      |
| client_order_id | false  | long     | 客户自己填写和维护，必须为数字                   |                                                              |
| price           | false  | decimal  | 价格                                             |                                                              |
| volume         | true   | long      | 委托数量(张)                                     |                                                              |
| direction        | true   | string  | 仓位方向                                         | "buy":买 "sell":卖                                           |
| offset         | true    | string   | 开平方向                                         | "open":开 "close":平                                         |
| order_price_type | true | string    | 订单报价类型                                     | "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档，ioc:IOC订单，fok：FOK订单, "opponent_ioc": 对手价-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |

###  备注

"limit":限价，"post_only":只做maker单，ioc:IOC订单，fok：FOK订单  这四种类型需要传价格price，其他订单报价类型不需要传价格price。

###   开平方向

开多：买入开多(direction用buy、offset用open)

平多：卖出平多(direction用sell、offset用close)

开空：卖出开空(direction用sell、offset用open)

平空：买入平空(direction用buy、offset用close)

>  Response:

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

###  返回参数

| 参数名称        | 是否必须 | 类型   | 描述                                       | 取值范围       |
| --------------- | -------- | ------ | ------------------------------------------ | -------------- |
| status          | true     | string | 请求处理结果                               | "ok" , "error" |
| \<data\>            | true     | object |                                            |                |
| order_id        | true     | long   | 订单ID                                     |                |
| order_id_str    | true     | string | String类型订单ID                           |                |
| client_order_id | false    | long   | 用户下单时填写的客户端订单ID，没填则不返回   |                |
| \</data\>           |          |        |                                            |                |
| ts              | true     | long   | 响应生成时间点，单位：毫秒                 |                |

### 备注
 - order_id返回是18位，nodejs和javascript默认解析18有问题，nodejs和javascript里面JSON.parse默认是int，超过18位的数字用json-bigint的包解析。

## 合约批量下单 


###  示例

- POST  `option-api/v1/option_batchorder`

>  Request:

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

###  请求参数

| 参数名称         | 是否必须 | 类型         | 描述                                             | 取值范围                                                     |
| ---------------- | -------- | ------------ | ------------------------------------------------ | ------------------------------------------------------------ |
| \<orders_data\>      | true     | object array |                                                  |                                                              |
| contract_code    | true <img width=250/>     | string       | 合约代码   <img width=1000/>                    | BTC-USDT-201225-C-13000                                      |
| client_order_id  | false    | long         | 客户自己填写和维护，必须为数字                   |                                                              |
| price            | false    | decimal      | 价格                                             |                                                              |
| volume           | true     | long         | 委托数量(张)                                     |                                                              |
| direction        | true     | string       | 仓位方向                                         | "buy":买 "sell":卖                                           |
| offset           | true     | string       | 开平方向                                         | "open":开 "close":平                                         |
| order_price_type | true     | string       | 订单报价类型                                     | "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档，ioc：IOC订单，fok：FOK订单,"opponent_ioc": 对手价-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |
| \</orders_data\>     |          |              |                                                  |                                                              |

###  备注

 - "limit":限价，"post_only":只做maker单，ioc:IOC订单，fok：FOK订单 这四种类型需要传价格price，其他订单报价类型不需要传价格price。

 - 一次最多允许10个订单。

>  Response:

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

###  返回参数

| 参数名称        | 是否必须 | 类型         | 描述                                       | 取值范围       |
| --------------- | -------- | ------------ | ------------------------------------------ | -------------- |
| status          | true     | string       | 请求处理结果                               | "ok" , "error" |
| \<data\>          | true     | object array |                                            |                |
| \<errors\>          | true     | object array |                                            |                |
| index           | true     | int          | 订单索引                                   |                |
| err_code        | true     | int          | 错误码                                     |                |
| err_msg         | true     | string       | 错误信息                                   |                |
| \</errors\>         |          |              |                                            |                |
| \<success\>         |          |              |                                            |                |
| index           | true     | int          | 订单索引                                   |                |
| order_id        | true     | long         | 订单ID                                     |                |
| order_id_str    | true     | string       | string格式的订单ID                         |                |
| client_order_id | true     | long         | 用户下单时填写的客户端订单ID，没填则不返回 |                |
| \</success\>        |          |              |                                            |                |
| \</data\>        |          |              |                                            |                |
| ts              | true     | long         | 响应生成时间点，单位：毫秒                 |                |

### 备注
order_id返回是18位，nodejs和javascript默认解析18有问题，nodejs和javascript里面JSON.parse默认是int，超过18位的数字用json-bigint的包解析。

## 撤销订单 

###  示例

- POST `option-api/v1/option_cancel`

>  Request:

```json

{
  "order_id": "675016139515973632,675016139515973632,675016172537729024",
  "trade_partition": "USDT"
}

```

###  请求参数

| 参数名称        | 是否必须 | 类型   | 描述                                                         | 取值范围       |
| --------------- | -------- | ------ | ------------------------------------------------------------ | -------------- |
| order_id        | false(请看备注)    | string | 订单ID(多个订单ID中间以","分隔,一次最多允许撤消10个订单)     |                |
| client_order_id | false(请看备注)    | string | 客户订单ID(多个订单ID中间以","分隔,一次最多允许撤消10个订单) |                |
| trade_partition | false    | string | 交易分区，不填默认”USDT“                                                   | "USDT"         |

### 备注：
 - order_id和client_order_id都可以用来撤单，至少要填写一个,同时只可以设置其中一种，如果设置了两种，默认以order_id来撤单。

 - 撤单接口返回结果只代表撤单命令发送成功，建议根据订单查询接口查询订单的状态来确定订单是否已真正撤销。
 
 - client_order_id，24小时有效，超过24小时的订单根据client_order_id将查询不到。
 
>  Response:

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

###  返回参数

| 参数名称  | 是否必须 | 类型         | 描述                                          | 取值范围       |
| --------- | -------- | ------------ | --------------------------------------------- | -------------- |
| status    | true     | string       | 请求处理结果                                  | "ok" , "error" |
| \<data\>    | true     | object array |                                               |                |
| \<errors\>    | true     | object array |                                               |                |
| order_id  | true     | string       | 订单ID                                        |                |
| err_code  | true     | int          | 错误码                                        |                |
| err_msg   | true     | string       | 错误信息                                      |                |
| \</errors\>   |          |              |                                               |                |
| successes | true     | string       | 撤销成功的订单的order_id或client_order_id列表 |                |
| \</data\>   |          |              |                                               |                |
| ts        | true     | long         | 响应生成时间点，单位：毫秒                    |                |


## 全部撤单 

###  示例

- POST  `option-api/v1/option_cancelall`


###  请求参数

| 参数名称      | 是否必须 | 类型   | 描述     | 取值范围                                                     |
| ------------- | -------- | ------ | -------- | ------------------------------------------------------------ |
| symbol             | true     | string       | 品种代码                   | "BTC","ETH"...                                    |
| trade_partition | false  | string | 交易分区 | "USDT"，不填默认”USDT“                                          |
| contract_type | false    | string | 合约类型 | this_week:当周 next_week:次周 quarter:季度                    |
| contract_code | false    | string | 合约代码 | BTC-USDT-201225-C-13000                                      |
| direction | false  | string | 买卖方向（不填默认全部）  |  "buy":买 "sell":卖 |
| offset | false  | string | 开平方向（不填默认全部）  | "open":开 "close":平  |

### 备注:

- 只要有contract_code，则撤销该code的合约
- direction与offset可只填其一，只填其一则按对应的条件去撤单。（如用户只传了direction=buy，则撤销所有买单，包括开仓和平仓）

>  Response:

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

###  返回参数

| 参数名称  | 是否必须 | 类型         | 描述                       | 取值范围       |
| --------- | -------- | ------------ | -------------------------- | -------------- |
| status    | true     | string       | 请求处理结果               | "ok" , "error" |
| \<data\>    | true     | object array |                            |                |
| \<errors\>    | true     | object array |                            |                |
| order_id  | true     | string       | 订单id                     |                |
| err_code  | true     | int          | 订单失败错误码             |                |
| err_msg   | true     | string       | 订单失败信息               |                |
| \</errors\>   |          |              |                            |                |
| successes | true     | string       | 成功的订单                 |                |
| \</data\>   |          |              |                            |                |
| ts        | true     | long         | 响应生成时间点，单位：毫秒 |                |


## 获取用户的订单信息

###  示例

- POST  `option-api/v1/option_order_info`

> Request:

```json
{
  "order_id": "663044581377445880",
  "symbol": "BTC",
  "trade_partition": "USDT",
  "client_order_id": "663044581377445888"
}
```

###  请求参数

| 参数名称        | 是否必须 | 类型   | 描述                                                         | 取值范围       |
| --------------- | -------- | ------ | ------------------------------------------------------------ | -------------- |
| order_id        | false（请看备注）    | string | 订单ID(多个订单ID中间以","分隔,一次最多允许查询50个订单)     |                |
| client_order_id | false（请看备注）    | string | 客户订单ID(多个订单ID中间以","分隔,一次最多允许查询50个订单) |                |
| symbol          | true     | string | 品种代码                                                   | "BTC","ETH"... |
| trade_partition | false    | string | 交易分区,不填默认”USDT“                                     | "USDT"         |

### 备注：
 - order_id和client_order_id至少要填写一个。

 - order_id和client_order_id都可以用来查询，同时只可以设置其中一种，至少要填写一个，如果设置了两种，默认以order_id来查询。周五行权结算后，会把结束状态的订单（5部分成交已撤单 6全部成交 7已撤单）删除掉。

 - client_order_id，24小时有效，超过24小时的订单根据client_order_id将查询不到。

>  Response:

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

###  返回数据

| 参数名称         | 是否必须   | 类型     |  描述                                                         | 取值范围                                                     |
| ---------------- | -------- | ------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status           | true <img width=250/>     | string  | 请求处理结果   <img width=1000/>                  | "ok" , "error"                                               |
| \<data\>            | true     | object  |                                      |                                                              |
| symbol            | true     | string  | 品种代码                             | "BTC","ETH"...                                               |
| trade_partition   | true     | string  | 交易分区                             | "USDT"                                                       |
| contract_type     | true     | string  | 合约类型                             | 当周:"this_week", 次周:"next_week", 季度:"quarter"           |
| contract_code     | true     | string  | 合约代码                             | "BTC-USDT-201225-C-13000"                                     |
| volume            | true     | decimal | 委托数量（张）                       |                                                              |
| price             | true     | decimal | 委托价格                             |                                                              |
| order_price_type  | true     | string  | 订单报价类型                         | "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档，ioc：IOC订单，fok：FOK订单,"opponent_ioc": 对手价-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |
| order_type        | true     | int     | 订单类型，1:报单 、 2:撤单 、 4:交割 |                                                              |
| direction         | true     | string  | "buy":买 "sell":卖                   |                                                              |
| offset            | true     | string  | "open":开 "close":平                 |                                                              |
| order_id          | true     | long    | 订单ID                               |                                                              |
| order_id_str      | true     | string  | string格式的订单ID                   |                                                              |
| client_order_id   | true     | long    | 客户订单ID                           |                                                              |
| created_at        | true     | long    | 订单创建时间                         |                                                              |
| trade_volume      | true     | decimal | 成交数量（张）                       |                                                              |
| trade_turnover    | true     | decimal | 成交总金额                           |                                                              |
| fee               | true     | decimal | 手续费                               |                                                              |
| fee_asset         | true     | string  | 手续费币种                           |                                                              |
| trade_avg_price   | true     | decimal | 成交均价                             |                                                              |
| margin_frozen     | true     | decimal | 冻结保证金（卖方）                   |                                                              |
| margin_asset      | true     | string  | 保证金币种                           | "BTC"，”ETH“，”USDT“                                         |
| profit            | true     | decimal | 收益                                 |                                                              |
| status            | true     | int     | 订单状态                             | (3未成交 4部分成交 5部分成交已撤单 6全部成交 7已撤单)        |
| order_source      | true     | string  | 订单来源                             |                                                              |
| delivery_date     | true     | string  | 到期日                               | 如"20200508"                                                 |
| option_right_type | true     | string  | 期权行权类型                         | C:看涨期权 P:看跌期权                                        |
| exercise_price    | true     | decimal | 行权价                               |                                                              |
| quote_asset       | true     | string  | 报价币种                             | 如"USDT"                                                     |
| premium_frozen    | true     | decimal | 冻结权利金（买方）                   |                                                              |
| fee_frozen        | true     | decimal | 冻结手续费                           |                                                              |
| \</data\>           |          |         |                                      |                                                              |
| ts                | true     | long    | 时间戳                               |                                                              |


## 获取用户的订单明细信息

###  示例

- POST `option-api/v1/option_order_detail`

>  Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "order_id": 663681892062679040,
  "order_type": 1
}

```

###  请求参数

| 参数名称   | 是否必须 | 类型   | 描述                   | 取值范围                           |
| ---------- | -------- | ------ | ---------------------- | ---------------------------------- |
| symbol     | true     | string | 品种代码                | "BTC","ETH"...                    |
| trade_partition | false  | string | 交易分区，不填默认”USDT“  | "USDT"                            |
| order_id   | true     | long   | 订单id                 |                                    |
| created_at | false    | long   | 下单时间戳             |                                    |
| order_type | false    | int    | 订单类型               | 1:报单 、 2:撤单 、4:交割 |
| page_index | false    | int    | 第几页,不填第一页      |                                    |
| page_size  | false    | int    | 不填默认20，不得多于50 |                                    |

### 备注

 - 获取订单明细接口查询撤单数据时，如果传“created_at”和“order_type”参数则能查询最近90天数据，如果不传“created_at”和“order_type”参数只能查询到最近24小时数据。

 - order_id返回是18位，nodejs和javascript默认解析18有问题，nodejs和javascript里面JSON.parse默认是int，超过18位的数字用json-bigint的包解析。

 - created_at使用13位long类型时间戳（包含毫秒时间），如果输入准确的时间戳，查询性能将会提升。例如:"2019/10/18 10:26:22"转换为时间戳为：1571365582123。也可以直接从contract_order下单接口返回的ts中获取时间戳查询对应的订单。

 - created_at禁止传0。


>  Response:

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


###  返回数据

| 参数名称          | 是否必须 | 类型         | 描述                                                         | 取值范围                                                     |
| ----------------- | -------- | ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status            | true  <img width=250/> | string       | 请求处理结果    <img width=1000/>                     | "ok" , "error"                                               |
| \<data\>            | true     | object       |                                                              |                                                              |
| symbol            | true     | string       | 品种代码                                                     | "BTC","ETH"...                                               |
| trade_partition   | true     | string       | 交易分区                                                     | "USDT"                                                       |
| contract_type     | true     | string       | 合约类型                                                     | 当周:"this_week", 次周:"next_week", 季度:"quarter"           |
| contract_code     | true     | string       | 合约代码                                                     | "BTC-USDT-201225-C-13000"                                     |
| direction         | true     | string       | 买卖方向                                                     | "buy":买 "sell":卖                                           |
| offset            | true     | string       | 开平方向                                                     | "open":开 "close":平                                         |
| volume            | true     | decimal      | 委托数量（张）                                               |                                                              |
| price             | true     | decimal      | 委托价格                                                     |                                                              |
| created_at        | true     | long         | 创建时间                                                     |                                                              |
| canceled_at       | true     | long         | 撤单时间                                                     |                                                              |
| order_source      | true     | string       | 订单来源                                                     |                                                              |
| order_price_type  | true     | string       | 订单报价类型                                                 | "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档，ioc：IOC订单，fok：FOK订单,"opponent_ioc": 对手价-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |
| margin_frozen     | true     | decimal      | 冻结保证金（卖方）                                           |                                                              |
| margin_asset      | true     | string       | 保证金币种                                                   | "BTC"，”ETH“，”USDT“                                         |
| profit            | true     | decimal      | 收益                                                         |                                                              |
| order_type        | true     | int          | 订单类型，1:报单 、 2:撤单 、 4:交割                         |                                                              |
| order_id          | true     | long         | 订单ID                                                       |                                                              |
| order_id_str      | true     | string       | string格式的订单ID                                           |                                                              |
| client_order_id   | true     | long         | 客户订单ID                                                   |                                                              |
| trade_volume      | true     | decimal      | 成交数量（张）                                               |                                                              |
| trade_turnover    | true     | decimal      | 成交总金额                                                   |                                                              |
| fee               | true     | decimal      | 手续费                                                       |                                                              |
| fee_asset         | true     | string       | 手续费币种                                                   |                                                              |
| trade_avg_price   | true     | decimal      | 成交均价                                                     |                                                              |
| status            | true     | int          | 订单状态                                                     | (3未成交 4部分成交 5部分成交已撤单 6全部成交 7已撤单)        |
| delivery_date     | true     | string       | 到期日                                                       |                                                              |
| option_right_type | true     | string       | 期权行权类型                                                 | C:看涨期权 P:看跌期权                                        |
| exercise_price    | true     | decimal      | 行权价                                                       |                                                              |
| quote_asset       | true     | string       | 报价币种                                                     | 如"USDT"                                                     |
| premium_frozen    | true     | decimal      | 冻结权利金（买方）                                           |                                                              |
| fee_frozen        | true     | decimal      | 冻结手续费                                                   |                                                              |
| total_page        | true     | int          | 总共页数                                                     |                                                              |
| current_page      | true     | int          | 当前页数                                                     |                                                              |
| total_size        | true     | int          | 总条数                                                       |                                                              |
| \<trades\>          | true     | object array |                                                              |                                                              |
| id                | true     | string       | 全局唯一的交易标识。                                             |                                                              |
| trade_id          | true     | long         | 与option-api/v1/option_matchresults返回结果中的match_id一样，是撮合结果id， 非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id |                                                              |
| trade_price       | true     | decimal      | 撮合价格                                                     |                                                              |
| trade_volume      | true     | decimal      | 成交量                                                       |                                                              |
| trade_turnover    | true     | decimal      | 成交金额                                                     |                                                              |
| trade_fee         | true     | decimal      | 成交手续费                                                   |                                                              |
| fee_asset         | true     | string       | 手续费币种                                                   |                                                              |
| role              | true     | string       | taker或maker                                                 |                                                              |
| created_at        | true     | long         | 创建时间                                                     |                                                              |
| \</trades\>         |          |              |                                                              |                                                              |
| \</data\>          |          |              |                                                              |                                                              |
| ts                | true     | long         | 时间戳                                                       |                                                              |


## 获取用户的当前未成交委托 

###  示例

- POST `option-api/v1/option_openorders`  

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

###  请求参数

| 参数名称   | 是否必须  | 类型   | 描述                         | 取值范围                                |
| ---------- | -------- | ------ | ---------------------------- | -------------------------------------- |
| symbol     | false    | string | 品种代码                     | "BTC","ETH"，如果缺省，默认返回所有品种  |
| trade_partition | false  | string | 交易分区，不填默认”USDT“    | "USDT"                                  |
| contract_code | false | string | 合约代码                     | "BTC-USDT-201225-C-13000" ...            |
| page_index | false    | int    | 页码，不填默认第1页           |                                         |
| page_size  | false    | int    | 页长，不填默认20，不得多于50  |                                         |
| sort_by  | false | string    |  排序字段，不填默认按创建时间倒序         | “created_at”(按照创建时间倒序)，“update_time”(按照更新时间倒序)   |
| trade_type  | false | int    |  交易类型，不填默认查询全部         | 0:全部,1:买入 开多,2: 卖出开空,3: 买入平空,4: 卖出平多。   |

>  Response:

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

###  返回参数

| 参数名称         | 是否必须 | 类型    | 描述                                                         | 取值范围                                                     |
| ---------------- | -------- | ------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status           | true <img width=250/>     | string  | 请求处理结果    <img width=1000/>                 |                                                              |
| \<data\>             | true     | object  |                                                              |                                                              |
| \<orders\>             | true     |   |                                                              |                                                              |
| symbol           | true     | string  | 品种代码                                                     | "BTC","ETH"...                                               |
| trade_partition  | true     | string  | 交易分区                                                     | "USDT"                                                       |
| contract_type    | true     | string  | 合约类型                                                     | 当周:"this_week", 次周:"next_week", 季度:"quarter"            |
| contract_code    | true     | string  | 合约代码                                                     | "BTC-USDT-201225-C-13000"                                      |
| volume           | true     | decimal | 委托数量（张）                                                     |                                                              |
| price            | true     | decimal | 委托价格                                                     |                                                              |
| order_price_type | true     | string  | 订单报价类型  |     "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档，ioc：IOC订单，fok：FOK订单,"opponent_ioc": 对手价-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单                                                         |
| order_type       | true     | int     | 订单类型，1:报单 、 2:撤单 、4:交割                 |                                                              |
| direction        | true     | string  | "buy":买 "sell":卖                                           |                                                              |
| offset           | true     | string  | "open":开 "close":平                                         |                                                              |
| order_id         | true     | long    | 订单ID                                                       |                                                              |
| order_id_str     | true     | string  | string格式的订单ID                                           |                                                              |
| client_order_id  | true     | long    | 客户订单ID                                                   |                                                              |
| created_at       | true     | long    | 订单创建时间                                                 |                                                              |
| trade_volume     | true     | decimal | 成交数量（张）                                                     |                                                              |
| trade_turnover   | true     | decimal | 成交总金额                                                   |                                                              |
| fee              | true     | decimal | 手续费                                                       |                                                              |
| trade_avg_price  | true     | decimal | 成交均价                                                     |                                                              |
| margin_frozen    | true     | decimal | 冻结保证金 （卖方）                                                  |                                                              |
| margin_asset     | true     | string  | 保证金币种                                                    | "BTC"，”ETH“，”USDT“                                         |
| profit           | true     | decimal | 收益                                                         |                                                              |
| status           | true     | int     | 订单状态                                                     | (3未成交 4部分成交 5部分成交已撤单 6全部成交 7已撤单)        |
| order_source     | true     | string  | 订单来源                                                     |                                                              |
| delivery_date    | true     | string  | 到期日                                                       | 如"20200508"                                                 |
| option_right_type | true    | string  | 期权行权类型                                                 | C:看涨期权 P:看跌期权                                         |
| exercise_price   | true     | decimal | 行权价                                                       |                                                               |
| quote_asset      | true     | string  | 报价币种                                                     | 如"USDT"                                                     |
| premium_frozen   | true     | decimal | 冻结权利金（买方）                                                   |                                                             |
| fee_frozen       | true     | decimal | 冻结手续费                                                   |                                                             |
| fee_asset         | true    | string      | 手续费币种                               |                |
| update_time       | true    | Long | 订单更新时间，单位：毫秒  | |
| \</orders\>            |          |         |                                                              |                                                              |
| total_page       | true     | int     | 总页数                                                       |                                                              |
| current_page     | true     | int     | 当前页                                                       |                                                              |
| total_size       | true     | int     | 总条数                                                       |                                                              |
| \</data\>        |          |         |                                                              |                                                              |
| ts               | true     | long    | 时间戳                                                       |                                                              |


## 获取用户的历史委托

###  示例

- POST `option-api/v1/option_hisorders` 

>  Request:

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

###  请求参数

| 参数名称      | 是否必须 | 类型   | 描述                 | 取值范围                                                     |
| ------------- | -------- | ------ | -------------------- | ------------------------------------------------------------ |
| symbol        | true     | string | 品种代码             | "BTC","ETH"...                                                |
| trade_partition | false  | string | 交易分区，不填默认”USDT“    | "USDT"                                                        |
| trade_type    | true     | int    | 交易类型             | 0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多,7:交割平多,8: 交割平空 |
| type          | true     | int    | 类型                 | 1:所有订单,2:结束状态的订单                                  |
| status        | true     | int    | 订单状态             | 0:全部,3:未成交, 4: 部分成交,5: 部分成交已撤单,6: 全部成交,7:已撤单 |
| create_date   | true     | int    | 日期                 | 可随意输入正整数，如果参数超过90则默认查询90天的数据                                           |
| page_index    | false    | int    | 页码，不填默认第1页  |                                                              |
| page_size     | false    | int    | 每页条数，不填默认20 | 不得多于50                                                   |
| contract_code | false    | string | 合约代码             | BTC-USDT-201225-C-13000                                     |
| sort_by       | false    | string | 排序字段（降序），不填默认按照create_date降序 | "create_date"：按订单创建时间进行降序，"update_time"：按订单更新时间进行降序|

### 备注：

 - 所有已撤销且无成交的API限价订单记录只保留24小时。

>  Response:

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

###  返回参数

| 参数名称         | 是否必须 | 类型         | 描述               | 取值范围                                                     |
| ---------------- | -------- | ------------ | ------------------ | ------------------------------------------------------------ |
| status  <img width=250/>  | true <img width=250/> | string <img width=250/>   | 请求处理结果 <img width=1000/>   |                                                              |
| \<data\>             | true     | object       |                    |                                                              |
| \<orders\>           | true     | object array |                    |                                                              |
| order_id         | true     | long         | 订单ID             |                                                              |
| order_id_str     | true     | string       | string格式的订单ID |                                                              |
| symbol           | true     | string       | 品种代码           | "BTC","ETH"...                                               |
| trade_partition  | true     | string       | 交易分区           | "USDT"                                                       |
| contract_type    | true     | string       | 合约类型           | 当周:"this_week", 次周:"next_week", 季度:"quarter"           |
| contract_code    | true     | string       | 合约代码           | "BTC-USDT-201225-C-13000"                                    |
| direction        | true     | string       | 买卖方向           | "buy":买 "sell":卖                                           |
| offset           | true     | string       | 开平方向           | "open":开 "close":平                                         |
| volume           | true     | decimal      | 委托数量(张)           |                                                              |
| price            | true     | decimal      | 委托价格           |                                                              |
| create_date      | true     | long         | 创建时间           |                                                              |
| update_time      |  true    |  long        | 订单更新时间，单位：毫秒	  |    | 
| order_source     | true     | string       | 订单来源           |                                                              |
| order_price_type | true     | string       | 订单报价类型       | "limit":限价 "opponent":对手价 "post_only":只做maker单,post only下单只受用户持仓数量限制,optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档，ioc:IOC订单，fok：FOK订单, "opponent_ioc": 对手价-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单      |
| margin_frozen    | true     | decimal      | 冻结保证金         |                                                              |
| margin_asset      | true     | string       | 保证金币种         | "BTC"，”ETH“，”USDT“                               |
| profit           | true     | decimal      | 收益               |                                                              |
| trade_volume     | true     | decimal      | 成交数量（张）           |                                                              |
| trade_turnover   | true     | decimal      | 成交总金额         |                                                              |
| fee              | true     | decimal      | 手续费             |                                                              |
| fee_asset         | true     | string      | 手续费币种                               |                |
| trade_avg_price  | true     | decimal      | 成交均价           |                                                              |
| status           | true     | int          | 订单状态           |                                                              |
| order_type       | true     | int          | 订单类型           | 1:报单 、 2:撤单 、4:交割                           |
| delivery_date    | true     | string       | 到期日             | 如"20200508"                                                 |
| option_right_type | true    | string       | 期权行权类型       | C:看涨期权 P:看跌期权                                         |
| exercise_price   | true     | decimal      | 行权价             |                                                               |
| quote_asset   | true     | string       | 报价币种           | 如"USDT"                                                     |
| \</orders\>          |          |              |                    |                                                              |
| current_page     | true     | int          | 当前页             |                                                              |
| total_page       | true     | int          | 总页数             |                                                              |
| total_size       | true     | int          | 总条数             |                                                              |
| \</data\>            |          |              |                    |                                                              |
| ts               | true     | long         | 时间戳             |                                                              |

#### 备注

 - order_id返回是18位，nodejs和javascript默认解析18有问题，nodejs和javascript里面JSON.parse默认是int，超过18位的数字用json-bigint的包解析。

## 获取用户的历史成交记录

### 实例

- POST `option-api/v1/option_matchresults`

>  Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "trade_type": 1,
  "create_date": 7
}

```

### 请求参数

| 参数名称      | 是否必须 | 类型   | 描述                   | 取值范围                                                     |
| ------------- | -------- | ------ | ---------------------- | ------------------------------------------------------------ |
| symbol        | true     | string | 品种代码               | "BTC","ETH"，如果缺省，默认返回所有品种                         |
| trade_partition | false  | string | 交易分区，不填默认”USDT“    | "USDT"                                                        |
| trade_type    | true     | int    | 交易类型               | 0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多          |
| create_date   | true     | int    | 日期                   | 可随意输入正整数，如果参数超过90则默认查询90天的数据            |
| contract_code | false    | string | 合约代码               | BTC-USDT-201225-C-13000                                       |
| page_index    | false    | int    | 页码，不填默认第1页    |                                                              |
| page_size     | false    | int    | 不填默认20，不得多于50 |                                                              |

>  Response:

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

### 返回参数

| 参数名称          | 是否必须 | 类型         | 描述                                                         | 取值范围                                                     |
| ----------------- | -------- | ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status            | true  <img width=200/>    | string  <img width=200/>      | 请求处理结果                                                 |              <img width=1000/>                         |
| \<data\>              | true     | object       |                                                              |                                                              |
| \<trades\>            | true     | object array |                                                              |                                                              |
| id                | true     | string       | 全局唯一的交易标识 |                                                              |
| match_id          | true     | long         | 撮合结果id, 与订单ws推送orders.$symbol-$partition推送结果中的trade_id是相同的，非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id   |                                                              |
| order_id          | true     | long         | 订单ID                                                       |                                                              |
| order_id_str      | true     | string       | string格式的订单ID                                           |                                                              |
| symbol            | true     | string       | 品种代码                                                     | "BTC","ETH"...                                               |
| trade_partition   | true     | string       | 交易分区                                                     | "USDT"                                                       |
| contract_type     | true     | string       | 合约类型                                                     | 当周:"this_week", 次周:"next_week", 季度:"quarter"            |
| contract_code     | true     | string       | 合约代码                                                     | "BTC-USDT-201225-C-13000"                                    |
| direction         | true     | string       | 买卖方向                                                     | "buy":买 "sell":卖                                           |
| offset            | true     | string       | 开平方向                                                     | "open":开 "close":平                                         |
| trade_volume      | true     | decimal      | 成交数量（张）                                                     |                                                              |
| trade_price       | true     | decimal      | 成交价格                                                     |                                                              |
| trade_turnover    | true     | decimal      | 成交金额                                                   |                                                              |
| create_date       | true     | long         | 成交时间                                                     |                                                              |
| offset_profitloss | true     | decimal      | 平仓盈亏                                                     |                                                              |
| trade_fee        | true     | decimal      | 成交手续费                                                   |                                                              |
| fee_asset         | true     | string      | 手续费币种                                                   |                |
| role              | true     | string       | 成交类型                                                   |   "taker"：吃单；"maker"：挂单；"Otm delivery records"：虚值行权；"Itm delivery records"：实值行权    |
| order_source      | true     | string       | 订单来源                                                     |                                                              |
| delivery_date     | true     | string       | 到期日                                                       | 如"20200508"                                                 |
| option_right_type | true     | string       | 期权行权类型                                                 | C:看涨期权 P:看跌期权                                         |
| exercise_price    | true     | decimal      | 行权价                                                       |                                                               |
| quote_asset       | true     | string       | 报价币种                                                     | 如"USDT"                                                     |
| \</trades\>           |          |              |                                                              |                                                              |
| current_page      | true     | int          | 当前页                                                       |                                                              |
| total_page        | true     | int          | 总页数                                                       |                                                              |
| total_size        | true     | int          | 总条数                                                       |                                                              |
| \</data\>             |          |              |                                                              |                                                              |
| ts                | true     | long         | 时间戳                                                       |                                                              |

### 备注

- order_id返回是18位，nodejs和javascript默认解析18有问题，nodejs和javascript里面JSON.parse默认是int，超过18位的数字用json-bigint的包解析。

## 闪电平仓下单

- POST `option-api/v1/option_lightning_close_position`

>  Request:

```json

{
  "contract_code": "BTC-USDT-201225-C-13000",
  "volume": 1,
  "direction": "sell"
}

```

### 请求参数

| 参数名称         | 是否必须 | 类型    | 描述                                    | 取值范围                                                     |
| ---------------- | -------- | ------- | --------------------------------------- | ------------------------------------------------------------ |
| contract_code    | true     | string  | 合约代码                                | BTC-USDT-201225-C-13000                                      |
| volume           | true     | long | 委托数量（张）                          |                                                              |
| direction        | true     | string  | 买卖方向                                | “buy”:买，“sell”:卖                                          |
| client_order_id  | false    | long    | （API）客户自己填写和维护，必须保持唯一  |                                                              |
| order_price_type | false    | string  | 订单报价类型                            | 不填，默认为"闪电平仓"，"lightning":闪电平仓，"lightning_ioc": 闪电平仓-IOC下单，"lightning_fok"：闪电平仓-FOK下单 |

### 备注

 - 闪电平仓，是指在对手价平仓的基础上，实行'最优30档'成交，即用户发出的平仓订单能够迅速以30档范围内对手方价格进行成交，未成交部分自动转为限价委托单。

 - client_order_id，24小时有效，超过24小时的订单根据client_order_id将查询不到。
 
 - 闪电平仓的平仓价格具备可预期的效果，避免在行情急涨急跌时订单无法成交时造成用户损失。

>  Response:

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


### 返回参数

| 参数名称        | 是否必须 | 类型   | 描述                                           | 取值范围                  |
| --------------- | -------- | ------ | ---------------------------------------------- | ------------------------- |
| status          | true     | string | 请求处理结果                                   | "ok" :成功, "error"：失败 |
| ts              | true     | long   | 响应生成时间点，单位：毫秒                      |                           |
| \<data\>            | true     | object |                                                |                         |
| order_id        | true     | long   | 订单ID[用户级别的，不同的用户order_id可能相同]   |                           |
| order_id_str    | true     | string | String类型订单ID                               |                           |
| client_order_id | false    | int    | 用户自己的订单id                                |                           |
| \</data\>           |          |        |                                                |                           |

>   错误信息：

```json

{
    "status": "error",
    "err_code": 1048,
    "err_msg": "Insufficient close amount available.",
    "ts": 1604891439021
}
```


## 计划委托下单

- POST `option-api/v1/option_trigger_order`

>  Request:

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

### 请求参数

| 参数名称         | 是否必须 | 类型    | 描述                                                         | 取值范围                                                     |
| ---------------- | -------- | ------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| contract_code    | true     | string  | 合约代码                                                     | BTC-USDT-201225-C-13000                                       |
| trigger_type     | true     | string  | 触发类型： ge大于等于(触发价比最新价大)；le小于(触发价比最新价小) |                                                            |
| trigger_price    | true     | decimal | 触发价，精度超过最小变动单位会报错                           |                                                              |
| order_price      | false    | decimal | 委托价，精度超过最小变动单位会报错                           |                                                              |
| order_price_type | false    | string  | 委托类型： 不填默认为limit;                                  | 限价：limit ，最优5档：optimal_5，最优10档：optimal_10，最优20档：optimal_20 |
| volume           | true     | long | 委托数量(张)                                                 |                                                              |
| direction        | true     | string  | 买卖方向                                                     | buy:买 sell:卖                                               |
| offset           | true     | string  | 开平方向                                                     | open:开 close:平                                             |

### 备注：

- optimal_5：最优5档、optimal_10：最优10档、optimal_20：最优20档下单order_price价格参数不用传，"limit":限价需要传价格。


>  Response:

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

>   错误信息：

```json

{
    "status": "error",
    "err_code": 1014,
    "err_msg": "This contract doesn't exist.",
    "ts": 1604891496965
}
```


### 返回参数

| 参数名称     | 是否必须 | 类型   | 描述                                           | 取值范围                  |
| ------------ | -------- | ------ | ---------------------------------------------- | ------------------------- |
| status       | true     | string | 请求处理结果                                   | "ok" :成功, "error"：失败 |
| ts           | true     | long   | 响应生成时间点，单位：毫秒                     |                           |
| \<data\>         | true     | object |                                                | 字典                      |
| order_id     | true     | long   | 订单ID[用户级别的，不同的用户order_id可能相同] |                           |
| order_id_str | true     | string | String类型订单ID                               |                           |
| \</data\>        |          |        |                                                |                           |



## 计划委托撤单

- POST `option-api/v1/option_trigger_cancel`

>  Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "order_id": "161251,161256,1344567"
}

```

### 请求参数

| 参数名称 | 是否必须 | 类型   | 描述                                                         | 取值范围       |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------------- |
| symbol   | true     | string | 品种代码                                                 | "BTC","ETH" ...     |
| trade_partition | false  | string | 交易分区，不填默认”USDT“                             | "USDT"         |
| order_id | true     | string | 用户订单ID（多个订单ID中间以","分隔,一次最多允许撤消20个订单 ） |                |


>  Response:

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

### 返回参数

| 参数名称  | 是否必须 | 类型   | 描述                                           | 取值范围                  |
| --------- | -------- | ------ | ---------------------------------------------- | ------------------------- |
| status    | true     | string | 请求处理结果                                   | "ok" :成功, "error"：失败 |
| \<data\>    | true     | object |                                                |                       |
| \<errors\>    | true     | object |                                                | 字典                      |
| order_id  | true     | string | 订单ID[用户级别的，不同的用户order_id可能相同] |                           |
| err_code  | false    | long   | 错误码                                         |                           |
| err_msg   | false    | string | 错误信息                                       |                           |
| \</errors\>   |          |        |                                                |                           |
| successes | true     | string | 成功的订单                                     |                           |
| \</data\>   |          |        |                                                |                           |
| ts        | true     | long   | 响应生成时间点，单位：毫秒                     |                           |



## 计划委托全部撤单

- POST `option-api/v1/option_trigger_cancelall`


### 请求参数

| 参数名称      | 是否必须 | 类型   | 描述     | 取值范围                                                     |
| ------------- | -------- | ------ | -------- | ------------------------------------------------------------ |
| symbol             | true     | string       | 品种代码                   | "BTC","ETH"...                                    |
| trade_partition | false  | string | 交易分区 | "USDT"，不填默认”USDT“                                          |
| contract_code | false    | string | 合约代码 | "BTC-USDT-201225-C-13000"                                      |
| contract_type | false    | string | 合约类型 | 当周:"this_week", 次周:"next_week", 季度:"quarter"            |
| direction | false  | string | 买卖方向（不填默认全部）  |  "buy":买 "sell":卖 |
| offset | false  | string | 开平方向（不填默认全部）  | "open":开 "close":平  |

### 备注

- 只要有contract_code，则撤销该code的合约
- direction与offset可只填其一，只填其一则按对应的条件去撤单。（如用户只传了direction=buy，则撤销所有买单，包括开仓和平仓）

>  Response:

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


### 返回参数

| 参数名称  | 是否必须 | 类型   | 描述                                           | 取值范围                  |
| --------- | -------- | ------ | ---------------------------------------------- | ------------------------- |
| status    | true     | string | 请求处理结果                                   | "ok" :成功, "error"：失败 |
| \<data\>    | true     | object |                                                | 字典                      |
| \<errors\>    | true     | object |                                                | 字典                      |
| order_id  | true     | string | 订单ID[用户级别的，不同的用户order_id可能相同] |                           |
| err-code  | false    | long   | 错误码                                         |                           |
| err-msg   | false    | string | 错误信息                                       |                           |
| \</errors\>   |          |        |                                                |                           |
| successes | true     | string | 成功的订单                                     |                           |
| \</data\>   |          |        |                                                |                           |
| ts        | true     | long   | 响应生成时间点，单位：毫秒                     |                           |



## 获取计划委托当前委托

- POST `option-api/v1/option_trigger_openorders`

>  Request:

```json
{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "page_index": "1",
  "page_size": "50"
}

```

### 请求参数

| 参数名称      | 是否必须 | 类型   | 描述                     | 取值范围            |
| ------------- | -------- | ------ | ------------------------ | ----------------- |
| symbol        | true     | string | 品种代码                 | "BTC","ETH"...    |
| trade_partition | false  | string | 交易分区，不填默认”USDT“   | "USDT"             |
| contract_code | false    | string | 合约代码                 | "BTC-USDT-201225-C-13000" |
| page_index    | false    | int    | 第几页，不填默认第一页   |                     |
| page_size     | false    | int    | 不填默认20，不得多于50   |                    |
| trade_type  | false | int    |  交易类型，不填默认查询全部         | 0:全部,1:买入 开多,2: 卖出开空,3: 买入平空,4: 卖出平多。   |

>  Response:

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


### 返回参数

| 参数名称         | 是否必须 | 类型         | 描述                              | 取值范围                                                     |
| ---------------- | -------- | ------------ | --------------------------------- | ------------------------------------------------------------ |
| status           | true     | string       | 请求处理结果                      | "ok" :成功, "error"：失败                                    |
| \<data\>             | true     | object       |                                   | 字典                                                         |
| total_page       | true     | int          | 总页数                            |                                                              |
| total_size       | true     | int          | 总条数                            |                                                              |
| current_page     | true     | int          | 当前页                            |                                                              |
| \<orders\>           | true     | object array |                                   |                                                              |
| symbol           | true     | string       | 品种代码                          | "BTC","ETH"...                                               |
| trade_partition  | true     | string       | 交易分区                          | "USDT"                                                       |
| contract_type    | true     | string       | 合约类型                          | 当周:"this_week", 次周:"next_week", 季度:"quarter"            |
| contract_code    | true     | string       | 合约代码                          | "BTC-USDT-201225-C-13000"                                     |
| trigger_type     | true     | string       | 触发类型： ge大于等于；le小于等于 |                                                              |
| volume           | true     | decimal      | 委托数量(张)                          |                                                              |
| order_type       | true     | int          | 订单类型：1、报单 2、撤单         |                                                              |
| direction        | true     | string       | 买卖方向                          | 买："buy",卖："sell"                                         |
| offset           | true     | string       | 开平方向                          | 开："open",平："close"                                       |
| order_id         | true     | long         | 计划委托单订单ID                  |                                                              |
| order_id_str     | true     | string       | 字符串类型的订单ID                |                                                              |
| order_source     | true     | string       | 来源                              |                                                              |
| trigger_price    | true     | decimal      | 触发价                            |                                                              |
| order_price      | true     | decimal      | 委托价                            |                                                              |
| created_at       | true     | long         | 订单创建时间                      |                                                              |
| order_price_type | true     | string       | 订单报价类型                      | "limit":限价，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档 |
| status           | true     | int          | 订单状态：                        | 1:准备提交、2:已提交、3:报单中、8：撤单未找到、9：撤单中、10：失败' |
| \</orders\>          |          |              |                                   |                                                              |
| \</data\>            |          |              |                                   |                                                              |
| ts               | true     | long         | 响应生成时间点，单位：毫秒        |                                                              |



## 获取计划委托历史委托

- POST `option-api/v1/option_trigger_hisorders`

>  Request:

```json

{
  "symbol": "BTC",
  "trade_partition": "USDT",
  "trade_type": "0",
  "status": "0",
  "create_date": "100"
}

```

### 请求参数

| 参数名称      | 是否必须 | 类型   | 描述                   | 取值范围                                                     |
| ------------- | -------- | ------ | ---------------------- | ------------------------------------------------------------ |
| symbol        | true     | string | 品种代码               | "BTC","ETH"...                                                |
| trade_partition | false  | string | 交易分区，不填默认”USDT“  | "USDT"                                                        |
| contract_code | false    | string | 合约代码               | "BTC-USDT-201225-C-13000"                                    |
| trade_type    | true     | int    | 交易类型               | 0:全部,1:买入开多,2: 卖出开空,3: 买入平空,4: 卖出平多；后台是根据该值转换为offset和direction，然后去查询的； 其他值无法查询出结果 |
| status        | true     | string | 订单状态               | 多个以英文逗号隔开，计划委托单状态：0:全部（表示全部结束状态的订单）、4:已委托、5:委托失败、6:已撤单 |
| create_date   | true     | long   | 日期                   | 可随意输入正整数，如果参数超过90则默认查询90天的数据         |
| page_index    | false    | int    | 第几页，不填默认第一页 |                                                              |
| page_size     | false    | int    | 不填默认20，不得多于50 |                                                              |
| sort_by       | false    | string | 排序字段（降序），不填默认按照created_at降序 |  "created_at"：按订单创建时间进行降序，"update_time"：按订单更新时间进行降序|

#### 备注：

- 默认查询 已完成订单（type对应状态范围 4、5、6）；

>  Response:

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


### 返回参数

| 参数名称          | 是否必须 | 类型         | 描述                                                         | 取值范围                                                     |
| ----------------- | -------- | ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| status            | true     | string       | 请求处理结果                                                 | "ok" :成功, "error"：失败                                    |
| \<data\>              | true     | object       |                                                              | 字典                                                         |
| total_page        | true     | int          | 总页数                                                       |                                                              |
| current_page      | true     | int          | 当前页                                                       |                                                              |
| total_size        | true     | int          | 总条数                                                       |                                                              |
| \<orders\>            | true     | object array |                                                              |                                                              |
| symbol            | true     | string       | 品种代码                                                     | "BTC","ETH"...                                               |
| trade_partition   | true     | string       | 交易分区                                                     | "USDT"                                                       |
| contract_type     | true     | string       | 合约类型                                                     | 当周:"this_week", 次周:"next_week", 季度:"quarter"            |
| contract_code     | true     | string       | 合约代码                                                     | "BTC-USDT-201225-C-13000"                                     |
| trigger_type      | true     | string       | 触发类型                                                    |   ge大于等于；le小于等于;                                    |
| volume            | true     | decimal      | 委托数量(张)                                                     |                                                              |
| order_type        | true     | int          | 订单类型                                                     | 1、报单 2、撤单                                              |
| direction         | true     | string       | 买卖方向                                                     | 买："buy",卖："sell"                                         |
| offset            | true     | string       | 开平方向                                                     | 开："open",平："close"                                       |
| order_id          | true     | decimal      | 计划委托单订单ID                                             |                                                              |
| order_id_str      | true     | string       | 字符串类型的订单ID                                           |                                                              |
| relation_order_id | true     | string       | 该字段为关联限价单的关联字段，未触发前数值为-1                    |                                                              |
| order_price_type  | true     | string       | 订单报价类型                                                 | "limit":限价，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档 |
| status            | true     | int          | 订单状态                                                     | 4:报单成功、5:报单失败、6:已撤单                             |
| order_source      | true     | string       | 来源                                                         |                                                              |
| trigger_price     | true     | decimal      | 触发价                                                       |                                                              |
| triggered_price   | true     | decimal      | 被触发时的价格                                               |                                                              |
| order_price       | true     | decimal      | 委托价                                                       |                                                              |
| created_at        | true     | long         | 订单创建时间                                                 |                                                              |
| update_time       | true     |long          | 订单更新时间，单位：毫秒	| |
| triggered_at      | true     | long         | 触发时间                                                     |                                                              |
| order_insert_at   | true     | long         | 下order单时间                                                |                                                              |
| canceled_at       | true     | long         | 撤单时间                                                     |                                                              |
| fail_code         | true     | int          | 被触发时下order单失败错误码                                  |                                                              |
| fail_reason       | true     | string       | 被触发时下order单失败原因                                    |                                                              |
| \</orders\>           |          |              |                                                              |                                                              |
| \</data\>             |          |              |                                                              |                                                              |
| ts                | true     | long         | 响应生成时间点，单位：毫秒                                   |                                                              |




# 现货-期权合约划转接口

## 现货-期权合约账户间进行资金的划转

### 实例

- POST `https://api.huobi.pro/v2/account/transfer`

> Request:

```json
{
  "from":"spot",
  "to":"option",
  "tradePartition":"USDT",
  "currency": "btc",
  "amount": 2
}
```

### 备注

此接口用户币币现货账户与期权合约账户之间的资金划转。 这是broker提供的接口，不受合约控制和维护

该接口的访问频次的限制为1秒/1次。

注意：请求地址为火币Global地址

现货与期权合约划转接口，所有划转的币的精度是8位小数。

### 请求参数

| 参数名称     | 是否必须 | 类型      | 描述    | 取值范围 |
| -------- | ---- | ------- | ---------------------------------------- | ---- |
| from | true | string  | 来源业务线账户，取值：spot(币币)、option(期权)   | e.g. spot                                 |
| to | true | string  | 目标业务线账户，取值：spot(币币)、option(期权)  | e.g. option                                 |
| tradePartition | true | string  | 交易区（目前只有USDT区）   | e.g. usdt                                 |
| currency | true | string  | 币种,支持大小写   | e.g. btc                                 |
| amount   | true | Decimal | 划转金额 |   |

>   Response:

```json

 正确的返回：
{
    "code": 200,
    "data": 182408686,
    "message": "Succeed",
    "success": true
}

    错误的返回：
{
    "code": 1301,
    "data": null,
    "message": "Insufficient amount available.",
    "success": false
}

```

###  返回参数

| 参数名称     | 是否必须 | 类型     | 描述        | 取值范围      |
| -------- | ---- | ------ | --------- | --------- |
| code     | true | long   | 响应码 |           |
| success   | true | boolean | 状态        | true/false	 |
| message  | true | string | 响应消息	      |  |
| data | true | string | 错误码       | 划转流水ID	 |


## 响应码列表

响应码 | 中文说明 |  英文说明  | 
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





# 合约Websocket简介

## 接口列表

| 权限类型 | 接口数据类型 | 接口                                           | 请求方式 | 接口描述                     | 需要验签  | 
| -------- | -------- |-------- | ---------------------------------------------- | -------- | ---------------------------- | 
| 读取   | 市场行情接口  | market.$contract_code.kline.$period                   | sub      | 订阅 KLine 数据                   | 否    |
| 读取   | 市场行情接口  | market.$contract_code.kline.$period                   | req      | 请求 KLine 数据                   | 否    |
| 读取   | 市场行情接口  | market.$contract_code.depth.$type                     | sub      | 订阅 Market Depth 数据            | 否    |
| 读取   | 市场行情接口  | market.$contract_code.depth.size_${size}.high_freq   | sub      | 订阅 Market Depth增量推送数据       | 否   |
| 读取   | 市场行情接口  | market.$contract_code.detail                         | sub      | 订阅 Market detail 数据            | 否    |
| 读取   | 市场行情接口  | market.$contract_code.trade.detail                    | req      | 请求 Trade detail 数据            | 否    |
| 读取   | 市场行情接口  | market.$contract_code.trade.detail                    | sub      | 订阅 Trade Detail 数据            | 否    |
| 读取   |  系统状态接口  |  public.$service.heartbeat  |        sub  | 订阅系统状态更新  | 否  | 
| 读取   | 交易接口   | orders.$symbol-$partition                             | sub      | 订阅订单成交数据                    | 是     |
| 读取   | 资产接口   | accounts.$symbol-$partition                            | sub      | 订阅资产变动数据                   | 是     |
| 读取   | 资产接口   | positions.$symbol-$partition                           | sub      | 订阅持仓变动更新数据                | 是    |
| 读取   | 交易接口   | matchOrders.$symbol-$partition                          | sub      | 订阅撮合订单成交数据               | 是    |

## 合约订阅地址

#### 备注：

合约站行情请求以及订阅地址为：wss://api.hbdm.com/option-ws

合约站订单推送订阅地址：wss://api.hbdm.com/option-notification

合约站系统状态更新订阅地址：wss://api.hbdm.com/center-notification

如果api.hbdm.com域名访问不了，可使用：

合约站行情请求以及订阅地址为：wss://api.btcgateway.pro/option-ws

合约站订单推送订阅地址：wss://api.btcgateway.pro/option-notification

合约站系统状态更新订阅地址：wss://api.btcgateway.pro/center-notification

如果对合约订单推送订阅有疑问，可以参考<a href='https://docs.huobigroup.com/docs/option/v1/cn/#2cff7db524'> Demo </a>

### 备注

 如果api.hbdm.com无法访问，可以使用api.btcgateway.pro来做调试，AWS服务器用户推荐使用api.hbdm.vn；

## 访问次数限制

公开行情接口和用户私有接口都有访问次数限制

- 普通用户，需要密钥的私有接口，每个UID 3秒最多 48 次请求(交易接口3秒最多 24 次请求，查询接口3秒最多 24 次请求) (该UID的所有币种和不同到期日的合约的所有私有接口共享该限制) 

- 其他非行情类的公开接口，比如获取指数信息，限价信息，交割结算、平台持仓信息等，所有用户都是每个IP3秒最多60次请求（所有该IP的非行情类的公开接口请求共享3秒60次的额度）

- 行情类的公开接口，比如：获取K线数据、获取聚合行情、市场行情、获取市场最近成交记录：

    （1） restful接口：同一个IP, 所有业务（交割合约、币本位永续合约、期权合约和USDT本位永续合约）总共1秒最多800个请求

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

注：WebSocket Client 和 WebSocket Server 建立连接之后，WebSocket Server 每隔 `5s`（这个频率可能会变化） 会向 WebSocket Client 发起一次心跳，WebSocket Client 忽略心跳5次后，WebSocket Server 将会主动断开连接；WebSocket Client发送最近2次心跳message中的其中一个`ping`的值，WebSocket Server都会保持WebSocket连接。

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

  合约站订单推送订阅地址：wss://api.hbdm.com/option-notification
  
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

>   请求数据结构如下:

```

   {
  "op": string, // 必填;Client 请求的操作类型(Server 会原样返回)，详细操作
  类型列列表请参考附录
  "cid": string, // 选填;当前请求唯一 ID(Client 自⽣成并保证本地唯一性，
  Server 会原样返回) 
  // 其余必填/可选字段
  }

```

>   所有响应/推送数据都会以固定的结构返回，具体接口说明文档中只会重点介绍data部分，请求响应数据结构如下:

```
   
  {
  "op": string, // 必填;本次响应 Client 请求的操作类型
  "cid": string, // 选填;Client 请求唯一 ID
  "ts": long, // 必填;Server 应答时本地时间戳
  "err-code": integer, // 必填;响应码，0 代表成功;非0 代表出错，详细响应码列表请参考错误码表。
  "err-msg": string, 只在出错情况下有此信息，表明详细的出错信息 
  "data": object // 选填;返回数据对象，请求处理成功时有效
  }
  
 ```

>    推送数据结构如下:

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

  `/option-notification\n`

- 按照ASCII码的顺序对参数名进行排序(使⽤ UTF-8 编码，且进⾏了 URI 编码，十六进制字符必须
  大写，如‘:’会被编码为'%3A'，空格被编码为'%20')。例如，下面是请求参数的原始顺序，进⾏过
  编码后。

  `AccessKeyId=e2xxxxxx-99xxxxxx-84xxxxxx-
  7xxxx&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2017-05-
  11T15%3A19%3A30`
  

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
| err-code | integer | 成功返回 0, 失败为其他值，详细响应码列列表请参考附录 |
| err-msg  | string  | 可选，若出错表示详细错误信息                         |
| ts       | long    | 服务端应答时间戳                                     |
| user-id  | string    | ⽤户 id                                              |

>   鉴权成功应答数据示例

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

>   鉴权失败应答返回数据示例

```json

{
  "op": "auth",
  "type":"api",
  "ts": 1489474081631, 
  "err-code": "xxxx",
  "err-msg": "详细的错误信息"
}

```

# WebSocket市场行情接口

## 订阅 KLine 数据  

 - market.$contract_code.kline.$period
 
### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：
`{`
  
  `"sub":"market.$contract_code.kline.$period",`

  `"id": "id generated by client",`

`}`

> 正确订阅请求参数的例子：

```json

{
"sub": "market.BTC-USDT-201225-C-13000.kline.1min",
"id": "id1"
}

```

### 请求参数

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| sub | true | string | 需要订阅的主题，该接口固定为：market.$contract_code.kline.$period，详细参数见sub订阅参数说明  | |
| id | false | string | 业务方自主生成的id | |

####  sub订阅参数说明

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| contract_code | true | string | 合约代码   | "BTC-USDT-201225-C-13000" ...  |
| period | true | string | K线周期  | 1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon |

>   订阅成功返回数据的例子:

```json

    {
    "id": "id1",
    "status": "ok",
    "subbed": "market.BTC-USDT-201225-C-13000.kline.1min",
    "ts": 1489474081631
    }

```

>   之后每当 KLine 有更新时，client 会收到数据:

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

### 返回参数

| 参数名称   | 是否必须 | 类型  | 描述   | 取值范围    |
| -------------- | ---- | ------- | -------------------------- | ---------- |
| ch   | true | string  | 数据所属的 channel   |格式： market.period |
| ts   | true | long  | 响应生成时间点，单位：毫秒    | |
| \<tick\>     | true | object  |     | |
| id   | true | long  | K线ID,也就是K线时间戳，K线起始时间   | |
| mrid | true | long  | 订单ID    |    |
| vol   | true | decimal  | 成交量张数    |    |
| count   | true | decimal  | 成交笔数    |    |
| open   | true | decimal  | 开盘价    |    |
| close   | true | decimal  | 收盘价,当K线为最晚的一根时，是最新成交价  |    |
| low   | true | decimal  | 最低价    |    |
| high   | true | decimal  | 最高价    |    |
| amount   | true | decimal  | 成交量(币), 即(成交量(张) * 单张合约面值)    |    |
| trade_turnover   | true | decimal  | 成交额（即成交的权利金总额）, 即sum（每一笔成交张数 * 合约面值 * 成交价格）   |    |
| \</tick>  \   |  |   |     |    |       



## 请求 KLine 数据 

 - market.$contract_code.kline.$period
 
### 成功建立和 WebSocket API 的连接之后，向Server发送如下格式的数据来请求数据：

`{`
  
  `"req":"market.$contract_code.kline.$period",`

  `"id": "id generated by client",`

  `"from":"type: long, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒",`

  `"to": "type: long, 2017-07-28T00:00:00+08:00 至2050-01-01T00:00:00+08:00 之间的时间点，单位：秒，必须比 from 大",`

`}`

>   请求 KLine 数据请求参数的例子：

```json

{
  "id": "id1",
  "req": "market.BTC-USDT-201225-C-13000.kline.60min",
  "from": 1579247342,
  "to": 1579247342
}

```
   
### 请求参数

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| req | true | string | 请求数据的主题，该接口固定为：market.$contract_code.kline.$period，详细参数见req请求参数说明  | |
| id | false | string | 业务方自主生成的id | |
| from | true | long | 开始时间  |  |
| to | true | long | 结束时间  |  |

####  req请求参数说明

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| contract_code | true | string | 合约代码   |"BTC-USDT-201225-C-13000" ...  |
| period | true | string | K线周期  | 1min, 5min, 15min, 30min, 60min,4hour,1day,1week, 1mon |

#### 备注

[t1, t5] 假设有 t1 ~ t5 的K线：

from: t1, to: t5, return [t1, t5].

from: t5, to: t1, which t5 >   t1, return [].

from: t5, return [t5].

from: t3, return [t3, t5].

to: t5, return [t1, t5].

from: t which t3 < t <t4, return [t4, t5].

to: t which t3 < t <t4, return [t1, t3].

from: t1 and to: t2, should satisfy 1325347200 < t1 < t2 < 2524579200.

一次最多2000条。

>   返回的数据如下:

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

### 返回参数  

| 参数名称   | 是否必须 | 类型  | 描述   | 取值范围   |
| -------------- | ---- | ------- | -------------------------- |---- |
| id   | true | string  | 请求id    |   |
| rep   | true | string  | 请求参数    |   |
| status   | true | string  | 状态    |   |
| wsid   | true | long  | wsid    |   |
| \<data\>     | true | object array |     |   |
| id   | true | long  | K线ID,也就是K线时间戳，K线起始时间  |   |
| open   | true | decimal  | 开盘价    |   |
| close   | true | decimal  | 收盘价,当K线为最晚的一根时，是最新成交价    |   |
| low   | true | decimal  | 最低价    |   |
| high   | true | decimal  | 最高价    |   |
| amount   | true | decimal  | 成交量(币), 即(成交量(张) * 单张合约面值)    |   |
| trade_turnover   | true | decimal  | 成交额（即成交的权利金总额）, 即sum（每一笔成交张数 * 合约面值 * 成交价格）   |    |
| vol   | true | decimal  | 成交量张数    |   |
| count   | true | decimal  | 成交笔数    |   |
| \</tick\>     |  |   |     |   |   

 

## 订阅 Market Depth 数据 

 - market.$contract_code.depth.$type
 
### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：

`{`
  
  `"sub":"market.$contract_code.depth.$type",`

  `"id": "id generated by client",`

`}`

>   正确订阅请求参数的例子：                                   

```json

{
  "sub": "market.BTC-USDT-201225-C-13000.depth.step0",
  "id": "id5"
}

```

###  请求参数

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| sub | true | string | 请求数据的主题，该接口固定为：market.$contract_code.depth.$type，详细参数见sub订阅参数说明  | |
| id | false | string | 业务方自主生成的id | |

####  sub订阅参数说明

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| contract_code | true <img width=250/>  | string | 合约代码 <img width=250/>   |"BTC-USDT-201225-C-13000" ...  |
| type | true | string | Depth 类型  | 获得150档深度数据，使用step0, step1, step2, step3, step4, step5，step14，step15（step1至step5以及step14、step15是进行了深度合并后的深度），使用step0时，不合并深度获取150档数据;获得20档深度数据，使用 step6, step7, step8, step9, step10, step11, step12, step13（step7至step13是进行了深度合并后的深度），使用step6时，不合并深度获取20档数据 |

#### 备注

- 用户选择“合并深度”时，一定报价精度内的市场挂单将予以合并显示。合并深度仅改变显示方式，不改变实际成交价格。

- step1至step5,step14,step15是进行了深度合并后的150档深度数据，step7至step13是进行了深度合并后的20档深度数据，对应精度如下：

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

>   之后每当 depth 有更新时，client 会收到数据，例子：

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

### 返回参数
 
| 参数名称   | 是否必须 | 类型  | 描述   | 取值范围  |
| -------------- | ---- | ------- | -------------------------- |---- |
| ch   | true | string  | 数据所属的 channel  | 格式： market.period    |
| ts   | true | long  | 响应生成时间点，单位：毫秒    |    |
| \<tick\>     | true | object  |     |   |
| mrid | true | long  | 订单ID    |   |
| id   | true | long  | ID    |   |
| asks   | true | array  | 卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序      |   |
| bids   | true | array  | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序    |   |
| ts   | true | long  | 响应生成时间点，单位：毫秒    |   |
| version   | true | long  | 版本号  |   |
| ch   | true | string  | 数据所属的 channel   | 格式： market.period   |
| \</tick\>     |  |   |     |   |



##  订阅 Market Depth增量推送数据

 - market.$contract_code.depth.size_${size}.high_freq

### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来请求数据:

`{`
  
  `"sub":"market.$contract_code.depth.size_${size}.high_freq",`
  
  `"data_type": "incremental",`

  `"id": "id generated by client",`

`}`

>   订阅 Market Depth增量推送数据请求参数的例子：

```json

{
  "data_type": "incremental",
  "sub": "market.BTC-USDT-201225-C-13000.depth.size_150.high_freq",
  "id": "id1"
}

```

###  请求参数

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| sub | true | string | 请求数据的主题，该接口固定为：market.$contract_code.depth.size_${size}.high_freq，详细参数见sub订阅参数说明   | |
| id | false | string | 业务方自主生成的id | |
| data_type | false | string | 数据类型  | 不填默认为全量数据，"incremental"：增量数据，"snapshot"：全量数据 |

####  sub订阅参数说明

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| contract_code | true | string | 合约代码 | 如"BTC-USDT-201225-C-13000" 。 |
| size | true | string | 档位数   | 20:表示20档不合并的深度，150:表示150档不合并的深度 |

### 备注

 - 用户选择“合并深度”时，一定报价精度内的市场挂单将予以合并显示。合并深度仅改变显示方式，不改变实际成交价格。
 
>  每当 depth 有增量更新时，client 会收到数据，如下:

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

### 返回参数

| 参数名称   | 是否必须 | 类型  | 描述   | 取值范围  |
| -------------- | ---- | ------- | -------------------------- | -- |
| ch   | true | string  | 数据所属的 channel   | 格式： market.period  |
| ts   | true | long  | 响应生成时间点，单位：毫秒    |  |
| \<tick\>     | true | object  |     |  |
| mrid | true | long  | 订单ID    |  |
| id   | true | long  | ID    |  |
| asks   | true | array  | 卖盘,[price(挂单价), vol(此价格挂单张数)], 按price升序      |  |
| bids   | true | array  | 买盘,[price(挂单价), vol(此价格挂单张数)], 按price降序    |  |
| ts   | true | long  | 响应生成时间点，单位：毫秒    |  |
| version   | true | long  | 版本号  |  |
| ch   | true | string  | 数据所属的 channel  | 格式： market.period   |
| event   | true | string  | 事件类型；   | "update":更新，表示推送买卖各20档或150档不合并深度的增量数据；"snapshot":快照值，表示推送买卖各20档或150档不合并深度的全量数据 |
| \</tick\>     |  |   |     |  |

### 备注

1、 当"data_type"为incremental时，首次推送的"event"为"snapshot"的数据，且当重新发送订阅请求时，首次返回都是"snapshot"的数据；

2、version（版本号），是自增的序号，每次增加1，不管是增量还是全量数据,每个连接是唯一的。多个websocket连接的version是可能不同的。

3、每30ms检查一次orderbook，如果有更新，则推送，如果没有更新，则不推送。

4、如果是增量数据，要自己维护好本地的orderbook bids\asks 数据。



## 订阅 Market Detail 数据

  - market.$contract_code.detail
  
### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来请求数据:

`{`
  
  `"sub": "market.$contract_code.detail",`
  
  `"id": "id generated by client",`

`}`

>   订阅 Market Detail 数据请求参数的例子：

```json

{
  "id": "111",
  "sub": "market.BTC-USDT-201225-C-13000.detail"
}

```

###  请求参数

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| sub | true | string | 请求数据的主题，该接口固定为：market.$contract_code.detail，详细参数见sub订阅参数说明   | |
| id | false | string | 业务方自主生成的id | |

#### sub订阅参数说明

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| contract_code | true | string | 合约代码 | 如"BTC-USDT-201225-C-13000"。|
   

>   请求成功返回数据的例子：

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

### 返回参数

| 参数名称   | 是否必须 | 类型  | 描述   | 取值范围  |
| -------------- | ---- | ------- | -------------------------- | --- |
| ch   | true | string  | 数据所属的 channel   | 格式： market.period   |
| ts   | true | long  | 响应生成时间点，单位：毫秒    |  |
| \<tick\>     | true | object  |     |  |
| id   | true | long  | ID    |  |
| mrid | true | long  | 订单ID    |  |
| open   | true | decimal  | 开盘价  |  |
| close   | true | decimal  | 收盘价,当K线为最晚的一根时，是最新成交价 |  |
| high   | true | decimal  | 最高价  |  |
| low   | true | decimal  | 最低价  |  |
| amount   | true | decimal  |成交量(币)，即(成交量(张) * 单张合约面值)   |  |
| vol   | true | decimal  | 成交量（张），买卖双边成交量之和  |  |
| trade_turnover   | true | decimal  | 成交额（即成交的权利金总额），即sum（每一笔成交张数 * 合约面值 * 成交价格） |  |
| count   | true | decimal  | 成交笔数  |  |
| ask  |  true  |  array  |   [卖1价,卖1量(张)]  |   
| bid  |  true  |  array  |   [买1价,买1量(张)]  |   
| \</tick\>     |  |   |     |  |

#### 备注：
 - 买一卖一并非实时更新，会存在部分延迟（500ms左右）。
 
## 请求 Trade Detail 数据

 - market.$contract_code.trade.detail
 
### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来请求数据：

`{`
  
  `"req": "market.$contract_code.trade.detail",`
  
  `"id": "id generated by client",`

`}`


>  请求 Trade Detail 数据请求参数的例子：

```json

{
  "id": "160943040012341",
  "size": 50,
  "req": "market.BTC-USDT-201225-C-13000.trade.detail"
}

```
### 备注

 - 仅返回当前 Trade Detail。

###  请求参数

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| req | true | string | 请求数据的主题，该接口固定为：market.$contract_code.trade.detail，详细参数见req请求参数说明   | |
| id | false | string | 业务方自主生成的id | |
| size   | false | int | 数据条数，最多50，不填默认50                      | [1,50]  |

####  req请求参数说明

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| contract_code | true | string | 合约代码 | 如"BTC-USDT-201225-C-13000"。 |

>   请求成功返回数据的例子：

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

### 返回参数

| 参数名称   | 是否必须 | 类型  | 描述   | 取值范围   |
| -------------- | ---- | ------- | -------------------------- | --- |
| rep   | true | string  | 数据所属的 channel      | 格式： market.$contract_code.trade.detail|
| status   | true | string  | 返回状态   | |
| id   | true | string  | 请求 ID    | |
| \<data\>     | true | object array  |     | |
| id   | true | long  | 成交唯一id（品种唯一）   | |
| price   | true | string  | 价格    | |
| amount   | true | string  | 数量（张）    | |
| direction   | true | string  | 买卖方向，即taker(主动成交)的方向   | |
| ts   | true | long  | 订单成交时间    | |
| quantity   | true | string  |成交量（币）    | |
| trade_turnover   | true | string  | 成交额（计价币种）    | |
| \</data\>     |  |   |     | |
| ts   | true | long  | 发送时间    | |

#### 备注
- 2021年2月3日 21:00:00 后返回参数才会有quantity、trade_turnover字段。


## 订阅 Trade Detail 数据

 - market.$contract_code.trade.detail
 
### 成功建立和 WebSocket API 的连接之后，向 Server发送如下格式的数据来订阅数据：

`{`
  
  `"sub": "market.$contract_code.trade.detail",`
  
  `"id": "id generated by client",`

`}`

>   正确订阅请求参数的例子：

```json

{
  "id": "160943040012341",
  "Sub": "market.BTC-USDT-201225-C-13000.trade.detail"
}

```


###  请求参数

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| sub | true | string | 请求数据的主题，该接口固定为：market.$contract_code.trade.detail，详细参数见sub订阅参数说明   | |
| id | false | string | 业务方自主生成的id | |

####  sub订阅参数说明

| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| contract_code | true | string | 合约代码 | 如"BTC-USDT-201225-C-13000"。 |

>   之后每当 Trade Detail 有更新时，client 会收到数据，例子：

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

### 返回参数

| 参数名称   | 是否必须 | 类型  | 描述   | 取值范围   |
| -------------- | ---- | ------- | -------------------------- | --- |
| ch   | true | string  | 数据所属的 channel    | 格式： market.period  |
| ts   | true | long  | 响应生成时间点，单位：毫秒    |   |
| \<tick\>     | true | object  |     |   |
| id   | true | long  | 订单唯一id（品种唯一）   |   |
| ts | true | long  | 发送时间    |   |
| \<data\>     | true | object array |     |   |
| amount   | true | decimal  | 数量（张） |   |
| ts   | true | long  | 发送时间  |   |
| id   | true | long  | 成交唯一id（品种唯一）  |   |
| price   | true | decimal  |价格  |   |
| direction   | true | string  | 买卖方向，即taker(主动成交)的方向 |   |
| quantity   | true | decimal  |成交量（币）    | |
| trade_turnover   | true | decimal  | 成交额（计价币种）    | |
| \</data\>     |  |   |     |   |
| \</tick\>     |  |   |     |   |


# WebSocket订单和用户数据接口

## 订阅订单成交数据

 - orders.$symbol-$partition
 
### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

`{`
  
  `"op": "sub",`
  
  `"topic": "orders.$symbol-$partition",`
  
  `"cid": "id generated by client",`
  
  `}`

>  正确订阅请求参数的例子:

```json

{
    "op": "sub",
    "topic": "orders.btc-usdt",
    "cid": "40sG903yz80oDFWr"
}

```

###  请求参数
| 参数名称 | 是否必须 | 类型   | 描述                                                         | 取值范围 |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string | 订阅固定值为sub                                              |          |
| cid      | false    | string | Client 请求唯一 ID                                           |          |
| topic    | true     | string | 订阅主题名称，必填 (orders.$symbol-$partition) 订阅、取消订阅某个品种下的成交订单信息； $symbol-$partition为“品种代码-交易分区”（BTC-USDT、ETH-USDT...），如果值为 * 时代表订阅所有期权合约; |          |

>  每当有订单成交时，client会收到数据，如下:

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

### 成交推送请求数据格式说明

| 参数名称          | 是否必须 | 类型         | 描述                                                         | 取值范围                                                     |
| ----------------- | -------- | ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| op                | true     | string       | 操作名称，推送固定值为 notify;                               |                                                              |
| topic             | true     | string       | 推送的主题                                                   |                                                              |
| ts                | true     | long         | 服务端应答时间戳                                             |                                                              |
| uid               | true     | string       | 用户uid                                                      |                                                              |
| symbol            | true     | string       | 品种代码                                                     | "BTC","ETH"...                                               |
| trade_partition   | true     | string       | 交易分区                                                     | "USDT"                                                       |
| contract_type     | true     | string       | 合约类型                                                     |                                                              |
| contract_code     | true     | string       | 合约代码                                                     | BTC-USDT-201225-C-13000                                   |
| volume            | true     | decimal      | 委托数量（张）                                               |                                                              |
| price             | true     | decimal      | 委托价格                                                     |                                                              |
| order_price_type  | true     | string       | 订单报价类型                                                 | "limit":限价，"opponent":对手价，"lightning":闪电平仓，"optimal_5":最优5档，"optimal_10":最优10档，"optimal_20":最优20档，"fok":FOK订单，"ioc":IOC订单, "opponent_ioc": 对手价-IOC下单，"lightning_ioc": 闪电平仓-IOC下单，"optimal_5_ioc": 最优5档-IOC下单，"optimal_10_ioc": 最优10档-IOC下单，"optimal_20_ioc"：最优20档-IOC下单，"opponent_fok"： 对手价-FOK下单，"lightning_fok"：闪电平仓-FOK下单，"optimal_5_fok"：最优5档-FOK下单，"optimal_10_fok"：最优10档-FOK下单，"optimal_20_fok"：最优20档-FOK下单 |
| direction         | true     | string       | 买卖方向                                                     | "buy":买 "sell":卖                                           |
| offset            | true     | string       | 开平方向                                                     | "open":开 "close":平                                         |
| status            | true     | int          | 订单状态                                                     | 1准备提交 2准备提交 3已提交 4部分成交 5部分成交已撤单 6全部成交 7已撤单 |
| order_id          | true     | long         | 订单ID                                                       |                                                              |
| order_id_str      | true     | string       | string格式的订单ID                                           |                                                              |
| client_order_id   | true     | long         | 客户订单ID                                                   |                                                              |
| order_source      | true     | string       | 订单来源                                                     | system:系统、web:用户网页、api:用户API、m:用户M站、risk:风控系统、settlement:交割结算、ios：ios客户端、android：安卓客户端、windows：windows客户端、mac：mac客户端、trigger：计划委托触发 |
| order_type        | true     | int          | 订单类型                                                     | 1:报单 、 2:撤单 、4:交割                                    |
| created_at        | true     | long         | 订单创建时间                                                 |                                                              |
| trade_volume      | true     | decimal      | 成交数量（张）                                               |                                                              |
| trade_turnover    | true     | decimal      | 成交总金额                                                   |                                                              |
| fee               | true     | decimal      | 手续费                                                       |                                                              |
| trade_avg_price   | true     | decimal      | 成交均价                                                     |                                                              |
| margin_frozen     | true     | decimal      | 冻结保证金（卖方）                                           |                                                              |
| margin_asset      | true     | string       | 保证金币种                                                   | "BTC"，”ETH“，”USDT“                                         |
| profit            | true     | decimal      | 收益                                                         |                                                              |
| canceled_at       | true     | long         | 撤单时间                                                     |                                                              |
| fee_asset         | true     | string       | 手续费币种                                                   |                                                              |
| delivery_date     | true     | string       | 到期日                                                       |                                                              |
| option_right_type | true     | string       | 期权行权类型                                                 | C:看涨期权 P:看跌期权                                        |
| exercise_price    | true     | decimal      | 行权价                                                       |                                                              |
| quote_asset       | true     | string       | 报价币种                                                     | 如"USDT"                                                     |
| premium_frozen    | true     | decimal      | 冻结权利金（买方）                                           |                                                              |
| fee_frozen        | true     | decimal      | 冻结手续费                                                   |                                                              |
| \<trade\>         | true     | object array |                                                              |                                                              |
| id                | true     | string       | 唯一成交id,由于match_id并不是unique的，具体使用方式是用match_id和id作为联合主键，拼接成unique的成交ID |                                                              |
| trade_id          | true     | long         | 与option-api/v1/option_matchresults返回结果中的match_id一样，是撮合结果id， 非唯一，可重复，注意：一个撮合结果代表一个taker单和N个maker单的成交记录的集合，如果一个taker单吃了N个maker单，那这N笔trade都是一样的撮合结果id |                                                              |
| trade_volume      | true     | decimal      | 成交量                                                       |                                                              |
| trade_price       | true     | decimal      | 撮合价格                                                     |                                                              |
| trade_fee         | true     | decimal      | 成交手续费                                                   |                                                              |
| trade_turnover    | true     | decimal      | 成交金额                                                     |                                                              |
| created_at        | true     | long         | 成交创建时间                                                 |                                                              |
| role              | true     | string       | taker或maker                                                 |                                                              |
| fee_asset         | true     | string       | 手续费币种                                                   |                                                              |
| \</trade\>        |          |              |                                                              |                                                              |


## 取消订阅订单成交数据（unsub）

### 成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

`{`
  
  `"op": "unsub",`
  
  `"topic": "orders.$symbol-$partition",`
  
  `"cid": "id generated by client",`
  
  `}`

>   正确的取消订阅请求:

```json

{
  "op": "unsub",
  "topic": "orders.btc-usdt",
  "cid": "40sG903yz80oDFWr"
}

```                               


### 取消订阅请求数据格式说明

| 参数名称 | 是否必须 | 类型   | 描述                                                         | 取值范围 |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string | 取消订阅固定值为unsub                                        |          |
| cid      | false    | string | Client 请求唯一 ID                                           |          |
| topic    | true     | string | 订阅主题名称，必填 (orders.$symbol-$partition) 订阅、取消订阅某个品种下的成交订单信息；$symbol-$partition为“品种代码-交易分区”（BTC-USDT、ETH-USDT...），如果值为 * 时代表订阅所有期权合约; |          |


### 订阅与取消订阅规则说明

| 订阅(sub)      | 取消订阅(ubsub) | 规则   |
| -------------- | --------------- | ------ |
| orders.*       | orders.*        | 允许   |
| orders.symbol1-partion1 | orders.*        | 允许   |
| orders.symbol1-partion1 | orders.symbol1-partion1  | 允许   |
| orders.symbol1-partion1 | orders.symbol2-partion1  | 不允许 |
| orders.*       | orders.symbol1-partion1  | 不允许 |


## 订阅资产变动数据

 - accounts.$symbol-$partition
 
### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

`{`
  
  `"op": "sub",`
  
  `"topic": "accounts.$symbol-$partition",`
  
  `"cid": "id generated by client",`
  
  `}`

>   正确的订阅请求:                           
                                    

```json

{
    "op": "sub",
    "topic": "accounts.btc-usdt",
    "cid": "40sG903yz80oDFWr"
}

```                                

###  请求参数
| 参数名称 | 是否必须 | 类型   | 描述                                                         | 取值范围 |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op  <img width=250/>     | true <img width=250/>     | string | 订阅固定值为sub                                              |          |
| cid      | false    | string | Client 请求唯一 ID                                           |          |
| topic    | true     | string | 订阅主题名称，必填 (accounts.$symbol-$partition) 订阅、取消订阅某个品种下的资产变更信息；$symbol-$partition为“品种代码-交易分区”（BTC-USDT、ETH-USDT,USDT-USDT...），如果值为 * 时代表订阅所有期权合约; |          |

#### 备注：

- 推送接口新增定期推送逻辑：每 5 秒进行一次定期推送，由定期推送触发的数据中 event 参数值为“snapshot”，表示由系统定期推送触发。 如果5秒内某合约资产已触发过推送，则该合约资产跳过此次推送。


>  每当有资产变动时，client会收到数据，如下:

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

### 返回字段说明

| 参数名称           | 是否必须 | 类型         | 描述                                     | 取值范围                                                     |
| ------------------ | -------- | ------------ | ---------------------------------------- | ------------------------------------------------------------ |
| op                 | true <img width=250/>  | string       | 操作名称，推送固定值为 notify;   <img width=1000/>     |                                                              |
| topic              | true     | string       | 推送的主题                               |                                                              |
| ts                 | true     | long         | 服务端应答时间戳                         |                                                              |
| uid                | true     | string       | 用户uid                                  |                                                              |
| event              | true     | string       | 资产变化通知相关事件说明                 | 比如订单创建开仓(order.open) 、订单平仓(order.close) 、订单成交(order.match)、结算交割(settlement)、订单撤销(order.cancel) 、合约账户划转（contract.transfer)（包括外部划转）、系统（contract.system)、其他资产变化(other) 、初始资金（init）、由系统定期推送触发（snapshot） |
| \<data\>             | true     | object array |                                          |                                                              |
| symbol             | true     | string       | 品种代码                                 | "BTC","ETH","USDT"...                                               |
| trade_partition    | true     | string       | 交易分区                                 | "USDT"                                                       |
| margin_balance     | true     | decimal      | 账户权益                                 |                                                              |
| margin_static      | true     | decimal      | 静态权益                                 |                                                              |
| margin_position    | true     | decimal      | 履约保证金  |                                                              |
| margin_frozen      | true     | decimal      | 冻结保证金（卖方）                               |                                                              |
| margin_available   | true     | decimal      | 可用保证金                               |                                                              |
| profit_real        | true     | decimal      | 已实现盈亏                               |                                                              |
| profit_unreal      | true     | decimal      | 未实现盈亏                               |                                                              |
| withdraw_available | true     | decimal      | 可划转数量                               |                                                              |
| premium_frozen     | true     | decimal      | 冻结权利金（买方）                               |                |
| fee_frozen         | true     | decimal      | 冻结手续费                               |                |
| fee_asset         | true     | string      | 手续费币种                               |                |
| premium_in         | true     | decimal      | 本周权利金收入                            |                |
| premium_out        | true     | decimal      | 本周权利金支出                            |                |
| delta              | true     | decimal      | DELTA                                    |                |
| gamma              | true     | decimal      | GAMMA                                    |                |
| theta              | true     | decimal      | THETA                                    |                |
| vega               | true     | decimal      | VEGA                                     |                |
| option_value       | true     | decimal      | 期权市值（单位为USDT）                      |                |
| margin_asset       | true     | string       | 保证金币种                     | "BTC"，”ETH“，”USDT“                                         |
| \</data\>            |          |              |                                          |                                                              |


### 备注：

- USDT资产为该交易区下所有品种期权共用的；

- USDT资产下的期权市值为USDT区下所有品种期权持仓的价值；BTC资产下的期权市值为BTC期权持仓的价值；ETH资产下的期权市值为ETH期权持仓的价值；

## 取消订阅资产变动数据（unsub）

### 成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

`{`
  
  `"op": "unsub",`
  
  `"topic": "accounts.$symbol-$partition",`
  
  `"cid": "id generated by client",`
  
  `}`


>   正确的取消订阅请求:

```json

{
  "op": "unsub",
  "topic": "accounts.btc-usdt",
  "cid": "40sG903yz80oDFWr"
}

``` 
                             
###  取消订阅请求参数

| 参数名称 | 是否必须 | 类型   | 描述                                                         | 取值范围 |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string | 取消订阅固定值为unsub                                        |          |
| cid      | false    | string | Client 请求唯一 ID                                           |          |
| topic    | true     | string | 订阅主题名称，必填 (accounts.$symbol-$partition) 订阅、取消订阅某个品种下的资产变更信息；$symbol-$partition为“品种代码-交易分区”（BTC-USDT、ETH-USDT,USDT-USDT...），如果值为 * 时代表订阅所有期权合约; |          |

### 订阅与取消订阅规则说明

| 订阅(sub)        | 取消订阅(ubsub)  | 规则   |
| ---------------- | ---------------- | ------ |
| accounts.*       | accounts.*       | 允许   |
| accounts.symbol1-partion1 | accounts.*       | 允许   |
| accounts.symbol1-partion1 | accounts.symbol1-partion1 | 允许   |
| accounts.symbol1-partion1 | accounts.symbol2-partion1 | 不允许 |
| accounts.*       | accounts.symbol1-partion1 | 不允许 |


## 持仓变动更新数据（sub）

 - positions.$symbol-$partition
 
### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

`{`
  
  `"op": "sub",`
  
  `"topic": "positions.$symbol-$partition",`
  
  `"cid": "id generated by client",`
  
  `}`

>   正确的订阅请求:

```json

{
    "op": "sub",
    "topic": "positions.*",
    "cid": "40sG903yz80oDFWr"
}

```                              

###  请求参数

| 参数名称 | 是否必须 | 类型   | 描述                                                         | 取值范围 |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string | 订阅固定值为sub                                              |          |
| cid      | false    | string | Client 请求唯一 ID                                           |          |
| topic    | true     | string | 订阅主题名称，必填 (positions.$symbol-$partition) 订阅、取消订阅某个品种下的持仓变更信息；$symbol-$partition为“品种代码-交易分区”（BTC-USDT、ETH-USDT...），如果值为 * 时代表订阅所有期权合约; |          |

#### 备注：

- 推送接口新增定期推送逻辑：每 5 秒进行一次定期推送，由定期推送触发的数据中 event 参数值为“snapshot”，表示由系统定期推送触发。 如果5秒内某仓位已触发过推送，则该仓位跳过此次推送。


>  每当持仓有变动更新时，client会收到数据，如下:

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

### 返回参数

| 参数名称        | 是否必须 | 类型         | 描述                                   | 取值范围                                                     |
| --------------- | -------- | ------------ | -------------------------------------- | ------------------------------------------------------------ |
| op              | true <img width=250/>   | string       | 操作名称，推送固定值为 notify;  <img width=1000/>    |                                                              |
| topic           | true     | string       | 推送的主题                             |                                                              |
| ts              | true     | long         | 服务端应答时间戳                       |                                                              |
| uid             | true     | string       | 用户uid                                |                                                              |
| event           | true     | string       | 持仓变化通知相关事件说明               | 比如订单创建平仓(order.close) 、订单成交(order.match)、交割(settlement)、订单撤销(order.cancel) 、初始持仓（init）、由系统定期推送触发（snapshot） |
| \<data\>          | true     | object array |                                        |                                                              |
| symbol          | true     | string       | 品种代码                               | "BTC","ETH"...                                               |
| trade_partition | true     | string       | 交易分区                               | "USDT"                                                       |
| contract_code   | true     | string       | 合约代码                               | BTC-USDT-201225-C-13000                                      |
| contract_type   | true     | string       | 合约类型                               | 当周:"this_week", 次周:"next_week", 季度:"quarter"           |
| volume          | true     | decimal      | 持仓量                                 |                                                              |
| available       | true     | decimal      | 可平仓数量                             |                                                              |
| frozen          | true     | decimal      | 冻结数量  |                                                              |
| cost_open       | true     | decimal      | 开仓均价                               |                                                              |
| cost_hold       | true     | decimal      | 持仓均价                               |                                                              |
| profit_unreal   | true     | decimal      | 未实现盈亏                             |                                                              |
| profit_rate     | true     | decimal      | 收益率                                 |                                                              |
| profit          | true     | decimal      | 收益                                   |                                                              |
| margin_position | true     | decimal      | 履约保证金                           |                                                              |
| position_value | true     | decimal      |   仓位价值                         |                                                              |
| direction       | true     | string       | 仓位方向                               | "buy":买 "sell":卖                                           |
| last_price      | true     | decimal      | 最新成交价                             |                                                              |
| delivery_date      | true     | string      | 到期日                             |    如"20200508"                                                          |
| option_right_type      | true     | string      | 期权行权类型                            |   C:看涨期权 P:看跌期权                                                           |
| exercise_price      | true     | decimal      | 行权价                            |                                                       |
| quote_asset      | true     | string      | 报单币种                            |   "USDT"...                                               |
| margin_asset      | true     | string      | 保证金币种                            |  "BTC"，”ETH“，”USDT“                                      |
| \</data\>         |          |              |                                        |                                                              |

## 取消订阅持仓变动数据（unsub）

### 成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

`{`
  
  `"op": "unsub",`
  
  `"topic": "positions.$symbol-$partition",`
  
  `"cid": "id generated by client",`
  
  `}`

>   正确的取消订阅请求:

```json

{
  "op": "unsub",
  "topic": "positions.btc-usdt",
  "cid": "40sG903yz80oDFWr"
}

```                                 

###  取消订阅请求参数

| 参数名称 | 是否必须 | 类型   | 描述                                                         | 取值范围 |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string | 取消订阅固定值为unsub                                        |          |
| cid      | false    | string | Client 请求唯一 ID                                           |          |
| topic    | true     | string | 订阅主题名称，必填 (positions.$symbol-$partition) 订阅、取消订阅某个品种下的资产变更信息；$symbol-$partition为“品种代码-交易分区”（BTC-USDT、ETH-USDT...），如果值为 * 时代表订阅所有期权合约; |          |


###  订阅与取消订阅规则说明

| 订阅(sub)         | 取消订阅(ubsub)   | 规则   |
| ----------------- | ----------------- | ------ |
| positions.*       | positions.*       | 允许   |
| positions.symbol1-partion1 | positions.*       | 允许   |
| positions.symbol1-partion1 | positions.symbol1-partion1 | 允许   |
| positions.symbol1-partion1 | positions.symbol2-partion1 | 不允许 |
| positions.*       | positions.symbol1-partion1 | 不允许 |

## 订阅撮合订单成交数据（sub）

- matchOrders.$symbol-$partition

### 成功建立和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来订阅数据:

`{`
  
  `"op": "sub",`
  
  `"topic": "matchOrders.$symbol-$partition",`
  
  `"cid": "id generated by client",`
  
  `}`

> 正确订阅请求参数的例子:

```json
{
    "op": "sub",
    "topic": "matchOrders.btc-usdt",
    "cid": "40sG903yz80oDFWr"
}
```

###  请求参数

| 参数名称 | 是否必须 | 类型   | 描述                                                         | 取值范围 |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string | 订阅固定值为sub                                              |          |
| cid      | false    | string | Client 请求唯一 ID                                           |          |
| topic    | true     | string | 订阅主题名称，必填 (matchOrders.$symbol-$partition) 订阅、取消订阅某个品种下的撮合订单成交信息；$symbol-$partition为“品种代码-交易分区”（BTC-USDT、ETH-USDT...），如果值为 * 时代表订阅所有期权合约; |          |

>  每当有成交订单变动时，client会收到数据，如下:

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

### 返回参数

| 参数名称       | 是否必须 | 类型         | 描述                                                         | 取值范围                                                     |
| -------------- | -------- | ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| op             | true     | string       | 操作名称，推送固定值为 notify;                               |                                                              |
| topic          | true     | string       | 推送的主题                                                   |                                                              |
| ts             | true     | long         | 服务端应答时间戳                                             |                                                              |
| uid            | true     | string       | 用户uid                                                      |                                                              |
| symbol         | true     | string       | 品种代码                                                     | "BTC","ETH"...                                               |
| trade_partition | true     | string       | 交易分区                                                    | "USDT"                                                       |
| contract_type  | true     | string       | 合约类型                                                     | 当周:"this_week", 次周:"next_week", 季度:"quarter"            |
| contract_code  | true     | string       | 合约代码                                                     | BTC-USDT-201225-C-13000                                    |
| status         | true     | int          | 订单状态(3未成交 4部分成交 5部分成交已撤单 6全部成交 7已撤单) |                                                              |
| order_id       | true     | long         | 订单ID，在系统存储的字段为user_order_id                      |                                                              |
| order_id_str   | true     | string       | 订单ID ,字符串类型                                           |                                                              |
| order_type     | true     | int          | 订单类型                                                     | 1:报单 、 2:撤单                           |
| trade_volume   | true     | decimal      | 订单已成交数量                                                |                        |
| volume         | true     | decimal      | 订单总委托数量                                                |                          |
| \<trade\>        | true     | object array |                                                              |                                                              |
| id             | true     | string       | 成交唯一ID                                                   |                                                              |
| trade_id       | true     | long         | 撮合结果id                                                   |                                                              |
| trade_price    | true     | decimal      | 撮合价格                                                     |                                                              |
| trade_volume   | true     | decimal      | 成交量                                                       |                                                              |
| trade_turnover | true     | decimal      | 成交金额                                                     |                                                              |
| created_at     | true     | long         | 创建时间                                                     |                                                              |
| role           | true     | string       | taker或maker                                                 |                                                              |
| \</trade\>       |          |              |                                                              |                                                              |


## 取消撮合订单成交数据（unsub）

### 成功建⽴和 WebSocket API 的连接之后，向 Server 发送如下格式的数据来取消订阅数据:

`{`
  
  `"op": "unsub",`
  
  `"topic": "matchOrders.$symbol-$partition",`
  
  `"cid": "id generated by client",`
  
  `}`

 
>   正确的取消订阅请求:

```json

{
  "op": "unsub",
  "topic": "matchOrders.btc-usdt",
  "cid": "40sG903yz80oDFWr"
}
```                                 
 
###  取消订阅请求参数

| 参数名称 | 是否必须 | 类型   | 描述                                                         | 取值范围 |
| -------- | -------- | ------ | ------------------------------------------------------------ | -------- |
| op       | true     | string | 取消订阅固定值为unsub                                        |          |
| cid      | false    | string | Client 请求唯一 ID                                           |          |
| topic    | true     | string | 订阅主题名称，必填 (matchOrders.$symbol-$partition) 订阅、取消订阅某个品种下的撮合订单成交信息；$symbol-$partition为“品种代码-交易分区”（BTC-USDT、ETH-USDT...），如果值为 * 时代表订阅所有期权合约; |          |
| ts       | true     | long   | 响应生成时间点，单位：毫秒                                   |          |

### 订阅与取消订阅规则说明

| 订阅(sub)           | 取消订阅(ubsub)     | 规则   |
| ------------------- | ------------------- | ------ |
| matchOrders.*       | matchOrders.*       | 允许   |
| matchOrders.symbol1-partion1 | matchOrders.*       | 允许   |
| matchOrders.symbol1-partion1 | matchOrders.symbol1-partion1 | 允许   |
| matchOrders.symbol1-partion1 | matchOrders.symbol2-partion1 | 不允许 |
| matchOrders.*       | matchOrders.symbol1-partion1 | 不允许 |

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
	"topic": "public.option.heartbeat"
}
```

### 请求参数:
| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| op | true | string | 订阅固定值为sub	 |  |
| cid | false| string | Client 请求唯一 ID	 | |
| topic | true| string | 订阅主题名称，必填 (public.$service.heartbeat) 订阅某个业务的系统状态信息 | |

### sub订阅参数说明:
| 参数名称   | 是否必须 | 类型     | 描述   | 取值范围           |
| ------ | ---- | ------ | -------- | -------------- |
| service | true | string | 业务代码	 | option：期权  |


> 返回示例:

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

### 返回参数说明：
| 参数名称   |   是否必须  |   数据类型   |   描述   |   取值范围   |
| -------- | -------- | -------- |  --------------------------------------- | -------------- | 
| op   | true | string  | 操作名称，推送固定值为 notify;    |   |
| topic   | true | string  | 推送的主题   |   |
| event   | true | string  | 通知相关事件说明   |  订阅成功返回的初始系统状态信息（init），系统状态变化触发（update） |
| ts   | true | long  | 服务端应答时间戳   |   |
| \<data\> |  |  |  | |
| heartbeat | true | int | 系统状态	 |  1是可用，0为不可用(即停服维护) |
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
| orders.$contract_code | sub,unsub    | 订阅、取消订阅指定交易易对的订单变更更消息，当 $contract_code 值为 * 时代表订阅所有交易易对 |

## 响应码（Err-Code）说明

| 返回码 | 返回描述                                 |
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
