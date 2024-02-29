import 'package:flutter/material.dart';
import 'package:layout_based_dual_screen/common/presentation/widgets/custom_buttom_bar.dart';
import 'package:layout_based_dual_screen/home/presentation/pages/home_page.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getCurrentPage(_selectedIndex),
      bottomNavigationBar: CustomBottomBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  Widget _getCurrentPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const HomePage();
      case 2:
        return const HomePage();
      default:
        return const HomePage();
    }
  }
}