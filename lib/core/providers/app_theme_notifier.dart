import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_notifier.g.dart';

@riverpod
class AppThemeNotifier extends _$AppThemeNotifier {
  @override
  FutureOr<Palette> build() async {
    // Retrive here the current palette and return it;
    return Palette.def;
  }

  void updatePalette({required Palette palette}) {
    state = AsyncValue.data(palette);
  }
}

enum Palette {
  def(null, null),
  ;

  const Palette(this.lightSchema, this.darkSchema);
  final ColorScheme? lightSchema;
  final ColorScheme? darkSchema;

  ColorScheme? get light => lightSchema;
  ColorScheme? get dark => darkSchema;

  static Palette fromString(String? value) {
    if (value == null) return Palette.def;
    switch (value) {
      default:
        return Palette.def;
    }
  }
}
