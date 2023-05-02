import 'package:flutter/material.dart';

extension ScrollControllerExtensinon on ScrollController {
  void onSchrollEndsListender(
    final void Function() callback, {
    double offset = 0.0,
  }) {
    addListener(() {
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels;

      if (currentScroll == maxScroll) {
        callback();
      }
    });
  }
}
