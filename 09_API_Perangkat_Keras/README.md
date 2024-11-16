# PERTEMUAN KE 9

## API Perangkat Keras

---

### GUIDED

1. Camera
  ``` dart
  import 'dart:io';
  
  import 'package:camera/camera.dart';
  import 'package:flutter/material.dart';
  
  class CameraScreen extends StatefulWidget {
    @override
    _CameraScreenState createState() => _CameraScreenState();
  }
  
  class _CameraScreenState extends State<CameraScreen> {
    late CameraController _controller;
    late Future<void> _initializeControllerFuture;
  
    @override
    void initState() {
      super.initState();
      _initializeCamera();
    }
  
    Future<void> _initializeCamera() async {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;
      _controller = CameraController(
        firstCamera,
        ResolutionPreset.high,
      );
      _initializeControllerFuture = _controller.initialize();
    }
  
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Camera Example')),
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return Center(child: CircularProgressIndicator());
            }
        },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              await _initializeControllerFuture;
              final image = await _controller.takePicture();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DisplayPictureScreen(imagePath: image.path),
                ),
              );
            } catch (e) {
              print(e);
            }
          },
          child: Icon(Icons.camera_alt),
        ),
      );
    }
  }
  
  class DisplayPictureScreen extends StatelessWidget {
    final String imagePath;
    const DisplayPictureScreen({Key? key, required this.imagePath})
        : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Display Picture')),
        body: Image.file(File(imagePath)),
      );
    }
  }
  ```

2. Image Picker
   ``` dart
    import 'dart:io';
    import 'package:flutter/material.dart';
    import 'picker';
    
    class ImageFromGalleryEx extends StatefulWidget {
      final type;
      const ImageFromGalleryEx(this.type, {super.key});
      @override
      ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
    }
    
    class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
      var _image;
      var imagePicker;
      var type;
      ImageFromGalleryExState(this.type);
      @override
      void initState() {
        super.initState();
        imagePicker = new ImagePicker();
      }
      
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
              title: Text(type == ImageSource.camera
                  ? "Image from Camera"
                  : "Image from Gallery")),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 52,
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    var source = type == ImageSource.camera
                        ? ImageSource.camera
                        : ImageSource.gallery;
                    XFile image = await imagePicker.pickImage(
                        source: source,
                        imageQuality: 50,
                        preferredCameraDevice: CameraDevice.front);
                    setState(() {
                      _image = File(image.path);
                    });
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(color: Colors.red[200]),
                    child: _image != null
                        ? Image.file(
                            _image,
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.fitHeight,
                          )
                        : Container(
                            decoration: BoxDecoration(color: Colors.red[200]),
                            width: 200,
                            height: 200,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    }
   ```

--- 

### UNGUIDED

``` text
Modifikasi project pemilihan gambar yang telah dikerjakan pada Tugas Pendahuluan Modul 09 agar fungsionalitas tombol dapat berfungsi untuk mengunggah gambar.

- Ketika tombol Gallery ditekan, aplikasi akan mengambil gambar dari galeri, dan setelah gambar dipilih, gambar tersebut akan ditampilkan di dalam container.

- Ketika tombol Camera ditekan, aplikasi akan mengambil gambar menggunakan kamera, dan setelah pengambilan gambar selesai, gambar tersebut akan ditampilkan di dalam container.

- Ketika tombol Hapus Gambar ditekan, gambar yang ada pada container akan dihapus.
```

1. Coding
``` dart
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
```

2. Output
   1. Default <br> <img src="https://github.com/user-attachments/assets/24783c7b-ad4a-49d8-9808-38d3cbb6c16c" alt="default" width="200"/>
   2. Camera <br> <img src="https://github.com/user-attachments/assets/8599273a-f199-480a-ae43-ad7562c010d9" alt="default" width="200"/>
   3. Galeri <br> <img src="https://github.com/user-attachments/assets/ac7047c1-23e7-4ffe-9a04-9f44427dc5de" alt="default" width="200"/>

3. Penjelasan
   1. `Future<void> _pickImage(ImageSource source)` untuk memperbarui tampilan dari gambar yang di ambil
   2. `_deleteImage` untuk menghapus tampilan gambar pada container
   3. Child pada row pertama berisi container gambar dan mengecek apakah gambar telah di terisi atau tidak
   4. `onPressed: () => _pickImage(ImageSource.gallery),` untuk mengambil gambar dari galeri saat tombol ditekan
   5. `onPressed: () => _pickImage(ImageSource.camera),` untuk mengambil gambar dari kamera hp saat tombol ditekan
