import 'package:flutter_select/src/config/import.dart';

/// A custom loading indicator that mimics the style of popular select components.
class LoadingVibeIndicator extends StatefulWidget {
  final double dotSize;
  final Color dotColor;
  const LoadingVibeIndicator({super.key, required this.dotSize, required this.dotColor});

  @override
  State<LoadingVibeIndicator> createState() => _LoadingVibeIndicatorState();
}

class _LoadingVibeIndicatorState extends State<LoadingVibeIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 1400), vsync: this)..repeat();
    _animations = List.generate(3, (index) {
      return TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.2, end: 1.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.2), weight: 1),
      ]).animate(CurvedAnimation(parent: _controller, curve: Interval(index * 0.2, (index * 0.2) + 0.6, curve: Curves.easeInOut)));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        width: widget.dotSize,
        height: widget.dotSize,
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        decoration: BoxDecoration(color: widget.dotColor, shape: BoxShape.circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Row(mainAxisSize: MainAxisSize.min, children: _animations.map(_buildDot).toList());
}
