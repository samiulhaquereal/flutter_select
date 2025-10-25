import 'package:flutter_select/src/config/import.dart';

/// A utility class to delay function execution. Useful for search fields
/// to prevent firing API calls on every keystroke.
class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  /// Runs the [action] after the specified [milliseconds] have passed.
  /// Cancels any previously scheduled actions.
  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  /// Cancels the timer.
  void dispose() {
    _timer?.cancel();
  }
}
