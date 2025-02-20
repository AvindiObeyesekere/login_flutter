import 'dart:convert';
import 'package:http/http.dart' as http;
import 'database_helper.dart'; // Assuming DatabaseHelper is in a separate file

class ApiService {
  final String apiUrl = 'https://api.ezuite.com/api/External_Api/Mobile_Api/Invoke';
  final DatabaseHelper _dbHelper = DatabaseHelper();

  // Login and save user data
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

        if (responseData['Status_Code'] == 200) {
          List<dynamic> responseBody = responseData['Response_Body'];
          if (responseBody.isNotEmpty) {
            // Save user data to database
            await _dbHelper.insertUser(responseBody[0]);
          }
          return responseData;
        } else {
          print('API Error: ${responseData['Status_Code']} - ${responseData['Message']}');
          return responseData;
        }
      } else {
        print('HTTP Error: ${response.statusCode} - ${response.body}');
        return {'Status_Code': response.statusCode, 'Message': 'HTTP request failed'};
      }
    } catch (e) {
      print('Error: $e');
      return {'Status_Code': null, 'Message': 'An error occurred'};
    }
  }
}
