// import 'package:flutter/material.dart';
// import 'package:link_up/ui/DrawerScreen.dart';

// class NewChatScreen extends StatefulWidget {
//   const NewChatScreen({Key? key}) : super(key: key);

//   @override
//   State<NewChatScreen> createState() => _NewChatScreenState();
// }

// class _NewChatScreenState extends State<NewChatScreen> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       key: _scaffoldKey,
//       // appBar: AppBar(
//       //   title: Text("data"),
//       // ),
//       drawer: Drawer(
//         // backgroundColor: Colors.green.shade900,
//         child: DrawerScreen(),
//       ),
//       body: Column(
//         children: <Widget>[
//           Container(
//             height: 140,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               // color: Colors.green
//               image: DecorationImage(
//                 alignment: Alignment.bottomCenter,
//                 image: AssetImage("assets/Group 163959.png"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     _scaffoldKey.currentState!.openDrawer();
//                   },
//                   icon: const Icon(Icons.menu),
//                   color: Colors.white,
//                   iconSize: 35,
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.camera_alt_outlined),
//                       color: Colors.white,
//                       iconSize: 25,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.phone_in_talk_sharp),
//                       color: Colors.white,
//                       iconSize: 25,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//               child: ListView(
//             children: <Widget>[
//               const SizedBox(
//                 height: 160,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 60.0,
//                   right: 5.0,
//                 ),
//                 child: Container(
//                     width: width / 1.5,
//                     height: 75,
//                     // color: Colors.amber,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(16.0),
//                           decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 56, 171, 216),
//                               borderRadius: BorderRadius.circular(20.0)),
//                           child: const Text(
//                             "Lorem ipsum dolor sit  amet, \n consectetuer adipiscing elit. \n Aen",
//                             textAlign: TextAlign.right,
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Column(
//                           children: const [
//                             CircleAvatar(backgroundColor: Colors.grey),
//                             SizedBox(
//                               height: 4,
//                             ),
//                             Text(
//                               "Vida Stuart",
//                               style: TextStyle(fontSize: 12),
//                             )
//                           ],
//                         ),
//                       ],
//                     )),
//               ),
//               const SizedBox(
//                 height: 2,
//               ),
//               Container(
//                 padding: const EdgeInsets.only(left: 120.0),
//                 child: const Text(
//                   "01:07 PM",
//                   style: TextStyle(fontSize: 12),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   right: 60.0,
//                   left: 5.0,
//                 ),
//                 child: Container(
//                   width: width,
//                   height: 58,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           const CircleAvatar(backgroundColor: Colors.grey),
//                           const SizedBox(
//                             height: 4,
//                           ),
//                           const Text(
//                             "Name",
//                             style: TextStyle(fontSize: 12),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius: BorderRadius.circular(20.0)),
//                         child: const Text(
//                           "Lorem ipsum dolor sit  am",
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // color: Colors.pink,
//                   //   child: ListTile(
//                   //     leading: CircleAvatar(backgroundColor: Color(0xff38ABD8)),
//                   //     title: Container(
//                   //       padding: EdgeInsets.all(12.0),
//                   //       decoration: BoxDecoration(
//                   //           color: Color.fromARGB(255, 56, 171, 216),
//                   //           borderRadius: BorderRadius.circular(20.0)),
//                   //       child: Text("LLorem ipsum dolor sit am"),
//                   //     ),
//                   //   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 2,
//               ),
//               Container(
//                 padding: const EdgeInsets.only(left: 180.0),
//                 child: const Text(
//                   "02:13 PM",
//                   style: TextStyle(fontSize: 12),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   right: 60.0,
//                   left: 5.0,
//                 ),
//                 child: Container(
//                   width: width,
//                   height: 60,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           const CircleAvatar(backgroundColor: Colors.grey),
//                           const SizedBox(
//                             height: 6,
//                           ),
//                           const Text(
//                             "Name",
//                             style: TextStyle(fontSize: 12),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius: BorderRadius.circular(20.0)),
//                         child: const Text(
//                           "Lorem ipsum dolor sit  amet, consect",
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // color: Colors.pink,
//                   //   child: ListTile(
//                   //     leading: CircleAvatar(backgroundColor: Color(0xff38ABD8)),
//                   //     title: Container(
//                   //       padding: EdgeInsets.all(12.0),
//                   //       decoration: BoxDecoration(
//                   //           color: Color.fromARGB(255, 56, 171, 216),
//                   //           borderRadius: BorderRadius.circular(20.0)),
//                   //       child: Text("LLorem ipsum dolor sit am"),
//                   //     ),
//                   //   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 2,
//               ),
//               Container(
//                 padding: const EdgeInsets.only(left: 220.0),
//                 child: const Text(
//                   "02:13 PM",
//                   style: TextStyle(fontSize: 12),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   right: 5.0,
//                   left: 7,
//                 ),
//                 child: SizedBox(
//                     width: width / 2,
//                     height: 70,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(16.0),
//                           decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 56, 171, 216),
//                               borderRadius: BorderRadius.circular(20.0)),
//                           child: const Text(
//                             "Lorem ipsum dolor sit  amet,  consectetuer \nadipiscing elit Aen",
//                             textAlign: TextAlign.right,
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 7,
//                         ),
//                         Column(
//                           children: const [
//                             CircleAvatar(backgroundColor: Colors.grey),
//                             SizedBox(
//                               height: 4,
//                             ),
//                             Text(
//                               "Vida Stuart",
//                               style: TextStyle(fontSize: 12),
//                             )
//                           ],
//                         ),
//                       ],
//                     )
//                     // color: Colors.amber,
//                     // child: ListTile(
//                     //   trailing: CircleAvatar(backgroundColor: Color(0xff38ABD8)),
//                     //   title: Container(
//                     //     padding: EdgeInsets.all(12.0),
//                     //     decoration: BoxDecoration(
//                     //         color: Color.fromARGB(255, 56, 171, 216),
//                     //         borderRadius: BorderRadius.circular(20.0)),
//                     //     child: Text(
//                     //         "Lorem ipsum dolor sit amet,  consectetuer adipiscing elit.  Aen"),
//                     //   ),
//                     // ),
//                     ),
//               ),
//               const SizedBox(
//                 height: 2,
//               ),
//               Container(
//                 padding: const EdgeInsets.only(left: 50.0),
//                 child: const Text(
//                   "02:15 PM",
//                   style: TextStyle(fontSize: 12),
//                 ),
//               ),
//             ],
//           )),
//           Container(
//               color: Colors.white,
//               padding:
//                   const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//               child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                 Expanded(
//                   child: TextFormField(
//                     autocorrect: false,
//                     // ignore: prefer_const_constructors
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.camera_alt_outlined),
//                       prefixIconColor: Colors.black,
//                       hintText: "Say something...",
//                       hintStyle:
//                           const TextStyle(fontSize: 16.0, color: Colors.black),
//                       fillColor: Colors.blue,
//                       enabledBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white)),
//                       focusedBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white)),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   iconSize: 25.0,
//                   onPressed: () {},
//                 )
//               ])),
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:link_up/get_controller/ChatController.dart';
import 'package:link_up/get_controller/auth_controller.dart';
import 'package:link_up/helper/router/route_path.dart';
import 'package:link_up/model/recent_chat.dart';
import 'package:link_up/model/user_model.dart';
import '../DrawerScreen.dart';

