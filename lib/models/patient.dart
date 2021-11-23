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

  Patient.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        medicalCondition = json['medical_condition'],
        bloodGroup = json['blood_group'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'medical_condition': medicalCondition,
      'blood_group': bloodGroup
    };
  }

  @override
  String toString() {
    return 'Patient{id: $id, name: $name, medicalCondition: $medicalCondition, bloodGroup: $bloodGroup}';
  }
}
