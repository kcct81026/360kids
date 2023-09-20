import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/models/checkbox_model.dart';
import 'package:three_sixty_kids/data/repositories/home_repo.dart';
import 'package:three_sixty_kids/data/repositories/join_center_repo.dart';
import 'package:three_sixty_kids/utils/valid_checker.dart';

class JoinCenterController extends GetxController{

  final JoinCenterRepo centerRepo;
  JoinCenterController({required this.centerRepo});


  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPhoneController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  bool _isLoading = false;
  bool _hasError = false;
  bool _isAgeSelected = true;
  bool _isCategorySelected = true;
  List<CheckboxModel> _ageList = [];
  List<CheckboxModel> _categoryList = [];

  List<CheckboxModel> get ageList => _ageList;
  List<CheckboxModel> get categoryList => _categoryList;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  bool get isAgeSelected => _isAgeSelected;
  bool get isCategorySelected => _isCategorySelected;
  String getName() => nameController.text;
  String getAddress() => addressController.text;
  String getPhone() => phoneController.text;
  String getPostalCode() => postalCodeController.text;
  String getEmail() => emailController.text;
  String getUserEmail() => userEmailController.text;
  String getUserPhone() => userPhoneController.text;
  String getUserName() => userNameController.text;


  bool isTextEmpty(text) => text.trim().isEmpty;
  bool isValidNumber(text) => ValidChecker.isValidNumber(text);
  bool isValidEmail(text) => ValidChecker.isValidEmail(text);

  @override
  void onInit() {
    super.onInit();
    //fetchAgeRatesCheckboxesFromServer();
  }






  Future<void> fetchAgeRatesCheckboxesFromServer() async {
    // Simulate an API call

    _isLoading = true;
    update();
    await Future.delayed(Duration(seconds: 2));

    _ageList = [
      CheckboxModel(id: 1, label: "6 months - 12 months"),
      CheckboxModel(id: 2, label: "12 months - 24 months"),
      CheckboxModel(id: 3, label: "2 years - 12 years"),
      CheckboxModel(id: 4, label: "4 years - 6 years"),
      CheckboxModel(id: 5, label: "Above 7 years"),

    ];

    _categoryList = [
      CheckboxModel(id: 1, label: "Art & Craft"),
      CheckboxModel(id: 2, label: "Phonics & English"),
      CheckboxModel(id: 3, label: "Taekwondo"),
      CheckboxModel(id: 4, label: "Soft Skills"),
      CheckboxModel(id: 5, label: "3D Abaus & Creative Maths"),
      CheckboxModel(id: 6, label: "Chinese"),
      CheckboxModel(id: 7, label: "Swimming"),
      CheckboxModel(id: 8, label: "Coding & Program"),
      CheckboxModel(id: 9, label: "STEM"),
      CheckboxModel(id: 10, label: "Multi-Sports"),
      CheckboxModel(id: 11, label: "Ballet"),
      CheckboxModel(id: 12, label: "Musical Instrument"),
    ];

    _isLoading = false;
    update();
  }

  bool isAnyAgeListCheckboxSelected() {
    _isAgeSelected = _ageList.any((checkbox) => checkbox.isSelected);
    update();
    return _isAgeSelected;
  }

  bool isAnyCategoryListCheckboxSelected() {
    _isCategorySelected = _categoryList.any((checkbox) => checkbox.isSelected);
    update();
    return _isCategorySelected;
  }


  void updateErrorValue(bool newValue){
    print("updated updated update $newValue");
    _hasError  =  newValue;
    update();
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
  void updateCategoryCheckbox(int id, bool isSelected) {
    for (int i = 0; i < _categoryList.length; i++) {
      if (_categoryList[i].id == id) {
        _categoryList[i].isSelected = isSelected;
        isAnyCategoryListCheckboxSelected();
        update(); // Update the state when a matching element is found
        break; // Exit the loop once the element is updated
      }
    }
  }

  String getErrorText(String text, TextInputType type, String hint){
    if(type == TextInputType.text){
      return text.trim().isEmpty ? "* Please enter ${hint.toLowerCase()}" : "";
    }
    else if(type == TextInputType.number){
      return text.trim().isEmpty ? "* Please enter ${hint.toLowerCase()}" :
       (!ValidChecker.isValidNumber(text.trim()) ? "* Please enter valid number" : "");
    }
    else if(type == TextInputType.emailAddress){
      return text.trim().isEmpty ? "* Please enter ${hint.toLowerCase()}" :
      (!ValidChecker.isValidEmail(text.trim()) ? "* Please enter valid email" : "");
    }
    return "";
  }



}