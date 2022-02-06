///
//  Generated code. Do not modify.
//  source: planted.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use meatDescriptor instead')
const Meat$json = const {
  '1': 'Meat',
  '2': const [
    const {'1': 'meat', '3': 1, '4': 1, '5': 9, '10': 'meat'},
  ],
};

/// Descriptor for `Meat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meatDescriptor = $convert.base64Decode('CgRNZWF0EhIKBG1lYXQYASABKAlSBG1lYXQ=');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'slogan', '3': 1, '4': 1, '5': 9, '10': 'slogan'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEhYKBnNsb2dhbhgBIAEoCVIGc2xvZ2Fu');
@$core.Deprecated('Use connectDescriptor instead')
const Connect$json = const {
  '1': 'Connect',
  '2': const [
    const {'1': 'meat', '3': 1, '4': 1, '5': 11, '6': '.proto.Meat', '10': 'meat'},
    const {'1': 'active', '3': 2, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `Connect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectDescriptor = $convert.base64Decode('CgdDb25uZWN0Eh8KBG1lYXQYASABKAsyCy5wcm90by5NZWF0UgRtZWF0EhYKBmFjdGl2ZRgCIAEoCFIGYWN0aXZl');
@$core.Deprecated('Use closeDescriptor instead')
const Close$json = const {
  '1': 'Close',
};

/// Descriptor for `Close`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closeDescriptor = $convert.base64Decode('CgVDbG9zZQ==');
