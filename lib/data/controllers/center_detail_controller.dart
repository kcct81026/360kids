import 'package:get/get.dart';
import 'package:three_sixty_kids/data/repositories/center_detail_repo.dart';
import 'package:three_sixty_kids/data/repositories/home_repo.dart';

class CenterDetailController extends GetxController{
  final CenterDetailRepo centerDetailRepo;

  CenterDetailController({required this.centerDetailRepo});

  List<String> _cateogryList = [];
  bool _isLoading = false;

  List<String> get cateogryList => _cateogryList;
  bool get isLoading => _isLoading;


  @override
  void onInit() {
    super.onInit();
  }



  Future<void> fetchOptions(int id) async {
    _isLoading = true;
    update();
    // Simulate an API call
    await Future.delayed(Duration(seconds: 1));

    // Replace this with your actual API call to fetch options from the server
    List<String> fetchedOptions = ['Category 1', 'Cateory 2', 'Category 3',];

    _cateogryList = fetchedOptions;
    _isLoading = false;
    update();
  }

  void setLoading(bool newValue) {
    _isLoading = newValue;
    update();
  }
}