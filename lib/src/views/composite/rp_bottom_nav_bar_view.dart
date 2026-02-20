import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPBottomNavBarView extends StatefulWidget {
  const RPBottomNavBarView({super.key, required this.bottomNavBar});

  final RPBottomNavBar bottomNavBar;

  @override
  State<RPBottomNavBarView> createState() => _RPBottomNavBarViewState();
}

class _RPBottomNavBarViewState extends State<RPBottomNavBarView> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.bottomNavBar.hasSelectedIndex() ? widget.bottomNavBar.selectedIndex : 0;
  }

  @override
  Widget build(BuildContext context) {
    final selectedColor = widget.bottomNavBar.hasSelectedColor()
        ? widget.bottomNavBar.selectedColor.toFlutterColor()
        : Theme.of(context).colorScheme.primary;
    final unselectedColor = widget.bottomNavBar.hasUnselectedColor()
        ? widget.bottomNavBar.unselectedColor.toFlutterColor()
        : Colors.grey;
    final bgColor = widget.bottomNavBar.hasBackgroundColor()
        ? widget.bottomNavBar.backgroundColor.toFlutterColor()
        : null;

    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: selectedColor,
      unselectedItemColor: unselectedColor,
      backgroundColor: bgColor,
      onTap: (index) {
        setState(() => _selectedIndex = index);
        if (index < widget.bottomNavBar.items.length) {
          RPActionHandler.handle(widget.bottomNavBar.items[index].action);
        }
      },
      items: widget.bottomNavBar.items.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(iconFromRPCodePoint(item.icon.name)),
          label: item.hasLabel() ? item.label : '',
        );
      }).toList(),
    );
  }
}
