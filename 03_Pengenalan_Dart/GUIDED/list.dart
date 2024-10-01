void main() {
  // // Membuat fixed-length list dengan panjang 3
  // List<int> fixedList = List.filled(3, 0);
  // // List dengan 3 elemen, diisi dengan 0

  // // Mengubah elemen dalam list
  // fixedList[0] = 10;
  // fixedList[1] = 20;
  // fixedList[2] = 30;

  // // fixedList[3] = 40;
  // // Error: Index diluar jangkauan karena panjang list hanya 3

  // print(fixedList); // Output: [10, 20, 30]
  // print(fixedList[0]); // Output: 10
  // print(fixedList[1]); // Output: 20
  // print(fixedList[2]); // Output: 30

  // Membuat growable list (panjangnya bisa berubah) 
  List<int> growableList = []; 
  
  // Menambahkan elemen ke dalam list 
  growableList.add(10); 
  growableList.add(20); 
  growableList.add(30); 
  
  print(growableList); // Output: [10, 20, 30] 
  
  // Menambahkan lebih banyak elemen 
  growableList.add(40); 
  growableList.add(50); 
  
  print(growableList); // Output: [10, 20, 30, 40, 50] 
  
  // Menghapus elemen dari list 
  growableList.remove(20); 
  
  print(growableList); // Output: [10, 30, 40, 50] 
}