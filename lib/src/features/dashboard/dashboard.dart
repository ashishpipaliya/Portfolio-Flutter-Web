import 'package:flutter/material.dart';
import 'package:portfolio/src/features/about/about_screen.dart';
import 'package:portfolio/src/features/dashboard/favourite_packages_part.dart';
import 'package:portfolio/src/features/dashboard/projects_part.dart';
import 'package:portfolio/src/widgets/not_responsive.dart';
import 'package:portfolio/src/widgets/vertical_tabs.dart';
import 'package:portfolio/src/widgets/cover_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _pageIndex = 0;

  final List<String> titles = ['About', 'Projects'];

  final List icons = [
    Icons.info_outline,
    Icons.work_outline_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ScreenTypeLayout(
        mobile: NotResponsiveWidget(),
        tablet: NotResponsiveWidget(),
        desktop: Row(
          children: [
            Expanded(
              child: VerticalTabsDesktop(
                tabBackgroundColor: Colors.white,
                backgroundColor: Colors.white,
                tabsElevation: 0.5,
                tabsShadowColor: Colors.grey[500],
                tabsWidth: 180,
                indicatorColor: Colors.black,
                selectedTabBackgroundColor: Colors.black.withOpacity(0.1),
                indicatorWidth: 5,
                disabledChangePageFromContentView: true,
                initialIndex: _pageIndex,
                changePageDuration: const Duration(microseconds: 1),
                contents: [
                  const CoverWidget(widget: AboutScreen()),
                  const CoverWidget(widget: ProjectsPart()),
                ],
                tabs: [
                  tab(titles[0], icons[0]),
                  tab(titles[1], icons[1]),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey[300]!,
                      blurRadius: 10,
                      offset: Offset(3, 3))
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.20,
              child: FavouritePackagesPart(),
            )
          ],
        ),
      ),
    ));
  }

  Tab tab(title, icon) {
    return Tab(
        child: Container(
      padding: const EdgeInsets.only(left: 10),
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            size: 20,
            color: Colors.grey[800],
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey[900],
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    ));
  }
}
