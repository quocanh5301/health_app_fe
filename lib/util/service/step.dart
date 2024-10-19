import 'package:pedometer/pedometer.dart';

class StepTrackingService {
  late Stream<StepCount> _stepStream;

  Stream<StepCount> startStepTracking() {
    _stepStream =  Pedometer.stepCountStream;
    return _stepStream;
  }
}
