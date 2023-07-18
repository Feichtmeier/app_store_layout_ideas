import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.index,
    this.height = 120,
    this.width = 120,
    this.onTap,
    required this.title,
  });

  final int index;
  final int height;
  final int width;
  final void Function()? onTap;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget container({Widget? child}) => Container(
          width: width.toDouble() - 8,
          height: height.toDouble(),
          color: theme.colorScheme.background,
          child: child,
        );

    final fallBack = Shimmer.fromColors(
      baseColor: theme.colorScheme.onSurface.withOpacity(0.05),
      highlightColor: theme.colorScheme.onSurface.withOpacity(0.1),
      child: container(),
    );

    return YaruBanner.tile(
        padding: EdgeInsets.zero,
        onTap: onTap,
        title: title,
        subtitle: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Text'), Text('Lorem ipsum dolor sit amet.')],
        ),
        icon: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.network(
              'https://picsum.photos/$width/$height?image=$index',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return container(
                  child: Icon(
                    Icons.broken_image,
                    size: width / 3,
                  ),
                );
              },
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return frame == null ? fallBack : child;
              },
            ),
          ),
        ));
  }
}
