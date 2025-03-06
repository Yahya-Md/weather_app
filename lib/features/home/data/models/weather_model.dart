import 'package:weather_app/features/home/domain/entities/weather_entity.dart';

class WeatherResultResponse extends WeatherEntity {
  WeatherResultResponse({
    required super.weather,
    required super.main,
    required super.name,
  });

  factory WeatherResultResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResultResponse(
      weather: (json['weather'] as List)
          .map((e) => WeatherResponse.fromJson(e))
          .toList(),
      main: MainResponse.fromJson(json['main']),
      name: json['name'] ?? "",
    );
  }
}

class WeatherResponse extends Weather {
  WeatherResponse({
    required int id,
    required super.main,
    required super.description,
    required super.icon,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class MainResponse extends Main {
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  MainResponse({
    required super.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory MainResponse.fromJson(Map<String, dynamic> json) {
    return MainResponse(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
    );
  }
}
