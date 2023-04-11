import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../helper/firebase_db_helper.dart';
import '../../res/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> allDocs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Voting App",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                Get.changeThemeMode(
                    (Get.isDarkMode == true) ? ThemeMode.light : ThemeMode.dark);
              });
            },
            child: const Icon(
              Icons.light_mode_outlined,
            ),
          ),
        ],
        elevation: 20,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FireStoreDbHelper.db.collection('vote').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>> data =
                snapshot.data as QuerySnapshot<Map<String, dynamic>>;
            allDocs = data.docs;
            return StatefulBuilder(
              builder: (context,setState) {
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      Text(
                        "Voting Live Data",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                              height: 270,
                              width: 350,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Political Party",
                                              style: GoogleFonts.notoSans(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Votes",
                                              style: GoogleFonts.notoSans(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 350,
                                    child: Divider(
                                      thickness: 1.5,
                                      color: (Get.isDarkMode == true)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "BJP",
                                            style: GoogleFonts.arya(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${allDocs[0].data()['bjp']}",
                                            style: GoogleFonts.arya(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 350,
                                    child: Divider(
                                      thickness: 1.5,
                                      color: (Get.isDarkMode == true)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Congress",
                                            style: GoogleFonts.arya(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${allDocs[0].data()['congress']}",
                                            style: GoogleFonts.arya(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 350,
                                    child: Divider(
                                      thickness: 1.5,
                                      color: (Get.isDarkMode == true)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "AAP",
                                            style: GoogleFonts.arya(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${allDocs[0].data()['aap']}",
                                            style: GoogleFonts.arya(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 350,
                                    child: Divider(
                                      thickness: 1.5,
                                      color: (Get.isDarkMode == true)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Other",
                                            style: GoogleFonts.arya(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${allDocs[0].data()['other']}",
                                            style: GoogleFonts.arya(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            height: 270,
                            width: 1,
                            color: (Get.isDarkMode == true)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            );
          }
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.indigo,
              size: 40,
            ),
          );
        },
      ),
      floatingActionButton: StreamBuilder(
        stream: FireStoreDbHelper.db.collection('vote').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>> data =
                snapshot.data as QuerySnapshot<Map<String, dynamic>>;
            List<QueryDocumentSnapshot<Map<String, dynamic>>> allData =
                data.docs;
            return (allData[0].data()['isVoted'] == false)
                ? FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Center(
                                child: Text(
                                  "Choose your party",
                                  style: GoogleFonts.arya(
                                    fontSize: 23,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              content:
                                  StatefulBuilder(builder: (context, setState) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CheckboxListTile(
                                      value: Global.isBjp,
                                      onChanged: (val) {
                                        setState(() {
                                          Global.isBjp = val!;
                                          if (Global.isBjp == true) {
                                            Global.isCongress = false;
                                            Global.isAap = false;
                                            Global.isOther = false;
                                          }
                                        });
                                      },
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(
                                        "BJP",
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    CheckboxListTile(
                                      value: Global.isCongress,
                                      onChanged: (val) {
                                        setState(() {
                                          Global.isCongress = val!;
                                          if (Global.isCongress == true) {
                                            Global.isBjp = false;
                                            Global.isAap = false;
                                            Global.isOther = false;
                                          }
                                        });
                                      },
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(
                                        "Congress",
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    CheckboxListTile(
                                      value: Global.isAap,
                                      onChanged: (val) {
                                        setState(() {
                                          Global.isAap = val!;
                                          if (Global.isAap == true) {
                                            Global.isCongress = false;
                                            Global.isBjp = false;
                                            Global.isOther = false;
                                          }
                                        });
                                      },
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(
                                        "AAP",
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    CheckboxListTile(
                                      value: Global.isOther,
                                      onChanged: (val) {
                                        setState(() {
                                          Global.isOther = val!;
                                          if (Global.isOther == true) {
                                            Global.isCongress = false;
                                            Global.isAap = false;
                                            Global.isBjp = false;
                                          }
                                        });
                                      },
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(
                                        "Other",
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              actions: [
                                StatefulBuilder(builder: (context, set) {
                                  return ElevatedButton(
                                    onPressed: () async {
                                      if (Global.isBjp == true ||
                                          Global.isCongress == true ||
                                          Global.isAap == true ||
                                          Global.isOther == true) {
                                        if (Global.isBjp == true) {
                                          setState(() {
                                            Global.isVoted = true;
                                            Global.bjp += 1;
                                          });
                                          await FireStoreDbHelper.db
                                              .collection('vote')
                                              .doc(allDocs[0].id)
                                              .update({
                                            'bjp': ++Global.bjp,
                                            'isVoted': Global.isVoted
                                          });
                                        } else if (Global.isCongress == true) {
                                          setState(() {
                                            Global.isVoted = true;
                                            Global.congress += 1;
                                          });
                                          await FireStoreDbHelper.db
                                              .collection('vote')
                                              .doc(allDocs[0].id)
                                              .update({
                                            'congress': ++Global.congress,
                                            'isVoted': Global.isVoted
                                          });
                                        } else if (Global.isAap == true) {
                                          setState(() {
                                            Global.isVoted = true;
                                            Global.aap += 1;
                                          });
                                          await FireStoreDbHelper.db
                                              .collection('vote')
                                              .doc(allDocs[0].id)
                                              .update({
                                            'aap': ++Global.aap,
                                            'isVoted': Global.isVoted
                                          });
                                        } else if (Global.isOther == true) {
                                          setState(() {
                                            Global.isVoted = true;
                                            Global.other += 1;
                                          });
                                          await FireStoreDbHelper.db
                                              .collection('vote')
                                              .doc(allDocs[0].id)
                                              .update({
                                            'other': ++Global.other,
                                            'isVoted': Global.isVoted
                                          });
                                        }
                                        Navigator.pop(context);
                                      } else {
                                        Get.showSnackbar(
                                          GetSnackBar(
                                            title: 'Error',
                                            backgroundColor:
                                                Colors.teal.shade300,
                                            snackPosition: SnackPosition.BOTTOM,
                                            borderRadius: 20,
                                            duration:
                                                const Duration(seconds: 2),
                                            margin: const EdgeInsets.all(15),
                                            message:
                                                "Please select any politician party to vote...",
                                            snackStyle: SnackStyle.FLOATING,
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text("Confirm"),
                                  );
                                }),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      Global.isVoted = false;
                                      Global.isBjp = false;
                                      Global.isCongress = false;
                                      Global.isAap = false;
                                      Global.isOther = false;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Text("Cancel"),
                                ),
                              ],
                            );
                          },
                        );
                      });
                    },
                    child: const Icon(Icons.add, color: Colors.white, size: 25),
                  )
                : Container();
          }
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.indigo,
              size: 40,
            ),
          );
        },
      ),
    );
  }
}
