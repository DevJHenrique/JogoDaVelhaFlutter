import 'dart:convert';

import 'package:flutter/material.dart';

class BoardTileModel {
  int id;
  bool enable;
  Color color;
  String symbol;
  BoardTileModel({
    required this.id,
    this.enable = true,
    this.color = Colors.white60,
    this.symbol = '',
  });

  BoardTileModel copyWith({
    int? id,
    bool? enable,
    Color? color,
    String? symbol,
  }) {
    return BoardTileModel(
      id: id ?? this.id,
      enable: enable ?? this.enable,
      color: color ?? this.color,
      symbol: symbol ?? this.symbol,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'enable': enable,
      'color': color.value,
      'symbol': symbol,
    };
  }

  factory BoardTileModel.fromMap(Map<String, dynamic> map) {
    return BoardTileModel(
      id: map['id'],
      enable: map['enable'],
      color: Color(map['color']),
      symbol: map['symbol'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoardTileModel.fromJson(String source) =>
      BoardTileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoardTileModel(id: $id, enable: $enable, color: $color, symbol: $symbol)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoardTileModel &&
        other.id == id &&
        other.enable == enable &&
        other.color == color &&
        other.symbol == symbol;
  }

  @override
  int get hashCode {
    return id.hashCode ^ enable.hashCode ^ color.hashCode ^ symbol.hashCode;
  }
}
