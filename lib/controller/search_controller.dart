import 'package:amankoora/model/search/search_type.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{

  RxBool itemSelect = false.obs;

  List<SearchType> listSearchType = [
    SearchType(name: 'المحافظة', isSelect: true),
    SearchType(name: 'النادي', isSelect: false)
  ];

}