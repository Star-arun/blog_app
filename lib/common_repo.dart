import 'package:dio/dio.dart';

class CommonRepo {
  static Future<Map<String, dynamic>> getAPI(String url) async {
    try {
      var responce = await Dio().get(url,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return true;
              },
              headers: {
                "Notion-Version": "2022-02-22",
                "Authorization":
                    "Bearer secret_6FUwEepND9KKRbw6SUxYailRLqVEMbsnhs5DgQxzIQ3"
              }));

      print("-------------${responce.data.runtimeType}");

      return responce.data;
    } on DioException catch (e) {
      return {"message": e};
    }
  }
}
