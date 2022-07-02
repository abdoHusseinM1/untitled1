import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:untitled/shared/components/constants.dart';

class EmailAPI{

  static String serviceId = 'service_1h6r9kq';
  static String templateId = 'template_v92lavn';
  static String publicKey = 'Z-yNRf77y1WrDPCmS';

  static Future<http.Response> sendEmail ({
    required toName , required toEmail ,
  }) async {
    var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    return await http.post(
        url,
      headers: getHeaders(),
      body: jsonEncode({
        'service_id': serviceId,
        'template_id' : templateId,
        'user_id' : publicKey,
        'template_params' :{
          'to_name' : toName,
          'to_email' : toEmail,
        }
      })
    );
  }
}