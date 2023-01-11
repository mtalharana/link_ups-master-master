// ignore_for_file: non_constant_identifier_names, unused_field, unused_element, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_up/events/couponscreen.dart';
import 'package:link_up/events/event9.dart';
import 'package:link_up/events/getcontroller.dart';
import 'package:link_up/events/ticketcontroller.dart';

import '../ui/DrawerScreen.dart';

class TicketType extends StatefulWidget {
  String? ticket_id;
  String? title;
  String? description;
  String? start_time;
  Timestamp? end_time;
  String? country;
  String? state;
  String? venue;
  String? uid;
  String? disclaimer;
  String? organizer;
  String? economy;
  String? vip_price;
  double? fees;

  Uint8List? image;
  String? discount;
  String? category;
  String? momo;
  String? dicountcode;
  TicketType({
    this.ticket_id,
    this.momo,
    this.category,
    this.discount,
    this.image,
    this.vip_price,
    this.fees,
    this.economy,
    this.organizer,
    this.disclaimer,
    this.title,
    this.description,
    this.end_time,
    this.start_time,
    this.country,
    this.state,
    this.venue,
    this.uid,
    this.dicountcode,
  });

  @override
  State<TicketType> createState() => _TicketTypeState();
}

class _TicketTypeState extends State<TicketType> {
  List earlybirdcheck = [];
  int earlybirdchecknew = 0;
  late final _subscription2;
  late final _subscription;
  String? pop = '';
  int? discountt = 0;
  int? vip = 0;
  int? ecnmy;
  int? butn = 0;
  int? equal = 0;
  double? equal2;
  double? fee;
  double? tax1;
  String? total;
  String? tax = "7.5";
  int? tax3 = 0;
  String? resultfes;
  double? total1 = 0.0;
  int? total2 = 0;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? button;
  String? dropdownvalue;
  String? dropdownvalue2;
  EventController entcontroller = Get.put(EventController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late var _collection;

  void getearlybrddata() {
    print('talha uid hai yeh is event ki');
    print(widget.uid);
    _subscription2 = FirebaseFirestore.instance
        .collection('events')
        .doc(widget.uid)
        .get()
        .then((value) {
      print('talha value hai yeh');
      if (value['early_bird_price_date_limit'].runtimeType == Timestamp) {
        earlybirdchecknew =
            value['early_bird_price_date_limit'].compareTo(Timestamp.now());
        print(earlybirdchecknew);
      }
    });

    //   print(data!['early_bird_price_date_limit']);

    //     Timestamp earlydate =
    //         data['early_bird_price_date_limit'] as Timestamp;

    //     // print(earlydate.compareTo(Timestamp.now()));
    //     earlybirdcheck.add(earlydate.compareTo(Timestamp.now()));
    //   } else {
    //     earlybirdcheck.add(0);
    //   }
    // });
    // print(earlybirdcheck);
  }

  getcoupondata() async {
    _collection = FirebaseFirestore.instance
        .collection('tickets')
        .where('event_id', isEqualTo: widget.uid)
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) async {
        entcontroller.ticketid!.value = element.id;
        print(entcontroller.ticketid!.value);
        if (entcontroller.ticketid!.value != null) {
          var collection = await FirebaseFirestore.instance
              .collection('coupons')
              .where('ticket_id', isEqualTo: entcontroller.ticketid!.value)
              .get();
          collection.docs.forEach((element) {
            print(element.data());
          });
        } else {
          print('no  ticket id data');
        }
      });
    });
  }

  @override
  void initState() {
    getcoupondata();
    getearlybrddata();

    // get discount code with single document in firestore

    vip = int.parse(widget.vip_price.toString());
    ecnmy = int.parse(widget.economy.toString());

    tax1 = double.parse(tax.toString());

    tax3 = tax1!.toInt();
    // print(widget.fees);
// resultfes=widget.fees!.replaceFirst("%","");
    fee = widget.fees!;
    total2 = total1!.toInt();

    // getsubsciptiondata();
    // button = '';
    // dropdownvalue = "" + widget.earlybrdVip.toString();
    // dropdownvalue2 = "" + widget.vip_price.toString();
    super.initState();
  }

  @override
  void dispose() {
    entcontroller.ticketid = ''.toString().obs;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(entcontroller.percentage!.value.toString());

    TicketController ticketController = Get.put(TicketController());
    // setState(() {
    //   equal = butn! * _counter;
    //   equal2 = (butn! * _counter * (100 - discountt!)) / 100;
    //   // // print(equal2);
    // });
    // setState(() {
    //   total1 = equal2! + ((equal! * tax3!) / 100) + ((equal! * fee!) / 100);
    //   // // print(total1);
    // });

    var appSize = MediaQuery.of(context).size;
    var appSize2 = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        elevation: 0.0,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            'assets/image/bacgroundlinkup.png',
            fit: BoxFit.fill,
          ),
        ),
        leadingWidth: 20,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 50, left: 10),
          child: Icon(Icons.menu),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 50, left: 10),
          child: Text('Ticket Type'),
        ),
      ),
      body: SafeArea(
          child: ListView(children: [
        SizedBox(height: 20),
        (earlybirdchecknew == 1)
            ? Column(
                children: [
                  TicketTypeContainer(
                      'Early Bird General Tickets \$15.00',
                      '\$15.00',
                      ' + \$3.46 Fees + \$0.00 Taxes',
                      'Sales end on Jan 7, 2023',
                      'This RSVP guarantees entrance to The Shrine before 11pm.',
                      Color.fromARGB(
                        253,
                        56,
                        171,
                        216,
                      ),
                      (() => ticketController.incrementearlygeneral()),
                      (() => ticketController.decrementearlygeneral()),
                      ticketController.counterearlygeneral),
                  SizedBox(
                    height: 20,
                  ),
                  TicketTypeContainer(
                    'Early Bird VIP   \$30.00',
                    '\$30.00',
                    ' + \$2.56 Fees + \$0.00 Taxes',
                    'Sales end on Jan 7, 2023',
                    'This Ticket is a VIP seating Ticket',
                    Color.fromARGB(253, 56, 171, 216),
                    () => ticketController.incrementearlyvip(),
                    () => ticketController.decrementearlyvip(),
                    ticketController.counterearlyvip,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TicketTypeContainer(
                    'VIP',
                    '\$40.00',
                    ' + \$3.45 Fees + \$0.00 Taxes',
                    '',
                    'This is a VIP seating Ticket ',
                    Color.fromARGB(253, 56, 171, 216),
                    () => ticketController.incrementvip(),
                    () => ticketController.decrementvip(),
                    ticketController.countervip,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TicketTypeContainer(
                    'General Admission',
                    '\$20.00',
                    ' + \$3.45 Fees + \$0.00 Taxes',
                    '',
                    'This Ticket is for General admission only',
                    Color.fromARGB(255, 213, 220, 22),
                    () => ticketController.incrementgeneral(),
                    () => ticketController.decrementgeneral(),
                    ticketController.countergeneral,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            smallContainer(
                'Event Coupon',
                Color.fromARGB(255, 213, 220, 22),
                Image.asset(
                  'assets/image/arrowgreen.png',
                  height: 20,
                )),
            smallContainer(
                'Pay From wallet ',
                Color.fromARGB(255, 56, 171, 216),
                Image.asset(
                  'assets/image/arrowblue.png',
                  height: 20,
                )),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            'Total   \$250.00',
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 110, 110, 110)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            height: 40,
            width: 170,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 213, 220, 22),
                borderRadius: BorderRadius.circular(6)),
            child: Center(
              child: Text(
                'Checkout',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ])),
    );
  }
}

Container smallContainer(
  String text,
  Color color,
  Image image,
) {
  return Container(
    height: 40,
    width: 170,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        image,
      ],
    ),
  );
}

