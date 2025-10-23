import 'package:geolocator/geolocator.dart';
import 'dart:math';

class LocationHelper {
  /// Lấy vị trí hiện tại của người dùng
  static Future<Position?> getCurrentLocation() async {
    // Kiểm tra xem GPS có bật không
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    // Kiểm tra quyền truy cập
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }
    if (permission == LocationPermission.deniedForever) return null;

    // Lấy vị trí hiện tại (chuẩn API mới)
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 0, // 0 = luôn cập nhật chính xác nhất có thể
      ),
    );
  }

  /// Tính khoảng cách giữa 2 tọa độ (đơn vị: mét)
  static double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const R = 6371000; // Bán kính Trái Đất (m)
    final dLat = _degToRad(lat2 - lat1);
    final dLon = _degToRad(lon2 - lon1);
    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_degToRad(lat1)) *
            cos(_degToRad(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  /// Chuyển độ sang radian
  static double _degToRad(double deg) => deg * pi / 180;
}
