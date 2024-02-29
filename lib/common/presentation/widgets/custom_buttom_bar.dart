import 'package:flutter/material.dart';
import 'package:layout_based_dual_screen/common/domain/entities/bottom_menu_model.dart';

class CustomBottomBar extends StatefulWidget {
  final ValueChanged<int> onItemTapped;
  final int selectedIndex;

  const CustomBottomBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: const Icon(Icons.assignment),
      activeIcon: const Icon(Icons.assignment),
      title: "Заявки",
    ),
    BottomMenuModel(
      icon: const Icon(Icons.home),
      activeIcon: const Icon(Icons.home),
      title: "Головна",
    ),
    BottomMenuModel(
      icon: const Icon(Icons.person),
      activeIcon: const Icon(Icons.person),
      title: "Особисті дані",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: bottomMenuList[index].icon,
              activeIcon: bottomMenuList[index].activeIcon,
              label: bottomMenuList[index].title,
            );
          }),
          onTap: (index) {
            widget.onItemTapped(index);
            setState(() {});
          },
        ),
      ),
    );
  }
}