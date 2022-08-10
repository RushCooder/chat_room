import 'package:chat_room/providers/chat_provider.dart';
import 'package:chat_room/views/widgets/custom_form_field.dart';
import 'package:chat_room/views/widgets/my_message_side.dart';
import 'package:chat_room/views/widgets/user_message_side.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatRoomPage extends StatelessWidget {
  static const String routeName = '/chat_room';
  final TextEditingController messageTextEditingController = TextEditingController();
  ChatRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatProvider chatProvider =
        Provider.of<ChatProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sender name'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: index.isEven ? MyMessageSide() : UserMessageSide()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    controller: messageTextEditingController,
                    icon: Icons.text_fields_outlined,
                    hintText: 'Message',

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      chatProvider.setMessage(messageTextEditingController.text);
                      messageTextEditingController.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
