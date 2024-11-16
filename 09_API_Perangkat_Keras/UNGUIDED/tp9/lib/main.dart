import 'package:flutter/material.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('Latihan Memilih Gambar',
              style: TextStyle(color: Colors.white)),
        ),
        body: const ImagePickerWidget(),
      ),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _deleteImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 1, style: BorderStyle.solid),
                  ),
                  child: _image == null
                      ? const Icon(
                          Icons.image_outlined,
                          size: 300,
                        )
                      : Image.file(
                          _image!,
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.camera),
                label: const Text(
                  'Camera',
                  style: TextStyle(color: Colors.white),
                ),
                icon:
                    const Icon(Icons.camera_alt_outlined, color: Colors.white),
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Color(Colors.blue.value)),
                ),
              )),
              const SizedBox(
                width: 20,
              ),
              Center(
                  child: ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.gallery),
                label: const Text(
                  'Gallery',
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.image_outlined, color: Colors.white),
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Color(Colors.blue.value)),
                ),
              )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton.icon(
                  onPressed: _deleteImage,
                  label: const Text(
                    'Hapus Gambar',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(Icons.delete_forever_outlined,
                      color: Colors.white),
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Color(Colors.blue.value)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
