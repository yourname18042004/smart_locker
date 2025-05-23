// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Locker _$LockerFromJson(Map<String, dynamic> json) => Locker(
      id: (json['id'] as num).toInt(),
      lockerCode: json['locker_code'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      days: (json['days'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LockerToJson(Locker instance) => <String, dynamic>{
      'id': instance.id,
      'locker_code': instance.lockerCode,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'product': instance.product,
      'days': instance.days,
    };
