import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_ai/pages/%C2%A0welcome_page.dart';
import 'package:gemini_ai/pages/notification_page.dart';
import 'package:gemini_ai/service/database.dart';
import 'package:gemini_ai/theme/consts.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final users = FirebaseAuth.instance.currentUser!;

  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(
    id: '0',
    firstName: 'User',
    profileImage:
        'https://media.licdn.com/dms/image/C4D1BAQExGO4JZZwlUg/company-background_1536_768/0/1583197502430?e=2147483647&v=beta&t=C481rwLxTBw29VvLs-BpLSMfcbesiizq7BBxAz3bg8g',
  );
  ChatUser geminiUser = ChatUser(
    id: '1',
    firstName: 'Gemini',
    profileImage:
        'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/google-gemini-icon.png',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          tag: '234',
          child: SizedBox(
            width: 100,
            height: 300,
            child: Image.asset('image/logo_gemini.png'),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Profile();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()));
            },
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: DashChat(
        messageOptions: MessageOptions(
          showCurrentUserAvatar: true,
          showOtherUsersName: true,
          currentUserTimeTextColor: Theme.of(context).colorScheme.surface,
          currentUserContainerColor: Theme.of(context).colorScheme.primary,
        ),
        inputOptions: InputOptions(
          inputTextStyle: const TextStyle(
            color: Colors.black,
          ),
          trailing: [
            IconButton(
              onPressed: _sendMediaMessage,
              icon: const Icon(Icons.image),
            ),
          ],
        ),
        currentUser: currentUser,
        onSend: _sendMessage,
        messages: messages,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void Profile() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'PROFILE',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          content: Container(
            height: 230,
            child: Column(
              children: [
                CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      currentUser.profileImage.toString(),
                    )),
                const SizedBox(height: 15),
                GetUserName(users.email!),
                const SizedBox(height: 10),
                Text(users.email!),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomePage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2),
                      gradient: const LinearGradient(
                        colors: ColorsLinearGradient,
                      ),
                    ),
                    width: double.infinity,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Sign out',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _sendMessage(ChatMessage chatMessage) async {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      List<Uint8List>? images;
      String question = chatMessage.text;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [File(chatMessage.medias!.first.url).readAsBytesSync()];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen(
        (event) {
          ChatMessage? lastMessage = messages.firstOrNull;
          if (lastMessage != null && lastMessage.user == gemini) {
            lastMessage = messages.removeAt(0);
            String response = event.content!.parts?.fold(
                    "", (previout, current) => "$previout ${current.text}") ??
                "";
            lastMessage.text += response;
            setState(() {
              messages = [lastMessage!, ...messages];
            });
          } else {
            String response = event.content!.parts?.fold(
                    "", (previout, current) => "$previout ${current.text}") ??
                "";
            ChatMessage message = ChatMessage(
                user: geminiUser, createdAt: DateTime.now(), text: response);
            setState(() {
              messages = [message, ...messages];
            });
          }
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Descripbe this picture?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          ),
        ],
      );
      _sendMessage(chatMessage);
    }
  }
}
