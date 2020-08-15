///
//  Generated code. Do not modify.
//  source: shurli.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'shurli.pb.dart' as $0;
export 'shurli.pb.dart';

class ShurliServiceClient extends $grpc.Client {
  static final _$walletInfo =
      $grpc.ClientMethod<$0.WalletInfoRequest, $0.WalletInfoResponse>(
          '/shurli.ShurliService/WalletInfo',
          ($0.WalletInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.WalletInfoResponse.fromBuffer(value));
  static final _$orderBook =
      $grpc.ClientMethod<$0.OrderBookRequest, $0.OrderBookResponse>(
          '/shurli.ShurliService/OrderBook',
          ($0.OrderBookRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.OrderBookResponse.fromBuffer(value));

  ShurliServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.WalletInfoResponse> walletInfo(
      $0.WalletInfoRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$walletInfo, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.OrderBookResponse> orderBook(
      $0.OrderBookRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$orderBook, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class ShurliServiceBase extends $grpc.Service {
  $core.String get $name => 'shurli.ShurliService';

  ShurliServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.WalletInfoRequest, $0.WalletInfoResponse>(
        'WalletInfo',
        walletInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.WalletInfoRequest.fromBuffer(value),
        ($0.WalletInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.OrderBookRequest, $0.OrderBookResponse>(
        'OrderBook',
        orderBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.OrderBookRequest.fromBuffer(value),
        ($0.OrderBookResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.WalletInfoResponse> walletInfo_Pre($grpc.ServiceCall call,
      $async.Future<$0.WalletInfoRequest> request) async {
    return walletInfo(call, await request);
  }

  $async.Future<$0.OrderBookResponse> orderBook_Pre($grpc.ServiceCall call,
      $async.Future<$0.OrderBookRequest> request) async {
    return orderBook(call, await request);
  }

  $async.Future<$0.WalletInfoResponse> walletInfo(
      $grpc.ServiceCall call, $0.WalletInfoRequest request);
  $async.Future<$0.OrderBookResponse> orderBook(
      $grpc.ServiceCall call, $0.OrderBookRequest request);
}
