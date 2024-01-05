import 'package:get/get.dart';
import 'package:three_sixty_kids/data/models/vos/center_detail_model.dart';
import 'package:three_sixty_kids/data/repositories/center_detail_repo.dart';
import 'package:three_sixty_kids/data/repositories/home_repo.dart';

class CenterDetailController extends GetxController{
  final CenterDetailRepo centerDetailRepo;

  CenterDetailController({required this.centerDetailRepo});

  bool _isLoading = false;
  late CenterDetail _centerDetail;


  bool get isLoading => _isLoading;
  CenterDetail get centerDetail => _centerDetail;


  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getCenterDetail(int id) async {
    _isLoading = true;
    update();

    _centerDetail = await centerDetailRepo.apiClient.getCenterDetail();

    _isLoading = false;
    update();
  }

  void setLoading(bool newValue) {
    _isLoading = newValue;
    update();
  }
}