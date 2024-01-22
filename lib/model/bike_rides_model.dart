class BikeRidesModel {
  BikeRidesModel({
    this.name,
    this.model,
    this.number,
    this.pickUp,
    this.dropOff,
}
  );

  String? name;
  String? model;
  String? number;
  String? pickUp;
  String? dropOff;

  static List<BikeRidesModel> bikeRidesList = [
    BikeRidesModel(name: "Danial Agha", model: "CD-70", number: "03122336722", pickUp: "Malir", dropOff: "Shah Faisal Colony"),
    BikeRidesModel(name: "Ebad", model: "YBZ-125", number: "03189161131", pickUp: "Shah Faisal Colony", dropOff: "Defence"),
    BikeRidesModel(name: "Talha", model: "SP-150", number: "03022136722", pickUp: "Malir", dropOff: "Defence"),
    BikeRidesModel(name: "Khalid", model: "CG-125", number: "03112377722", pickUp: "F.B. Area", dropOff: "Shahra-e-Faisal"),
    BikeRidesModel(name: "Muhammad Muzammil", model: "UD-100", number: "03182436712", pickUp: "Gulberg", dropOff: "Defence"),
  ];
}

