import 'package:flutter/material.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/model/structs.dart';

class DescribedThingWidget extends StatelessWidget {
  final DescribedThing description;

  const DescribedThingWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Text(
            description.title ?? "",
            style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 30),
        SizedBox(
          width: 175,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: description.descriptions.length,
            itemBuilder: (context, index) {
              final thing = description.descriptions[index];
              if (thing is AdditionalInfo) {
                final info = thing as AdditionalInfo;
                return Text(info.info, style: theme.textTheme.labelLarge);
              }
              return const SizedBox();
            },
          ),
        )
      ],
    );
  }
}
