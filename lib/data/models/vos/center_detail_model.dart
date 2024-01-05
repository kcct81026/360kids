import 'package:three_sixty_kids/data/models/vos/class_detail_model.dart';

// Root class representing the entire JSON structure
class CenterDetail {
  String centerName;
  List<String> centerOperation;
  List<String> centerAgeRange;
  List<String> centerCategories;
  String centerDescription;
  String centerImage;
  List<ClassItem> classList;

  CenterDetail({
    required this.centerName,
    required this.centerOperation,
    required this.centerAgeRange,
    required this.centerCategories,
    required this.centerDescription,
    required this.centerImage,
    required this.classList,
  });

  factory CenterDetail.fromJson(Map<String, dynamic> json) {
    return CenterDetail(
      centerName: json['center_name'],
      centerOperation: List<String>.from(json['center_operation']),
      centerAgeRange: List<String>.from(json['center_age_range']),
      centerCategories: List<String>.from(json['center_categories']),
      centerDescription: json['center_description'],
      centerImage: json['center_image'],
      classList: (json['class_list'] as List)
          .map((i) => ClassItem.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'center_name': centerName,
    'center_operation': centerOperation,
    'center_age_range': centerAgeRange,
    'center_categories': centerCategories,
    'center_description': centerDescription,
    'center_image': centerImage,
    'class_list': classList.map((e) => e.toJson()).toList(),
  };
}

// Class representing each class details
class ClassItem {
  String className;
  String classImage;
  String classDescription;
  List<String> classAgeRange;
  List<String> classCategories;

  ClassItem({
    required this.className,
    required this.classImage,
    required this.classDescription,
    required this.classAgeRange,
    required this.classCategories,
  });

  factory ClassItem.fromJson(Map<String, dynamic> json) {
    return ClassItem(
      className: json['class_name'],
      classImage: json['class_image'],
      classDescription: json['class_description'],
      classAgeRange: List<String>.from(json['class_age_range']),
      classCategories: List<String>.from(json['class_categories']),
    );
  }

  Map<String, dynamic> toJson() => {
    'class_name': className,
    'class_image': classImage,
    'class_description': classDescription,
    'class_age_range': classAgeRange,
    'class_categories': classCategories,
  };
}



