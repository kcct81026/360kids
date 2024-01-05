class ClassDetails {
  String classImage;
  String centerName;
  String className;
  List<String> classAgeRange;
  List<String> classCategories;
  List<String> classOperation; // Corrected typo in the field name
  String classDescription;
  int trialFeeAmount;

  ClassDetails({
    required this.classImage,
    required this.centerName,
    required this.className,
    required this.classAgeRange,
    required this.classCategories,
    required this.classOperation,
    required this.classDescription,
    required this.trialFeeAmount,
  });

  factory ClassDetails.fromJson(Map<String, dynamic> json) {
    return ClassDetails(
      classImage: json['class_image'],
      centerName: json['center_name'],
      className: json['class_name'],
      classAgeRange: List<String>.from(json['class_age_range']),
      classCategories: List<String>.from(json['class_categories']),
      classOperation: List<String>.from(json['class_opeartion']), // Corrected typo in the field name
      classDescription: json['class_description'],
      trialFeeAmount: json['trial_fee_amount'],
    );
  }

  Map<String, dynamic> toJson() => {
    'class_image': classImage,
    'center_name': centerName,
    'class_name': className,
    'class_age_range': classAgeRange,
    'class_categories': classCategories,
    'class_opeartion': classOperation, // Corrected typo in the field name
    'class_description': classDescription,
    'trial_fee_amount': trialFeeAmount,
  };
}
