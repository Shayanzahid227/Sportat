import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchFilterBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: whitecolor,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: _SearchFilterContent(),
        );
      },
    );
  }
}

class _SearchFilterContent extends StatefulWidget {
  @override
  __SearchFilterContentState createState() => __SearchFilterContentState();
}

class __SearchFilterContentState extends State<_SearchFilterContent> {
  String? selectedCity;
  String? selectedSport;
  DateTime? selectedDate;
  double minPrice = 30;
  double maxPrice = 3000;
  double currentPrice = 30;
  void _resetFilters() {
    setState(() {
      selectedCity = null;
      selectedSport = null;
      selectedDate = null;
      minPrice = 30;
      maxPrice = 3000;
    });
  }

  List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Miami'
  ];
  List<String> sports = [
    'Football',
    'Basketball',
    'Tennis',
    'Cricket',
    'Baseball'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                _resetFilters();
              },
              child: Text("Reset", style: style16B),
            ),
            Text("Search Filter", style: style20B.copyWith(color: blackColor)),
            IconButton(
              icon: Image.asset(
                AppAssets().close,
                scale: 4,
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
        SizedBox(height: 20),
        _buildDropdown("City", cities, selectedCity, (value) {
          setState(() {
            selectedCity = value;
          });
        }),
        _buildDropdown("Sport", sports, selectedSport, (value) {
          setState(() {
            selectedSport = value;
          });
        }),
        _buildDatePicker(),
        _buildPriceSlider(),
        SizedBox(height: 20),
        _buildApplyButton(),
      ],
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedItem,
      Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: style16.copyWith(color: lightGreyColor)),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            dropdownColor: whitecolor,
            icon: Icon(Icons.keyboard_arrow_down),
            value: selectedItem,
            isExpanded: true,
            hint: Text("Select $label"),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    selectedDate == null
                        ? "Select Date"
                        : DateFormat('dd MMM, yyyy').format(selectedDate!),
                    style: TextStyle(fontSize: 16)),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _buildPriceSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price",
          style: style16.copyWith(color: lightGreyColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${minPrice.toInt()} SAR", style: style16),
            Text("${maxPrice.toInt()} SAR", style: style16),
          ],
        ),
        RangeSlider(
          values: RangeValues(minPrice, maxPrice),
          min: 30,
          max: 3000,
          divisions: 50, // Controls the step count
          activeColor: Colors.green,
          labels: RangeLabels(
            "${minPrice.toInt()} SAR",
            "${maxPrice.toInt()} SAR",
          ),
          onChanged: (RangeValues values) {
            setState(() {
              minPrice = values.start;
              maxPrice = values.end;
            });
          },
        ),
      ],
    );
  }

  Widget _buildApplyButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: () {
        Navigator.pop(context);
        // Apply filter logic here
      },
      child: Text("Apply Filter", style: style16B.copyWith(color: whitecolor)),
    );
  }
}
