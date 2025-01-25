import 'package:flutter/material.dart';

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return const ClampingScrollPhysics();
      case TargetPlatform.android:
        return const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        );
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
        return const ClampingScrollPhysics();
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
