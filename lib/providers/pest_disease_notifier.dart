import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:agromax/models/pest_disease_model.dart';
import 'package:agromax/services/pest_disease_analysis_service.dart';

class PestDiseaseNotifier with ChangeNotifier {
  final PestDiseaseAnalysisService _analysisService = PestDiseaseAnalysisService();
  
  bool _isLoading = false;
  List<PestDiseaseDisplayItem> _analyses = [];
  String? _error;

  bool get isLoading => _isLoading;
  List<PestDiseaseDisplayItem> get analyses => _analyses;
  String? get error => _error;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setAnalyses(List<PestDiseaseDisplayItem> analyses) {
    _analyses = analyses;
    notifyListeners();
  }

  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  void clearAnalyses() {
    _analyses = [];
    _error = null;
    notifyListeners();
  }

  Future<void> analyzeImageFromCamera() async {
    setLoading(true);
    setError(null);

    try {
      final XFile? image = await _analysisService.pickImageFromCamera();
      if (image != null) {
        await _performAnalysis(image);
      } else {
        setError('No image selected');
      }
    } catch (e) {
      setError('Failed to access camera: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  Future<void> analyzeImageFromGallery() async {
    setLoading(true);
    setError(null);

    try {
      final XFile? image = await _analysisService.pickImageFromGallery();
      if (image != null) {
        await _performAnalysis(image);
      } else {
        setError('No image selected');
      }
    } catch (e) {
      setError('Failed to access gallery: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  Future<void> _performAnalysis(XFile image) async {
    try {
      final result = await _analysisService.analyzeImage(image);

      if (result.success && result.analyses != null) {
        final displayItems = result.analyses!
            .map((analysis) => PestDiseaseDisplayItem.fromAnalysis(analysis))
            .toList();

        setAnalyses(displayItems);
      } else {
        setError(result.error ?? 'Analysis failed');
      }
    } catch (e) {
      setError('Analysis error: ${e.toString()}');
    }
  }

  // Helper method to add a mock analysis for testing
  void addMockAnalysis() {
    final mockAnalysis = PestDiseaseDisplayItem(
      title: 'Aphid Infestation',
      description: 'Small green insects on the leaves causing yellowing',
      severity: 'Moderate',
      confidence: 0.85,
      icon: Icons.bug_report_outlined,
      color: const Color(0xFFE74C3C),
    );
    
    _analyses.add(mockAnalysis);
    notifyListeners();
  }
}