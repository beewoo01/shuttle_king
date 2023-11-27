class Singleton {
  int? accountIdx;
  bool? isDriver;
  static final Singleton _instance = Singleton._internal();

  factory Singleton() => _instance;

  Singleton._internal() {
    //accountIdx = 1;
  }

}