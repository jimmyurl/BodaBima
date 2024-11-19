import 'package:flutter/material.dart';

class UssdService {
  static const String USSD_PREFIX = '*150*00#';

  static Map<String, String> ussdCodes = {
    'checkBalance': '1',
    'viewPlans': '2',
    'makePayment': '3',
    'emergency': '4',
    'support': '5',
  };

  static String generateUssdCode(String action, {Map<String, String>? params}) {
    String baseCode = '$USSD_PREFIX*${ussdCodes[action]}';

    if (params != null) {
      params.forEach((key, value) {
        baseCode += '*$value';
      });
    }

    return baseCode;
  }

  static Future<void> initiateUssdRequest(String code) async {
    try {
      final url = Uri.parse('tel:$code');
      // Launch USSD code using url_launcher
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    } catch (e) {
      print('Error launching USSD: $e');
    }
  }
}
