class Devices {
  String phone;
  String device;
  String deviceTypeId;
  Devices({
    required this.device,
    required this.phone,
    required this.deviceTypeId,
  });
}

Devices fromJsonDevices(Map<String, dynamic> e) {
  return Devices(
    phone: e['phone'],
    device: e['device_name'],
    deviceTypeId: e['device_type'],
  );
}

// fromJsonDevices
// List<int> listID = [
//   10400043,
//   10400129,
//   10400166,
//   10400170,
//   10400173,
//   10400571,
//   10400651,
//   10400958,
//   10401373,
//   10401621,
//   10401639,
//   10401774,
//   10401886,
//   8048672291,
//   8049124198,
//   8049140376,
//   8049142323,
//   8049163311,
//   8049163543,
// ];

// List<Devices> listDevices = listID
//     .map((e) => Devices(
//           device: e,
//           phone: "255625789316",
//           deviceTypeId: "2",
//         ))
//     .toList();
