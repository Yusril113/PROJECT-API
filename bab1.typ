Bagian 1: Import Library & Inisialisasi
Pertama, saya mengimpor framework Express.js. Library ini digunakan untuk membangun server web dan menangani permintaan HTTP dari client.
Selanjutnya, saya mengimpor module File System (fs). Module ini berfungsi untuk membaca data produk Vendor A yang disimpan dalam file JSON.
dan saya juga menginisialisasi aplikasi Express ke dalam sebuah variabel agar server dapat dikonfigurasi dan dijalankan.
disini saya juga menentukan port 3001 sebagai port khusus untuk Vendor A, agar tidak terjadi bentrok dengan vendor lain maupun sistem integrator.

Bagian 2: Endpoint GET (Mengambil Data)
Ini digunakan untuk membuat endpoint GET yang berfungsi menampilkan data produk Vendor A ketika endpoint tersebut diakses.

Bagian 3: Membaca dan Parsing Data
Server membaca isi file data Vendor A yang berisi informasi produk dari sistem lama Warung Legacy. Data yang telah dibaca kemudian diubah ke dalam bentuk objek agar bisa diproses lebih lanjut oleh server.

Bagian 4: Proses Normalisasi Data
Pada bagian ini dilakukan proses normalisasi data, yaitu mengubah struktur data lama menjadi struktur data standar yang telah ditentukan.
Perubahan yang dilakukan:
•	Mengubah kode produk menjadi format ID
•	Menyesuaikan nama barang
•	Mengubah harga dari bentuk teks menjadi angka
•	Menyeragamkan status stok
•	Menambahkan informasi sumber data

Bagian 5: Mengirimkan Data ke Client
Setelah proses normalisasi selesai, server mengirimkan data produk yang sudah rapi dan seragam kepada client dalam format JSON.

Bagian 6: Menjalankan Server
Pada bagian ini server dijalankan pada port yang telah ditentukan. Jika server berhasil berjalan, akan muncul pesan pada terminal sebagai tanda bahwa API Vendor A siap digunakan.