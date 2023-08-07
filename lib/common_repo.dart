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

      // if (responce.statusCode! > 200 && responce.statusCode! < 300) {
      //   return responce.data;
      // } else {
      //   return {"status": false};
      // }
    } on DioException catch (e) {
      return {"message": e};
    }
  }

  // String endpoint =
  //     'https://api.notion.com/v1/blocks/e45f355a4cb442fab0c22521e88912ec/children?page_size=200';
  // static Future<Temperatures> getUsers(endpoint) async {
  //   Response response = await get(Uri.parse(endpoint), headers: {
  //     "Notion-Version": "2022-02-22",
  //     "Authorization":
  //         "Bearer secret_6FUwEepND9KKRbw6SUxYailRLqVEMbsnhs5DgQxzIQ3"
  //   });
  //   if (response.statusCode == 200) {
  //     final result = jsonDecode(response.body);
  //     print(result);
  //     // return result.map(((e) => Temperatures.fromJson(e))).toList();
  //     return result.map(((e) => Temperatures.fromJson(result)));
  //   } else {
  //     throw Exception(response);
  //   }
  // }

 
}
