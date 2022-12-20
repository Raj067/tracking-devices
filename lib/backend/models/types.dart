class TypesDevices {
  String name;
  String id;
  TypesDevices({
    required this.name,
    required this.id,
  });
}

List<TypesDevices> allTypesDevices = [
  TypesDevices(
    name: "ECTS",
    id: "1",
  ),
  TypesDevices(
    name: "CARGO",
    id: "2",
  ),
  TypesDevices(
    name: "FUEL",
    id: "3",
  ),
];
