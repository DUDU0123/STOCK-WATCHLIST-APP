import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/controllers/bloc/navigation/navigation_cubit.dart';
import 'package:stock_watchlist/views/pages/home/home_page.dart';
import 'package:stock_watchlist/views/pages/watchlist/watchlist_page.dart';
import 'package:stock_watchlist/views/widgets/common_widgets/text_widget_common.dart';

final pages = [
  const HomePage(),
  const WatchlistPage(),
];

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextWidgetCommon(
          text: context.watch<NavigationCubit>().state.currentIndex == 0
              ? "Home"
              : "Watchlist",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocConsumer<NavigationCubit, NavigationState>(
        listener: (context, state) {
          pageController.animateToPage(
            state.currentIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        },
        builder: (context, state) {
          return PageView(
            controller: pageController,
            children: pages,
            onPageChanged: (index) {
              context
                  .read<NavigationCubit>()
                  .selectCurrentIndex(currentIndex: index);
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            context
                .read<NavigationCubit>()
                .selectCurrentIndex(currentIndex: index);
            pageController.jumpToPage(index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kGreen,
          selectedIconTheme: const IconThemeData(size: 30),
          unselectedItemColor: kBlack.withOpacity(0.5),
          currentIndex: context.watch<NavigationCubit>().state.currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'Watchlist',
            ),
          ]),
    );
  }
}
