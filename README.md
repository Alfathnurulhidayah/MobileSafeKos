# SAFEKOS - Smart Boarding House Security System

SAFEKOS adalah aplikasi keamanan kos berbasis mobile yang dirancang untuk membantu pemilik kos dalam memantau aktivitas penghuni secara lebih aman, efisien, dan real-time. Sistem ini mengintegrasikan teknologi Mobile Development, REST API, MongoDB, serta konsep AI Face Recognition untuk meningkatkan keamanan lingkungan kos.

---

# Fitur Utama

## Authentication System
- Login dan Register akun pemilik kos
- Login penghuni
- JWT Authentication
- Forgot Password dengan OTP Email Verification
- Reset Password

## Manajemen Penghuni
- Tambah penghuni kos
- Edit data penghuni
- Hapus penghuni
- Upload foto wajah penghuni
- Pencarian data penghuni

## Sistem Keamanan
- Monitoring aktivitas penghuni
- Pencatatan log aktivitas
- Deteksi orang asing (Stranger Detection)
- Integrasi Face Recognition
- Dashboard monitoring keamanan

## Dashboard Monitoring
- Statistik penghuni
- Statistik aktivitas
- Monitoring data secara real-time
- Visualisasi data keamanan kos

---

# Teknologi yang Digunakan

## Frontend Mobile
- Flutter
- GetX State Management
- Dart

## Backend
- Python Flask
- REST API
- JWT Authentication

## Database
- MongoDB

## Library Pendukung
- Image Picker
- HTTP Package
- Shared Preferences
- Flask Mail
- Flask JWT Extended
- Flask PyMongo

---

# Struktur Project

```bash
lib/
│
├── app/
│   ├── modules/
│   │   ├── login/
│   │   ├── register/
│   │   ├── dashboard/
│   │   ├── data_penghuni/
│   │   ├── edit_penghuni/
│   │   └── forgot_password/
│   │
│   ├── routes/
│   ├── services/
│   ├── models/
│   └── widgets/
│
├── main.dart
