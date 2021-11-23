class BloodBank {
  final String name;
  final int staffDetails;
  final String operatingHours;
  final String address;

  BloodBank(
    this.name,
    this.staffDetails,
    this.operatingHours,
    this.address,
  );

  BloodBank.fromJson(Map json)
      : name = json['name'],
        staffDetails = json['staff_details'],
        operatingHours = json['operating_hours'],
        address = json['address'];

  Map toJson() {
    return {
      'name': name,
      'staff_details': staffDetails,
      'operating_hours': operatingHours,
      'address': address
    };
  }

  @override
  String toString() {
    return 'BloodBank{name: $name, staffDetails: $staffDetails, operatingHours: $operatingHours, address: $address}';
  }
}
