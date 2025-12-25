Bagian 1: Import Library & Inisialisasi
Baris 1: const express = require('express'); "Pertama, saya mengimpor framework Express.js. Ini adalah library utama yang saya gunakan untuk membangun server web dan menangani permintaan HTTP."

Baris 2: const cors = require('cors'); "Kemudian saya mengimpor CORS. Ini sangat penting karena API saya nantinya akan dipanggil oleh Mahasiswa 4 yang berada di domain atau port yang berbeda. Tanpa ini, koneksi akan diblokir oleh browser."

Baris 3: const app = express(); "Di sini saya menginisialisasi aplikasi Express ke dalam variabel app."

Baris 4: const PORT = 3002; "Saya menetapkan Port 3002 sebagai pintu masuk untuk Vendor B, agar tidak bentrok dengan vendor lain atau integrator."

Bagian 2: Middleware (Jembatan Data)
Baris 7: app.use(express.json()); "Baris ini sangat krusial. Ini adalah middleware yang berfungsi agar server saya bisa membaca data berformat JSON yang dikirimkan melalui body request, terutama saat kita menggunakan metode POST nanti."

Baris 8: app.use(cors()); "Di sini saya mengaktifkan kebijakan CORS yang sudah diimpor tadi agar API ini terbuka untuk diintegrasikan."

Bagian 3: Sumber Data (Listing 2)
Baris 11-30: let vendorBData = [...]; "Inilah pusat data kita. Variabel vendorBData menggunakan let agar isinya bisa kita tambah secara dinamis. Perhatikan strukturnya: Sesuai dengan Listing 2, saya menggunakan format CamelCase seperti productName dan isAvailable. Harganya menggunakan tipe data Number dan statusnya menggunakan Boolean. Ini adalah identitas asli dari Vendor B."

Bagian 4: Endpoint GET (Mengambil Data)
Baris 33-35: app.get('/api/vendorB/products', ...) "Ini adalah endpoint GET. Fungsinya sederhana: ketika ada yang mengakses URL ini, server akan langsung merespons dengan mengirimkan seluruh isi vendorBData dalam format JSON. Mahasiswa 4 akan mengambil data mentah dari sini."

Bagian 5: Endpoint POST (Menambah Data)
Baris 38: app.post('/api/vendorB/products', ...) "Selanjutnya adalah endpoint POST. Ini digunakan untuk menambahkan produk baru ke dalam daftar."

Baris 40: const newItem = req.body; "Saya mengambil data produk baru yang dikirimkan dari luar (misalnya dari Postman) melalui req.body."

Baris 43-47: Validasi If Statement "Di sini saya menambahkan logika validasi sederhana. Jika data yang dikirim tidak memiliki SKU, nama produk, atau harga, server akan menolak dan mengirimkan pesan error 400."

Baris 50: vendorBData.push(newItem); "Jika data sudah valid, produk tersebut dimasukkan ke dalam array vendorBData menggunakan fungsi .push()."

Baris 53: res.status(201).json(...) "Terakhir, server mengirimkan status 201 yang artinya data berhasil dibuat, beserta pesan sukses."

Bagian 6: Menjalankan Server
Baris 59-63: app.listen(PORT, ...) "Terakhir, baris ini memerintahkan server untuk mulai 'mendengarkan' permintaan di Port 3002. Saya juga menambahkan log di terminal agar saya tahu bahwa server sudah aktif dan siap digunakan."