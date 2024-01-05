import 'package:three_sixty_kids/data/models/vos/center_item_model.dart';

class CenterResponse {
  final int distance;
  final String keyword;
  final int centerCount;
  final List<CenterItem> centerList;

  CenterResponse({
    required this.distance,
    required this.keyword,
    required this.centerCount,
    required this.centerList,
  });

  factory CenterResponse.fromJson(Map<String, dynamic> json) {
    return CenterResponse(
      distance: json['distance'],
      keyword: json['keyword'],
      centerCount: json['center_count'],
      centerList: (json['center_list'] as List)
          .map((item) => CenterItem.fromJson(item))
          .toList(),
    );
  }
}
