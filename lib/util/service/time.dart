import 'dart:async';

class TimeTrackingService {
  Timer? _timer;

  void startCountdown(void Function() onTick) {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        onTick();
      },
    );
  }

  void stopCountdown() {
    _timer?.cancel();
  }
}
