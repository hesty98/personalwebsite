import 'package:flutter/material.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/model/structs.dart';

enum BulletContainer { container, surface }

class BulletPointList extends StatelessWidget {
  final List<BulletPoint> bulletPoints;

  final BulletContainer container;

  const BulletPointList({super.key, required this.bulletPoints, required this.container});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: bulletPoints.length,
      itemBuilder: (context, index) {
        final bulletPoint = bulletPoints[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Icon(Icons.circle, color: container == BulletContainer.container ? Colors.black : theme.colorScheme.onSurface, size: 8),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  bulletPoint.value,
                  style: container == BulletContainer.container
                      ? theme.textTheme.labelMedium?.copyWith(
                          color: container == BulletContainer.container ? Colors.black : theme.colorScheme.onSurface,
                        )
                      : theme.textTheme.bodyMedium?.copyWith(
                          color: container == BulletContainer.container ? Colors.black : theme.colorScheme.onSurface,
                        ),
                  maxLines: 5,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
