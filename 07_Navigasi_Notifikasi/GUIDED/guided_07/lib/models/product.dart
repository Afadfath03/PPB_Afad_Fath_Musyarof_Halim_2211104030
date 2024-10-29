class Product {
  final int id;
  final String nama;
  final double harga;
  final String img;
  final String desc;

  Product(
      {required this.id,
      required this.nama,
      required this.harga,
      required this.img,
      required this.desc});

  // method untuk mengubah data json menjadi object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'].toDouble(),
      img: json['img'],
      desc: json['desc'],
    );
  }

  // method untuk mengubah object menjadi json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'img': img,
      'desc': desc,
    };
  }
}
