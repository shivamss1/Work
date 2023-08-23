import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.yellow,
      elevation: 0,
      leadingWidth: 44,
      leading: Builder(
        builder: (context) {
          return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ));
        },
      ),
      centerTitle: true,
      title: Text(
        "CABTO",
        style: GoogleFonts.alumniSans(
            fontWeight: FontWeight.w800, color: Colors.black),
      ),
    );
  }
}
