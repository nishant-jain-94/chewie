import 'package:chewiebingeplayer/chewiebingeplayer.dart';
import 'package:flutter/material.dart';

class AdaptiveControls extends StatelessWidget {
  AdaptiveControls({
    super.key,
    this.additionalWidgetBuilder,
  });
  Widget Function()? additionalWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return MaterialControls(
          additionalWidgetBuilder: additionalWidgetBuilder,
        );

      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return MaterialDesktopControls(
          additionalWidgetBuilder: additionalWidgetBuilder,
        );

      case TargetPlatform.iOS:
        return CupertinoControls(
          backgroundColor: Color.fromRGBO(41, 41, 41, 0.7),
          iconColor: Color.fromARGB(255, 200, 200, 200),
          additionalWidgetBuilder: additionalWidgetBuilder,
        );
      default:
        return MaterialControls(
          additionalWidgetBuilder: additionalWidgetBuilder,
        );
    }
  }
}
