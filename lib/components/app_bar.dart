import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFC1E965),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
