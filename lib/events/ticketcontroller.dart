import 'package:get/get.dart';

class TicketController extends GetxController {
  RxString ticketId = "".obs;

  RxInt countervip = 1.obs;
  RxInt countergeneral = 1.obs;
  RxInt counterearlyvip = 1.obs;
  RxInt counterearlygeneral = 1.obs;

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

  RxDouble earlybirdtaxnew = 1.8.obs;
  RxDouble generaltaxnew = 0.6.obs;
  RxDouble earlybirdviptaxnew = 3.6.obs;
  RxDouble viptaxnew = 1.2.obs;

  RxDouble feeearlybirdgeneralorignal = 7.5.obs;
  RxDouble feegeneralorignal = 7.5.obs;
  RxDouble feeearlybirdviporignal = 7.5.obs;
  RxDouble feeviporignal = 7.5.obs;

  RxDouble feeearlybirdgeneralnew = 1.125.obs;
  RxDouble feegeneralnew = 0.375.obs;
  RxDouble feeearlybirdvipnew = 2.25.obs;
  RxDouble feevipnew = 0.75.obs;

  RxDouble totalgeneral = 5.975.obs;
  RxDouble totalearlygeneral = 17.925.obs;
  RxDouble totalvip = 11.95.obs;
  RxDouble totalearlyvip = 35.85.obs;
  RxDouble totalearlyticket = 53.775.obs;
  RxDouble totalgeneralticket = 17.925.obs;

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
    countervip.value > 1 ? countervip.value-- : print('cannot decrement');
    vippricenew.value = vippriceorignal.value * countervip.value;
    feevipnew.value = (vippricenew.value * feeviporignal.value) / 100;
    viptaxnew.value = (vippricenew.value * viptax.value) / 100;
    totalvip.value = viptaxnew.value + feevipnew.value + vippricenew.value;

    totalgeneralticket.value = totalgeneral.value + totalvip.value;
  }

  void decrementgeneral() {
    countergeneral.value > 1
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
    counterearlyvip.value > 1
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
    counterearlygeneral.value > 1
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
