import 'package:flutter/material.dart';

import '../sevices/auth/auth_sevices.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_field.dart';


class ForgotPwPage extends StatefulWidget {
  const ForgotPwPage({super.key});

  @override
  State<ForgotPwPage> createState() => _ForgotPwPageState();
}

class _ForgotPwPageState extends State<ForgotPwPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    AuthSevices auth = AuthSevices();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Forgot your password ?',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 5),
            Text(
              'Please enter your email.',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 30),
            MyTextField(
              controller: _emailController,
              labelText: 'Your email',
              obscureText: false,
            ),
            //Send pw
            GestureDetector(
              onTap: () {
                auth.forgotPassword(context, _emailController);
              },
              child: MyButton(name: 'Send'),
            ),
          ],
        ),
      ),
    );
  }
}
