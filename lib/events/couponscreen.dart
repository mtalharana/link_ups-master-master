import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:link_up/events/TicketType.dart';
import 'package:link_up/events/getcontroller.dart';

class CouponScreen extends StatefulWidget {
  String? id;
  CouponScreen({Key? key, this.id}) : super(key: key);

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  String? code;
  String? discount;

  TextEditingController codeController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  EventController entcontroller = Get.put(EventController());
  String? discountcode;
  @override
  void initState() {
    super.initState();
    discountcode = entcontroller.codecONTROLLER.value.text.toString();
    print(widget.id);
    // Get a reference to the collection
    var _collection = FirebaseFirestore.instance
        .collection('coupons')
        .where("ticket_id", isEqualTo: widget.id);
    // Get the data from the collection
    _collection.get().then((snapshot) {
      snapshot.docs.forEach((doc) {
        entcontroller.adddiscountcode(doc.get("code"));
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    codeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Group 163959 (2).jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Available Coupon",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        // Text(id.toString())
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: _firestore
                                .collection("coupons")
                                .where("ticket_id", isEqualTo: widget.id)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      final data = snapshot.data!.docs[index];
                                      entcontroller.code!.value =
                                          data.get("code");
                                      entcontroller.discount!.value =
                                          data.get("discount");
                                      return Center(
                                        child: Row(
                                          children: [
                                            Text(
                                              entcontroller.code!.value
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: "OpenSans",
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            ),
                                            Text(
                                              entcontroller.discount!.value
                                                  .toString(),
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                color: Colors.transparent,
                                                fontSize: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/Rectangle.png",
                    height: 30,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Get 10% OFF up to \$100",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "In case the cashback is not credited within stipulatedtimeline, please contact 0120-4456-456",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black38,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      // Image.asset(
                      //   "assets/VIP.png",
                      //   height: 40,
                      // ),
                      Container(
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(7)),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: entcontroller.codecONTROLLER.value,
                          onChanged: (value) {
                            setState(() {
                              value = entcontroller.codecONTROLLER.value.text;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),

                      InkWell(
                        onTap: () {
                          entcontroller.selecteddiscountcode.value =
                              entcontroller.codecONTROLLER.value.text;
                          Get.back();
                        },
                        child: entcontroller.getbutton(),
                      ),
                    ],
                  ),
                  // Text(codeController.text),
                  SizedBox(
                    height: 35,
                  ),
                  Image.asset(
                    "assets/Rectangle (1).png",
                    height: 30,
                  ),
                  Text(
                    "Cashback using CityBank",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "applicable with Paytm wallet.Paytm cashback will becredited in your wallet within 24 hours of ordercompletion In casse the cashback is no...",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black38,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/VIP (1).png",
                        height: 40,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        "assets/Economy.png",
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
