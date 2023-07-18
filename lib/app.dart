// ignore_for_file: constant_identifier_names

import 'package:app_store_layout_ideas/app_grid.dart';
import 'package:app_store_layout_ideas/search_field.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      builder: (context, yaru, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: yaru.theme,
          darkTheme: yaru.darkTheme
              ?.copyWith(scaffoldBackgroundColor: const Color(0xFF2b2b2b)),
          home: const Home(),
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _searchActive = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: YaruWindowTitleBar(
          backgroundColor: Colors.transparent,
          actions: [
            SizedBox(
              height: 35,
              width: 35,
              child: YaruIconButton(
                icon: const Icon(
                  YaruIcons.user_filled,
                  size: 16,
                ),
                onPressed: () => setState(() {}),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
          title: SizedBox(
            width: 300,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                if (_searchActive)
                  const Center(
                    child: SizedBox(height: 35, child: SearchField()),
                  )
                else
                  const Padding(
                    padding: EdgeInsets.only(left: 60, right: 30),
                    child: TabBar(
                      tabs: [
                        Tab(
                          text: 'Explore',
                        ),
                        Tab(
                          text: 'Manage',
                        )
                      ],
                    ),
                  ),
                SizedBox(
                  height: 35,
                  width: 35,
                  child: YaruIconButton(
                    isSelected: _searchActive,
                    selectedIcon: Icon(
                      YaruIcons.search,
                      size: 16,
                      color: theme.colorScheme.onSurface,
                    ),
                    icon: Icon(
                      YaruIcons.search,
                      size: 16,
                      color: theme.colorScheme.onSurface,
                    ),
                    onPressed: () =>
                        setState(() => _searchActive = !_searchActive),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const Banner(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, bottom: 10, top: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Super cool apps',
                          style: theme.textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w100),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'See more...',
                          ),
                        )
                      ],
                    ),
                  ),
                  const AppGrid(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, bottom: 10, top: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Woopa Doopa!',
                          style: theme.textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w100),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'See more...',
                          ),
                        )
                      ],
                    ),
                  ),
                  const AppGrid(
                    skip: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, bottom: 10, top: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Brrrrrrrrrzt',
                          style: theme.textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w100),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'See more...',
                          ),
                        )
                      ],
                    ),
                  ),
                  const AppGrid(
                    skip: 40,
                  ),
                ],
              ),
            ),
            const Center(
              child: Text('Manage'),
            ),
          ],
        ),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final title = Text(
      'Mega Apps',
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        shadows: [
          Shadow(
            offset: const Offset(0, 1),
            blurRadius: 1.0,
            color: Colors.black.withOpacity(
              0.4,
            ), //color of shadow with opacity
          )
        ],
      ),
    );

    final subSlogan = Text(
      'Wow mega cool',
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w100,
        shadows: [
          Shadow(
            offset: const Offset(0, 1),
            blurRadius: 1.0,
            color: Colors.black.withOpacity(
              0.4,
            ), //color of shadow with opacity
          )
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 15,
      ),
      child: Container(
        padding: const EdgeInsets.all(30),
        height: 220,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Colors.pink,
              Colors.purple,
            ],
          ),
        ),
        child: SizedBox(
          width: 800,
          child: Wrap(
            runSpacing: kYaruPagePadding,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title,
                  subSlogan,
                ],
              ),
              Wrap(
                spacing: 10,
                children: [
                  for (int i = 200; i < 203; i++)
                    _PlatedIcon(
                      url: 'https://picsum.photos/50/50?image=$i',
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlatedIcon extends StatefulWidget {
  const _PlatedIcon({
    // ignore: unused_element
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<_PlatedIcon> createState() => _PlatedIconState();
}

class _PlatedIconState extends State<_PlatedIcon> {
  bool hovered = false;
  final dur = const Duration(milliseconds: 100);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BasePlate(
        hovered: hovered,
        child: Image.network(
          widget.url,
        ),
      ),
    );
  }
}

class BasePlate extends StatelessWidget {
  const BasePlate({
    super.key,
    required this.child,
    required this.hovered,
    this.radius = 10.0,
    this.blurRadius = 5,
    this.spreadRadius = 3,
    this.useBorder = false,
    this.useShadow = true,
    this.childPadding = 10.0,
  });

  final Widget child;
  final bool hovered;
  final double radius;
  final double spreadRadius;
  final double blurRadius;
  final bool useBorder;
  final bool useShadow;
  final double childPadding;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        border: useBorder
            ? Border.all(width: 1, color: Theme.of(context).dividerColor)
            : null,
        boxShadow: useShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(hovered ? 0.4 : 0.15),
                  spreadRadius: spreadRadius,
                  blurRadius: blurRadius,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.all(childPadding),
        child: child,
      ),
    );
  }
}
