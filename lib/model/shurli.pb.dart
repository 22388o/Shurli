///
//  Generated code. Do not modify.
//  source: shurli.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class WalletInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WalletInfoRequest', package: const $pb.PackageName('shurli'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  WalletInfoRequest._() : super();
  factory WalletInfoRequest() => create();
  factory WalletInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WalletInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WalletInfoRequest clone() => WalletInfoRequest()..mergeFromMessage(this);
  WalletInfoRequest copyWith(void Function(WalletInfoRequest) updates) => super.copyWith((message) => updates(message as WalletInfoRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WalletInfoRequest create() => WalletInfoRequest._();
  WalletInfoRequest createEmptyInstance() => create();
  static $pb.PbList<WalletInfoRequest> createRepeated() => $pb.PbList<WalletInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static WalletInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WalletInfoRequest>(create);
  static WalletInfoRequest _defaultInstance;
}

class WalletInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WalletInfo', package: const $pb.PackageName('shurli'), createEmptyInstance: create)
    ..aOS(1, 'Name', protoName: 'Name')
    ..aOS(2, 'Ticker', protoName: 'Ticker')
    ..aOS(3, 'Icon', protoName: 'Icon')
    ..aOS(4, 'Status', protoName: 'Status')
    ..a<$core.double>(5, 'Balance', $pb.PbFieldType.OD, protoName: 'Balance')
    ..a<$core.double>(6, 'ZBalance', $pb.PbFieldType.OD, protoName: 'ZBalance')
    ..a<$core.int>(7, 'Blocks', $pb.PbFieldType.O3, protoName: 'Blocks')
    ..aOB(8, 'Synced', protoName: 'Synced')
    ..aOB(9, 'Shielded', protoName: 'Shielded')
    ..aOB(10, 'TValidAddr', protoName: 'TValidAddr')
    ..aOB(11, 'ZValidAddr', protoName: 'ZValidAddr')
    ..hasRequiredFields = false
  ;

  WalletInfo._() : super();
  factory WalletInfo() => create();
  factory WalletInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WalletInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WalletInfo clone() => WalletInfo()..mergeFromMessage(this);
  WalletInfo copyWith(void Function(WalletInfo) updates) => super.copyWith((message) => updates(message as WalletInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WalletInfo create() => WalletInfo._();
  WalletInfo createEmptyInstance() => create();
  static $pb.PbList<WalletInfo> createRepeated() => $pb.PbList<WalletInfo>();
  @$core.pragma('dart2js:noInline')
  static WalletInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WalletInfo>(create);
  static WalletInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ticker => $_getSZ(1);
  @$pb.TagNumber(2)
  set ticker($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTicker() => $_has(1);
  @$pb.TagNumber(2)
  void clearTicker() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get balance => $_getN(4);
  @$pb.TagNumber(5)
  set balance($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBalance() => $_has(4);
  @$pb.TagNumber(5)
  void clearBalance() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get zBalance => $_getN(5);
  @$pb.TagNumber(6)
  set zBalance($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasZBalance() => $_has(5);
  @$pb.TagNumber(6)
  void clearZBalance() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get blocks => $_getIZ(6);
  @$pb.TagNumber(7)
  set blocks($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBlocks() => $_has(6);
  @$pb.TagNumber(7)
  void clearBlocks() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get synced => $_getBF(7);
  @$pb.TagNumber(8)
  set synced($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSynced() => $_has(7);
  @$pb.TagNumber(8)
  void clearSynced() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get shielded => $_getBF(8);
  @$pb.TagNumber(9)
  set shielded($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasShielded() => $_has(8);
  @$pb.TagNumber(9)
  void clearShielded() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get tValidAddr => $_getBF(9);
  @$pb.TagNumber(10)
  set tValidAddr($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTValidAddr() => $_has(9);
  @$pb.TagNumber(10)
  void clearTValidAddr() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get zValidAddr => $_getBF(10);
  @$pb.TagNumber(11)
  set zValidAddr($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasZValidAddr() => $_has(10);
  @$pb.TagNumber(11)
  void clearZValidAddr() => clearField(11);
}

class WalletInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WalletInfoResponse', package: const $pb.PackageName('shurli'), createEmptyInstance: create)
    ..pc<WalletInfo>(1, 'Wallets', $pb.PbFieldType.PM, protoName: 'Wallets', subBuilder: WalletInfo.create)
    ..hasRequiredFields = false
  ;

  WalletInfoResponse._() : super();
  factory WalletInfoResponse() => create();
  factory WalletInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WalletInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WalletInfoResponse clone() => WalletInfoResponse()..mergeFromMessage(this);
  WalletInfoResponse copyWith(void Function(WalletInfoResponse) updates) => super.copyWith((message) => updates(message as WalletInfoResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WalletInfoResponse create() => WalletInfoResponse._();
  WalletInfoResponse createEmptyInstance() => create();
  static $pb.PbList<WalletInfoResponse> createRepeated() => $pb.PbList<WalletInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static WalletInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WalletInfoResponse>(create);
  static WalletInfoResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<WalletInfo> get wallets => $_getList(0);
}

class OrderData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OrderData', package: const $pb.PackageName('shurli'), createEmptyInstance: create)
    ..aOS(1, 'Price', protoName: 'Price')
    ..aOS(2, 'MaxVolume', protoName: 'MaxVolume')
    ..aOS(3, 'DexPubkey', protoName: 'DexPubkey')
    ..aOS(4, 'Base', protoName: 'Base')
    ..aOB(5, 'ZBase', protoName: 'ZBase')
    ..aOS(6, 'Rel', protoName: 'Rel')
    ..aOB(7, 'ZRel', protoName: 'ZRel')
    ..aInt64(8, 'OrderID', protoName: 'OrderID')
    ..aOS(9, 'TimestampStr', protoName: 'TimestampStr')
    ..aOS(10, 'Timestamp', protoName: 'Timestamp')
    ..aOS(11, 'Handle', protoName: 'Handle')
    ..aOS(12, 'Pubkey', protoName: 'Pubkey')
    ..aOB(13, 'Authorized', protoName: 'Authorized')
    ..a<$core.double>(14, 'BaseBal', $pb.PbFieldType.OD, protoName: 'BaseBal')
    ..a<$core.double>(15, 'ZBaseBal', $pb.PbFieldType.OD, protoName: 'ZBaseBal')
    ..a<$core.double>(16, 'RelBal', $pb.PbFieldType.OD, protoName: 'RelBal')
    ..a<$core.double>(17, 'ZRelBal', $pb.PbFieldType.OD, protoName: 'ZRelBal')
    ..aOS(18, 'BaseIcon', protoName: 'BaseIcon')
    ..aOS(19, 'RelIcon', protoName: 'RelIcon')
    ..hasRequiredFields = false
  ;

  OrderData._() : super();
  factory OrderData() => create();
  factory OrderData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrderData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OrderData clone() => OrderData()..mergeFromMessage(this);
  OrderData copyWith(void Function(OrderData) updates) => super.copyWith((message) => updates(message as OrderData));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrderData create() => OrderData._();
  OrderData createEmptyInstance() => create();
  static $pb.PbList<OrderData> createRepeated() => $pb.PbList<OrderData>();
  @$core.pragma('dart2js:noInline')
  static OrderData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrderData>(create);
  static OrderData _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get price => $_getSZ(0);
  @$pb.TagNumber(1)
  set price($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrice() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get maxVolume => $_getSZ(1);
  @$pb.TagNumber(2)
  set maxVolume($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxVolume() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxVolume() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dexPubkey => $_getSZ(2);
  @$pb.TagNumber(3)
  set dexPubkey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDexPubkey() => $_has(2);
  @$pb.TagNumber(3)
  void clearDexPubkey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get base => $_getSZ(3);
  @$pb.TagNumber(4)
  set base($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBase() => $_has(3);
  @$pb.TagNumber(4)
  void clearBase() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get zBase => $_getBF(4);
  @$pb.TagNumber(5)
  set zBase($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasZBase() => $_has(4);
  @$pb.TagNumber(5)
  void clearZBase() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get rel => $_getSZ(5);
  @$pb.TagNumber(6)
  set rel($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRel() => $_has(5);
  @$pb.TagNumber(6)
  void clearRel() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get zRel => $_getBF(6);
  @$pb.TagNumber(7)
  set zRel($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasZRel() => $_has(6);
  @$pb.TagNumber(7)
  void clearZRel() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get orderID => $_getI64(7);
  @$pb.TagNumber(8)
  set orderID($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOrderID() => $_has(7);
  @$pb.TagNumber(8)
  void clearOrderID() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get timestampStr => $_getSZ(8);
  @$pb.TagNumber(9)
  set timestampStr($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTimestampStr() => $_has(8);
  @$pb.TagNumber(9)
  void clearTimestampStr() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get timestamp => $_getSZ(9);
  @$pb.TagNumber(10)
  set timestamp($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTimestamp() => $_has(9);
  @$pb.TagNumber(10)
  void clearTimestamp() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get handle => $_getSZ(10);
  @$pb.TagNumber(11)
  set handle($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasHandle() => $_has(10);
  @$pb.TagNumber(11)
  void clearHandle() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get pubkey => $_getSZ(11);
  @$pb.TagNumber(12)
  set pubkey($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPubkey() => $_has(11);
  @$pb.TagNumber(12)
  void clearPubkey() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get authorized => $_getBF(12);
  @$pb.TagNumber(13)
  set authorized($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasAuthorized() => $_has(12);
  @$pb.TagNumber(13)
  void clearAuthorized() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get baseBal => $_getN(13);
  @$pb.TagNumber(14)
  set baseBal($core.double v) { $_setDouble(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasBaseBal() => $_has(13);
  @$pb.TagNumber(14)
  void clearBaseBal() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get zBaseBal => $_getN(14);
  @$pb.TagNumber(15)
  set zBaseBal($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasZBaseBal() => $_has(14);
  @$pb.TagNumber(15)
  void clearZBaseBal() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get relBal => $_getN(15);
  @$pb.TagNumber(16)
  set relBal($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasRelBal() => $_has(15);
  @$pb.TagNumber(16)
  void clearRelBal() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get zRelBal => $_getN(16);
  @$pb.TagNumber(17)
  set zRelBal($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasZRelBal() => $_has(16);
  @$pb.TagNumber(17)
  void clearZRelBal() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get baseIcon => $_getSZ(17);
  @$pb.TagNumber(18)
  set baseIcon($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasBaseIcon() => $_has(17);
  @$pb.TagNumber(18)
  void clearBaseIcon() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get relIcon => $_getSZ(18);
  @$pb.TagNumber(19)
  set relIcon($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasRelIcon() => $_has(18);
  @$pb.TagNumber(19)
  void clearRelIcon() => clearField(19);
}

class OrderBookResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OrderBookResponse', package: const $pb.PackageName('shurli'), createEmptyInstance: create)
    ..aOS(1, 'Base', protoName: 'Base')
    ..aOS(2, 'Rel', protoName: 'Rel')
    ..aOS(3, 'Results', protoName: 'Results')
    ..aOS(4, 'SortBy', protoName: 'SortBy')
    ..a<$core.double>(5, 'BaseBal', $pb.PbFieldType.OD, protoName: 'BaseBal')
    ..a<$core.double>(6, 'RelBal', $pb.PbFieldType.OD, protoName: 'RelBal')
    ..aOS(7, 'BaseIcon', protoName: 'BaseIcon')
    ..aOS(8, 'RelIcon', protoName: 'RelIcon')
    ..pc<OrderData>(9, 'OrderList', $pb.PbFieldType.PM, protoName: 'OrderList', subBuilder: OrderData.create)
    ..hasRequiredFields = false
  ;

  OrderBookResponse._() : super();
  factory OrderBookResponse() => create();
  factory OrderBookResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrderBookResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OrderBookResponse clone() => OrderBookResponse()..mergeFromMessage(this);
  OrderBookResponse copyWith(void Function(OrderBookResponse) updates) => super.copyWith((message) => updates(message as OrderBookResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrderBookResponse create() => OrderBookResponse._();
  OrderBookResponse createEmptyInstance() => create();
  static $pb.PbList<OrderBookResponse> createRepeated() => $pb.PbList<OrderBookResponse>();
  @$core.pragma('dart2js:noInline')
  static OrderBookResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrderBookResponse>(create);
  static OrderBookResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get base => $_getSZ(0);
  @$pb.TagNumber(1)
  set base($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get rel => $_getSZ(1);
  @$pb.TagNumber(2)
  set rel($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRel() => $_has(1);
  @$pb.TagNumber(2)
  void clearRel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get results => $_getSZ(2);
  @$pb.TagNumber(3)
  set results($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResults() => $_has(2);
  @$pb.TagNumber(3)
  void clearResults() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sortBy => $_getSZ(3);
  @$pb.TagNumber(4)
  set sortBy($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSortBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearSortBy() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get baseBal => $_getN(4);
  @$pb.TagNumber(5)
  set baseBal($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBaseBal() => $_has(4);
  @$pb.TagNumber(5)
  void clearBaseBal() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get relBal => $_getN(5);
  @$pb.TagNumber(6)
  set relBal($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRelBal() => $_has(5);
  @$pb.TagNumber(6)
  void clearRelBal() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get baseIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set baseIcon($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBaseIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearBaseIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get relIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set relIcon($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRelIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearRelIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<OrderData> get orderList => $_getList(8);
}

class OrderBookRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OrderBookRequest', package: const $pb.PackageName('shurli'), createEmptyInstance: create)
    ..aOS(1, 'Base', protoName: 'Base')
    ..aOS(2, 'Rel', protoName: 'Rel')
    ..aOS(3, 'Results', protoName: 'Results')
    ..aOS(4, 'SortBy', protoName: 'SortBy')
    ..hasRequiredFields = false
  ;

  OrderBookRequest._() : super();
  factory OrderBookRequest() => create();
  factory OrderBookRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrderBookRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OrderBookRequest clone() => OrderBookRequest()..mergeFromMessage(this);
  OrderBookRequest copyWith(void Function(OrderBookRequest) updates) => super.copyWith((message) => updates(message as OrderBookRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrderBookRequest create() => OrderBookRequest._();
  OrderBookRequest createEmptyInstance() => create();
  static $pb.PbList<OrderBookRequest> createRepeated() => $pb.PbList<OrderBookRequest>();
  @$core.pragma('dart2js:noInline')
  static OrderBookRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrderBookRequest>(create);
  static OrderBookRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get base => $_getSZ(0);
  @$pb.TagNumber(1)
  set base($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get rel => $_getSZ(1);
  @$pb.TagNumber(2)
  set rel($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRel() => $_has(1);
  @$pb.TagNumber(2)
  void clearRel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get results => $_getSZ(2);
  @$pb.TagNumber(3)
  set results($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResults() => $_has(2);
  @$pb.TagNumber(3)
  void clearResults() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sortBy => $_getSZ(3);
  @$pb.TagNumber(4)
  set sortBy($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSortBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearSortBy() => clearField(4);
}

