import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Model/carmodel.dart';
import 'package:untitled/Screens/hoverbutton.dart';
import 'package:untitled/Widgets/app_color.dart';
import 'package:untitled/Widgets/car_data_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isselcted = false;
  bool notselect = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController date = TextEditingController();

    DateTime selectedDate = DateTime.now();
    Size size = MediaQuery.of(context).size;
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  SizedBox(
                    width: size.width,
                    child: Image.asset(
                      "Images/map.png",
                    ),
                  ),
                  Positioned(
                      top: 16.0,
                      left: 1.0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      )),
                ]),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: AppColor.green1,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: size.width * 0.8,
                        child: TextFormField(
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500, color: Colors.black),
                          decoration: const InputDecoration(
                              labelText: "Source Loction",
                              fillColor: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: AppColor.red1,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: size.width * 0.8,
                        child: TextFormField(
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500, color: Colors.black),
                          decoration: const InputDecoration(
                            labelText: "Destination Loction",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                const Divider(
                  thickness: 1,
                  color: AppColor.greyDark1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        "Top Suggestion For You",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        top: 6,
                      ),
                      width: size.width * 0.54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "   Pickup Date Time",
                            style: GoogleFonts.inter(
                                fontSize: 12, fontWeight: FontWeight.w800),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            height: size.height * 0.05,
                            child: TextField(
                              controller: date,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.calendar_month_rounded),
                                  labelText: "$selectedDate",
                                  labelStyle: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onTap: () async {
                                DateTime? datePicked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                if (datePicked != null &&
                                    datePicked != selectedDate) {
                                  setState(() {
                                    selectedDate = datePicked;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 15),
                      margin:
                          const EdgeInsets.only(top: 4, bottom: 7, right: 5),
                      height: size.height * 0.27,
                      child: FutureBuilder(
                        future: Cardataservice().carlist(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<CarModel> carlist1 =
                                snapshot.data as List<CarModel>;
                            return ListView.builder(
                                itemCount: carlist1.length,
                                itemBuilder: (context, index) {
                                  return OnHoverButton(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 5),
                                      height: size.height * 0.14,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: size.height * 0.08,
                                            width: size.width * 0.22,
                                            margin: const EdgeInsets.only(
                                                left: 3, right: 12),
                                            child: Image(
                                              image: AssetImage(
                                                  carlist1[index].image),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: size.height * 0.06,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: size.width * 0.24,
                                                    child: Text(
                                                      carlist1[index]
                                                          .type
                                                          .toString(),
                                                      style: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: size.height *
                                                            0.005),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.028,
                                                    width: size.width * 0.2,
                                                    child: Text(
                                                      carlist1[index]
                                                          .name
                                                          .toString(),
                                                      style: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.05,
                                            width: size.width * 0.19,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        size.height * 0.02),
                                                child: Text(
                                                  "\$${carlist1[index].price}",
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20,
                                                      color: AppColor.green1),
                                                ),
                                              ),
                                              const Icon(
                                                Icons.info_outlined,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1, vertical: 0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: FilterChip(
                          label: const Text("Book for Myself"),
                          selected: isselcted,
                          onSelected: (bool value) {
                            setState(() {
                              isselcted = !isselcted;
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: FilterChip(
                          label: const Text("Book for Others"),
                          selected: notselect,
                          onSelected: (bool value) {
                            setState(() {
                              notselect = !notselect;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {},
                      child: Text(
                        "Book",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
