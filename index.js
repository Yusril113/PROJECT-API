import express from 'express';
import pkg from 'pg';
const { Pool } = pkg;
import 'dotenv/config';

const app = express();
app.use(express.json());

// ==========================================
// DATA VENDOR (SAMA PERSIS)
// ==========================================

const dataVendorA = [
    {
        "kd_produk": "A001",
        "nm_brg": "Kopi Bubuk 100g",
        "hrg": "15000",
        "ket_stok": "ada"
    }
];

const dataVendorB = [
    {
        "sku": "TSHIRT-001",
        "productName": "Kaos Ijen Crater",
        "price": 75000,
        "isAvailable": true
    }
];

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
// ROUTES (SAMA PERSIS)
// ==========================================

app.get('/api/products', (req, res) => {
    let finalOutput = [];

    const processedA = dataVendorA.map(item => {
        const hargaAsli = parseInt(item.hrg);
        const hargaDiskon = hargaAsli - (hargaAsli * 0.10);

        return {
            id: item.kd_produk,
            nama: item.nm_brg,
            harga_final: Math.floor(hargaDiskon),
            status: (item.ket_stok === 'ada') ? 'Tersedia' : 'Habis',
            sumber: 'Vendor A'
        };
    });

    const processedB = dataVendorB.map(item => ({
        id: item.sku,
        nama: item.productName,
        harga_final: item.price,
        status: item.isAvailable ? 'Tersedia' : 'Habis',
        sumber: 'Vendor B'
    }));

    const processedC = dataVendorC.map(item => {
        let namaProduk = item.details.name;

        if (item.details.category === 'makanan') {
            namaProduk += " (Recommended)";
        }

        return {
            id: String(item.id),
            nama: namaProduk,
            harga_final: item.pricing.base_price + item.pricing.tax,
            status: (item.stock > 0) ? 'Tersedia' : 'Habis',
            sumber: 'Vendor C'
        };
    });

    finalOutput = [...processedA, ...processedB, ...processedC];

    res.json({
        message: "Data Integration Success",
        total_data: finalOutput.length,
        data: finalOutput
    });
});

// TEST DATABASE
const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
});

app.get('/test-db', async (req, res) => {
    try {
        const result = await pool.query('SELECT NOW()');
        res.json({
            status: 'success',
            time: result.rows[0].now
        });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

// ❌ JANGAN app.listen()
export default app;
