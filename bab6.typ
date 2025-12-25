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

app.get('/api/products', (req, res) => {
Membuat endpoint API dengan metode GET pada URL /api/products.

let finalOutput = [];
Membuat array kosong untuk menampung hasil integrasi dari semua vendor.

// --- PROSES VENDOR A (WARUNG LEGACY) ---
Komentar penanda proses data Vendor A.
