import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key? key,
      required this.title,
      this.icon,
      this.titleAtStart = false,
      this.trailing,
      this.iconColor})
      : super(key: key);
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;
  final bool? titleAtStart;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      icon,
      size: 26,
      color: iconColor ?? Theme.of(context).primaryColor,
    );

    final textWidget = Text(title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: titleAtStart! ? textWidget : iconWidget,
      title: titleAtStart! ? null : textWidget,
      trailing: trailing,
    );
  }
}
