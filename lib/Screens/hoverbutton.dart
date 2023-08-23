import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  final Widget child;
  const OnHoverButton({super.key, required this.child});

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final hoveredTransform = Matrix4.identity()..scale(1.02);
    final transform1 = isHovered ? hoveredTransform : Matrix4.identity();
    return GestureDetector(
        onTapUp: (_) => onEntered(true),
        onTapDown: (_) => onEntered(false),
        child: AnimatedContainer(
            margin: EdgeInsets.only(right: size.width * 0.01),
            height: isHovered ? size.height * 0.13 : size.height * 0.13,
            duration: const Duration(milliseconds: 200),
            transform: transform1,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                child: widget.child)));
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
