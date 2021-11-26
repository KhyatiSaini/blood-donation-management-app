class Patient {
  final int id;
  final String name;
  final String medicalCondition;
  final String bloodGroup;

  Patient(
    this.id,
    this.name,
    this.medicalCondition,
    this.bloodGroup,
  );

  /// constructor for constructing a new [Patient] instance from [map] structure
  Patient.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        medicalCondition = json['medical_condition'],
        bloodGroup = json['blood_group'];

  /// function to convert [Patient] instance into [map]
  Map toJson() {
    return {
      'id': id,
      'name': name,
      'medical_condition': medicalCondition,
      'blood_group': bloodGroup
    };
  }

  /// function for string representation of [Patient] instance
  @override
  String toString() {
    return 'Patient{id: $id, name: $name, medicalCondition: $medicalCondition, bloodGroup: $bloodGroup}';
  }
}
