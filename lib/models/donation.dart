class Donation {
  final int donorId;
  final int patientId;
  final String bloodBank;
  final String date;

  Donation(
      this.donorId,
      this.patientId,
      this.bloodBank,
      this.date,
      );

  /// constructor for constructing a new [Donation] instance from [map] structure
  Donation.fromJson(Map json)
      : donorId = json['donor_id'],
        patientId = json['patient_id'],
        bloodBank = json['blood_bank'],
        date = json['date'];

  /// function to convert [Donation] instance into [map]
  Map toJson() {
    return {
      'donor_id': donorId,
      'patient_id': patientId,
      'blood_bank': bloodBank,
      'date': date
    };
  }

  /// function for string representation of [Donation] instance
  @override
  String toString() {
    return 'Donation{donorId: $donorId, patientId: $patientId, bloodBank: $bloodBank, date: $date}';
  }
}
