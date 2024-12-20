import 'package:flutter/material.dart';

class DismissibleIndicator extends StatefulWidget {
  const DismissibleIndicator({
    super.key,
    required this.child,
  });

  final Dismissible child;

  @override
  State<StatefulWidget> createState() => _DismissibleIndicatorState();
}

class _DismissibleIndicatorState extends State<DismissibleIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-0.2, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true, count: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final main = SlideTransition(
      position: _animation,
      child: widget.child,
    );

    if (widget.child.background == null) {
      return main;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 180,
        minHeight: 0,
      ),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            widget.child.background!,
            main,
          ],
        ),
      ),
    );
  }
}
