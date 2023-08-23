import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_day3/screens/tabs/home_tab.dart';
import 'package:task_day3/screens/tabs/offers_tab.dart';
import 'package:task_day3/screens/tabs/orders_tab.dart';
import 'package:task_day3/screens/tabs/profile_tab.dart';

final bottomBarIndexProvider = StateProvider<int>((_) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> pages = const [
      HomeTab(),
      OrdersTab(),
      ProfileTab(),
      OffersTab(),
      ProfileTab(),
    ];
    return Scaffold(
      backgroundColor: const Color(0XFFEEEEEE),
      body: SafeArea(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              pages[ref.watch(bottomBarIndexProvider)],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0XFFEEEEEE),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          color: Color(0xFFFF5A00),
        ),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        currentIndex: ref.watch(bottomBarIndexProvider),
        onTap: (int index) {
          ref.read(bottomBarIndexProvider.notifier).update((state) => index);
        },
        items: items
            .map(
              (Tab tab) => BottomNavigationBarItem(
                icon: tab.icon,
                activeIcon: tab.activeIcon,
                backgroundColor: tab.backgroundColor,
                label: tab.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class Tab {
  final Color? backgroundColor;
  final Widget icon;
  final String? label;
  final Widget? activeIcon;
  Tab({
    required this.icon,
    this.label,
    this.backgroundColor,
    this.activeIcon,
  });
}

List<Tab> items = [
  Tab(
    icon: const Icon(
      Icons.home_outlined,
      color: Colors.grey,
    ),
    label: "Home",
    activeIcon: const Icon(
      Icons.home,
      color: Color(0xFFFF5A00),
    ),
  ),
  Tab(
    icon: const Icon(
      Icons.chat_outlined,
      color: Colors.grey,
    ),
    label: "Chat",
    activeIcon: const Icon(
      Icons.chat,
      color: Color(0xFFFF5A00),
    ),
  ),
  Tab(
    icon: const Icon(
      Icons.calendar_month_outlined,
      color: Colors.grey,
    ),
    label: "Calendar",
    activeIcon: const Icon(
      Icons.calendar_month,
      color: Color(0xFFFF5A00),
    ),
  ),
  Tab(
    icon: const Icon(
      Icons.notifications_none,
      color: Colors.grey,
    ),
    label: "Notification",
    activeIcon: const Icon(
      Icons.notifications,
      color: Color(0xFFFF5A00),
    ),
  ),
  Tab(
    icon: const Icon(
      Icons.notifications_none,
      color: Colors.grey,
    ),
    label: "Notification",
    activeIcon: const Icon(
      Icons.notifications,
      color: Color(0xFFFF5A00),
    ),
  ),
];
