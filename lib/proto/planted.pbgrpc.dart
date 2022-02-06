///
//  Generated code. Do not modify.
//  source: planted.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'planted.pb.dart' as $0;
export 'planted.pb.dart';

class BroadcastClient extends $grpc.Client {
  static final _$getSlogan = $grpc.ClientMethod<$0.Meat, $0.Message>(
      '/proto.Broadcast/GetSlogan',
      ($0.Meat value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  BroadcastClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Message> getSlogan($0.Meat request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSlogan, request, options: options);
  }
}

abstract class BroadcastServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.Broadcast';

  BroadcastServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Meat, $0.Message>(
        'GetSlogan',
        getSlogan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Meat.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Future<$0.Message> getSlogan_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Meat> request) async {
    return getSlogan(call, await request);
  }

  $async.Future<$0.Message> getSlogan($grpc.ServiceCall call, $0.Meat request);
}
