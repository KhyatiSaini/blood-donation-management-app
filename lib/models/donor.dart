class Donor {
  final int id;
  final String name;
  final String medicalReport;
  final String bloodGroup;
  final String contactNumber;
  final DateTime? latestDonationDate;

  Donor(
    this.id,
    this.name,
    this.medicalReport,
    this.bloodGroup,
    this.contactNumber,
    this.latestDonationDate,
  );

  Donor.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        medicalReport = json['medical_report'],
        bloodGroup = json['blood_group'],
        contactNumber = json['contact_number'],
        latestDonationDate = json['latest_donation_date'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'medical_report': medicalReport,
      'blood_group': bloodGroup,
      'contact_number': contactNumber,
      'latest_donation_date': latestDonationDate
    };
  }

  @override
  String toString() {
    return 'Donor{id: $id, name: $name, medicalReport: $medicalReport, bloodGroup: $bloodGroup, contactNumber: $contactNumber, latestDonationDate: $latestDonationDate}';
  }
}
