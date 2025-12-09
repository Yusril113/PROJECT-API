const express = require('express');
const cors = require('cors'); 
const app = express();
const PORT = 3002; 

// Tambahkan Middleware untuk membaca body request dalam format JSON
app.use(express.json()); // <--- WAJIB DITAMBAHKAN
app.use(cors());

// --- DATA VENDOR B ---
// Data sekarang DIBUAT DENGAN 'let' (bukan 'const')
// agar bisa diubah (ditambahkan data baru)
let vendorBData = [ 
  {
    "sku": "TSHIRT-001",
    "productName": "Kaos Ijen Crater",
    "price": 75000, 
    "isAvailable": true 
  },
  // ... data awal lainnya
];

// 1. ENDPOINT GET (READ) - Tetap sama
app.get('/api/vendorB/products', (req, res) => {
  res.json(vendorBData);
});

// 2. ENDPOINT POST (CREATE) - BARU DITAMBAH
app.post('/api/vendorB/products', (req, res) => {
    // Ambil data yang dikirim dari Postman (body request)
    const newItem = req.body; 

    // --- Validasi Data (Opsional tapi direkomendasikan) ---
    if (!newItem.sku || !newItem.productName || newItem.price === undefined) {
        return res.status(400).json({ 
            error: 'Data produk harus lengkap: sku, productName, dan price wajib diisi.' 
        });
    }

    // Tambahkan item baru ke array data
    vendorBData.push(newItem);

    // Beri respons status 201 (Created) dan kembalikan item yang baru dibuat
    res.status(201).json({ 
        message: 'Produk berhasil ditambahkan', 
        data: newItem 
    });
});
// -----------------------------------------------------

app.listen(PORT, () => {
  console.log(`✅ Vendor B API AKTIF di http://localhost:${PORT}`);
  console.log(`GET Endpoint: http://localhost:${PORT}/api/vendorB/products`);
  console.log(`POST Endpoint: http://localhost:${PORT}/api/vendorB/products`);
});