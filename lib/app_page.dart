import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
    this.title,
    required this.url,
  });

  final Widget? title;
  final String url;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget container({Widget? child}) => Container(
          padding: const EdgeInsets.only(right: 20),
          width: 300,
          height: 300,
          color: theme.colorScheme.background,
          child: child,
        );

    final fallBack = Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Shimmer.fromColors(
        baseColor: theme.colorScheme.onSurface.withOpacity(0.05),
        highlightColor: theme.colorScheme.onSurface.withOpacity(0.1),
        child: container(),
      ),
    );

    return Scaffold(
      appBar: YaruWindowTitleBar(
        backgroundColor: Colors.transparent,
        title: title,
        leading: Navigator.of(context).canPop()
            ? const YaruBackButton()
            : const SizedBox.shrink(),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return container(
                      child: const Icon(
                        Icons.broken_image,
                        size: 300 / 3,
                      ),
                    );
                  },
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    return frame == null ? fallBack : child;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                url,
                style: const TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
