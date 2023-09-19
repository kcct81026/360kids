import 'package:get/get.dart';
import 'package:three_sixty_kids/data/repositories/home_repo.dart';

class HomeController extends GetxController{
  final HomeRepo homeRepo;

  HomeController({required this.homeRepo});

  List<String> _options = [];
  List<String> _centerList = [];
  String _selectedOptions = "";
  bool _isLoading = false;
  String _postalCode = "";

  List<String> get options => _options;
  List<String> get centerList => _centerList;
  bool get isLoading => _isLoading;
  String get selectedOptions => _selectedOptions;
  String get getPostalCode => _postalCode;


  @override
  void onInit() {
    super.onInit();
    fetchOptions();
  }



  Future<void> fetchOptions() async {
    // Simulate an API call
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual API call to fetch options from the server
    List<String> fetchedOptions = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

    _options = fetchedOptions;

    List<String> fetchedOptions1 = ['Center 1', 'Center 2', 'Center 3', 'Center 4','Center 5'];

    _centerList = fetchedOptions1;

    _selectedOptions = _options[0];
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

    // Simulate an API call
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual API call to fetch options from the server
    List<String> fetchedOptions = ['Center 1', 'Center 2', 'Center 3', 'Center 4','Center 5'];

    _centerList = fetchedOptions;
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