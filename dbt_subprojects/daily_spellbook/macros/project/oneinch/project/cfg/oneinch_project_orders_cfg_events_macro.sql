{% macro oneinch_project_orders_cfg_events_macro() %}

-- EVENTS CONFIG
{%
    set events = {
        "0x0bcc4c97732e47d9946f229edb95f5b6323f601300e4690de719993f3c371129": {
            "project":          "ZeroEx",
            "name":             "Fill",
            "maker":            "substr(topic1  , 12 + 1                , 20)",
            "taker":            "substr(data    , 12 + 1                , 20)",
            "maker_asset":      "if(substr(data, bytearray_to_bigint(substr(data, 32*6 + 24 + 1, 8)) + 32*1 + 1, 4) = 0xf47261b0, substr(data, bytearray_to_bigint(substr(data, 32*6 + 24 + 1, 8)) + 32*1 + 4 + 12 + 1, 20), 0x01)",
            "taker_asset":      "if(substr(data, bytearray_to_bigint(substr(data, 32*7 + 24 + 1, 8)) + 32*1 + 1, 4) = 0xf47261b0, substr(data, bytearray_to_bigint(substr(data, 32*7 + 24 + 1, 8)) + 32*1 + 4 + 12 + 1, 20), 0x01)",
            "making_amount":    "substr(data    , 32*2 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*3 + 1              , 32)",
            "order_hash":       "substr(topic3  , 1                     , 32)",
        },
        "0x6869791f0a34781b29882982cc39e882768cf2c96995c2a110c577c53bc932d5": {
            "project":          "ZeroEx",
            "name":             "Fill",
            "maker":            "substr(topic1  , 12 + 1                , 20)",
            "taker":            "substr(data    , 32*4 + 12 + 1         , 20)",
            "maker_asset":      "if(substr(data, bytearray_to_bigint(substr(data, 32*0 + 24 + 1, 8)) + 32*1 + 1, 4) = 0xf47261b0, substr(data, bytearray_to_bigint(substr(data, 32*0 + 24 + 1, 8)) + 32*1 + 4 + 12 + 1, 20), 0x01)",
            "taker_asset":      "if(substr(data, bytearray_to_bigint(substr(data, 32*1 + 24 + 1, 8)) + 32*1 + 1, 4) = 0xf47261b0, substr(data, bytearray_to_bigint(substr(data, 32*1 + 24 + 1, 8)) + 32*1 + 4 + 12 + 1, 20), 0x01)",
            "making_amount":    "substr(data    , 32*6 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*7 + 1              , 32)",
            "order_hash":       "substr(topic3  , 1                     , 32)",
        },
        "0xab614d2b738543c0ea21f56347cf696a3a0c42a7cbec3212a5ca22a4dcff2124": {
            "project":          "ZeroEx",
            "name":             "LimitOrderFilled",
            "maker":            "substr(data    , 32*1 + 12 + 1         , 20)",
            "taker":            "substr(data    , 32*2 + 12 + 1         , 20)",
            "maker_asset":      "substr(data    , 32*4 + 12 + 1         , 20)",
            "taker_asset":      "substr(data    , 32*5 + 12 + 1         , 20)",
            "making_amount":    "substr(data    , 32*7 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*6 + 1              , 32)",
            "taker_fee_amount": "substr(data    , 32*8 + 1              , 32)",
            "order_hash":       "substr(data    , 1                     , 32)",
        },
        "0xac75f773e3a92f1a02b12134d65e1f47f8a14eabe4eaf1e24624918e6a8b269f": {
            "project":          "ZeroEx",
            "name":             "OtcOrderFilled",
            "maker":            "substr(data    , 32*1 + 12 + 1         , 20)",
            "taker":            "substr(data    , 32*2 + 12 + 1         , 20)",
            "maker_asset":      "substr(data    , 32*3 + 12 + 1         , 20)",
            "taker_asset":      "substr(data    , 32*4 + 12 + 1         , 20)",
            "making_amount":    "substr(data    , 32*5 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*6 + 1              , 32)",
            "order_hash":       "substr(data    , 1                     , 32)",
        },
        "0x829fa99d94dc4636925b38632e625736a614c154d55006b7ab6bea979c210c32": {
            "project":          "ZeroEx",
            "name":             "RfqOrderFilled",
            "maker":            "substr(data    , 32*1 + 12 + 1         , 20)",
            "taker":            "substr(data    , 32*2 + 12 + 1         , 20)",
            "maker_asset":      "substr(data    , 32*3 + 12 + 1         , 20)",
            "taker_asset":      "substr(data    , 32*4 + 12 + 1         , 20)",
            "making_amount":    "substr(data    , 32*6 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*5 + 1              , 32)",
            "order_hash":       "substr(data    , 1                     , 32)",
        },
        "0xb709ddcc6550418e9b89df1f4938071eeaa3f6376309904c77e15d46b16066f5": {
            "project":          "Hashflow",
            "name":             "Trade",
            "maker":            "substr(data    , 32*0 + 12 + 1         , 20)",
            "taker":            "substr(data    , 32*1 + 12 + 1         , 20)",
            "maker_asset":      "substr(data    , 32*4 + 12 + 1         , 20)",
            "taker_asset":      "substr(data    , 32*3 + 12 + 1         , 20)",
            "making_amount":    "substr(data    , 32*6 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*5 + 1              , 32)",
        },
        "0x8cf3dec1929508e5677d7db003124e74802bfba7250a572205a9986d86ca9f1e": {
            "project":          "Hashflow",
            "name":             "Trade",
            "taker":            "substr(data    , 32*0 + 12 + 1         , 20)",
            "maker_asset":      "substr(data    , 32*3 + 12 + 1         , 20)",
            "taker_asset":      "substr(data    , 32*2 + 12 + 1         , 20)",
            "making_amount":    "substr(data    , 32*5 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*4 + 1              , 32)",
        },
        "0x34f57786fb01682fb4eec88d340387ef01a168fe345ea5b76f709d4e560c10eb": {
            "project":          "Hashflow",
            "name":             "Trade",
            "taker":            "substr(data    , 32*0 + 12 + 1         , 20)",
            "maker_asset":      "substr(data    , 32*4 + 12 + 1         , 20)",
            "taker_asset":      "substr(data    , 32*3 + 12 + 1         , 20)",
            "making_amount":    "substr(data    , 32*6 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*5 + 1              , 32)",
            "order_hash":       "substr(data    , 32*2 + 1              , 32)",
        },
        "0x32f38ef2842789f9cd8fd5ae2497e7acfd3ca27d341fa0878305c3072b63a06d": {
            "project":          "Native",
            "name":             "RfqTrade",
            "maker":            "substr(data    , 32*6 + 12 + 1         , 20)",
            "taker":            "substr(data    , 32*0 + 12 + 1         , 20)",
            "maker_asset":      "substr(data    , 32*2 + 12 + 1         , 20)",
            "taker_asset":      "substr(data    , 32*1 + 12 + 1         , 20)",
            "making_amount":    "substr(data    , 32*4 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*3 + 1              , 32)",
            "order_hash":       "substr(data    , 32*5 + 1              , 16)",
        },
        "0x0c3ca67555399daacbfbeef89219bf4eca6380fdc58f2ed80cdc0841616c5818": {
            "project":          "Native",
            "name":             "ExternalSwap",
            "taker":            "substr(data    , 32*1 + 12 + 1         , 20)",
            "maker_asset":      "substr(data    , 32*3 + 12 + 1         , 20)",
            "taker_asset":      "substr(data    , 32*2 + 12 + 1         , 20)",
            "making_amount":    "cast(abs(bytearray_to_int256(substr(data, 32*5 + 1, 32))) as varbinary)",
            "taking_amount":    "substr(data    , 32*4 + 1              , 32)",
            "order_hash":       "substr(data    , 32*6 + 1              , 16)",
        },
        "0x4be05c8d54f5e056ab2cfa033e9f582057001268c3e28561bb999d35d2c8f2c8": {
            "project":          "Clipper",
            "name":             "Swapped",
            "taker":            "coalesce(substr(topic3, 12 + 1, 20), substr(data, 32*2 + 12 + 1, 20))",
            "maker_asset":      "coalesce(substr(topic2, 12 + 1, 20), substr(data, 32*1 + 12 + 1, 20))",
            "taker_asset":      "coalesce(substr(topic1, 12 + 1, 20), substr(data, 32*0 + 12 + 1, 20))",
            "making_amount":    "substr(data, 32*if(topic1 is null, 4, 1) + 1, 32)",
            "taking_amount":    "substr(data, 32*if(topic1 is null, 3, 0) + 1, 32)",
        },
        "0x2170c741c41531aec20e7c107c24eecfdd15e69c9bb0a8dd37b1840b9e0b207b": {
            "project":          "Swaap",
            "name":             "Swap",
            "pool":             "topic1",
            "maker_asset":      "substr(topic3  , 12 + 1                , 20)",
            "taker_asset":      "substr(topic2  , 12 + 1                , 20)",
            "making_amount":    "substr(data    , 32*1 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*0 + 1              , 32)",
        },
        "0x6621486d9c28838df4a87d2cca5007bc2aaf6a5b5de083b1db8faf709302c473": {
            "project":          "Paraswap",
            "name":             "OrderFilled",
            "maker":            "substr(topic2  , 12 + 1                , 20)",
            "taker":            "substr(topic3  , 12 + 1                , 20)",
            "maker_asset":      "substr(data    , 32*0 + 12 + 1         , 20)",
            "taker_asset":      "substr(data    , 32*2 + 12 + 1         , 20)",
            "making_amount":    "substr(data    , 32*1 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*3 + 1              , 32)",
            "order_hash":       "substr(topic1  , 1                     , 32)",
        },
        "0xa07a543ab8a018198e99ca0184c93fe9050a79400a0a723441f84de1d972cc17": {
            "project":          "CoWSwap",
            "name":             "Trade",
            "maker":            "substr(topic1  , 12 + 1                , 20)",
            "maker_asset":      "substr(data    , 32*0 + 12 + 1         , 20)",
            "taker_asset":      "substr(data    , 32*1 + 12 + 1         , 20)",
            "making_amount":    "substr(data    , 32*2 + 1              , 32)",
            "taking_amount":    "substr(data    , 32*3 + 1              , 32)",
            "fee_asset":        "substr(data    , 32*0 + 12 + 1         , 20)",
            "fee_amount":       "substr(data    , 32*4 + 1              , 32)",
            "order_hash":       "substr(data    , 32*7 + 1              , 56)",
        },
        "0x78ad7ec0e9f89e74012afa58738b6b661c024cb0fd185ee2f616c0a28924bd66": {
            "project":          "UniswapX",
            "name":             "Fill",
            "maker":            "substr(topic3  , 12 + 1                , 20)",
            "taker":            "substr(topic2  , 12 + 1                , 20)",
            "order_hash":       "substr(topic1  , 1                     , 32)",
            "nonce":            "substr(data    , 1                     , 32)",
        },
        "0xadd7095becdaa725f0f33243630938c861b0bba83dfd217d4055701aa768ec2e": {
            "project":          "Bebop",
            "name":             "BebopOrder",
            "order_hash":       "substr(topic1  , 16 + 1                , 16)",
        }
    }
%}

{{ return(events) }}

{% endmacro %}