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
        child: SingleChildScrollView(
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                pages[ref.watch(bottomBarIndexProvider)],
          ),
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
      Icons.list_alt_outlined,
      color: Colors.grey,
    ),
    label: "Orders",
    activeIcon: const Icon(
      Icons.list_alt,
      color: Color(0xFFFF5A00),
    ),
  ),
  Tab(
    icon: const Icon(
      Icons.confirmation_num_outlined,
      color: Colors.grey,
    ),
    label: "Vouchers",
    activeIcon: const Icon(
      Icons.confirmation_num,
      color: Color(0xFFFF5A00),
    ),
  ),
  Tab(
    icon: const Icon(
      Icons.bookmark_add_outlined,
      color: Colors.grey,
    ),
    label: "Offers",
    activeIcon: const Icon(
      Icons.bookmark_add,
      color: Color(0xFFFF5A00),
    ),
  ),
  Tab(
    icon: const Icon(
      Icons.account_circle_outlined,
      color: Colors.grey,
    ),
    label: "Profile",
    activeIcon: const Icon(
      Icons.account_circle,
      color: Color(0xFFFF5A00),
    ),
  ),
];
