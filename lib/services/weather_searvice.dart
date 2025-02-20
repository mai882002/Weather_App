import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherSearvice {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String key = 'df78e3f664f344fc938112834251902 ';
  WeatherSearvice(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$key&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMesage =
          e.response?.data['error']['message'] ?? 'oops there was an error';
      throw Exception(errorMesage);
    } catch (e) {
      throw Exception('oops there was an error');
    }
  }
}
