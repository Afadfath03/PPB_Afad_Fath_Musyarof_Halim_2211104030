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
   1. 
3. Output
   1.
5. Penjelasan
   1.
