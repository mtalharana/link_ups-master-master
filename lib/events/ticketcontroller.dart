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

  RxDouble earlybirdtax = 0.0.obs;
  RxDouble generaltax = 0.0.obs;
  RxDouble earlybirdviptax = 0.0.obs;
  RxDouble viptax = 0.0.obs;
  RxDouble totaltax = 0.0.obs;

  RxDouble feeearlybirdgeneral = 0.0.obs;
  RxDouble feegeneral = 0.0.obs;
  RxDouble feeearlybirdvip = 0.0.obs;
  RxDouble feevip = 0.0.obs;

  void updatePricegeneral(double value) {
    generalpriceorignal.value = value;
    update();
  }

  void updatePriceEarlyBirdgeneral(double value) {
    earlybirdpriceorignal.value = value;
    update();
  }

  void updatepricevip(double value) {
    feevip.value = value;
    update();
  }

  void updatepricealybirdvip(double value) {
    earlybirdvippriceorignal.value = value;
    update();
  }

  void updateTaxgeneral(double value) {
    generaltax.value = value;
    update();
  }

  void updateTaxEarlyBirdgeneral(double value) {
    earlybirdtax.value = value;
    update();
  }

  void updateTaxvip(double value) {
    viptax.value = value;
    update();
  }

  void updateTaxEarlyBirdvip(double value) {
    earlybirdviptax.value = value;
    update();
  }

  void updatefeegeneral(double value) {
    feegeneral.value = value;
    update();
  }

  void updatefeeearlybirdgeneral(double value) {
    feeearlybirdgeneral.value = value;
    update();
  }

  void updatefeevip(double value) {
    feevip.value = value;
    update();
  }

  void updateearlybirdfeevip(double value) {
    feeearlybirdvip.value = value;
    update();
  }

  // increment counter
  void incrementvip() {
    countervip.value++;
    vippricenew.value = vippriceorignal.value * countervip.value;
  }

  void incrementgeneral() {
    countergeneral.value++;
    generalpricenew.value = generalpriceorignal.value * countergeneral.value;
    print(generalpricenew.value);
  }

  void incrementearlyvip() {
    counterearlyvip.value++;
    earlybirdvippricenew.value =
        earlybirdvippriceorignal.value * counterearlyvip.value;
  }

  void incrementearlygeneral() {
    counterearlygeneral.value++;
    earlybirdpricenew.value =
        earlybirdpriceorignal.value * counterearlygeneral.value;
  }

  // decrement counter
  void decrementvip() {
    countervip.value > 1 ? countervip.value-- : print('cannot decrement');
    vippricenew.value = vippriceorignal.value * countervip.value;
  }

  void decrementgeneral() {
    countergeneral.value > 1
        ? countergeneral.value--
        : print('cannot decrement');
    generalpricenew.value = generalpriceorignal.value * countergeneral.value;
  }

  void decrementearlyvip() {
    counterearlyvip.value > 1
        ? counterearlyvip.value--
        : print('cannot decrement');
    earlybirdvippricenew.value =
        earlybirdvippriceorignal.value * counterearlyvip.value;
  }

  void decrementearlygeneral() {
    counterearlygeneral.value > 1
        ? counterearlygeneral.value--
        : print('cannot decrement');
    earlybirdpricenew.value =
        earlybirdpriceorignal.value * counterearlygeneral.value;
  }
}
