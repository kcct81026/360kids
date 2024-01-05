class CenterItem {
  final int id;
  final String centerName;
  final String centerDescription;
  final String calculateKilometer;
  final String slug;
  final String imageUrl;

  CenterItem({
    required this.id,
    required this.centerName,
    required this.centerDescription,
    required this.calculateKilometer,
    required this.slug,
    required this.imageUrl,
  });

  factory CenterItem.fromJson(Map<String, dynamic> json) {
    return CenterItem(
      id: json['id'],
      centerName: json['center_name'],
      centerDescription: json['center_description'],
      calculateKilometer: json['calculate_kilometer'],
      // Note: Corrected the typo in the JSON key
      slug: json['slug'],
      imageUrl: json['center_image'],
    );
  }
}