class TicketTypeContainer extends StatefulWidget {
  TicketTypeContainer(
      this.text1,
      this.text2,
      this.text3,
      this.text4,
      this.text5,
      this.color,
      this.onTapincrement,
      this.onTapdecrement,
      this.counter);
  late String text1;
  late String text2;
  late String text3;
  late String text4;
  late String text5;
  late Color color;
  RxInt counter;
  void Function()? onTapincrement;
  void Function()? onTapdecrement;

  @override
  State<TicketTypeContainer> createState() => _TicketTypeContainerState();
}

class _TicketTypeContainerState extends State<TicketTypeContainer> {
  GetxController ticketcontroller = Get.put(TicketController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
            border: Border.all(color: widget.color),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.text1,
                style: TextStyle(
                    fontSize: 20,
                    color: widget.color,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              color: widget.color,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: widget.text2,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: widget.text3,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          )),
                    ])),
                    SizedBox(
                      width: 45,
                    ),
                    InkWell(
                      onTap: widget.onTapdecrement,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 219, 239, 246),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            '-',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Obx(
                      () => Text(
                        widget.counter.toString(),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: widget.onTapincrement,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 219, 239, 246),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            '+',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(widget.text4,
                  style: TextStyle(
                    color: Color.fromARGB(255, 110, 110, 110),
                    fontSize: 16,
                  )),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(widget.text5,
                  style: TextStyle(
                    color: Color.fromARGB(255, 110, 110, 110),
                    fontSize: 12,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
