import 'dart:convert';
import 'package:halake_barber/model/rest/rest_response.dart';
import 'package:halake_barber/model/slot/slot.dart';
import 'package:halake_barber/utils/const_res.dart';
import 'package:http/http.dart' as http;

class SlotService {
  Future<RestResponse?> addStaffSlot(
    int staffId,
    String time,
    String weekDay,
  ) async {
    final response = await http.post(
      Uri.parse(ConstRes.addStaffSlot),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {
        ConstRes.staffId: staffId.toString(),
        ConstRes.time: time,
        ConstRes.weekday: weekDay,
      },
    );
    final responseJson = jsonDecode(response.body);
    return RestResponse.fromJson(responseJson);
  }

  Future<RestResponse?> deleteStaffSlot(int slotId) async {
    final response = await http.post(
      Uri.parse(ConstRes.deleteStaffSlot),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {ConstRes.slotId: slotId.toString()},
    );
    final responseJson = jsonDecode(response.body);
    return RestResponse.fromJson(responseJson);
  }

  Future<Slot?> fetchStaffSlots(int staffId) async {
    final response = await http.post(
      Uri.parse(ConstRes.fetchStaffSlots),
      headers: {ConstRes.apiKey: ConstRes.apiKeyValue},
      body: {ConstRes.staffId: staffId.toString()},
    );
    final responseJson = jsonDecode(response.body);
    return Slot.fromJson(responseJson);
  }
}
