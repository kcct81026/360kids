import 'package:get/get.dart';
import 'package:three_sixty_kids/data/models/responses/blog_response.dart';
import 'package:three_sixty_kids/data/models/responses/center_response.dart';
import 'package:three_sixty_kids/data/models/vos/center_item_model.dart';
import 'package:three_sixty_kids/data/repositories/home_repo.dart';

class HomeController extends GetxController{
  final HomeRepo homeRepo;

  HomeController({required this.homeRepo});

  List<String> _options = [];
  List<CenterItem> _centerList = [];
  List<Article> _articleList = [];
  late CenterResponse _centerResponse;
  String _selectedOptions = "";
  bool _isLoading = false;
  String _postalCode = "";

  List<String> get options => _options;
  List<CenterItem> get centerList => _centerList;
  List<Article> get articleList => _articleList;
  CenterResponse get centerResponse => _centerResponse;

  bool get isLoading => _isLoading;
  String get selectedOptions => _selectedOptions;
  String get getPostalCode => _postalCode;


  @override
  void onInit() {
    super.onInit();
    //fetchOptions();
    fetchDistances();
    fetchBlogList();
  }

  Future<void> fetchDistances() async {
    _options = await homeRepo.apiClient.loadDistanceJson();
    update();
    _selectedOptions = _options[0];
    update();
  }

  Future<void> fetchBlogList() async {
    BlogResponse blogResponse = await homeRepo.apiClient.getBlogList();
    update();
    _articleList = blogResponse.articles;
    update();
  }

  void updateSelectedValue(String newValue) {
    _selectedOptions = newValue;
    update();
  }


  Future<void> searchList(String postalCode) async {
    _isLoading = true;
    update();
    _postalCode = postalCode;

    _centerResponse = await homeRepo.apiClient.getSearchCenterList();
    _centerList = _centerResponse.centerList;

    _isLoading = false;
    update();
  }


  void clearSearch(){
    _centerList = [];
    _postalCode = "";
    update();
  }

  void setLoading(bool newValue) {
    _isLoading = newValue;
    update();
  }
}