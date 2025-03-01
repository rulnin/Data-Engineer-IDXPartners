# Data Warehouse ETL Project

📌 Overview

Proyek ini bertujuan untuk membangun sebuah Data Warehouse (DWH) untuk salah satu klien dari ID/X Partners yang bergerak di industri perbankan. Data berasal dari berbagai sumber seperti file Excel, CSV, dan database SQL Server. Tantangan utama adalah melakukan ekstraksi, transformasi, dan pemuatan (ETL) data ke dalam Data Warehouse secara optimal agar pelaporan dan analisis data menjadi lebih efisien.

📂 Sumber Data

transaction_excel (File Excel)

transaction_csv (File CSV)

transaction_db (Database SQL Server)

account (Database SQL Server)

customer (Database SQL Server)

branch (Database SQL Server)

city (Database SQL Server)

state (Database SQL Server)

🎯 Tujuan

Sebagai Data Engineer, tugas utama dalam proyek ini adalah:

Membuat database baru bernama DWH.

Membuat tabel:

DimAccount

DimCustomer (dengan format kolom: CustomerID, CustomerName, Address, CityName, StateName, Age, Gender, Email dalam PascalCase, dengan semua teks dikonversi ke huruf kapital kecuali CustomerID, Age, Email)

DimBranch

FactTransaction (menyimpan transaksi tanpa duplikasi)

Membangun job ETL di Talend untuk memindahkan data ke tabel dimension dan fact.

Menggabungkan data transaksi dari tiga sumber (transaction_excel, transaction_csv, transaction_db) ke dalam tabel FactTransaction tanpa duplikasi.

Membuat dua Stored Procedure (SP) untuk analisis data:

DailyTransaction: Menghitung total transaksi dan jumlah nominal per hari berdasarkan parameter start_date dan end_date.

BalancePerCustomer: Menghitung saldo akhir per pelanggan berdasarkan parameter name, dengan aturan penambahan dan pengurangan saldo berdasarkan jenis transaksi (Deposit menambah saldo, selain itu mengurangi saldo). Hanya menampilkan akun yang berstatus active.

🛠️ Teknologi yang Digunakan

Talend (ETL Tool)

SQL Server (Database Management)

Excel & CSV (Sumber Data)

📌 Output Contoh

1. DailyTransaction

Date

TotalTransactions

TotalAmount

2024-02-20

100

500,000

2024-02-21

120

600,000

2. BalancePerCustomer

CustomerName

AccountType

Balance

CurrentBalance

Shelly

Savings

1,000

500

🚀 Cara Menjalankan

Buat Database DWH di SQL Server.

Jalankan Talend Jobs untuk melakukan ETL.

Jalankan Stored Procedure untuk analisis data dengan parameter yang sesuai.

Proyek ini bertujuan untuk meningkatkan efisiensi dalam pengolahan data perbankan dan mempercepat proses pelaporan serta analisis bisnis.

