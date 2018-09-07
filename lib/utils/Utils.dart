class Utils {
  bool isNight() {
    bool isNight = false;
    DateTime time = DateTime.now();
    var hour = time.hour;
    if (hour < 6 || hour > 18) {
      isNight = true;
    } else {
      isNight = false;
    }
    return isNight;
  }
}
