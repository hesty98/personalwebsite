import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/model/structs.dart';
import 'package:privatewebsite/pages/career/backend/model/structs.dart';
import 'package:privatewebsite/pages/career/backend/port.dart';
import 'package:privatewebsite/shared/ui/base/page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class KnowledgeWidget extends HookWidget {
  final SizingInformation sizingInformation;
  final ResponsiveState state;

  const KnowledgeWidget(this.sizingInformation, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(top: 80, left: state == ResponsiveState.Large ? 100 : 0, right: state == ResponsiveState.Large ? 100 : 0),
      child: FutureBuilder<List<KnowledgeGroup>>(
        future: PrimPortImpl().getAllKnowledge(),
        builder: (context, snapshot) {
          if (snapshot.data == null) return const CircularProgressIndicator();
          final knowledge = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: knowledge.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(localizations.knowledge),
                );
              }
              return KnowlegdeItem(knowledge[index - 1]);
            },
          );
        },
      ),
    );
  }
}

class KnowlegdeItem extends HookWidget {
  final KnowledgeGroup knowledge;

  const KnowlegdeItem(this.knowledge, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getChildren(theme),
      ),
    );
  }

  List<Widget> getChildren(ThemeData theme) {
    final result = List<Widget>.empty(growable: true);
    result.add(Text(
      knowledge.title,
      style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onSurface, fontWeight: FontWeight.bold),
    ));

    for (var elem in knowledge.knowledge) {
      result.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              elem.name,
              style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onSurface),
              overflow: TextOverflow.ellipsis,
            ),
            RatingWidget(elem.rating),
          ],
        ),
      ));
    }

    return result;
  }
}

class RatingWidget extends HookWidget {
  final Rating rating;

  const RatingWidget(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        final size = sizingInformation.screenSize;

        double width = 200;
        late ResponsiveState state;
        if (size.width < ResponsivePage.maxWidthSmall) {
          state = ResponsiveState.Small;
          width = 200;
        }
        if (size.width >= ResponsivePage.maxWidthSmall && size.width < ResponsivePage.maxWidthMedium) {
          state = ResponsiveState.Medium;
          width = 225;
        }
        if (size.width >= ResponsivePage.maxWidthMedium) {
          state = ResponsiveState.Large;
          width = 250;
        }

        return Stack(
          children: [
            Container(
              height: 20,
              width: width,
              decoration: ShapeDecoration(
                color: const Color.fromRGBO(217, 217, 217, 1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 100),
              child: Container(
                height: 20,
                width: rating.value * (width / rating.max),
                decoration: ShapeDecoration(
                  color: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "${rating.value} / ${rating.max}",
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
