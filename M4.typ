Berikut penjelasan kode **per baris dan per bagian** menggunakan bahasa Indonesia, tanpa emot dan tanpa tulisan miring.


const express = require('express');
Baris ini mengimpor library Express ke dalam program. Express adalah framework Node.js yang digunakan untuk membuat server dan API dengan lebih mudah.


const app = express();
Baris ini membuat sebuah objek aplikasi Express. Objek ini digunakan untuk mengatur routing, middleware, dan konfigurasi server.


const port = 3000;
Baris ini menentukan nomor port yang akan digunakan server. Dalam hal ini server berjalan di port 3000.

// Vendor A (String semua)

Komentar ini menjelaskan bahwa data dari Vendor A masih berupa string semua.


const dataVendorA = [ ... ];
Baris ini mendefinisikan data mentah dari Vendor A dalam bentuk array berisi objek produk.

"kd_produk": "A001"
Kode produk dari Vendor A, masih berupa string.

"nm_brg": "Kopi Bubuk 100g"
Nama barang dari Vendor A.

"hrg": "15000"
Harga produk, masih berbentuk string sehingga perlu dikonversi ke number saat diproses.

"ket_stok": "ada"
Keterangan stok dalam bentuk teks.


// Vendor B (Standard)

Komentar penjelasan bahwa Vendor B sudah menggunakan format data yang lebih standar.

const dataVendorB = [ ... ];
Mendefinisikan data dari Vendor B dalam bentuk array.

"sku": "TSHIRT-001"
Kode unik produk dari Vendor B.

"productName": "Kaos Ijen Crater"
Nama produk dari Vendor B.


"price": 75000
Harga produk dalam bentuk number, tidak perlu konversi.

"isAvailable": true

Status ketersediaan produk dalam bentuk boolean.

// Vendor C (Nested & Complex)
Komentar yang menjelaskan bahwa struktur data Vendor C lebih kompleks dan bersarang.

const dataVendorC = [ ... ];

Mendefinisikan data Vendor C.

"id": 501
ID produk Vendor C dalam bentuk number.

"details": { ... }
Objek bersarang yang berisi detail produk.

"name": "Nasi Tempong"
Nama produk.

"category": "makana"
Kategori produk. Pada logika nanti akan dicek apakah kategori makanan.

"pricing": { ... }
Objek bersarang yang berisi informasi harga.

"base_price": 20000
Harga dasar produk.

"tax": 2000
Pajak produk.

"stock": 50
Jumlah stok produk.


// ==========================================
// 2. LOGIKA INTEGRASI (Tugas Mahasiswa 4)
// ==========================================
Komentar penanda bagian logika integrasi data.

app.get('/api/products', (req, res) => {
Membuat endpoint API dengan metode GET pada URL /api/products.

let finalOutput = [];
Membuat array kosong untuk menampung hasil integrasi dari semua vendor.

// --- PROSES VENDOR A (WARUNG LEGACY) ---
Komentar penanda proses data Vendor A.


const processedA = dataVendorA.map(item => {
Melakukan perulangan pada data Vendor A menggunakan map untuk mengubah format data.


const hargaAsli = parseInt(item.hrg);
Mengubah harga dari string menjadi number agar bisa dihitung.

const hargaDiskon = hargaAsli - (hargaAsli  0.10);
Menghitung harga setelah diskon 10 persen.

return { ... };
Mengembalikan objek baru dengan format data yang sudah distandarkan.

id: item.kd_produk
Mengambil kode produk sebagai ID.

nama: item.nm_brg
Mengambil nama barang.

harga_final: Math.floor(hargaDiskon)
Membulatkan harga diskon ke bilangan bulat.

status: (item.ket_stok === 'ada') ? 'Tersedia' : 'Habis'
Mengubah keterangan stok menjadi format standar.

sumber: 'Vendor A'
Menandai asal data dari Vendor A.

// --- PROSES VENDOR B (DISTRO MODERN) ---
Komentar penanda proses Vendor B.

const processedB = dataVendorB.map(item => {
Melakukan transformasi data Vendor B.


harga_final: item.price
Harga langsung digunakan karena sudah berbentuk number.

status: item.isAvailable ? 'Tersedia' : 'Habis'
Mengubah boolean menjadi teks status.

sumber: 'Vendor B'
Menandai asal data.


// --- PROSES VENDOR C (RESTO) ---
Komentar penanda proses Vendor C.

const processedC = dataVendorC.map(item => {
Melakukan transformasi data Vendor C.

let namaProduk = item.details.name;
Mengambil nama produk dari objek bersarang.

if (item.details.category === 'makanan') { ... }
Jika kategori adalah makanan, maka produk diberi label tambahan.

namaProduk += " (Recommended)";
Menambahkan teks Recommended ke nama produk.

const totalHarga = item.pricing.base_price + item.pricing.tax;
Menjumlahkan harga dasar dan pajak.

id: String(item.id)
Mengubah ID number menjadi string agar konsisten dengan vendor lain.


status: (item.stock > 0) ? 'Tersedia' : 'Habis'
Menentukan status berdasarkan jumlah stok.


sumber: 'Vendor C'
Menandai asal data.


finalOutput = [...processedA, ...processedB, ...processedC];
Menggabungkan semua hasil data dari Vendor A, B, dan C ke dalam satu array.


res.json({ ... });
Mengirim response ke client dalam format JSON.


message: "Data Integration Success"
Pesan bahwa integrasi data berhasil.


total_data: finalOutput.length
Jumlah total data hasil integrasi.


data: finalOutput
Data produk yang sudah terintegrasi dan distandarkan.

});
Menutup endpoint API.

app.listen(port, () => { ... });

Menjalankan server Express pada port yang sudah ditentukan.
console.log(`Server Integrasi berjalan di http://localhost:${port}/api/products`);

Menampilkan pesan di terminal bahwa server berhasil dijalankan dan URL endpoint bisa diakses.