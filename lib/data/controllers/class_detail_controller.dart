import 'package:get/get.dart';
import 'package:three_sixty_kids/data/models/vos/class_detail_model.dart';
import 'package:three_sixty_kids/data/repositories/center_detail_repo.dart';
import 'package:three_sixty_kids/data/repositories/class_detail_repo.dart';
import 'package:three_sixty_kids/data/repositories/home_repo.dart';

class ClassDetailController extends GetxController{
  final ClassDetailRepo classDetailRepo;

  ClassDetailController({required this.classDetailRepo});

  List<String> _cateogryList = [];
  List<String> _imgList = [];
  bool _isLoading = false;
  late ClassDetails _classDetails;

  List<String> get cateogryList => _cateogryList;
  List<String> get imgList => _imgList;
  bool get isLoading => _isLoading;
  ClassDetails get classDetails => _classDetails;


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
    List<String> _imgList1 = [
      "https://res.cloudinary.com/tech-myanmar/image/upload/v1694006668/articles/ow6051n50rmd1jzu1idc.jpg",
      "https://res.cloudinary.com/tech-myanmar/image/upload/v1694006315/articles/dlyhiuutk055vd5k4wdp.jpg",
      "https://res.cloudinary.com/tech-myanmar/image/upload/v1691665455/articles/ocadgswdf03fkkgo8tdr.jpg"
    ];

    List<String> fetchedOptions = ['Category 1', 'Cateory 2', 'Category 3',];

    _cateogryList = fetchedOptions;

    _imgList = _imgList1;
    _isLoading = false;
    update();
  }

  Future<void> getClassDetail(int id) async {
    _isLoading = true;
    update();

    _classDetails = await classDetailRepo.apiClient.getClassDetail();

    _isLoading = false;
    update();
  }
  void setLoading(bool newValue) {
    _isLoading = newValue;
    update();
  }
}