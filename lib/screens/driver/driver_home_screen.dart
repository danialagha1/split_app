import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_pooling_app/widgets/custom_drawer1.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({Key? key}) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

enum VehicleType { car, bike }

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool isOnline = false;
  String? _selectedFromValue;
  String? _selectedToValue;
  VehicleType _selectedVehicleType = VehicleType.car;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextStyle? style1;
  TextStyle? style2;


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    style1 = GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black);
    style2 = GoogleFonts.roboto(fontSize: 21, fontWeight: FontWeight.w500);


    return Scaffold(
      drawer: const DriverDrawer(),
      appBar: buildAppBar(),
      body: buildBody(style1!, style2!, screenWidth, screenHeight),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Color(0xFF0F52BA),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/customer_logo.png"),
        ),
      ],
    );
  }

  Widget buildBody(TextStyle style1, TextStyle style2, double width, double height) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.036),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildWelcomeText(style1, style2),
          SizedBox(height: height * 0.022),
          Row(
            children: [
              buildStatusCard(style1, style2, width, height),
              const Spacer(),
              buildAddVehicleCard(width, height),
            ],
          ),
          SizedBox(height: height * 0.018),
          buildCreateRideCard(height, width),
        ],
      ),
    );
  }

  Widget buildWelcomeText(TextStyle style1, TextStyle style2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome Captain', style: style1),
        Text('Muhammad Ebad Ur Rehman', style: style2),
      ],
    );
  }

  Widget buildStatusCard(TextStyle style1, TextStyle style2, double width, double height) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.025, vertical: height * 0.016),
        width: width * 0.390,
        height: height * 0.180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Status', style: style2),
            Text(isOnline ? "You're Online" : "You're Offline", style: style1),
            Align(
              alignment: Alignment.bottomRight,
              child: buildSwitch(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwitch() {
    return Switch(
      activeColor: const Color(0xFF0F52BA),
      value: isOnline,
      onChanged: (value) {
        setState(() {
          isOnline = value;
        });
      },
    );
  }

  Widget buildAddVehicleCard(double width, double height) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: width * 0.490,
        height: height * 0.180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Add Vehicle', style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w500)),
            Text("Information", style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black)),
            Align(
              alignment: Alignment.bottomRight,
              child: buildAddVehicleButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddVehicleButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0F52BA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {},
      child: Text('Add'),
    );
  }

  Widget buildCreateRideCard(double height, double width) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.030, vertical: height * 0.014),
        width: double.infinity,
        height: height * 0.190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Create a Ride to share with others', style: GoogleFonts.roboto(fontSize: 21, fontWeight: FontWeight.w500)),
            Text("One Ride, Many Smiles", style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black)),
            SizedBox(height: height * 0.018),
            Align(
              alignment: Alignment.bottomRight,
              child: buildAddRideButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddRideButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0F52BA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: showBottomModalSheet,
      child: Text('Add'),
    );
  }

  Widget _buildDropdown(String label, String? value, ValueChanged<String?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(label),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade300,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: DropdownButton(
              style: const TextStyle(fontSize: 13, color: Colors.black),
              elevation: 4,
              value: value,
              borderRadius: BorderRadius.circular(15),
              dropdownColor: Colors.grey.shade200,
              onChanged: onChanged,
              items: _buildDropdownMenuItems(),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    return [
      "Shah Faisal Colony",
      "Defence",
      "Malir",
      "F.B. Area",
      "Shahra-e-Faisal",
      "Gulberg"
    ]
        .map(
          (location) => DropdownMenuItem(
        value: location,
        child: Text(location),
      ),
    )
        .toList();
  }

  Widget buildVehicleTypeSelection() {
    return StatefulBuilder(
      builder: (context,setState){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select Vehicle Type'),
            Radio(
              value: VehicleType.car,
              groupValue: _selectedVehicleType,
              onChanged: (VehicleType? value) {
                setState(() {
                  _selectedVehicleType = value!;
                });
              },
            ),
            Text('Car'),
            Radio(
              value: VehicleType.bike,
              groupValue: _selectedVehicleType,
              onChanged: (VehicleType? value) {
                setState(() {
                  _selectedVehicleType = value!;
                });
              },
            ),
            Text('Bike'),
          ],
        );
      },
    );
  }

  Widget buildAddRideConfirmationButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0F52BA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Update the main screen's state
          setState(() {
            // Update other values if needed
          });

          // Close the modal sheet
          Navigator.pop(context);
        }
      },
      child: Text('Add'),
    );
  }
  void showBottomModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Add Ride Information', style: style1,),
              SizedBox(height: 20),
              StatefulBuilder(
                builder: (context, setState){
                  return _buildDropdown('PICK-UP', _selectedFromValue, (String? newValue) {
                    setState(() {
                      _selectedFromValue = newValue!;
                    });
                  });
                },
              ),
              SizedBox(height: 20),
              StatefulBuilder(
                builder: (context, setState){
                  return _buildDropdown('DROP-OFF', _selectedToValue, (String? newValue) {
                    setState(() {
                      _selectedToValue = newValue!;
                    });
                  });
                },
              ),
              SizedBox(height: 16),
              buildVehicleTypeSelection(),
              SizedBox(height: 16),
              buildAddRideConfirmationButton(),
            ],
          ),
        );
      },
    );
  }
}

