import 'package:chat_app/components/components.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatPage extends StatelessWidget {
  static String routeId = 'ChatPage';

  String kMessagesCollections = 'messages';

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController messageController = TextEditingController();
  final listViewController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesLsit = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesLsit.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.black,
              title: const Text(
                'Chat App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    physics: const BouncingScrollPhysics(),
                    controller: listViewController,
                    itemCount: messagesLsit.length,
                    itemBuilder: (context, index) {
                      return messagesLsit[index].id == email
                          ? ChatBubble(
                              myMessage: messagesLsit[index],
                            )
                          : ChatBubbleForFriend(
                              myMessage: messagesLsit[index],
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  ////////////////////////////////////////////////
                  ////////////////////////////////////////////////
                  ///////////////////////////////////////////////
                  child: TextField(
                    controller: messageController,
                    keyboardType: TextInputType.text,
                    onSubmitted: (data) {
                      messages.add({
                        'message': data,
                        'createdAt': DateTime.now(),
                        'id': email
                      });
                      //بعمل السطر دة عشان يمسح الرسالة لما اعمل 
                      // submit____________________________________
                      messageController.clear();

                      listViewController.animateTo(
                        0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
                    },

                    //////// STYLING THE TEXTFIELD //////////////////////
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: HexColor('7ffa88'),
                    decoration: InputDecoration(
                      hintText: 'Message',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: HexColor('262837'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: HexColor('262837')),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: HexColor('262837')),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: HexColor('262837')),
                      ),
                      ///////////////////////////////////////////////
                      ///////// ICON BUTTON /////////////////////////
                      suffixIcon: IconButton(
                        onPressed: () {
                          
                        },
                        color: HexColor('7ffa88'),
                        icon: Icon(
                          Icons.send_rounded,
                          color: HexColor('7ffa88'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
