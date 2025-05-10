import 'package:code_structure/core/others/base_view_model.dart';
import 'package:country_picker/country_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProfileViewModel extends BaseViewModel {
  String? selectedGender;
  Country? selectedCountry;
  String? selectedCity;
  List<String> selectedCities = [];

  selectCountry(Country country) {
    selectedCountry = country;
    fetchCitiesForCountry(
        country.name); // Pass country name instead of country code
    notifyListeners();
  }

  void selectCity(String city) {
    selectedCity = city;
    notifyListeners();
  }

  String? cityError;

  Future<void> fetchCitiesForCountry(String countryName) async {
    try {
      cityError = null;
      selectedCities = await getCitiesFromCountry(countryName);
      if (selectedCities.isEmpty) {
        cityError = 'No cities found for this country';
      }
    } catch (e) {
      cityError = 'Failed to load cities';
      print("Cities Failed get $e");
    }
    notifyListeners();
  }

  Future<List<String>> getCitiesFromCountry(String countryName) async {
    print("countryName $countryName");
    List<String> cities = [];
    try {
      // Encode country name for URL and use new endpoint format
      final encodedCountry = Uri.encodeQueryComponent(countryName);
      print("encoded country name: $encodedCountry");
      final url = Uri.parse(
        'https://countriesnow.space/api/v0.1/countries/cities/q?country=$encodedCountry',
      );

      final response = await http.get(url); // Changed to GET request

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['error'] == false && data['data'] != null) {
          cities = List<String>.from(data['data']);
        } else {
          print("API Error: ${data['msg'] ?? 'Unknown error'}");
        }
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching cities: $e");
    }

    print("Fetched ${cities.length} cities for $countryName");
    return cities;
  }

  void setSelectedGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }
}
