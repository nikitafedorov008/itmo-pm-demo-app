import 'package:flutter/material.dart';

class FieldNoteCategory {
  final String value;
  final String label;
  final IconData icon;

  FieldNoteCategory(this.value, this.label, this.icon);
}

class FieldNoteStatus {
  final String value;
  final String label;
  final Color color;

  FieldNoteStatus(this.value, this.label, this.color);
}

class FieldNote {
  final int id;
  final int zoneId;
  final String category; // 'inspection', 'disease', 'fertilization', etc.
  final String title;
  final String content;
  final String status; // 'pending', 'in_progress', 'completed', etc.
  final int rating; // 1-5 stars
  final DateTime date;
  final String imageUrl; // Optional image attachment
  final Map<String, dynamic>? pestDiseaseAnalysis; // Optional pest/disease analysis results

  FieldNote({
    required this.id,
    required this.zoneId,
    required this.category,
    required this.title,
    required this.content,
    required this.status,
    required this.rating,
    required this.date,
    this.imageUrl = '',
    this.pestDiseaseAnalysis,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'zoneId': zoneId,
      'category': category,
      'title': title,
      'content': content,
      'status': status,
      'rating': rating,
      'date': date.toIso8601String(),
      'imageUrl': imageUrl,
      'pestDiseaseAnalysis': pestDiseaseAnalysis,
    };
  }

  factory FieldNote.fromJson(Map<String, dynamic> json) {
    return FieldNote(
      id: json['id'] ?? 0,
      zoneId: json['zoneId'] ?? 0,
      category: json['category'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      status: json['status'] ?? 'pending',
      rating: json['rating'] ?? 0,
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
      imageUrl: json['imageUrl'] ?? '',
      pestDiseaseAnalysis: json['pestDiseaseAnalysis'],
    );
  }
}

class FieldAnalytics {
  final int zoneId;
  final DateTime date;
  final double ndviValue;
  final double moistureLevel;
  final double temperature;
  final double growthRate;
  final String healthStatus; // 'Good', 'Fair', 'Poor'
  final List<String> detectedIssues;
  final String imageUrl; // Image for analysis

  FieldAnalytics({
    required this.zoneId,
    required this.date,
    required this.ndviValue,
    required this.moistureLevel,
    required this.temperature,
    required this.growthRate,
    required this.healthStatus,
    required this.detectedIssues,
    this.imageUrl = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'zoneId': zoneId,
      'date': date.toIso8601String(),
      'ndviValue': ndviValue,
      'moistureLevel': moistureLevel,
      'temperature': temperature,
      'growthRate': growthRate,
      'healthStatus': healthStatus,
      'detectedIssues': detectedIssues,
      'imageUrl': imageUrl,
    };
  }

  factory FieldAnalytics.fromJson(Map<String, dynamic> json) {
    return FieldAnalytics(
      zoneId: json['zoneId'] ?? 0,
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
      ndviValue: (json['ndviValue'] ?? 0.0).toDouble(),
      moistureLevel: (json['moistureLevel'] ?? 0.0).toDouble(),
      temperature: (json['temperature'] ?? 0.0).toDouble(),
      growthRate: (json['growthRate'] ?? 0.0).toDouble(),
      healthStatus: json['healthStatus'] ?? 'Fair',
      detectedIssues: List<String>.from(json['detectedIssues'] ?? []),
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}