import 'dart:convert';

List<Map<String, dynamic>> generateGridFromRecords(dynamic dbRecords, Map<String, String> fields) {
  List<Map<String, dynamic>> records = [];
  for (dynamic row in dbRecords) {
    Map<String, String?> record = {};
    int index = 0;
    for (dynamic field in row) {
      final key = fields.keys.elementAt(index);
      String value = "";
      if (field != null) {
        value = utf8.decode(field);
      }
      index++;
      record[key] = value;
    }
    records.add(record);
  }
  return records;
}
