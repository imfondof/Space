sealed class TimerEvent {
  TimerEvent();
}

final class TimerStarted extends TimerEvent {
  TimerStarted({required this.duration});

  final int duration;
}

final class TimerPaused extends TimerEvent {
  TimerPaused();
}

final class TimerResumed extends TimerEvent {
  TimerResumed();
}

class TimerReset extends TimerEvent {
  TimerReset();
}

class TimerTicked extends TimerEvent {
  TimerTicked({required this.duration});

  final int duration;
}
