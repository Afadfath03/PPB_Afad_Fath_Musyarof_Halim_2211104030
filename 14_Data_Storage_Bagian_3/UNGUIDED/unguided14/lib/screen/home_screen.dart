import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/getx_controller.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ControllerX _controller = Get.put(ControllerX());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('JSONPlaceholder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _controller.fetchPosts,
                  child: const Text('Fetch Posts'),
                ),
                ElevatedButton(
                  onPressed: _controller.createPost,
                  child: const Text('Create Post'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _controller.updatePost,
                  child: const Text('Update Post'),
                ),
                ElevatedButton(
                  onPressed: _controller.deletePost,
                  child: const Text('Delete Post'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Obx(
              () {
                if (_controller.isLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: _controller.posts.length,
                      itemBuilder: (context, index) {
                        final post = _controller.posts[index];
                        return ListTile(
                          title: Text(post['title']),
                          subtitle: Text(post['body']),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
