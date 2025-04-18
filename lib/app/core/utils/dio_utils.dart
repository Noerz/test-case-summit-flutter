import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Kelas `DioUtils` menyediakan utilitas untuk mengatur dan mengonfigurasi instance Dio.
class DioUtils {
  /// Fungsi `initDio` digunakan untuk menginisialisasi instance Dio dengan base URL yang diberikan.
  /// 
  /// [baseUrl] adalah URL dasar untuk semua permintaan HTTP.
  /// 
  /// Mengembalikan instance Dio yang telah dikonfigurasi.
  static Dio initDio(String baseUrl) {
    const isLogAllowed = !kReleaseMode;
    final dioInstance = Dio(
      BaseOptions(baseUrl: baseUrl),
    );
    if (isLogAllowed) {
      dioInstance.interceptors.add(loggerInterceptor());
    }

    return dioInstance;
  }

  /// Fungsi `loggerInterceptor` digunakan untuk membuat interceptor yang mencatat log
  /// dari permintaan dan respons HTTP.
  /// 
  /// Mengembalikan instance `PrettyDioLogger` yang dikonfigurasi.
  static Interceptor loggerInterceptor() {
    const isLogAllowed = !kReleaseMode;
    return PrettyDioLogger(
      request: isLogAllowed,
      responseBody: isLogAllowed,
      requestBody: isLogAllowed,
      logPrint: (log) {
        developer.log(
          '$log',
        );
      },
    );
  }
}
