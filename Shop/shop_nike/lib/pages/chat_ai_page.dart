import 'dart:io';
import 'dart:typed_data';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_nike/models/shoes.dart';

import '../sevices/firestore/cloud_firestore.dart';

class ChatAiPage extends StatefulWidget {
  const ChatAiPage({super.key});

  @override
  State<ChatAiPage> createState() => _ChatAiPageState();
}

class _ChatAiPageState extends State<ChatAiPage> {
  final users = FirebaseAuth.instance.currentUser!;
  bool isChatStarted = false;

  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(
    id: '0',
    firstName: 'User',
    profileImage:
        'https://static.vecteezy.com/system/resources/previews/019/879/186/non_2x/user-icon-on-transparent-background-free-png.png',
  );
  ChatUser geminiUser = ChatUser(
      id: '1',
      firstName: 'Nike Store',
      profileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfdreJYfFSFATt4IWOVQ0yBlZrhJgM4pX5rGYDBfwOZQ3VwAtuCwbovoVATLsDF4tmhtI&usqp=CAU');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'N I K E    S T O R E    A I',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: isChatStarted ? _buildChatUI() : _buildWelcomeScreen(),
    );
  }

  Widget _buildWelcomeScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://cdn-icons-png.flaticon.com/512/4712/4712109.png",
            width: 120,
            height: 120,
          ),
          const SizedBox(height: 20),
          const Text(
            "Welcome to NIKE STORE AI!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isChatStarted = true;
              });
              _sendInitialMessage();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: Colors.black,
            ),
            child: const Text(
              "Start",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendInitialMessage() async {
    final CloudFirestoreService _firestore = CloudFirestoreService();

    try {
      List<Shoe> featShoe = await _firestore.getShoes();

      if (featShoe.isEmpty) {
        print(" Không có sản phẩm nào từ Firestore!");
        return;
      }

      String shoeList = featShoe
          .map((shoe) => "- ${shoe.names}, giá: ${shoe.price}đ")
          .join("\n");
      String initialText =
          "Bạn là nhân viên bán giày của Nike. Khi khách hàng ghé vào cửa hàng, nhiệm vụ đầu tiên của bạn là **chỉ chào hỏi họ** một cách thân thiện."
          "🚫 Không giới thiệu sản phẩm ngay lập tức."
          "✅ Chỉ giới thiệu sản phẩm khi khách hàng hỏi hoặc bày tỏ mong muốn mua giày."
          "Bây giờ, hãy gửi một lời chào thân thiện mà không kèm theo thông tin sản phẩm.\n"
          "Đây là danh sách sản phẩm $shoeList";

      gemini.streamGenerateContent(initialText).listen(
        (event) {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";

          if (response.isNotEmpty) {
            ChatMessage message = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: response,
            );

            setState(() {
              messages = [message, ...messages];
            });
          }
        },
      );
    } catch (e) {
      print("Lỗi khi lấy dữ liệu Firestore hoặc gửi request: $e");
    }
  }

  Widget _buildChatUI() {
    return Container(
      color: const Color.fromARGB(255, 199, 198, 198),
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