class ChatHomePage extends StatefulWidget {
  @override
  _ChatHomePageState createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  AuthController authController = Get.find(tag: AuthController().toString());
  ChatController chatController = Get.find(tag: ChatController().toString());

  @override
  void initState() {
    chatController.getMatchList();
    chatController.getMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, RoutePath.home_screen);
        return false;
      },
      child: Scaffold(
         key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 211, 228, 212),
          child: DrawerScreen(),
        ),
        body: Stack(
          children: [
          Image.asset("assets/image/Group 163959 (2).png"),
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 10),
            child: InkWell(
              onTap: () {
               _scaffoldKey.currentState!.openDrawer();
              },
              child: Icon(Icons.menu,color: Colors.white,)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 50),
            child: Text("Chat Now",style: TextStyle(color: Colors.white,fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: GetBuilder(
                init: chatController,
                builder: (_) {
                  return Container(
                    width: width,
                    height: height,
                    child: new Column(
                      children: <Widget>[
                        if (chatController.matchList.isNotEmpty)
                          Container(
                            margin: EdgeInsets.only(
                                left: 10,
                                top: height * 0.02,
                                bottom: height * 0.03),
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 130),
                              child: Text(
                                'new_matches'.tr,
                                style: TextStyle(
                                  color: Color.fromARGB(251, 56, 171, 216),
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        if (chatController.matchList.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: new Container(
                              height: 100,
                              child: ListView.builder(
                                itemCount: chatController.matchList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  UserModel _endUser = UserModel.fromJson(
                                      chatController.matchList[index]);
                                  return GestureDetector(
                                    onTap: () {
                                      chatController.updateEndUser(_endUser);

                                      String chatID = chatController
                                          .matchList[index]['chat_id'];
                                      Navigator.pushNamed(
                                          context, RoutePath.chat_message_page,
                                          arguments: {
                                            'end_user_id': _endUser.uid,
                                            'end_user_name': _endUser.firstName,
                                            'chat_id': chatID
                                          });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 0),
                                      child: Column(
                                        children: [
                                          if (_endUser.avatar != '')
                                            CircleAvatar(
                                              radius: 40,
                                              backgroundImage: new NetworkImage(
                                                _endUser.avatar,
                                              ),
                                              backgroundColor: Colors.grey,
                                            ),
                                          if (_endUser.avatar == '')
                                            CircleAvatar(
                                              radius: 40,
                                              backgroundColor: Colors.grey,
                                              child: Text(
                                                _endUser.firstName[0].toUpperCase(),
                                              ),
                                            ),
                                          Text(
                                            _endUser.firstName,
                                            style: TextStyle(
                                              fontSize:
                                                  (_endUser.firstName).length < 10
                                                      ? 16
                                                      : ((_endUser.firstName)
                                                                  .length <
                                                              15)
                                                          ? 14
                                                          : 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 130),
                            child: Text(
                              'messages'.tr,
                              style: TextStyle(
                                color: Color.fromARGB(255, 56, 171, 216),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        if (chatController.recentChatList.length == 0)
                          Container(
                            alignment: Alignment.center,
                            child: Center(
                              child: Text(
                                'there_is_no_message'.tr,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: new ListView.builder(
                                    itemCount:
                                        chatController.recentChatList.length,
                                    itemBuilder: (context, index) {
                                      RecentChatModel _recentChatModel =
                                          RecentChatModel.fromJson(
                                              chatController.recentChatList[index]
                                                  as Map<String, dynamic>);
                                      return Slidable(
                                        key: const ValueKey(0),
                                        startActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          dismissible:
                                              DismissiblePane(onDismissed: () {}),
                                          dragDismissible: false,
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) async {
                                                FirebaseFirestore.instance
                                                    .collection('chats')
                                                    .doc(_recentChatModel.chatId)
                                                    .collection('message')
                                                    .get()
                                                    .then((value) {
                                                  value.docs.forEach((element) {
                                                    FirebaseFirestore.instance
                                                        .collection('chats')
                                                        .doc(_recentChatModel
                                                            .chatId)
                                                        .collection('message')
                                                        .doc(element.id)
                                                        .delete();
                                                  });
                                                });
                                                FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(authController
                                                        .user?.value.uid)
                                                    .collection('messages')
                                                    .doc(_recentChatModel.chatId)
                                                    .delete();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text('delete'.tr),
                                                  ),
                                                );
                                              },
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                              icon: Icons.delete,
                                              label: 'Delete',
                                            ),
                                            SlidableAction(
                                              onPressed: (context) {
                                                FirebaseFirestore.instance
                                                    .collection('chats')
                                                    .doc(_recentChatModel.chatId)
                                                    .collection('message')
                                                    .get()
                                                    .then((value) {
                                                  value.docs.forEach((element) {
                                                    FirebaseFirestore.instance
                                                        .collection('chats')
                                                        .doc(_recentChatModel
                                                            .chatId)
                                                        .collection('message')
                                                        .doc(element.id)
                                                        .delete();
                                                  });
                                                });
                                                FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(authController
                                                        .user?.value.uid)
                                                    .collection('messages')
                                                    .doc(_recentChatModel.chatId)
                                                    .delete();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text('delete'.tr),
                                                  ),
                                                );
                                                FirebaseFirestore.instance
                                                    .collection('matches')
                                                    .doc(authController
                                                        .user?.value.uid)
                                                    .collection('matches')
                                                    .doc(_recentChatModel.chatId)
                                                    .update({
                                                  'friend': false,
                                                  'me': false,
                                                  'matchingStatus': false,
                                                });

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text('un_match'.tr),
                                                  ),
                                                );
                                              },
                                              backgroundColor: Colors.blue,
                                              foregroundColor: Colors.white,
                                              icon: Icons.refresh,
                                              label: 'un_match'.tr,
                                            ),
                                          ],
                                        ),
                                        child: new Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black26,
                                                      width: 0.5))),
                                          child: ListTile(
                                            leading: _recentChatModel
                                                    .withAvatar.isNotEmpty
                                                ? Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black12,
                                                      image: new DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            _recentChatModel
                                                                .withAvatar),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    width: 50,
                                                    height: 50,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black12,
                                                    ),
                                                    child: Text(
                                                      _recentChatModel.withName[0]
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                          color: Colors.blue[700],
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                            title: Text(
                                              _recentChatModel.withName,
                                              style:
                                                  TextStyle(color: Colors.black),
                                            ),
                                            subtitle: Text(
                                              _recentChatModel.lastText.length <
                                                      30
                                                  ? _recentChatModel.lastText
                                                  : _recentChatModel.lastText
                                                          .substring(0, 30) +
                                                      ' ...',
                                            ),
                                            trailing:
                                                StreamBuilder<QuerySnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('chats')
                                                  .doc(_recentChatModel.chatId)
                                                  .collection('message')
                                                  .where('senderID',
                                                      isEqualTo:
                                                          _recentChatModel.withId)
                                                  .where('isRead',
                                                      isEqualTo: false)
                                                  .snapshots(),
                                              builder: (context, unReadSnapshot) {
                                                return Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      authController
                                                          .timeStampToDateTime(
                                                              _recentChatModel
                                                                  .timestamp),
                                                      style: TextStyle(
                                                          color: Colors.black54),
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    unReadSnapshot.hasData &&
                                                            (unReadSnapshot
                                                                        .data
                                                                        ?.docs
                                                                        .length ??
                                                                    0) >
                                                                0
                                                        ? Container(
                                                            alignment:
                                                                Alignment.center,
                                                            width: 20.0,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape:
                                                                  BoxShape.circle,
                                                              color: Colors
                                                                  .blue[700],
                                                            ),
                                                            child: Text(
                                                              unReadSnapshot.data!
                                                                  .docs.length
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                              ),
                                                            ),
                                                          )
                                                        : SizedBox(
                                                            height: 0,
                                                          ),
                                                  ],
                                                );
                                              },
                                            ),
                                            isThreeLine: false,
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  RoutePath.chat_message_page,
                                                  arguments: {
                                                    'end_user_id':
                                                        _recentChatModel.withId,
                                                    'end_user_name':
                                                        _recentChatModel.withName,
                                                    'chat_id':
                                                        _recentChatModel.chatId
                                                  });
                                            },
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
