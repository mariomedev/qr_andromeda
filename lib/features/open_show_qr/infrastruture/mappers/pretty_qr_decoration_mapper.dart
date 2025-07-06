import 'dart:ui';
import 'dart:convert';

import 'package:flutter/painting.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class PrettyQrDecorationMapper {
  static Map<String, dynamic> toJson(PrettyQrDecoration decoration) {
    final shape = decoration.shape;
    final shapeType = shape.runtimeType.toString();

    int? colorValue;
    if (shape is PrettyQrSmoothSymbol) {
      colorValue = shape.color.toARGB32();
    } else if (shape is PrettyQrRoundedSymbol) {
      colorValue = shape.color.toARGB32();
    }

    return {
      'background': decoration.background?.toARGB32(),
      'quietZone': decoration.quietZone?.value,
      'shape': {
        'type': shapeType,
        'color': colorValue,
        'roundFactor': shape is PrettyQrSmoothSymbol
            ? (shape).roundFactor
            : null, // Only for PrettyQrSmoothSymbol
      },
    };
  }

  static PrettyQrDecoration fromJson(Map<String, dynamic> json) {
    final shapeData = json['shape'] as Map<String, dynamic>?;
    final shapeType = shapeData?['type'] ?? 'PrettyQrSmoothSymbol';
    final shapeColor = Color(shapeData?['color'] ?? 0xFF000000);
    final roundFactor = shapeData?['roundFactor'] ?? 0.0;
    final isRoundedBorders = shapeData?['roundFactor'] == 0 ? false : true;
    final shape = switch (shapeType) {
      'PrettyQrSmoothSymbol' => PrettyQrSmoothSymbol(
        color: shapeColor,
        roundFactor: roundFactor,
      ),
      'PrettyQrRoundedSymbol' => PrettyQrRoundedSymbol(
        color: shapeColor,
        borderRadius: BorderRadius.circular(isRoundedBorders ? 10 : 0),
      ),
      _ => const PrettyQrSmoothSymbol(),
    };

    final quietZone = json['quietZone'] == 0
        ? PrettyQrQuietZone.zero
        : PrettyQrQuietZone.standart;

    return PrettyQrDecoration(
      background: json['background'] != null ? Color(json['background']) : null,
      quietZone: quietZone,
      shape: shape,
    );
  }

  static String encode(PrettyQrDecoration decoration) {
    return jsonEncode(toJson(decoration));
  }

  static PrettyQrDecoration decode(String source) {
    return fromJson(jsonDecode(source));
  }
}
