import 'package:flutter/material.dart';
import 'package:heimdalladmin/Theme/MyTheme.dart';
import 'package:heimdalladmin/UI/Home/Feedbacks/FeedbacksView.dart';
import 'package:heimdalladmin/UI/Home/HomeTab/HomeTabView.dart';
import 'package:heimdalladmin/UI/Home/Reports/ReportsView.dart';
import 'package:side_navigation/side_navigation.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  List<Widget> tabs = const [HomeTabView() , FeedbacksView() , ReportsView()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            SideNavigationBar(
              selectedIndex: selectedIndex,
              items: const [
                SideNavigationBarItem(
                  icon: Icons.home,
                  label: 'Home',
                ),
                SideNavigationBarItem(
                  icon: Icons.star_rounded,
                  label: 'Feedback',
                ),
                SideNavigationBarItem(
                  icon: Icons.message,
                  label: 'Reports',
                ),
              ],
              theme: SideNavigationBarTheme(
                dividerTheme: const SideNavigationBarDividerTheme(
                  showHeaderDivider: true,
                  showMainDivider: true,
                  showFooterDivider: true,
                  mainDividerThickness: 1,
                  mainDividerColor: MyTheme.cafe
                ),

                itemTheme: SideNavigationBarItemTheme(
                  iconSize: 30,
                  labelTextStyle: Theme.of(context).textTheme.titleLarge,
                  selectedItemColor: MyTheme.cafe,
                  unselectedItemColor: Colors.grey
                ),
                togglerTheme: const SideNavigationBarTogglerTheme(
                  expandIconColor: MyTheme.cafe,
                  shrinkIconColor: MyTheme.cafe
                )
              ),
              toggler:const SideBarToggler(
                expandIcon: Icons.arrow_forward_ios,
                shrinkIcon: Icons.arrow_back_ios
              ),
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),

            /// Make it take the rest of the available width
            Expanded(
              child: tabs[selectedIndex],
            )
          ],
        ),
      ),
    );
  }
}
