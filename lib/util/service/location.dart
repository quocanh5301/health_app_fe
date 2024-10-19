import 'package:geolocator/geolocator.dart';

class LocationTrackingService {
  late Stream<Position> _positionStream;

  Stream<Position> startLocationTracking()  {
    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.medium,
        distanceFilter: 10,
      ),
    );
    return _positionStream;
  }
}
