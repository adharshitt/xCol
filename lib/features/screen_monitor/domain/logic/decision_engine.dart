class DecisionEngine {

  final List<double> _confidenceHistory = [];

  final int _bufferSize = 3; // Number of frames to confirm before alert

  final double _threshold = 0.85; // 85% confidence required

  bool shouldTriggerAlert(double currentScore) {

    _confidenceHistory.add(currentScore);

    if (_confidenceHistory.length > _bufferSize) {

      _confidenceHistory.removeAt(0);

    }

    // High Security: Only alert if the AVERAGE of the last 3 frames is high

    if (_confidenceHistory.length < _bufferSize) return false;

    

    double average = _confidenceHistory.reduce((a, b) => a + b) / _bufferSize;

    return average >= _threshold;

  }

}

