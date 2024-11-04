import 'package:flutter/material.dart';
import 'package:shop_nike/widgets/my_button.dart';
import 'package:shop_nike/widgets/my_text_field.dart';
import 'package:u_credit_card/u_credit_card.dart';

class CreditCartPage extends StatefulWidget {
  const CreditCartPage({super.key});

  @override
  State<CreditCartPage> createState() => _CreditCartPageState();
}

class _CreditCartPageState extends State<CreditCartPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _validFromController = TextEditingController();
  final TextEditingController _validThruController = TextEditingController();
  final TextEditingController _cvvNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userController.addListener(() {
      setState(() {});
    });
    _cardController.addListener(() {
      setState(() {});
    });
    _validFromController.addListener(() {
      setState(() {});
    });
    _validThruController.addListener(() {
      setState(() {});
    });
    _cvvNumberController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _userController.dispose();
    _cardController.dispose();
    _validThruController.dispose();
    _validFromController.dispose();
    _cvvNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'C R E D I T   C A R T',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CreditCardUi(
              cardHolderFullName: _userController.text,
              cardNumber: _cardController.text,
              validFrom: _validFromController.text,
              validThru: _validThruController.text,
              topLeftColor: const Color.fromARGB(255, 208, 208, 208),
              doesSupportNfc: true,
              placeNfcIconAtTheEnd: true,
              cardType: CardType.debit,
              cardProviderLogoPosition: CardProviderLogoPosition.right,
              showBalance: true,
              balance: 128.32434343,
              autoHideBalance: true,
              enableFlipping: true,
              cardProviderLogo: SizedBox(
                width: 30,
                child: Image.asset('assets/img/Nike-logo-png-white.png'),
              ),
              cvvNumber: _cvvNumberController.text,
            ),
            const SizedBox(height: 20),
            MyTextField(
              controller: _userController,
              hintText: 'Your Name',
              obscureText: false,
              maxLeng: 30,
              keyboardType: TextInputType.name,
            ),
            MyTextField(
              controller: _cardController,
              hintText: 'Card Number',
              obscureText: true,
              maxLeng: 16,
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    controller: _validFromController,
                    hintText: 'Valid From',
                    obscureText: false,
                    maxLeng: 5,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                Expanded(
                  child: MyTextField(
                    controller: _validThruController,
                    hintText: 'Valid Thru',
                    obscureText: false,
                    maxLeng: 5,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ],
            ),
            MyTextField(
              controller: _cvvNumberController,
              hintText: 'CVV Number',
              obscureText: true,
              maxLeng: 3,
              keyboardType: TextInputType.number,
            ),
            MyButton(name: 'Confirm'),
          ],
        ),
      ),
    );
  }
}
