const express = require("express");
const fs = require("fs");
const app = express();
const PORT = 3001;

app.get("/vendorA/products", (req, res) => {
    try {
        const raw = fs.readFileSync("vendorA.json", "utf-8");
        const data = JSON.parse(raw);
        const normalized = data.map(item => ({
            id: item.kd_produk,
            nama: item.nm_brg.trim(),
            harga_final: parseInt(item.hrg),
            status: item.ket_stok === "ada" ? "Tersedia" : "Habis",
            sumber: "Vendor A"
        }));

        res.json(normalized);

    } catch (err) {
        res.status(500).json({ error: "Gagal memproses data Vendor A", detail: err.message });
    }
});

app.listen(PORT, () => {
    console.log(`Vendor A API running at http://localhost:${PORT}/vendorA/products`);
});
