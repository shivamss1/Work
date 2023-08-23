import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _value;
  bool isselect = true;
  bool notselected = false;
  showwidget() {
    if (_value == 1) {
      return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 30),
        width: 340,
        child: TextField(
            decoration: InputDecoration(
                filled: true,
                labelText: "Destination",
                labelStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                fillColor: Colors.grey.shade100,
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)))),
      );
    } else if (_value == 2) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Select Package",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 15),
            height: 50,
            width: 70,
            child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "8 Hr",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                        )),
                    Container(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        "80 km",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400, fontSize: 10),
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 15),
            height: 30,
            width: 340,
            child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    labelText: "Destination",
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)))),
          )
        ],
      );
    } else if (_value == 3) {
      return Column(
        children: [
          Container(
            height: 30,
            margin: const EdgeInsets.all(15),
            child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    labelText: "Destination",
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)))),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: FilterChip(
                  label: const Text("One-Way"),
                  onSelected: (bool value) {
                    setState(() {
                      isselect = !isselect;
                    });
                  },
                  selected: isselect,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: FilterChip(
                  label: const Text("Round-Trip"),
                  onSelected: (bool value) {
                    setState(() {
                      notselected = !notselected;
                    });
                  },
                  selected: notselected,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    labelText: "Return Date",
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)))),
          )
        ],
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _value = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              height: size.height * 0.45,
              width: size.width,
              child: Image.asset(
                "Images/GoogleMaps.png",
                fit: BoxFit.fill,
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset("Images/citycab.png"),
                      iconSize: 40,
                      onPressed: () {
                        setState(() {
                          _value = 1;
                        });
                      },
                    ),
                    Text(
                      "CityCab",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 55,
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _value = 2;
                        });
                      },
                      icon: Image.asset("Images/carrental.png"),
                      iconSize: 40,
                    ),
                    Text(
                      "Rental",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    )
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _value = 3;
                        });
                      },
                      icon: Image.asset("Images/travel.png"),
                      iconSize: 40,
                    ),
                    Text(
                      "OutStation",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Container(
            height: size.height * 0.22,
            padding: EdgeInsets.only(top: size.height * 0.009),
            child: Card(
              surfaceTintColor: Colors.black,
              elevation: 25,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: SizedBox(
                height: size.height * 0.18,
                width: size.width * 0.9,
                child: Container(
                  child: showwidget(),
                ),
              ),
            ),
          ),
          Container(
            width: size.width * 0.8,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.of(context).pushNamed("/dashboard");
                },
                child: Text(
                  "Next",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
