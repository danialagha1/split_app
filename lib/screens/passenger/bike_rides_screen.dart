import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_pooling_app/model/bike_rides_model.dart';
import 'package:vehicle_pooling_app/widgets/custom_appbar.dart';

class BikeRidesScreen extends StatefulWidget {
  const BikeRidesScreen({Key? key}) : super(key: key);

  @override
  State<BikeRidesScreen> createState() => _BikeRidesScreenState();
}

class _BikeRidesScreenState extends State<BikeRidesScreen> {
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  final _normalTextStyle = GoogleFonts.roboto(
      fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black);

  String? _selectedFromValue;
  String? _selectedToValue;
  List<BikeRidesModel> _filteredBikeRidesList = BikeRidesModel.bikeRidesList;

  void _filterList() {
    _filteredBikeRidesList = BikeRidesModel.bikeRidesList
        .where((ride) =>
            ride.pickUp == _selectedFromValue &&
            ride.dropOff == _selectedToValue)
        .toList();
  }

  void _clearFilter() {
    setState(() {
      _selectedFromValue = null;
      _selectedToValue = null;
      _filteredBikeRidesList = BikeRidesModel.bikeRidesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(onClearFilter: _clearFilter, titleName: "Bike Rides"),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //SizedBox(height: 5,),
          _buildFilterDropdowns(),
          SizedBox(height: screenHeight * 0.03),
          Expanded(
            child: _buildFilteredRidesList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdowns() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildDropdown('PICK-UP', _selectedFromValue, screenHeight, (String? newValue) {
          setState(() {
            _selectedFromValue = newValue!;
            _filterList();
          });
        }),
        _buildDropdown('DROP-OFF', _selectedToValue, screenHeight, (String? newValue) {
          setState(() {
            _selectedToValue = newValue!;
            _filterList();
          });
        }),
      ],
    );
  }

  Widget _buildDropdown(
      String label, String? value, double height, ValueChanged<String?> onChanged) {
    return Column(
      children: [
        Text(label, style: _normalTextStyle,),
        SizedBox(height: height * 0.010),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade300,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.004, vertical: screenHeight * 0.006),
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
      ]
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

  Widget _buildFilteredRidesList() {
    if (_filteredBikeRidesList.isEmpty) {
      return const Center(
        child: Text('No Rides available'),
      );
    }

    return ListView.builder(
      itemCount: _filteredBikeRidesList.length,
      itemBuilder: (context, index) {
        BikeRidesModel ride = _filteredBikeRidesList[index];
        return Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018, horizontal: screenWidth * 0.038),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ride.name ?? '', style: _normalTextStyle),
                Text(ride.model ?? '', style: _normalTextStyle),
                Text(ride.number ?? '', style: _normalTextStyle),
                SizedBox(height: screenHeight * 0.016),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(ride.pickUp ?? '', style: _normalTextStyle),
                    SizedBox(width: screenWidth * 0.010),
                    const Text('to'),
                    SizedBox(width: screenWidth * 0.010),
                    Text(ride.dropOff ?? '', style: _normalTextStyle),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
