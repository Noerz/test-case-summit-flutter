import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

/// Kelas `LocationService` digunakan untuk mendapatkan lokasi pengguna saat ini.
class LocationService {
  /* Fungsi `getCurrentLocation` digunakan untuk mendapatkan posisi geografis pengguna.
  Fungsi ini memeriksa apakah layanan lokasi aktif dan apakah izin lokasi telah diberikan.
  Jika layanan lokasi tidak aktif atau izin ditolak, fungsi ini akan melemparkan exception.
  Mengembalikan objek `Position` yang berisi informasi lokasi pengguna.*/
  Future<Position> getCurrentLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Periksa apakah layanan lokasi aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Layanan lokasi tidak aktif.');
    }

    // Periksa izin lokasi
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Izin lokasi ditolak.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Izin lokasi secara permanen ditolak.');
    }

    // Dapatkan posisi saat ini
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return position;
  }
}
