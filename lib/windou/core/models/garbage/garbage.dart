import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'garbage.freezed.dart';
part 'garbage.g.dart';

@freezed
class GarbageModel with _$GarbageModel {
  const factory GarbageModel({
    required String id,
    required String name,
    required String imageLink,
    required String price,
  }) = _GarbageModel;

  factory GarbageModel.fromJson(Map<String, Object?> json) =>
      _$GarbageModelFromJson(json);
}
