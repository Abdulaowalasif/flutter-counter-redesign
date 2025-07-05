import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int selectedIndex = 0;

  final List<IconData> icons = [
    Icons.apartment,
    Icons.speaker,
    Icons.analytics,
    Icons.star,
    Icons.shopping_cart,
    Icons.biotech,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(icons.length, (index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: isSelected
                    ? Border.all(color: Colors.white, width: 2)
                    : null,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icons[index],
                color: Colors.white,
                size: 36,
              ),
            ),
          );
        }),
      ),
    );
  }
}
