import 'package:get/get.dart';
import 'model.dart';

class CatatanController extends GetxController {
  var catatanList = <Catatan>[].obs;

  void addCatatan(Catatan catatan) {
    catatanList.add(catatan);
  }

  void deleteCatatan(int index) {
    catatanList.removeAt(index);
  }
}
