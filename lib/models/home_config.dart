import 'dart:convert';

import 'package:catering_sdu/components/types.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_config.g.dart';

@JsonSerializable()
class HomeConfig {
  static const _configId = "HomoConfig";
  static const _default = '["search", "recommend"]';

  static late HomeConfig _instance;

  factory HomeConfig._() {
    _instance = const HomeConfig(map: []);
    load().then((value) => _instance = value);
    return _instance;
  }

  static HomeConfig get instance => HomeConfig._();

  static void update(HomeConfig newConfig) async {
    // _instance = newConfig;
    final sp = await SharedPreferences.getInstance();
    sp.setString(_configId, _$HomeConfigToJson(newConfig).toString());
  }

  static Future<HomeConfig> load() async {
    final sp = await SharedPreferences.getInstance();

    return _$HomeConfigFromJson(
        jsonDecode(sp.getString(_configId) ?? _default));
  }

  final List<ComponentType> map;

  const HomeConfig({required this.map});
}