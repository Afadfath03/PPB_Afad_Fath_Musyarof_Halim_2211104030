import 'package:get/get.dart';
import '../service/api_service.dart';

class ControllerX extends GetxController {
  var posts = <dynamic>[].obs;
  var isLoading = false.obs;

  final ApiService _apiService = ApiService();

  void showSnackBar(String title, String message) {
    Get.snackbar(title, message, snackPosition: SnackPosition.TOP);
  }

  Future<void> handleApiOperation(
      Future<void> operation, String title, String successMessage) async {
    isLoading.value = true;
    try {
      await operation;
      posts.value = _apiService.posts;
      showSnackBar(title, successMessage);
    } catch (e) {
      showSnackBar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchPosts() =>
      handleApiOperation(_apiService.fetchPosts(), "Fetch", 'Fetch Posts');
  void createPost() =>
      handleApiOperation(_apiService.createPost(), "Create", 'Create Post');
  void updatePost() =>
      handleApiOperation(_apiService.updatePost(), "Update", 'Update Post');
  void deletePost() =>
      handleApiOperation(_apiService.deletePost(), "Delete", 'Delete Post');
}
