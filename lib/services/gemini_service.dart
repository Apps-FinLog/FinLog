// lib/services/gemini_service.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import flutter_dotenv

class GeminiService {
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';

  Future<Map<String, dynamic>> parseExpense(String userInput) async {
    final String prompt = """
You are an expense journal assistant. Your task is to parse the following user input and extract the expense details into a JSON object. If a field is not explicitly mentioned, infer it if possible (e.g., today's date for 'date', 'cash' for 'paymentMethod' if not specified), otherwise omit it or use a reasonable default. make the category tailored to indonesia users, usually involved in food, transportation, some of the foods are 'makan', 'minum', 'snack', 'kopi', 'makanan berat', 'makanan ringan', 'transportasi', 'belanja', 'hiburan', 'tagihan', 'lainnya'. If the user input is not clear or does not contain enough information, return an empty JSON object.

Expected JSON structure:
{
  "amount": <number>,
  "currency": <string, e.g., "IDR">,
  "category": <string>,
  "description": <string>,
  "date": <string, YYYY-MM-DD, infer today's date if not specified>,
  "paymentMethod": <string, infer "cash" if not specified>
}

If the user input is not clear or does not contain enough information to extract all fields, return an empty JSON object or a JSON object with only the fields that could be confidently extracted.

User input: "$userInput"

Please provide ONLY the JSON object. Do not include any additional text or markdown outside the JSON block.
""";

    final Uri uri = Uri.parse('$_baseUrl?key=${dotenv.env['GEMINI_API_KEY']}');

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'contents': [
            {
              'parts': [
                {'text': prompt}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        if (responseBody['candidates'] != null && responseBody['candidates'].isNotEmpty) {
          final String jsonString = responseBody['candidates'][0]['content']['parts'][0]['text'];
          // Gemini might return markdown code block, try to extract pure JSON
          final String cleanJsonString = _extractJsonFromMarkdown(jsonString);
          return json.decode(cleanJsonString);
        } else {
          throw Exception('Gemini API did not return any candidates.');
        }
      } else {
        throw Exception('Failed to call Gemini API: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      debugPrint('Error parsing expense with Gemini: ${e.toString()}');
      rethrow; // Re-throw to be handled by the calling widget
    }
  }

  Future<Map<String, dynamic>> processImageForOcr(String base64Image) async {
    final String prompt = """
You are an OCR assistant. Your task is to extract bill details from the provided image and format them into a JSON object.
Infer values if not explicitly mentioned, or use reasonable defaults.

Expected JSON structure:
{
  "displayDate": "<string, DD/MM/YYYY, infer today's date if not specified>",
  "displayTime": "<string, HH:MM:SS, infer current time if not specified>",
  "billItems": [
    {
      "name": "<string>",
      "price": <number>,
      "quantity": <number>,
      "total": <number>
    }
  ],
  "subtotal": <number>,
  "pajak": <number>,
  "diskon": <number>,
  "lainnya": <number>,
  "jumlahTotal": <number>
}

If the image does not contain enough information to extract all fields, return a JSON object with only the fields that could be confidently extracted. For billItems, if no items are found, return an empty array.

Please provide ONLY the JSON object. Do not include any additional text or markdown outside the JSON block.
""";

    final Uri uri = Uri.parse('$_baseUrl?key=${dotenv.env['GEMINI_API_KEY']}');

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'contents': [
            {
              'parts': [
                {'text': prompt},
                {
                  'inlineData': {
                    'mimeType': 'image/jpeg', // Assuming JPEG. Adjust if other formats are expected.
                    'data': base64Image,
                  }
                }
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        if (responseBody['candidates'] != null && responseBody['candidates'].isNotEmpty) {
          final String jsonString = responseBody['candidates'][0]['content']['parts'][0]['text'];
          final String cleanJsonString = _extractJsonFromMarkdown(jsonString);
          debugPrint('Gemini OCR Raw Response: $jsonString'); // Log the raw response
          debugPrint('Gemini OCR Cleaned JSON: $cleanJsonString'); // Log the cleaned JSON
          return json.decode(cleanJsonString);
        } else {
          throw Exception('Gemini API did not return any candidates for OCR.');
        }
      } else {
        throw Exception('Failed to call Gemini API for OCR: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      debugPrint('Error processing image with Gemini for OCR: ${e.toString()}');
      rethrow;
    }
  }

  String _extractJsonFromMarkdown(String text) {
    final RegExp regex = RegExp(r'```json\s*([\s\S]*?)\s*```');
    final Match? match = regex.firstMatch(text);
    if (match != null && match.groupCount >= 1) {
      return match.group(1)!;
    }
    return text; // Return original text if no markdown block found
  }
}
