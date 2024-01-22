import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_pooling_app/model/car_rides_model.dart';
import 'package:vehicle_pooling_app/widgets/custom_appbar.dart';

class CarRidesScreen extends StatefulWidget {
  const CarRidesScreen({Key? key}) : super(key: key);

  @override
  State<CarRidesScreen> createState() => _CarRidesScreenState();
}

class _CarRidesScreenState extends State<CarRidesScreen> {
  final _normalTextStyle = GoogleFonts.roboto(
      fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black);

  String? _selectedFromValue;
  String? _selectedToValue;
  List<CarRidesModel> _filteredCarRidesList = CarRidesModel.carRidesList;

  void _filterList() {
    _filteredCarRidesList = CarRidesModel.carRidesList
        .where((ride) =>
            ride.pickUp == _selectedFromValue &&
            ride.dropOff == _selectedToValue)
        .toList();
  }

  void _clearFilter() {
    setState(() {
      _selectedFromValue = null;
      _selectedToValue = null;
      _filteredCarRidesList = CarRidesModel.carRidesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onClearFilter: _clearFilter, titleName: 'Car Rides'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildFilterDropdowns(),
          const SizedBox(height: 15),
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
        _buildDropdown('From', _selectedFromValue, (String? newValue) {
          setState(() {
            _selectedFromValue = newValue!;
            _filterList();
          });
        }),
        _buildDropdown('To', _selectedToValue, (String? newValue) {
          setState(() {
            _selectedToValue = newValue!;
            _filterList();
          });
        }),
      ],
    );
  }

  Widget _buildDropdown(
      String label, String? value, ValueChanged<String?> onChanged) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
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
    if (_filteredCarRidesList.isEmpty) {
      return const Center(
        child: Text('No Rides available'),
      );
    }

    return ListView.builder(
      itemCount: _filteredCarRidesList.length,
      itemBuilder: (context, index) {
        CarRidesModel ride = _filteredCarRidesList[index];
        return Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ride.name ?? '', style: _normalTextStyle),
                Text(ride.model ?? '', style: _normalTextStyle),
                Text(ride.number ?? '', style: _normalTextStyle),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(ride.pickUp ?? '', style: _normalTextStyle),
                    const SizedBox(width: 5),
                    const Text('to'),
                    const SizedBox(width: 4),
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
