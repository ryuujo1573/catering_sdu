import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'search_box.dart';

@JsonEnum()
enum ComponentType {
  @JsonValue('search')
  searchBox,
  @JsonValue('recommend')
  recommendBox,
}