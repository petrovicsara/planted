import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:planted/model/druck.dart';
import 'package:planted/model/ist.dart';

class LoadData {
  static final List<Ist> istData = [];
  static final List<Druck> druckData = [];

  String myCSV = '';

  Future loadData() async{
    await loadDruckData();
    await loadIstData();
  }

  loadDruckData() async {
    try {
      myCSV = await rootBundle.loadString('assets/druck.csv');
      List<List<dynamic>> data = csvToList(myCSV);
      List values = [];

      if(druckData.isNotEmpty){
        druckData.clear();
      }

      for(int i=1; i<data.length; i++) {
        values.add(data[i]);
      }

      for(int i=0; i<values.length-1; i++){
        String time = values[i].toString().split(', ')[1].trim();
        String valueNumber = values[i].toString().split(', ')[2];
        String value = valueNumber.substring(0, valueNumber.indexOf(']'));
        druckData.add(Druck(DateTime.parse(time), double.parse(value)));
      }
    } catch (e) {
      print(e);
    }
  }

  loadIstData() async {
    try {
      myCSV = await rootBundle.loadString('assets/ist.csv');
      List<List<dynamic>> data = csvToList(myCSV);
      List values = [];

      if(istData.isNotEmpty){
        istData.clear();
      }

      for(int i=1; i<data.length; i++) {
        values.add(data[i]);
      }

      for(int i=0; i<values.length-1; i++){
        String time = values[i].toString().split(', ')[1].trim();
        String valueNumber = values[i].toString().split(', ')[2];
        String value = valueNumber.substring(0, valueNumber.indexOf(']'));
        istData.add(Ist(DateTime.parse(time), double.parse(value)));
      }
    } catch (e) {
      print(e);
    }
  }

  List<List> csvToList(String myCSV) {
    CsvToListConverter c = const CsvToListConverter(eol: '\r\n', fieldDelimiter: ',');
    List<List> list = c.convert(myCSV);
    return list;
  }
}