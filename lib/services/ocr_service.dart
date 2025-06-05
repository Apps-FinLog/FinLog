import 'dart:io';
import 'dart:convert'; // For base64Encode
import 'package:flutter/foundation.dart';
import './gemini_service.dart'; // Import your GeminiService

class OcrService {
  final GeminiService _geminiService = GeminiService(); // Instantiate GeminiService

  Future<Map<String, dynamic>> extractTextFromImage(File imageFile) async {
    try {
      final List<int> imageBytes = await imageFile.readAsBytes();
      final String base64Image = base64Encode(imageBytes);

      // Call the new Gemini service method for OCR
      final Map<String, dynamic> extractedData = await _geminiService.processImageForOcr(base64Image);
      return extractedData;
    } catch (e) {
      debugPrint("Error during OCR with Gemini: $e");
      return {"error": "Gagal mengekstrak teks dari gambar menggunakan Gemini: $e"};
    }
  }

  void dispose() {
    // No specific dispose needed for GeminiService here, as it's stateless
  }
}
