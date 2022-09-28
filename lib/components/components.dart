import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// custom textField ----------------------------------

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.hintText,
    this.onChanged,
    this.obsText = false,
  }) : super(key: key);
  String? hintText;
  bool? obsText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //السطر اللي تحت دة عشان يديك النقط اللي بتطلع لما تكتب الباسوورد
      obscureText: obsText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: HexColor('7ffa88'),
      decoration: InputDecoration(
        hintText: hintText,
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
      ),
    );
  }
}

// custom MaterialButton -------------------------------

class CustomMaterialButton extends StatelessWidget {
  CustomMaterialButton(
    this.materialButtonTitle, {
    Key? key,
    this.onTap,
    this.materialButtonHeight,
    this.materialButtonColor,
  }) : super(key: key);
  double? materialButtonHeight;
  Color? materialButtonColor;
  String materialButtonTitle;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: materialButtonHeight,
      child: MaterialButton(
        color: materialButtonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        onPressed: onTap,
        child: Text(
          materialButtonTitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
// showSnackBar -------------------------------------------------------

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

// ChatBubble ---------------------------------------------------------------

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.myMessage,
  }) : super(key: key);

  final Message myMessage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        padding: const EdgeInsets.only(
          left: 20,
          top: 8,
          bottom: 8,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: HexColor('7ffa88'),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.zero,
          ),
        ),
        child: Column(
          children: [
            Text(
              myMessage.message,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

// ChatBubbleForFriend ---------------------------------------------------------------

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    Key? key,
    required this.myMessage,
  }) : super(key: key);

  final Message myMessage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        padding: const EdgeInsets.only(
          left: 20,
          top: 8,
          bottom: 8,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: HexColor('262837'),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.zero,
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          myMessage.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
