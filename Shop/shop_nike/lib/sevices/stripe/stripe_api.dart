import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shop_nike/conts.dart';

class StripeService {
  StripeService._();
  static final StripeService instance = StripeService._();

  Future<String?> makePayment(String userName, int amount) async {
    try {
      String? paymentIntentClientSecret =
          await _createPaymentIntent(amount * 100, 'usd');
      if (paymentIntentClientSecret == null) {
        return null;
      }

      // Khởi tạo Payment Sheet với client secret
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: userName,
        ),
      );

      await _processPayment();
    } catch (e) {
      print("Error in makePayment: $e");
    }
    return null;
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": amount,
        "currency": currency,
        "payment_method_types[]": "card",
      };
      var res = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );

      if (res.data != null && res.data['client_secret'] != null) {
        return res.data['client_secret'];
      }
    } catch (e) {
      print("Error in _createPaymentIntent: $e");
    }
    return null;
  }

//Show Payment Sheet
  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print("Payment completed successfully!");
    } catch (e) {
      print("Error in _processPayment: $e");
    }
  }
}
