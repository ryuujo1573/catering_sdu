// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeConfig _$HomeConfigFromJson(Map<String, dynamic> json) => HomeConfig(
      map: (json['map'] as List<dynamic>)
          .map((e) => $enumDecode(_$ComponentTypeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$HomeConfigToJson(HomeConfig instance) =>
    <String, dynamic>{
      'map': instance.map.map((e) => _$ComponentTypeEnumMap[e]!).toList(),
    };

const _$ComponentTypeEnumMap = {
  ComponentType.searchBox: 'search',
  ComponentType.recommendBox: 'recommend',
};
