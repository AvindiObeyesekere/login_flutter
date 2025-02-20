import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'https://api.ezuite.com/api/External_Api/Mobile_Api/Invoke'; // Corrected URL

  Future<Map<String, dynamic>> login(String username, String password) async {
    final Map<String, dynamic> requestBody = {
      'API_Body': [
        {'Unique_Id': '', 'Pw': password}
      ],
      'Api_Action': 'GetUserData',
      'Company_Code': username,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        // Check for API-specific success (Status_Code 200 in the response)
        if (responseData['Status_Code'] == 200) {
          return responseData; // Return the full successful response
        } else {
          // API-specific error
          print('API Error: ${responseData['Status_Code']} - ${responseData['Message']}');
          return responseData; // Return the API error response
        }
      } else {
        // HTTP error
        print('HTTP Error: ${response.statusCode} - ${response.body}');
        return {
          'Status_Code': response.statusCode,
          'Message': 'HTTP request failed'
        }; // HTTP error
      }
    } catch (e) {
      // Network or other error
      print('Error: $e');
      return {'Status_Code': null, 'Message': 'An error occurred'}; // General error
    }
  }
}