class WeatherEntity {
  final List<Weather> weather;
  final Main main;
  final String name;

  WeatherEntity({
    required this.weather,
    required this.main,
    required this.name,
  });
}

class Weather {
  final String main;
  final String description;
  final String icon;

  Weather({required this.main, required this.description, required this.icon});
}

class Main {
  final double temp;

  Main({required this.temp});
}
