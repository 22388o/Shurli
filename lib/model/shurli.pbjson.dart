///
//  Generated code. Do not modify.
//  source: shurli.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const WalletInfoRequest$json = const {
  '1': 'WalletInfoRequest',
};

const WalletInfo$json = const {
  '1': 'WalletInfo',
  '2': const [
    const {'1': 'Name', '3': 1, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'Ticker', '3': 2, '4': 1, '5': 9, '10': 'Ticker'},
    const {'1': 'Icon', '3': 3, '4': 1, '5': 9, '10': 'Icon'},
    const {'1': 'Status', '3': 4, '4': 1, '5': 9, '10': 'Status'},
    const {'1': 'Balance', '3': 5, '4': 1, '5': 1, '10': 'Balance'},
    const {'1': 'ZBalance', '3': 6, '4': 1, '5': 1, '10': 'ZBalance'},
    const {'1': 'Blocks', '3': 7, '4': 1, '5': 5, '10': 'Blocks'},
    const {'1': 'Synced', '3': 8, '4': 1, '5': 8, '10': 'Synced'},
    const {'1': 'Shielded', '3': 9, '4': 1, '5': 8, '10': 'Shielded'},
    const {'1': 'TValidAddr', '3': 10, '4': 1, '5': 8, '10': 'TValidAddr'},
    const {'1': 'ZValidAddr', '3': 11, '4': 1, '5': 8, '10': 'ZValidAddr'},
  ],
};

const WalletInfoResponse$json = const {
  '1': 'WalletInfoResponse',
  '2': const [
    const {'1': 'Wallets', '3': 1, '4': 3, '5': 11, '6': '.shurli.WalletInfo', '10': 'Wallets'},
  ],
};

const OrderData$json = const {
  '1': 'OrderData',
  '2': const [
    const {'1': 'Price', '3': 1, '4': 1, '5': 9, '10': 'Price'},
    const {'1': 'MaxVolume', '3': 2, '4': 1, '5': 9, '10': 'MaxVolume'},
    const {'1': 'DexPubkey', '3': 3, '4': 1, '5': 9, '10': 'DexPubkey'},
    const {'1': 'Base', '3': 4, '4': 1, '5': 9, '10': 'Base'},
    const {'1': 'ZBase', '3': 5, '4': 1, '5': 8, '10': 'ZBase'},
    const {'1': 'Rel', '3': 6, '4': 1, '5': 9, '10': 'Rel'},
    const {'1': 'ZRel', '3': 7, '4': 1, '5': 8, '10': 'ZRel'},
    const {'1': 'OrderID', '3': 8, '4': 1, '5': 3, '10': 'OrderID'},
    const {'1': 'TimestampStr', '3': 9, '4': 1, '5': 9, '10': 'TimestampStr'},
    const {'1': 'Timestamp', '3': 10, '4': 1, '5': 9, '10': 'Timestamp'},
    const {'1': 'Handle', '3': 11, '4': 1, '5': 9, '10': 'Handle'},
    const {'1': 'Pubkey', '3': 12, '4': 1, '5': 9, '10': 'Pubkey'},
    const {'1': 'Authorized', '3': 13, '4': 1, '5': 8, '10': 'Authorized'},
    const {'1': 'BaseBal', '3': 14, '4': 1, '5': 1, '10': 'BaseBal'},
    const {'1': 'ZBaseBal', '3': 15, '4': 1, '5': 1, '10': 'ZBaseBal'},
    const {'1': 'RelBal', '3': 16, '4': 1, '5': 1, '10': 'RelBal'},
    const {'1': 'ZRelBal', '3': 17, '4': 1, '5': 1, '10': 'ZRelBal'},
    const {'1': 'BaseIcon', '3': 18, '4': 1, '5': 9, '10': 'BaseIcon'},
    const {'1': 'RelIcon', '3': 19, '4': 1, '5': 9, '10': 'RelIcon'},
  ],
};

const OrderBookResponse$json = const {
  '1': 'OrderBookResponse',
  '2': const [
    const {'1': 'Base', '3': 1, '4': 1, '5': 9, '10': 'Base'},
    const {'1': 'Rel', '3': 2, '4': 1, '5': 9, '10': 'Rel'},
    const {'1': 'Results', '3': 3, '4': 1, '5': 9, '10': 'Results'},
    const {'1': 'SortBy', '3': 4, '4': 1, '5': 9, '10': 'SortBy'},
    const {'1': 'BaseBal', '3': 5, '4': 1, '5': 1, '10': 'BaseBal'},
    const {'1': 'RelBal', '3': 6, '4': 1, '5': 1, '10': 'RelBal'},
    const {'1': 'BaseIcon', '3': 7, '4': 1, '5': 9, '10': 'BaseIcon'},
    const {'1': 'RelIcon', '3': 8, '4': 1, '5': 9, '10': 'RelIcon'},
    const {'1': 'OrderList', '3': 9, '4': 3, '5': 11, '6': '.shurli.OrderData', '10': 'OrderList'},
  ],
};

const OrderBookRequest$json = const {
  '1': 'OrderBookRequest',
  '2': const [
    const {'1': 'Base', '3': 1, '4': 1, '5': 9, '10': 'Base'},
    const {'1': 'Rel', '3': 2, '4': 1, '5': 9, '10': 'Rel'},
    const {'1': 'Results', '3': 3, '4': 1, '5': 9, '10': 'Results'},
    const {'1': 'SortBy', '3': 4, '4': 1, '5': 9, '10': 'SortBy'},
  ],
};

