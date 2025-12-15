import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:agromax/models/pest_disease_model.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

class PestDiseaseAnalysisService {
  static const String _model = 'gpt-4o-mini';
  static const String _baseUrl = 'https://api.proxyapi.ru/openai/v1';
  static const String _apiKeyEnv = 'sk-4i1NKXLxmr4Ai3vXXFKhbFMn1jf5v9IM'; // We'll use environment variable for security

  // In a real app, you would get this from environment variables or secure storage
  static String get _apiKey {
    // For development purposes we'll provide a placeholder - in a real app,
    // this should be properly configured
    return const String.fromEnvironment('PROXYAPI_KEY', defaultValue: 'sk-4i1NKXLxmr4Ai3vXXFKhbFMn1jf5v9IM');
  }

  Future<AnalysisResult> analyzeImage(XFile imageFile) async {
    try {
      // Read the original image file
      final imageBytes = await imageFile.readAsBytes();

      // Compress the image
      final compressedImageBytes = await _compressImage(imageBytes);
      final base64Image = base64Encode(compressedImageBytes);

      // Prepare the prompt for the AI model
      final String prompt = '''
Analyze this agricultural image and identify any pests or diseases present on the plants.
Provide your analysis in the following JSON format:

{
  "pestName": "Name of the pest or disease",
  "description": "Detailed description of the issue, including what parts of the plant are affected",
  "severity": "Severity level (Minor, Moderate, Major, or Critical)",
  "confidence": "Confidence level as a decimal between 0.0 and 1.0",
  "treatmentRecommendations": "Specific treatment recommendations",
  "preventionTips": "Prevention tips for the future",
  "imageUrl": "URL of the analyzed image (for reference)"
}

If no pests or diseases are detected, respond with:
{
  "pestName": "No Issues Detected",
  "description": "No pests or diseases were detected in the image",
  "severity": "Minor",
  "confidence": 0.9,
  "treatmentRecommendations": "Continue regular monitoring and good agricultural practices",
  "preventionTips": "Maintain proper spacing, watering, and fertilization schedule",
  "imageUrl": "URL of the analyzed image (for reference)"
}
''';

      // Create the OpenAI API instance with ProxyAPI configuration
      final chatModel = ChatOpenAI(
        apiKey: _apiKey,
        baseUrl: _baseUrl, // Base URL for ProxyAPI
        defaultOptions: ChatOpenAIOptions(
          model: _model,
          //temperature: 0.2,
        ),
        // configuration: OpenAIConfiguration(
        //   timeout: const Duration(minutes: 2),
        // ),
      );

      // Create the message with image content
      final message = HumanChatMessage(
        content: ChatMessageContent.multiModal(
          [
            ChatMessageContent.text(prompt),
            ChatMessageContent.image(
              data: base64Image,
              mimeType: 'image/jpeg',
            ),
          ],
        ),
      );

      // Call the model
      final result = await chatModel([message]);

      // Parse the response
      final content = result.content as String;
      final analysisData = jsonDecode(content);

      // Create the analysis result
      final analysis = PestDiseaseAnalysis.fromJson(analysisData);

      return AnalysisResult(
        success: true,
        message: 'Analysis completed successfully',
        analyses: [analysis],
      );
    } catch (e) {
      return AnalysisResult(
        success: false,
        message: 'Error during analysis',
        error: e.toString(),
      );
    }
  }

  // Method to pick an image from camera or gallery
  Future<XFile?> pickImageFromCamera() async {
    final picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.camera);
  }

  Future<XFile?> pickImageFromGallery() async {
    final picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.gallery);
  }

  // Method to compress image before base64 encoding
  Future<Uint8List> _compressImage(Uint8List imageBytes) async {
    try {
      // Decode the image
      final decodedImage = img.decodeImage(imageBytes);
      if (decodedImage == null) {
        throw Exception('Could not decode image');
      }

      // Resize the image if it's too large (keeping aspect ratio)
      // Limit to 1024px on the longest side to optimize for API calls
      final maxDimension = 1024;
      int width = decodedImage.width;
      int height = decodedImage.height;

      if (width > maxDimension || height > maxDimension) {
        if (width > height) {
          height = (height * maxDimension ~/ width);
          width = maxDimension;
        } else {
          width = (width * maxDimension ~/ height);
          height = maxDimension;
        }
      }

      // Resize the image
      final resizedImage = img.copyResize(decodedImage, width: width, height: height);

      // Encode the resized image back to JPEG with quality 80 to further compress
      final compressedBytes = img.encodeJpg(resizedImage, quality: 80);

      return compressedBytes;
    } catch (e) {
      // If compression fails, return original image
      print('Image compression failed: $e');
      return imageBytes;
    }
  }
}