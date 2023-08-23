import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Screens/dashboard.dart';
import 'package:untitled/Screens/homepage.dart';

void main() {
  runApp(MyTask());
}

class MyTask extends StatelessWidget {
  const MyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {"/dashboard": (_) => Dashboard()},
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
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
            title: Text("CABTO",
                style: GoogleFonts.alumniSans(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: 26,
                )),
          ),
          body: Homepage(),
        ));
  }
}
