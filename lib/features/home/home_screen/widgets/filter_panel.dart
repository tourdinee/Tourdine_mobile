import 'package:flutter/material.dart';

class FilterPanel extends StatefulWidget {
  const FilterPanel({super.key});

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      right: 20,
      left: 20,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        height: 200,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          constraints: BoxConstraints(
            maxHeight: 200,
            maxWidth: MediaQuery.of(context).size.width - 40,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
