import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/widgets/bullet_point_list.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/widgets/described_thing.dart';
import 'package:privatewebsite/pages/career/backend/model/structs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventItem extends HookWidget {
  final int index;
  final double pixelPerDay;
  final LifeEvent event;
  final ValueNotifier<int?> hovered;

  const EventItem(this.index, this.pixelPerDay, this.event, this.hovered, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    return InkWell(
      onTap: () {
        hovered.value = index;
      },
      onHover: (event) async {
        if (event) {
          hovered.value = index;
        } else {
          await Future.delayed(const Duration(milliseconds: 500), () {
            if (hovered.value == index) hovered.value = null;
          });
        }
      },
      child: Container(
        width: hovered.value == index ? 300 : 50,
        height: pixelPerDay * event.timeOfWork.totalDays(),
        decoration: ShapeDecoration(
          color: theme.brightness == Brightness.dark ? Colors.white : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        child: Container(
          decoration: ShapeDecoration(
            color: colorForCategory(event.category),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          child: hovered.value != index
              ? Center(
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      event.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                  ),
                )
              : getContent(theme, localizations),
        ),
      ),
    );
  }

  Color colorForCategory(Category category) {
    Color color;
    switch (category) {
      case Category.education:
        color = Colors.indigo;
        break;
      case Category.career:
        color = Colors.pink;
        break;
      case Category.social:
        color = Colors.greenAccent;
        break;
      case Category.projects:
        color = Colors.amber;
        break;
    }
    if (hovered.value == index) {
      return color.withOpacity(0.30);
    }
    return color.withOpacity(0.30);
  }

  Widget getContent(ThemeData theme, AppLocalizations localizations) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            event.title,
            style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurfaceVariant),
          ),
          Text(
            "${DateFormat.yMMM().format(event.timeOfWork.start)} - ${event.timeOfWork.end != null ? DateFormat.yMMM().format(event.timeOfWork.end!) : localizations.today}",
            style: theme.textTheme.labelMedium?.copyWith(fontStyle: FontStyle.italic),
          ),
          if (event.publicEntity != null)
            Text(
              event.publicEntity!.entityName,
              style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          if (event.description != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                event.description!.text,
                style: theme.textTheme.labelMedium,
              ),
            ),
          BulletPointList(
            bulletPoints: event.bulletPoints,
            container: BulletContainer.container,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: event.additionalInfo.length,
            itemBuilder: (context, index) {
              final info = event.additionalInfo[index];
              return DescribedThingWidget(
                description: info,
              );
            },
          ),
        ],
      ),
    );
  }
}
