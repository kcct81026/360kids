import 'package:get/get.dart';
import 'package:three_sixty_kids/data/models/responses/blog_response.dart';
import 'package:three_sixty_kids/data/models/vos/blog_detail_model.dart';
import 'package:three_sixty_kids/data/models/vos/center_detail_model.dart';
import 'package:three_sixty_kids/data/repositories/article_detail_repo.dart';
import 'package:three_sixty_kids/data/repositories/center_detail_repo.dart';
import 'package:three_sixty_kids/data/repositories/home_repo.dart';

class ArticleDetailController extends GetxController{
  final ArticleDetailRepo articleDetailRepo;

  ArticleDetailController({required this.articleDetailRepo});

  bool _isLoading = false;
  late BlogDetails _article;


  bool get isLoading => _isLoading;
  BlogDetails get articleDetail => _article;


  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getBlogDetail(int id) async {
    _isLoading = true;
    update();

    _article = await articleDetailRepo.apiClient.getBlogDetails(id);

    _isLoading = false;
    update();
  }

  void setLoading(bool newValue) {
    _isLoading = newValue;
    update();
  }
}