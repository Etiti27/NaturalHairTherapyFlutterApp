import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String? _apiKey = dotenv.env['API_KEY']; // Fetch API key from .env

  Future<String> generateResponse(
      String userInput, String predefinedAnswer) async {
    if (_apiKey == null || _apiKey!.isEmpty) {
      if (kDebugMode) {
        print('❌ API Key is missing! Please check your .env file.');
      }
      return 'Error: API key is missing. Please configure it properly.';
    }

    const String apiUrl = 'https://api.openai.com/v1/chat/completions';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
    };

    final body = json.encode({
      'model': 'gpt-4',
      'messages': [
        {
          "role": "system",
          "content": "You are an assistant providing hair health advice."
        },
        {"role": "user", "content": userInput},
        {"role": "assistant", "content": predefinedAnswer},
      ],
      'max_tokens': 70,
      'temperature': 0.7,
    });

    try {
      final response =
          await http.post(Uri.parse(apiUrl), headers: headers, body: body);

      if (response.statusCode == 200) {
        try {
          final data = json.decode(response.body);
          return data['choices'][0]['message']['content'] ??
              'No response from AI.';
        } catch (e) {
          if (kDebugMode) print('❌ JSON Parsing Error: $e');
          return 'Error processing response. Please try again.';
        }
      } else if (response.statusCode == 429) {
        return '⚠️ You have exceeded your OpenAI quota. Please try again later or upgrade your plan.';
      } else {
        if (kDebugMode) {
          print('❌ OpenAI API Error: ${response.statusCode}');
          print('Response Body: ${response.body}');
        }
        return 'Error: Failed to fetch response. Please check your internet or API key.';
      }
    } catch (e) {
      if (kDebugMode) print('❌ Network Error: $e');
      return 'Network error occurred. Please check your connection.';
    }
  }
}
