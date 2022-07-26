import 'package:flutter/material.dart';
import 'package:vim/models/carInfo.dart';

import '../services/vim_service.dart';

class VimProvider with ChangeNotifier{
  final VimService _service;
  VimProvider(this._service);

  Future<CarInfo> getVimInfo(String year, String vim) async {
    var response = await _service.getVimInfo(vim, year);
    return response;
  }
}