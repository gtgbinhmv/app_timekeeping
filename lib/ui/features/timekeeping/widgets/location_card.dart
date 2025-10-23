import 'package:app_timekeeping/ui/core/resources/appcolors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app_timekeeping/utils/location_helper.dart';
import 'package:geolocator/geolocator.dart';

class LocationCard extends StatefulWidget {
  const LocationCard({super.key});

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  Position? _currentPosition;
  double? _distance;
  late GoogleMapController mapController;

  // Ví dụ: toạ độ văn phòng
  final LatLng office = const LatLng(
    21.039137,
    105.913688,
  ); //Chung cư TSG LOTUS

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    final pos = await LocationHelper.getCurrentLocation();
    if (pos != null) {
      final dist = LocationHelper.calculateDistance(
        pos.latitude,
        pos.longitude,
        office.latitude,
        office.longitude,
      );
      setState(() {
        _currentPosition = pos;
        _distance = dist;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.hexFFFFFF,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: AppColor.hex7A8A98, //
          width: 1, // Độ dày của viền
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:
                    _currentPosition == null
                        ? const Center(child: CircularProgressIndicator())
                        : GoogleMap(
                          onMapCreated:
                              (controller) => mapController = controller,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              _currentPosition!.latitude,
                              _currentPosition!.longitude,
                            ),
                            zoom: 15,
                          ),
                          markers: {
                            Marker(
                              markerId: const MarkerId('me'),
                              position: LatLng(
                                _currentPosition!.latitude,
                                _currentPosition!.longitude,
                              ),
                              infoWindow: const InfoWindow(
                                title: "Vị trí của bạn",
                              ),
                            ),
                            Marker(
                              markerId: const MarkerId('office'),
                              position: office,
                              infoWindow: const InfoWindow(title: "Văn phòng"),
                            ),
                          },
                          myLocationEnabled: true,
                          myLocationButtonEnabled: false,
                        ),
              ),
            ),
            const SizedBox(height: 10),
            if (_distance != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTag(
                    "Cách văn phòng ~${_distance!.toStringAsFixed(0)}m",
                  ),
                  const SizedBox(width: 8),
                  _buildTag("GPS ổn định"),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}
