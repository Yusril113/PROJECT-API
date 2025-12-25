= 1. Persiapan Awal (The Setup)
Bagian paling atas adalah proses menyiapkan alat kerja:

install "npm init" untuk package nodejs nya  

Express: Kerangka kerja (framework) untuk membuat server.

CORS: Izin agar server ini bisa diakses oleh aplikasi lain (misal dari browser atau website).

PORT (3200): Nomor pintu di komputer kamu tempat server ini berjalan.

idSeq: Sebuah penghitung otomatis agar setiap data baru punya ID unik yang berbeda.

= 2. Gudang Data (The Database)
Variabel let resto adalah gudang penyimpanan sementara. Di dalamnya sudah ada dua menu awal: "Nasi Boran" dan "Es Teh". Karena disimpan di variabel biasa, data ini akan hilang (kembali ke awal) jika server dimatikan.

= 3. Alamat-Alamat (Routes/Endpoints)
Server ini memiliki beberapa "alamat" yang bisa dihubungi untuk melakukan hal yang berbeda-beda (CRUD):

GET	/status :	Mengecek apakah server sedang hidup atau tidak.
GET	/resto :	Mengambil semua daftar menu yang ada.
GET	/resto/:id :	Mengambil satu menu spesifik berdasarkan nomor ID-nya.
POST	/resto :	Menambah menu baru ke dalam daftar.
PUT	/resto/:id :	Mengubah atau memperbaiki data menu yang sudah ada.
DELETE	/resto/:id :	Menghapus menu dari daftar.

= 4. cara menjalankan 
untuk mempermudah pengembangan program perlu untuk install nodemon (npm install --save-dev nodemon)
dan untuk mejalankan program dengan peritah "npx nodemon server.js". 