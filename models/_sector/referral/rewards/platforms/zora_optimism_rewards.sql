{{ config(
    schema = 'zora_optimism',
    alias = 'rewards',
    
    materialized = 'incremental',
    file_format = 'delta',
    incremental_strategy = 'merge',
    unique_key = ['project','tx_hash','sub_tx_id'],
    incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')],
    )
}}

{{zora_referral_rewards(
    blockchain = "optimism"
    ,ProtocolRewards_evt_RewardsDeposit = source('zora_optimism','ProtocolRewards_evt_RewardsDeposit')
    )
}}
