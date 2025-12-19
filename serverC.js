const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 3200;

let idSeq = 3;

let resto = [{
    id: 1, vendor_name: 'Vendor C',
    details: {
        name: 'nasi boran', category: 'makanan'
    },
    pricing: {
        base_price: 10000,
        tax: 5000
    }, stock: 100
},
{
    id: 2, vendor_name: 'Vendor C',
    details: {
        name: 'es teh', category: 'minuman'
    },
    pricing: {
        base_price: 5000,
        tax: 1000
    }, stock: 10
}
];


//===MIDDLEWARE===
app.use(cors());
app.use(express.json());


app.get('/status', (req, res) => {
    res.json({
        ok: true,
        service: 'resto-kuliner',
        time: new Date().toISOString()
    });
});

app.get('/resto', (req, res) => {
    res.json(resto);

});

app.get('/resto/:id', (req, res) => {
    const id = Number(req.params.id);
    const item = resto.find(m => m.id === id);
    if (!item) return res.status(404).json({ error: 'Data tidak ditemukan' });
    res.json(item);
});

app.post('/resto', (req, res) => {
    const { vendor_name, name, category, base_price, tax, stock } = req.body;
    if (!name || !category || !base_price || !tax) {
        return res.status(400).json({ error: 'mohon isi data nya harus lengkap!' });
    }3
    const newResto = {
        id: idSeq++, vendor_name,
        details: { name, category },
        pricing: { base_price, tax },
        stock
    };
    resto.push(newResto);
    res.status(201).json(newResto);
});


app.put('/resto/:id', (req, res) => {
    const id = Number(req.params.id);
    const restoIndex = resto.findIndex(r => r.id === id);
    if (restoIndex === -1) {
        return res.status(404).json({
            error: 'resto tidak ditemukan!'
        });
    }
    const existingResto = resto[restoIndex];
    const { vendor_name, name, category, base_price, tax, stock } = req.body || {};
    const updatedResto = {
        id: id,
        vendor_name: vendor_name || existingResto.vendor_name,
        details: {
            name: name || existingResto.details.name,
            category: category || existingResto.details.category
        },
        pricing: {
            base_price: base_price || existingResto.pricing.base_price,
            tax: tax || existingResto.pricing.tax
        },
        stock: stock !== undefined ? stock : existingResto.stock
    }
    resto[restoIndex] = updatedResto;
    res.json(updatedResto);
});

app.delete('/resto/:id', (req, res) => {
    const id = Number(req.params.id);
    const restoIndex = resto.findIndex(r => r.id === id);
    if (restoIndex === -1) {
        return res.status(404).json({ error: 'resto tidak ditemukan' });
    }
    resto.splice(restoIndex, 1);
    res.status(204).send();
});

app.use((req, res) => {
    res.status(404).json({ error: 'rute tidak ditemukan' });
});

app.use((err, req, res, _next) => {
    console.error('[ERROR]', err);
    res.status(500).json({ error: 'terjadi kesalahan internal server' });
});

app.listen(PORT, () => {
    console.log(`Server aktif di http://localhost:${PORT}/resto`);
});