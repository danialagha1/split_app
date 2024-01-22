class CarRidesModel {
  CarRidesModel({
    this.name,
    this.model,
    this.number,
    this.pickUp,
    this.dropOff,
  });

  String? name;
  String? model;
  String? number;
  String? pickUp;
  String? dropOff;

  static List<CarRidesModel> carRidesList = [
    CarRidesModel(name: "Danial Agha", model: "Alto-VXL", number: "03122336722", pickUp: "Malir", dropOff: "Shah Faisal Colony"),
    CarRidesModel(name: "Ebad", model: "Corolla-X", number: "03189161131", pickUp: "Shah Faisal Colony", dropOff: "Defence"),
    CarRidesModel(name: "Talha", model: "Suzuki-Cultus", number: "03022136722", pickUp: "Malir", dropOff: "Defence"),
    CarRidesModel(name: "Khalid", model: "Kia-Picanto", number: "03112377722", pickUp: "F.B. Area", dropOff: "Shahra-e-Faisal"),
    CarRidesModel(name: "Muhammad Muzammil", model: "Honda-Civic", number: "03182436712", pickUp: "Gulberg", dropOff: "Defence"),
  ];
}