import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

var _apiKey = dotenv.env['API_KEY'];

class OpenAIService {
  // final String _apiKey = 'your-openai-api-key'; // Replace with your actual OpenAI API key

  Future<String> generateResponse(
      String userInput, String predefinedAnswer) async {
    const String apiUrl = 'https://api.openai.com/v1/chat/completions';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
    };

    final body = json.encode({
      'model': 'gpt-4', // Use 'gpt-4' if you have access
      'messages': [
        {
          "role": "system",
          "content":
              "You are an assistant providing hair health advice. Encourage users to book a consultation appointment with Janine, access e-books, and explore other resources available for natural hair care. Provide concise and actionable advice in 50 words."
        },
        {"role": "user", "content": userInput},
        {"role": "assistant", "content": predefinedAnswer},
      ],
      'max_tokens': 70, // Reduced token limit to manage usage
      'temperature': 0.7,
    });

    try {
      final response =
          await http.post(Uri.parse(apiUrl), headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String answer = data['choices'][0]['message']['content'];
        return answer;
      } else if (response.statusCode == 429) {
        // Handle insufficient quota error
        print(
            'You have exceeded your current quota. Please check your plan and billing details.');
        return 'You have exceeded your current quota. Please try again later or upgrade your plan.';
      } else {
        // Print response details for debugging
        print(
            'Failed to load suggestions from OpenAI API. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        throw Exception('Failed to load suggestions from OpenAI API');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
