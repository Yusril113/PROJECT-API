const express = require('express');
const cors = require('cors'); 
const app = express();
const PORT = 3002; 


app.use(express.json()); 
app.use(cors());


let vendorBData = [ 
  {
    "sku": "TSHIRT-001",
    "productName": "Kaos Ijen Crater",
    "price": 75000, 
    "isAvailable": true 
  },
  
];

app.get('/api/vendorB/products', (req, res) => {
  res.json(vendorBData);
});

app.post('/api/vendorB/products', (req, res) => {
    
    const newItem = req.body; 

    
    if (!newItem.sku || !newItem.productName || newItem.price === undefined) {
        return res.status(400).json({ 
            error: 'Data produk harus lengkap: sku, productName, dan price wajib diisi.' 
        });
    }
    vendorBData.push(newItem);

    res.status(201).json({ 
        message: 'Produk berhasil ditambahkan', 
        data: newItem 
    });
});


app.listen(PORT, () => {
  console.log(`✅ Vendor B API AKTIF di http://localhost:${PORT}`);
  console.log(`GET Endpoint: http://localhost:${PORT}/api/vendorB/products`);
  console.log(`POST Endpoint: http://localhost:${PORT}/api/vendorB/products`);
});