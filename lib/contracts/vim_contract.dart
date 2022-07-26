import '../models/carInfo.dart';

abstract class VimContract{
  Future<CarInfo>getVimInfo(String year,String vim);
}