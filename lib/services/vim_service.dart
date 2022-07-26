import 'package:dio/dio.dart';
import 'package:vim/contracts/vim_contract.dart';
import 'package:vim/models/carInfo.dart';

class VimService implements VimContract {
  String serverurl = "https://vpic.nhtsa.dot.gov/";
  String endpoint = "api/vehicles/DecodeVinValues/";


  @override
  Future<CarInfo> getVimInfo(String year, String vim) async {
    //https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVinValues/2HGFA16537H507451?format=json&modelyear=2007
  CarInfo response = CarInfo();
    try {
      var resp = await Dio().get(serverurl + endpoint+vim+"?format=json&modelyear="+year);
      if (resp.statusCode == 200) {
        response = CarInfo.fromJson(resp.data);
        // foundSexes = list
        //     .map<SexualOrientation>((sample) => SexualOrientation(
        //         id: sample["id"],
        //         enabled: sample["enabled"],
        //         name: sample["name"]))
        //     .toList();
        // foundCountry;
        return response;
      }

      if (resp.statusCode == "404") {
        print("Car Not Found");
      }
      return response;
    } on DioError catch (e) {
      //http error(statusCode not 20x) will be catched here.
      print(e.response!.statusCode.toString());
      print('Failed Load Data with status code ${e.response!.statusCode}');
      return response;
    } catch (e) {
      print(e);
      return response;
    }
  }
  
}