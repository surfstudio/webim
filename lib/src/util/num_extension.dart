extension NumExtension on num {
  /// from seconds to microseconds
  num fromSecToMicro() => Duration(seconds: this.round()).inMicroseconds;

  /// from microseconds to seconds
  num fromMicroToSec() => Duration(microseconds: this.round()).inSeconds;
}