import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoListTiles extends StatelessWidget {
  CupertinoListTiles(
      {super.key,
      required this.title,
      this.subtitle,
      this.leading,
      this.trailing});

  Widget title;
  Widget? subtitle;
  Widget? leading;
  Icon? trailing;

  final Widget? textTitle = null;

  final Widget? textSubtitle = null;

  static const Color primaryColor = Color.fromRGBO(80, 13, 196, 1);
  static const Color secundaryColor = Color.fromRGBO(84, 79, 93, 1);

  TextStyle textStyleTitle = const TextStyle(
    color: primaryColor,
    fontWeight: FontWeight.w800,
  );

  TextStyle textStyleSubtitle = const TextStyle(
    color: secundaryColor,
    fontWeight: FontWeight.normal,
  );

  TextStyle textStyleIcon = const TextStyle(
    color: secundaryColor,
  );

  @override
  Widget build(BuildContext context) {
    Widget textTitle = Container(
      alignment: Alignment.topLeft,
      child: DefaultTextStyle(
        style: textStyleTitle,
        textAlign: TextAlign.start,
        child: title,
      ),
    );

    Widget textSubTitle = Container(
      alignment: Alignment.topLeft,
      child: DefaultTextStyle(
        style: textStyleSubtitle,
        textAlign: TextAlign.start,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        child: subtitle ?? const SizedBox(),
      ),
    );

    Widget? leadingIcon;
    if (leading != null) {
      leadingIcon = SizedBox(
        width: 30,
        child: DefaultTextStyle(style: textStyleIcon, child: leading!),
      );
    }

    Widget? trailingingIcon;
    if (trailing != null) {
      trailingingIcon = SizedBox(
        width: 30,
        child: DefaultTextStyle(
          style: textStyleIcon,
          child: trailing!,
        ),
      );
    }

    SizedBox emptyContainer = const SizedBox(width: 30, height: 20);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        child: Row(
          children: [
            leadingIcon ?? emptyContainer,
            Expanded(
              child: Column(
                children: [
                  textTitle,
                  textSubTitle,
                ],
              ),
            ),
            trailingingIcon ?? emptyContainer,
          ],
        ),
      ),
    );
  }
}
