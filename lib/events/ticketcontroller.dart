import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TicketController extends GetxController {
  RxString ticketId = "".obs;
  RxBool ticketavailable = false.obs;
  RxInt countervip = 0.obs;
  RxInt countergeneral = 0.obs;
  RxInt counterearlyvip = 0.obs;
  RxInt counterearlygeneral = 0.obs;

  RxDouble earlybirdpriceorignal = 0.0.obs;
  RxDouble generalpriceorignal = 0.0.obs;
  RxDouble earlybirdvippriceorignal = 0.0.obs;
  RxDouble vippriceorignal = 0.0.obs;
  RxDouble earlybirdpricenew = 0.0.obs;
  RxDouble generalpricenew = 0.0.obs;
  RxDouble earlybirdvippricenew = 0.0.obs;
  RxDouble vippricenew = 0.0.obs;

  RxDouble earlybirdtax = 12.0.obs;
  RxDouble generaltax = 12.0.obs;
  RxDouble earlybirdviptax = 12.0.obs;
  RxDouble viptax = 12.0.obs;

  RxDouble earlybirdtaxnew = 0.0.obs;
  RxDouble generaltaxnew = 0.0.obs;
  RxDouble earlybirdviptaxnew = 0.0.obs;
  RxDouble viptaxnew = 0.0.obs;

  RxDouble feeearlybirdgeneralorignal = 7.5.obs;
  RxDouble feegeneralorignal = 7.5.obs;
  RxDouble feeearlybirdviporignal = 7.5.obs;
  RxDouble feeviporignal = 7.5.obs;

  RxDouble feeearlybirdgeneralnew = 0.0.obs;
  RxDouble feegeneralnew = 0.0.obs;
  RxDouble feeearlybirdvipnew = 0.0.obs;
  RxDouble feevipnew = 0.0.obs;

  RxDouble totalgeneral = 5.975.obs;
  RxDouble totalearlygeneral = 17.925.obs;
  RxDouble totalvip = 11.95.obs;
  RxDouble totalearlyvip = 35.85.obs;
  RxDouble totalearlyticket = 0.0.obs;
  RxDouble totalgeneralticket = 0.0.obs;

  void getprices(String ticketId) {
    var _subscription = FirebaseFirestore.instance
        .collection('tickets')
        .doc(ticketId)
        .get()
        .then((value) {
      vippriceorignal.value =
          double.parse(int.parse(value['price_vip']).toString());

      generalpriceorignal.value =
          double.parse(int.parse(value['price_economy']).toString());
      earlybirdvippriceorignal.value =
          double.parse(int.parse(value['early_bird_vip_price']).toString());
      earlybirdpriceorignal.value =
          double.parse(int.parse(value['early_bird_economy_price']).toString());
      print('asd');
      var _subscrption2 = FirebaseFirestore.instance
          .collection('events')
          .doc(value['event_id'])
          .get()
          .then((value) {
        print(value['event_fee']);
        feeearlybirdgeneralorignal.value =
            double.parse(int.parse(value['event_fee']).toString());
        feegeneralorignal.value =
            double.parse(int.parse(value['event_fee']).toString());
        feeearlybirdviporignal.value =
            double.parse(int.parse(value['event_fee']).toString());
        feeviporignal.value =
            double.parse(int.parse(value['event_fee']).toString());
      });

      update();
    });
  }

  // increment counter
  void incrementvip() {
    countervip.value++;
    vippricenew.value = vippriceorignal.value * countervip.value;
    feevipnew.value = (vippricenew.value * feeviporignal.value) / 100;
    viptaxnew.value = (vippricenew.value * viptax.value) / 100;
    totalvip.value = viptaxnew.value + feevipnew.value + vippricenew.value;

    totalgeneralticket.value = totalgeneral.value + totalvip.value;
    print(totalgeneralticket.value);
  }

  void incrementgeneral() {
    countergeneral.value++;
    print(generalpriceorignal.value);
    generalpricenew.value = generalpriceorignal.value * countergeneral.value;
    feegeneralnew.value =
        (generalpricenew.value * feegeneralorignal.value) / 100;
    generaltaxnew.value = (generalpricenew.value * generaltax.value) / 100;
    totalgeneral.value =
        generaltaxnew.value + feegeneralnew.value + generalpricenew.value;
    totalgeneralticket.value = totalgeneral.value + totalvip.value;
  }

  void incrementearlyvip() {
    counterearlyvip.value++;
    earlybirdvippricenew.value =
        earlybirdvippriceorignal.value * counterearlyvip.value;
    feeearlybirdvipnew.value =
        (earlybirdvippricenew.value * feeearlybirdviporignal.value) / 100;
    earlybirdviptaxnew.value =
        (earlybirdvippricenew.value * earlybirdviptax.value) / 100;
    totalearlyvip.value = earlybirdviptaxnew.value +
        feeearlybirdvipnew.value +
        earlybirdvippricenew.value;
    totalearlyticket.value = totalearlyvip.value + totalearlygeneral.value;
    print(totalearlyvip.value.toString());
  }

  void incrementearlygeneral() {
    counterearlygeneral.value++;
    earlybirdpricenew.value =
        earlybirdpriceorignal.value * counterearlygeneral.value;
    feeearlybirdgeneralnew.value =
        (earlybirdpricenew.value * feeearlybirdgeneralorignal.value) / 100;
    earlybirdtaxnew.value =
        (earlybirdpricenew.value * earlybirdtax.value) / 100;
    totalearlygeneral.value = earlybirdtaxnew.value +
        feeearlybirdgeneralnew.value +
        earlybirdpricenew.value;
    totalearlyticket.value = totalearlyvip.value + totalearlygeneral.value;
  }

  // decrement counter
  void decrementvip() {
    countervip.value > 0 ? countervip.value-- : print('cannot decrement');
    vippricenew.value = vippriceorignal.value * countervip.value;
    feevipnew.value = (vippricenew.value * feeviporignal.value) / 100;
    viptaxnew.value = (vippricenew.value * viptax.value) / 100;
    totalvip.value = viptaxnew.value + feevipnew.value + vippricenew.value;

    totalgeneralticket.value = totalgeneral.value + totalvip.value;
  }

  void decrementgeneral() {
    countergeneral.value > 0
        ? countergeneral.value--
        : print('cannot decrement');
    generalpricenew.value = generalpriceorignal.value * countergeneral.value;
    feegeneralnew.value =
        (generalpricenew.value * feegeneralorignal.value) / 100;
    generaltaxnew.value = (generalpricenew.value * generaltax.value) / 100;
    totalgeneral.value =
        generaltaxnew.value + feegeneralnew.value + generalpricenew.value;
    totalgeneralticket.value = totalgeneral.value + totalvip.value;
    totalearlygeneral.value = earlybirdtaxnew.value +
        feeearlybirdgeneralnew.value +
        earlybirdpricenew.value;
    totalearlyticket.value = totalearlyvip.value + totalearlygeneral.value;
  }

  void decrementearlyvip() {
    counterearlyvip.value > 0
        ? counterearlyvip.value--
        : print('cannot decrement');
    earlybirdvippricenew.value =
        earlybirdvippriceorignal.value * counterearlyvip.value;
    feeearlybirdvipnew.value =
        (earlybirdvippricenew.value * feeearlybirdviporignal.value) / 100;
    earlybirdviptaxnew.value =
        (earlybirdvippricenew.value * earlybirdviptax.value) / 100;
    totalearlyvip.value = earlybirdviptaxnew.value +
        feeearlybirdvipnew.value +
        earlybirdvippricenew.value;
    totalearlyticket.value = totalearlyvip.value + totalearlygeneral.value;
  }

  void decrementearlygeneral() {
    counterearlygeneral.value > 0
        ? counterearlygeneral.value--
        : print('cannot decrement');
    earlybirdpricenew.value =
        earlybirdpriceorignal.value * counterearlygeneral.value;
    feeearlybirdgeneralnew.value =
        (earlybirdpricenew.value * feeearlybirdgeneralorignal.value) / 100;
    earlybirdtaxnew.value =
        (earlybirdpricenew.value * earlybirdtax.value) / 100;
    totalearlyvip.value = earlybirdviptaxnew.value +
        feeearlybirdvipnew.value +
        earlybirdvippricenew.value;
    totalearlyticket.value = totalearlyvip.value + totalearlygeneral.value;
    totalearlygeneral.value = earlybirdtaxnew.value +
        feeearlybirdgeneralnew.value +
        earlybirdpricenew.value;
    totalearlyticket.value = totalearlyvip.value + totalearlygeneral.value;
  }
}
