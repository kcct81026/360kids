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
  bool _isLoading = false;
  bool _hasError = false;
  List<CheckboxModel> _ageList = [];
  List<CheckboxModel> _categoryList = [];

  List<CheckboxModel> get ageList => _ageList;
  List<CheckboxModel> get categoryList => _categoryList;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String getName() => nameController.text;
  String getAddress() => addressController.text;
  String getPhone() => phoneController.text;
  String getPostalCode() => postalCodeController.text;


  bool isTextEmpty(text) => text.isEmpty;
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
    print("---------------------- loading $_isLoading");
    update();
  }

  void updateErrorValue(bool newValue){
    _hasError = newValue;
    update();
  }

}