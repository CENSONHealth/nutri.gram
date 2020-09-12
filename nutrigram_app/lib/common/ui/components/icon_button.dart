import 'package:flutter/material.dart';
import 'package:nutrigram_app/common/ui/ui_helpers.dart';

class CustomIconButton extends StatelessWidget {
  final Color gradientColor;
  final Color color;
  final IconData icon;
  final bool isBig;
  final double radius;
  final double iconSize;
  final bool hasBoxShadow;
  final VoidCallback onPressed;
  const CustomIconButton({
    Key key,
    @required this.gradientColor,
    this.isBig = false,
    @required this.color,
    @required this.icon,
    @required this.onPressed,
    this.iconSize = 18,
    this.radius = 22,
    this.hasBoxShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Container(
          height: radius * 2,
          width: radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: hasBoxShadow ? getBoxShadow(context, color) : null,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                gradientColor,
                color,
              ],
              tileMode: TileMode.repeated,
            ),
            color: color,
          ),
          child: Icon(
            icon,
            size: iconSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
