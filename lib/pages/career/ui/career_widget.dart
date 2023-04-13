import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:privatewebsite/pages/career/backend/model/structs.dart';
import 'package:privatewebsite/pages/career/backend/port.dart';
import 'package:privatewebsite/pages/career/ui/event_item.dart';
import 'package:privatewebsite/shared/ui/base/page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CareerWidget extends HookWidget {
  final SizingInformation sizingInformation;
  final ResponsiveState state;

  const CareerWidget(this.sizingInformation, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // todo: HEader
        Row(
          children: [],
        ),
        ChartWidget()
      ],
    );
  }
}

class ChartWidget extends HookWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final hovered = useState<int?>(null);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final width = sizingInformation.localWidgetSize.width;
        final height = width / 1.8;
        return FutureBuilder<List<LifeEvent>>(
            future: PrimPortImpl().getAllEvents(),
            builder: (context, snapshot) {
              if (snapshot.data == null) return const CircularProgressIndicator();
              final events = snapshot.data!;

              final firstDate = getFirstDate(events);
              final lastDate = DateTime.now();

              final days = lastDate.difference(firstDate).inDays;
              final pixelPerDay = height / days;

              return SizedBox(
                width: width,
                height: height,
                child: Stack(
                  children: getChildren(
                    events,
                    pixelPerDay,
                    days,
                    firstDate,
                    lastDate,
                    sizingInformation,
                    hovered,
                  ),
                ),
              );
            });
      },
    );
  }

  DateTime getFirstDate(List<LifeEvent> events) {
    DateTime firstDate = events[0].timeOfWork.start;
    for (var event in events) {
      if (event.timeOfWork.start.isBefore(firstDate)) {
        firstDate = event.timeOfWork.start;
      }
    }

    return firstDate;
  }

  List<Widget> getChildren(
    List<LifeEvent> events,
    double pixelPerDay,
    int days,
    DateTime firstDate,
    DateTime lastDate,
    SizingInformation sizingInformation,
    ValueNotifier<int?> hovered,
  ) {
    final result = List<Widget>.empty(growable: true);

    result.addAll(_linesAndYears(events, pixelPerDay, days, firstDate, firstDate, sizingInformation));

    for (var event in events) {
      int index = events.indexOf(event);

      double magischerWertVonHovered = 0;
      if (hovered.value != null && index > hovered.value!) {
        magischerWertVonHovered += 250;
      }

      result.add(
        Positioned(
          left: (index * 55) + 70 + magischerWertVonHovered,
          top: pixelPerDay * event.timeOfWork.start.difference(firstDate).inDays,
          child: EventItem(index, pixelPerDay, event, hovered),
        ),
      );
    }

    return result;
  }

  List<Widget> _linesAndYears(
    List<LifeEvent> events,
    double pixelPerDay,
    int days,
    DateTime firstDate,
    DateTime lastDate,
    SizingInformation sizingInformation,
  ) {
    final result = List<Widget>.empty(growable: true);

    final daysFromStartToNextYear = DateTime(firstDate.year + 1, 1, 1).difference(firstDate).inDays;
    double dayForYearLine = daysFromStartToNextYear.toDouble();
    int year = firstDate.year + 1;
    while (dayForYearLine < days) {
      result.add(
        Positioned(
          top: pixelPerDay * dayForYearLine,
          child: Row(
            children: [
              Text("$year"),
              const SizedBox(width: 25),
              Container(
                color: Colors.grey,
                height: 1,
                width: sizingInformation.localWidgetSize.width,
              ),
            ],
          ),
        ),
      );
      year++;
      dayForYearLine += 365.25;
    }
    return result;
  }
}
