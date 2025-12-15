import 'package:flutter/material.dart';

class PestDiseaseAnalysis {
  final String pestName;
  final String description;
  final String severity; // 'Minor', 'Moderate', 'Major', 'Critical'
  final double confidence; // 0.0 to 1.0
  final String treatmentRecommendations;
  final String preventionTips;
  final String imageUrl; // URL of the analyzed image

  PestDiseaseAnalysis({
    required this.pestName,
    required this.description,
    required this.severity,
    required this.confidence,
    required this.treatmentRecommendations,
    required this.preventionTips,
    required this.imageUrl,
  });

  factory PestDiseaseAnalysis.fromJson(Map<String, dynamic> json) {
    return PestDiseaseAnalysis(
      pestName: json['pestName'] ?? json['pest_name'] ?? 'Unknown Pest/Disease',
      description: json['description'] ?? 'Description not available',
      severity: json['severity'] ?? 'Moderate',
      confidence: (json['confidence'] ?? 0.5).toDouble(),
      treatmentRecommendations: json['treatmentRecommendations'] ?? json['treatment_recommendations'] ?? 'No treatment recommendations available',
      preventionTips: json['preventionTips'] ?? json['prevention_tips'] ?? 'No prevention tips available',
      imageUrl: json['imageUrl'] ?? json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pestName': pestName,
      'description': description,
      'severity': severity,
      'confidence': confidence,
      'treatmentRecommendations': treatmentRecommendations,
      'preventionTips': preventionTips,
      'imageUrl': imageUrl,
    };
  }
}

class AnalysisResult {
  final bool success;
  final String message;
  final List<PestDiseaseAnalysis>? analyses;
  final String? error;

  AnalysisResult({
    required this.success,
    required this.message,
    this.analyses,
    this.error,
  });

  factory AnalysisResult.fromJson(Map<String, dynamic> json) {
    List<PestDiseaseAnalysis>? analyses;
    if (json['analyses'] != null) {
      analyses = (json['analyses'] as List)
          .map((item) => PestDiseaseAnalysis.fromJson(item))
          .toList();
    }

    return AnalysisResult(
      success: json['success'] ?? false,
      message: json['message'] ?? 'Analysis completed',
      analyses: analyses,
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'analyses': analyses?.map((analysis) => analysis.toJson()).toList(),
      'error': error,
    };
  }
}

enum SeverityLevel {
  minor('Minor', 0.25),
  moderate('Moderate', 0.5),
  major('Major', 0.75),
  critical('Critical', 1.0);

  const SeverityLevel(this.label, this.value);
  final String label;
  final double value;
}

// Helper class for UI display
class PestDiseaseDisplayItem {
  final String title;
  final String description;
  final String severity;
  final double confidence;
  final IconData icon;
  final Color color;

  PestDiseaseDisplayItem({
    required this.title,
    required this.description,
    required this.severity,
    required this.confidence,
    required this.icon,
    required this.color,
  });

  factory PestDiseaseDisplayItem.fromAnalysis(PestDiseaseAnalysis analysis) {
    // Determine icon based on pest name
    IconData icon = _getIconForPest(analysis.pestName);
    // Determine color based on severity
    Color color = _getColorForSeverity(analysis.severity);

    return PestDiseaseDisplayItem(
      title: analysis.pestName,
      description: analysis.description,
      severity: analysis.severity,
      confidence: analysis.confidence,
      icon: icon,
      color: color,
    );
  }

  static IconData _getIconForPest(String pestName) {
    final lowerPestName = pestName.toLowerCase();
    if (lowerPestName.contains('aphid') || lowerPestName.contains('bug') || lowerPestName.contains('insect')) {
      return Icons.bug_report_outlined;
    } else if (lowerPestName.contains('mildew') || lowerPestName.contains('fungus') || lowerPestName.contains('disease')) {
      return Icons.water_drop_outlined;
    } else if (lowerPestName.contains('worm') || lowerPestName.contains('caterpillar')) {
      return Icons.linear_scale_outlined;
    } else if (lowerPestName.contains('mite') || lowerPestName.contains('spider')) {
      return Icons.psychology_outlined;
    } else if (lowerPestName.contains('fly') || lowerPestName.contains('whitefly')) {
      return Icons.psychology_alt_outlined;
    } else if (lowerPestName.contains('mealy')) {
      return Icons.local_florist_outlined;
    } else {
      return Icons.bug_report_outlined;
    }
  }

  static Color _getColorForSeverity(String severity) {
    switch (severity.toLowerCase()) {
      case 'minor':
        return const Color(0xFF2ECC71); // Green
      case 'moderate':
        return const Color(0xFFF1C40F); // Yellow
      case 'major':
        return const Color(0xFFE67E22); // Orange
      case 'critical':
        return const Color(0xFFE74C3C); // Red
      default:
        return const Color(0xFF95A5A6); // Gray
    }
  }
}