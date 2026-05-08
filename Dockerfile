# Gunakan image Node.js versi 18 dengan variant Alpine agar ukuran sangat kecil (~50MB)
FROM node:18-alpine

# Tentukan direktori kerja di dalam kontainer
WORKDIR /app

# Salin package.json dan package-lock.json terlebih dahulu
# Ini trik agar build lebih cepat jika tidak ada perubahan dependensi
COPY package*.json ./

# Install dependensi hanya untuk production (tanpa devDependencies)
# Ini membantu menjaga penggunaan RAM tetap rendah
RUN npm install --omit=dev

# Salin seluruh kode aplikasi dari laptop/github ke dalam kontainer
COPY . .

# Expose port 3000 (sesuai dengan port di server.js Anda)
EXPOSE 3000

# Jalankan aplikasi menggunakan node secara langsung
CMD ["node", "server.js"]