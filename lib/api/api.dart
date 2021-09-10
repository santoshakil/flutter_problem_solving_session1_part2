import 'package:demo_app/model/model.dart';
import 'package:http/http.dart';

Future<List<TestDataModel>?> getData() async {
  var request =
      Request('GET', Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var _json = await response.stream.bytesToString();
    print(_json);
    var _data = testDataModelFromJson(_json);
    return _data;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}
