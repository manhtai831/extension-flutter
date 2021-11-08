import 'dart:async';

extension DurationExt on Duration {
  Future delay([FutureOr callback()?]) async => Future.delayed(this, callback);
}
