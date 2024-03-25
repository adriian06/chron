import 'package:auto_route/auto_route.dart';
import 'package:chron/router/router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final router = context.innerRouterOf<TabsRouter>(HomeRoute.name);
        if (router?.activeIndex != 0) {
          router?.setActiveIndex(0);
          return false;
        }
        return true;
      },
      child: AutoTabsScaffold(
        routes: const [
          ProjectsRoute(),
          CalendarRoute(),
          SettingsRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            currentIndex: tabsRouter.activeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Projects',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}
