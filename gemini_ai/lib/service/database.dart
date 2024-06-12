import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatabaseMethods {
  Future addUser(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("User")
        .doc(userId)
        .set(userInfoMap);
  }
}

class GetUserName extends StatefulWidget {
  GetUserName({Key? key});

  @override
  State<GetUserName> createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
  late String documentId;

  @override
  void initState() {
    super.initState();
    // Lấy uid của người dùng đã đăng nhập
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    // Nếu uid không null, gán cho documentId
    if (uid != null) {
      documentId = uid;
    } else {
      // Xử lý trường hợp người dùng không đăng nhập
      // (ví dụ: chuyển hướng đến trang đăng nhập)
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('User');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child:
                  CircularProgressIndicator()); // Hiển thị tiến trình khi đang tải dữ liệu
        }
        if (snapshot.hasError) {
          return Text("Something went wrong"); // Xử lý lỗi nếu có
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Text(
              "Document does not exist"); // Xử lý tài liệu không tồn tại
        }
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        String userName = data['name'];
        return Text(userName); // Hiển thị tên người dùng từ dữ liệu Firestore
      },
    );
  }
}
