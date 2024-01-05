import 'package:get/get.dart';
import 'package:three_sixty_kids/data/api/api_client.dart';
import 'package:three_sixty_kids/data/controllers/article_detail_controller.dart';
import 'package:three_sixty_kids/data/controllers/center_detail_controller.dart';
import 'package:three_sixty_kids/data/controllers/class_detail_controller.dart';
import 'package:three_sixty_kids/data/controllers/dialog_controller.dart';
import 'package:three_sixty_kids/data/controllers/home_controller.dart';
import 'package:three_sixty_kids/data/controllers/join_center_controller.dart';
import 'package:three_sixty_kids/data/repositories/article_detail_repo.dart';
import 'package:three_sixty_kids/data/repositories/center_detail_repo.dart';
import 'package:three_sixty_kids/data/repositories/class_detail_repo.dart';
import 'package:three_sixty_kids/data/repositories/dialo_repo.dart';
import 'package:three_sixty_kids/data/repositories/home_repo.dart';
import 'package:three_sixty_kids/data/repositories/join_center_repo.dart';
import 'package:three_sixty_kids/utils/app_constants.dart';


Future<void> init() async{

  /// API CLIENT
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // Repos
  Get.lazyPut(() => HomeRepo(apiClient: Get.find()));
  Get.lazyPut(() => CenterDetailRepo(apiClient: Get.find()));
  Get.lazyPut(() => ClassDetailRepo(apiClient: Get.find()));
  Get.lazyPut(() => JoinCenterRepo(apiClient: Get.find()));
  Get.lazyPut(() => DialogRepo(apiClient: Get.find()));
  Get.lazyPut(() => ArticleDetailRepo(apiClient: Get.find()));


  // Controllers
  Get.lazyPut(() => HomeController(homeRepo: Get.find()));
  Get.lazyPut(()=> DialogController(dialogRepo: Get.find()));
  Get.lazyPut(() => CenterDetailController(centerDetailRepo: Get.find()));
  Get.lazyPut(() => ClassDetailController(classDetailRepo: Get.find()));
  Get.lazyPut(() => JoinCenterController(centerRepo: Get.find()));
  Get.lazyPut(() => DialogController(dialogRepo: Get.find()));
  Get.lazyPut(() => ArticleDetailController(articleDetailRepo: Get.find()));

}