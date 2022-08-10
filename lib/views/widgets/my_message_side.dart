import 'package:flutter/material.dart';

class MyMessageSide extends StatelessWidget {
  const MyMessageSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text('Messagfjhasoifuawnioefamcfjaioesfimsdnlfakshdjfjewionfkasdhfwebfksadhiufsbdfkasdfaisehffiwefbaksjdfiuashfewlhe'),
        ),const SizedBox(width: 10,),
        const CircleAvatar(
          radius: 20,
        ),

      ],
    );
  }
}
