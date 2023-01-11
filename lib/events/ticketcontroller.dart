import 'package:get/get.dart';

class TicketController extends GetxController {
  RxString ticketId = "".obs;
  RxInt countervip = 1.obs;
  RxInt countergeneral = 1.obs;
  RxInt counterearlyvip = 1.obs;
  RxInt counterearlygeneral = 1.obs;
  RxDouble earlybirdprice = 0.0.obs;
  RxDouble generalprice = 0.0.obs;
  RxDouble earlybirdvipprice = 0.0.obs;
  RxDouble vipprice = 0.0.obs;
  RxDouble totalprice = 0.0.obs;
  RxDouble earlybirdtax = 0.0.obs;
  RxDouble generaltax = 0.0.obs;
  RxDouble earlybirdviptax = 0.0.obs;
  RxDouble viptax = 0.0.obs;
  RxDouble totaltax = 0.0.obs;
  RxDouble feeearlybirdgeneral = 0.0.obs;
  RxDouble feegeneral = 0.0.obs;
  RxDouble feeearlybirdvip = 0.0.obs;
  RxDouble feevip = 0.0.obs;

  // increment counter
  void incrementvip() {
    print('incrementing');
    countervip.value++;
  }

  void incrementgeneral() {
    countergeneral.value++;
  }

  void incrementearlyvip() {
    counterearlyvip.value++;
  }

  void incrementearlygeneral() {
    counterearlygeneral.value++;
  }

  // decrement counter
  void decrementvip() {
    countervip.value > 1 ? countervip.value-- : print('cannot decrement');
  }

  void decrementgeneral() {
    countergeneral.value > 1
        ? countergeneral.value--
        : print('cannot decrement');
  }

  void decrementearlyvip() {
    counterearlyvip.value > 1
        ? counterearlyvip.value--
        : print('cannot decrement');
  }

  void decrementearlygeneral() {
    counterearlygeneral.value > 1
        ? counterearlygeneral.value--
        : print('cannot decrement');
  }
}
