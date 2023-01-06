import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:link_up/events/TicketType.dart';

class EventController extends GetxController {
  Rx<TextEditingController> eventscontroller = TextEditingController().obs;
  RxString selecteddiscountcode = ''.obs;
  RxString? category = ''.obs;
  RxString? title = ''.obs;
  RxString? description = ''.obs;
  RxString? start_date = ''.obs;
  RxString? end_date = ''.obs;
  RxString? location = ''.obs;
  Rx<TextEditingController> codecONTROLLER = TextEditingController().obs;
  RxString? code = ''.obs;
  RxString? discount = ''.obs;
  RxString? percentage = ''.obs;
  // var discountint=int.parse(discount.toString()).obs;
  RxList<String> discountcodes = <String>[].obs;

  void adddiscountcode(String discountcode) {
    if (!discountcodes.contains(discountcode)) {
      discountcodes.add(discountcode);
      update();
    }
  }

  RxDouble? currrentlongitude = 0.0.obs;
  RxDouble? currentlatitude = 0.0.obs;
  void getCurrentLocation() async {
    print('getting location');
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currrentlongitude!.value = position.longitude.toDouble();
    currentlatitude!.value = position.latitude.toDouble();
    // print(currrentlongitude!.value);
    // print(currentlatitude!.value);
    // update();
    // print(currrentlongitude!.value);
    // print(currentlatitude!.value);
  }

  Widget getbutton() {
    if (discountcodes.contains(codecONTROLLER.value.text.toString())) {
      return Container(
          child: Image.asset(
        "assets/Economy.png",
        height: 40,
      ));
    } else {
      return Text('No Coupon Available');
    }
  }
}
