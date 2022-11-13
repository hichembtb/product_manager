class ClientModel {
  // * frontend Var
  final String name;
  final String surname;
  final double credit;
  final DateTime addedDate;
  final List payment;
  // ! backend Var
  final String refId;
  ClientModel({
    // * frontend Var
    required this.name,
    required this.surname,
    required this.credit,
    required this.addedDate,
    required this.payment,
    // ! backend Var
    required this.refId,
  });
  factory ClientModel.fromMap(Map<String, dynamic> data) {
    return ClientModel(
      // * frontend Var
      name: data['name'],
      surname: data['surname'],
      credit: data['credit'],
      addedDate: data['added_date'].toDate(),
      payment: data['payment'],
      // ! backend Var
      refId: data['refId'],
    );
  }
}
