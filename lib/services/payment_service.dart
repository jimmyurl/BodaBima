// Create a new file: lib/services/payment_service.dart

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum PaymentProvider { mpesa, tigoPesa, airtelMoney }

class PaymentService {
  final String baseUrl = 'your-payment-gateway-url';
  final storage = FlutterSecureStorage();

  Future<Map<String, dynamic>> initiatePayment({
    required String phoneNumber,
    required double amount,
    required PaymentProvider provider,
    required String reference,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/initiate'),
        body: {
          'phoneNumber': phoneNumber,
          'amount': amount.toString(),
          'provider': provider.toString(),
          'reference': reference,
        },
      );

      if (response.statusCode == 200) {
        // Store transaction reference for status check
        await storage.write(
          key: 'transaction_$reference',
          value: DateTime.now().toIso8601String(),
        );
        return {'success': true, 'reference': reference};
      }
      return {'success': false, 'error': 'Payment initiation failed'};
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> checkPaymentStatus(String reference) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/status/$reference'),
      );
      return {'success': true, 'status': response.body};
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }
}
