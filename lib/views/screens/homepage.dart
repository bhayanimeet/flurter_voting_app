import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../res/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        elevation: 20,
        centerTitle: true,
      ),
      body: Center(
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
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: StatefulBuilder(builder: (context, setState) {
                    return Column(
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Divider(
                            thickness: 1.5,
                            color: Colors.black,
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
                                  Global.bjp.toString(),
                                  style: GoogleFonts.arya(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 350,
                          child: Divider(
                            thickness: 1.5,
                            color: Colors.black,
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
                                  Global.congress.toString(),
                                  style: GoogleFonts.arya(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 350,
                          child: Divider(
                            thickness: 1.5,
                            color: Colors.black,
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
                                  Global.aap.toString(),
                                  style: GoogleFonts.arya(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 350,
                          child: Divider(
                            thickness: 1.5,
                            color: Colors.black,
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
                                  Global.other.toString(),
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
                    );
                  }),
                ),
                Container(
                  height: 270,
                  width: 1,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: (Global.isVoted == false)
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
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
                            content: Column(
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
                                      // else if (Global.isBjp == false) {
                                      //   Global.bjp--;
                                      // }
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
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
                                      // else if (Global.isCongress == false) {
                                      //   Global.congress--;
                                      // }
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
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
                                      // else if (Global.isAap == false) {
                                      //   Global.aap--;
                                      // }
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
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
                                      // else if (Global.isOther == false) {
                                      //   Global.other--;
                                      // }
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: Text(
                                    "Other",
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                    if(Global.isBjp==true || Global.isCongress == true || Global.isAap == true || Global.isOther == true){
                                      Global.isVoted = true;
                                      if(Global.isBjp==true){
                                        setState((){
                                          Global.bjp = Global.bjp + 1;
                                        });
                                      }
                                      Navigator.pop(context);
                                    }
                                     else {
                                      Get.showSnackbar(
                                        GetSnackBar(
                                          title: 'Error',
                                          backgroundColor: Colors.teal.shade300,
                                          snackPosition: SnackPosition.BOTTOM,
                                          borderRadius: 20,
                                          duration: const Duration(seconds: 2),
                                          margin: const EdgeInsets.all(15),
                                          message:
                                          "Please select any politician party to vote...",
                                          snackStyle: SnackStyle.FLOATING,
                                        ),
                                      );
                                    }
                                },
                                child: const Text("Confirm"),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  if (Global.isBjp == false ||
                                      Global.isCongress == false ||
                                      Global.isAap == false ||
                                      Global.isOther == false) {
                                    Global.isVoted = false;
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text("Cancel"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                });
              },
              child: const Icon(Icons.add, color: Colors.white, size: 25),
            )
          : Container(),
    );
  }
}
