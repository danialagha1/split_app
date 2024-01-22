import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.onClearFilter, required this.titleName}) : super(key: key);

  final VoidCallback onClearFilter;
  final String titleName;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title:  Text(titleName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black)),
      actions: [
        IconButton(
          onPressed: onClearFilter,
          icon: const Icon(Icons.lock_reset, size: 30.0),
        ),
      ],
    );
  }
}
