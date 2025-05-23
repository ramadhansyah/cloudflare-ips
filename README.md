
# 🔐 NGINX  Hanya Mengizinkan IP Cloudflare

Konfigurasi NGINX  hanya menerima request dari IP Cloudflare dan secara otomatis memperbarui List IP CloudFlare setiap hari.

---

## 1. Membuat File Konfigurasi IP Cloudflare

#### 📄 path file konfigurasi NGINX

```bash
 /etc/nginx/cloudflare-ips.conf
```



####  Sertakan konfigurasi ini dalam blok `server {}` di setiap virtualhost host:

```nginx
include /etc/nginx/cloudflare-ips.conf;
```

---

## 2. Auto Update IP Cloudflare via Cron

####  file bash sheel untuk renew list ip cloudflare

```bash
 /usr/local/bin/renew-cloudflare-ips.sh
```


####  Ubah menjadi executable

```bash
sudo chmod +x /usr/local/bin/renew-cloudflare-ips.sh
```

---

## 3. Atur Cron Job Harian

#### 🕒 Edit crontab

```bash
sudo crontab -e
```

#### ➕ Tambahkan baris berikut untuk menjalankan update setiap hari pukul 03:00

```bash
0 3 * * * /usr/local/bin/renew-cloudflare-ips.sh
```

---

## ✅ Selesai!

Server NGINX kamu sekarang hanya mengizinkan request dari IP Cloudflare, dan daftar IP akan diperbarui secara otomatis setiap hari.
