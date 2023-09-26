import 'package:get/get.dart';
import 'package:three_sixty_kids/data/models/checkbox_model.dart';
import 'package:three_sixty_kids/data/repositories/center_detail_repo.dart';
import 'package:three_sixty_kids/data/repositories/dialo_repo.dart';
import 'package:three_sixty_kids/data/repositories/home_repo.dart';

class DialogController extends GetxController{
  final DialogRepo dialogRepo;

  DialogController({required this.dialogRepo});

  List<CheckboxModel> _ageList = [];
  String _name = "";
  String _kidName = "";
  String _phone = "";
  String _kidAge = "";
  bool _isAgeSelected = true;


  List<CheckboxModel> get ageList => _ageList;
  bool get isAgeSelected => _isAgeSelected;
  String get name => _name;
  String get kidAge => _kidAge;
  String get kidName => _kidName;
  String get phone => _phone;



  @override
  void onInit() {
    super.onInit();
  }

// Add your HTTP request function here
  Future<void> sendEnquiryToServer() async {
    await Future.delayed(Duration(seconds: 2));

    // Make your HTTP request here
    // You can use a package like 'http' to make the request
    // Example:
    // final response = await http.post(
    //   Uri.parse('https://your-api-endpoint.com/enquiry'),
    //   body: {
    //     'name': name,
    //     'phone': phone,
    //     'kidName': kidName,
    //     'kidAge': kidAge,
    //   },
    // );
  }

  Future<void> fetchAgeRatesCheckboxesFromServer() async {
    // Simulate an API call
    await Future.delayed(Duration(seconds: 2));

    _ageList = [
      CheckboxModel(id: 1, label: "6 months - 12 months"),
      CheckboxModel(id: 2, label: "12 months - 24 months"),
      CheckboxModel(id: 3, label: "2 years - 12 years"),
      CheckboxModel(id: 4, label: "4 years - 6 years"),
      CheckboxModel(id: 5, label: "Above 7 years"),

    ];
  }

  bool isAnyAgeListCheckboxSelected() {
    _isAgeSelected = _ageList.any((checkbox) => checkbox.isSelected);
    update();
    return _isAgeSelected;
  }

  void updateAgeCheckbox(int id, bool isSelected) {
    for (int i = 0; i < _ageList.length; i++) {
      if (_ageList[i].id == id) {
        _ageList[i].isSelected = isSelected;
        isAnyAgeListCheckboxSelected();
        update(); // Update the state when a matching element is found
        break; // Exit the loop once the element is updated
      }
    }
  }

  void setPhoneAndName(String name, String phone){
    _name = name;
    _phone = phone;
    update();
  }

  void setKidNameAndAge(String name, String age){
    _kidName = name;
    _kidAge = age ;
    update();
  }



}