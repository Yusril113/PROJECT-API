const express = require('express');
const app = express();
const port = 3000;

// ==========================================
// 1. DATA MENTAH DARI VENDOR (SIMULASI)
// ==========================================

// Vendor A (String semua)
const dataVendorA = [
    {
        "kd_produk": "A001",
        "nm_brg": "Kopi Bubuk 100g",
        "hrg": "15000",
        "ket_stok": "ada"
    }
];

// Vendor B (Standard)
const dataVendorB = [
    {
        "sku": "TSHIRT-001",
        "productName": "Kaos Ijen Crater",
        "price": 75000,
        "isAvailable": true
    }
];

// Vendor C (Nested & Complex)
const dataVendorC = [
    {
        "id": 501,
        "details": {
            "name": "Nasi Tempong",
            "category": "makana"
        },
        "pricing": {
            "base_price": 20000,
            "tax": 2000
        },
        "stock": 50
    }
];

// ==========================================
// 2. LOGIKA INTEGRASI (Tugas Mahasiswa 4)
// ==========================================

app.get('/api/products', (req, res) => {
    let finalOutput = [];

    // --- PROSES VENDOR A (WARUNG LEGACY) ---
    const processedA = dataVendorA.map(item => {
        // Logika Bisnis: Diskon 10%
        const hargaAsli = parseInt(item.hrg); // Konversi String ke Number
        const hargaDiskon = hargaAsli - (hargaAsli * 0.10);

        return {
            id: item.kd_produk,
            nama: item.nm_brg,
            harga_final: Math.floor(hargaDiskon), // Type Safety: Pastikan Integer
            status: (item.ket_stok === 'ada') ? 'Tersedia' : 'Habis', // Standardisasi Status
            sumber: 'Vendor A'
        };
    });

    // --- PROSES VENDOR B (DISTRO MODERN) ---
    const processedB = dataVendorB.map(item => {
        return {
            id: item.sku,
            nama: item.productName,
            harga_final: item.price, // Sudah number, aman
            status: item.isAvailable ? 'Tersedia' : 'Habis',
            sumber: 'Vendor B'
        };
    });

    // --- PROSES VENDOR C (RESTO) ---
    const processedC = dataVendorC.map(item => {
        // Data Mapping: Akses Nested Object
        let namaProduk = item.details.name;
        
        // Logika Bisnis: Label Recommended
        if (item.details.category === 'makanan') {
            namaProduk += " (Recommended)";
        }

        // Hitung Total Harga (Base + Tax)
        const totalHarga = item.pricing.base_price + item.pricing.tax;

        return {
            id: String(item.id), // Konversi ke string agar konsisten dengan ID lain
            nama: namaProduk,
            harga_final: totalHarga, // Type Safety: Integer
            status: (item.stock > 0) ? 'Tersedia' : 'Habis',
            sumber: 'Vendor C'
        };
    });

    // Gabungkan semua data
    finalOutput = [...processedA, ...processedB, ...processedC];

    // Kirim response JSON
    res.json({
        message: "Data Integration Success",
        total_data: finalOutput.length,
        data: finalOutput
    });
});

// Jalankan Server
app.listen(port, () => {
    console.log(`Server Integrasi berjalan di http://localhost:${port}/api/products`);
});