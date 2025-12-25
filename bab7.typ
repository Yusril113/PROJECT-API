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