import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:privatewebsite/shared/ui/base/footer.dart';
import 'package:privatewebsite/shared/ui/base/header.dart';
import 'package:responsive_builder/responsive_builder.dart';
export 'package:privatewebsite/shared/util/font_size_maker.dart';

enum ResponsiveState { Small, Medium, Large }

abstract class ResponsivePage extends HookWidget {
  static int largePage = 1792;
  static int maxWidthMedium = 1100;
  static int maxWidthSmall = 700;

  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: Drawer(
        width: 100,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ResponsiveBuilder(builder: (BuildContext context, SizingInformation sizingInformation) {
        final size = sizingInformation.screenSize;

        late ResponsiveState state;
        if (size.width < maxWidthSmall) state = ResponsiveState.Small;
        if (size.width >= maxWidthSmall && size.width < maxWidthMedium) state = ResponsiveState.Medium;
        if (size.width >= maxWidthMedium) state = ResponsiveState.Large;

        final horizontal = paddingForState(sizingInformation, state);
        final vertical = verticalPaddingForState(sizingInformation, state);
        return CustomScrollView(
          primary: true,
          slivers: [
            SliverToBoxAdapter(child: Header()),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: horizontal, right: horizontal, top: vertical),
                child: buildBody(context, sizingInformation, state),
                // child: Text(sizingInformation.screenSize.width.toString()),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.symmetric(vertical: 100)),
            SliverToBoxAdapter(
              child: Footer(),
            )
          ],
        );
      }),
    );
  }

  Widget buildBody(BuildContext context, SizingInformation sizingInformation, ResponsiveState state);

  double paddingForState(SizingInformation sizingInformation, ResponsiveState state) {
    final size = sizingInformation.screenSize;

    switch (state) {
      case ResponsiveState.Small:
        return 25;
      case ResponsiveState.Medium:
        return size.width * 0.15;
      case ResponsiveState.Large:
        return size.width * 0.2;
    }
  }

  double verticalPaddingForState(SizingInformation sizingInformation, ResponsiveState state) {
    final size = sizingInformation.screenSize;

    switch (state) {
      case ResponsiveState.Small:
        return 10;
      case ResponsiveState.Medium:
      case ResponsiveState.Large:
        return 100;
    }
  }
}
