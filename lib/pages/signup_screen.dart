import 'package:flutter/material.dart';
import 'group_chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> countries = [
    'India', 'USA', 'Canada', 'UK', 'Australia', 'Germany', 'France', 'Italy', 'Spain', 'Japan'
  ];

  final Map<String, Map<String, dynamic>> _data = {
    'India': {
      'states': ['Andhra Pradesh', 'Maharashtra', 'Karnataka', 'Tamil Nadu', 'Telangana'],
      'cities': {
        'Andhra Pradesh': ['Visakhapatnam', 'Vijayawada', 'Tirupati', 'Guntur'],
        'Maharashtra': ['Mumbai', 'Pune', 'Nagpur', 'Nashik'],
        'Karnataka': ['Bengaluru', 'Mysuru', 'Mangaluru', 'Hubli'],
        'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai', 'Tiruchirappalli'],
        'Telangana': ['Hyderabad', 'Warangal', 'Nizamabad', 'Khammam'],
      }
    },
    'USA': {
      'states': ['California', 'Texas', 'Florida', 'New York', 'Illinois'],
      'cities': {
        'California': ['Los Angeles', 'San Francisco', 'San Diego', 'Sacramento'],
        'Texas': ['Houston', 'Dallas', 'Austin', 'San Antonio'],
        'Florida': ['Miami', 'Orlando', 'Tampa', 'Jacksonville'],
        'New York': ['New York City', 'Buffalo', 'Rochester', 'Albany'],
        'Illinois': ['Chicago', 'Aurora', 'Naperville', 'Rockford'],
      }
    },
    'Canada': {
      'states': ['Ontario', 'Quebec', 'British Columbia', 'Alberta', 'Nova Scotia'],
      'cities': {
        'Ontario': ['Toronto', 'Ottawa', 'Hamilton', 'London'],
        'Quebec': ['Montreal', 'Quebec City', 'Gatineau', 'Laval'],
        'British Columbia': ['Vancouver', 'Victoria', 'Surrey', 'Burnaby'],
        'Alberta': ['Calgary', 'Edmonton', 'Red Deer', 'Lethbridge'],
        'Nova Scotia': ['Halifax', 'Sydney', 'Dartmouth', 'Truro'],
      }
    },
    'UK': {
      'states': ['England', 'Scotland', 'Wales', 'Northern Ireland'],
      'cities': {
        'England': ['London', 'Manchester', 'Birmingham', 'Liverpool'],
        'Scotland': ['Edinburgh', 'Glasgow', 'Aberdeen', 'Dundee'],
        'Wales': ['Cardiff', 'Swansea', 'Newport', 'Wrexham'],
        'Northern Ireland': ['Belfast', 'Derry', 'Lisburn', 'Newtownabbey'],
      }
    },
    'Australia': {
      'states': ['New South Wales', 'Victoria', 'Queensland', 'Western Australia', 'South Australia'],
      'cities': {
        'New South Wales': ['Sydney', 'Newcastle', 'Wollongong', 'Central Coast'],
        'Victoria': ['Melbourne', 'Geelong', 'Ballarat', 'Bendigo'],
        'Queensland': ['Brisbane', 'Gold Coast', 'Cairns', 'Townsville'],
        'Western Australia': ['Perth', 'Mandurah', 'Bunbury', 'Geraldton'],
        'South Australia': ['Adelaide', 'Mount Gambier', 'Port Adelaide', 'Whyalla'],
      }
    },
    'Germany': {
      'states': ['Bavaria', 'Berlin', 'North Rhine-Westphalia', 'Baden-Württemberg', 'Hesse'],
      'cities': {
        'Bavaria': ['Munich', 'Nuremberg', 'Augsburg', 'Regensburg'],
        'Berlin': ['Berlin'],
        'North Rhine-Westphalia': ['Cologne', 'Düsseldorf', 'Dortmund', 'Essen'],
        'Baden-Württemberg': ['Stuttgart', 'Mannheim', 'Karlsruhe', 'Freiburg'],
        'Hesse': ['Frankfurt', 'Wiesbaden', 'Darmstadt', 'Kassel'],
      }
    },
    'France': {
      'states': ['Île-de-France', 'Provence-Alpes-Côte d\'Azur', 'Auvergne-Rhône-Alpes', 'Nouvelle-Aquitaine', 'Occitanie'],
      'cities': {
        'Île-de-France': ['Paris', 'Boulogne-Billancourt', 'Saint-Denis', 'Nanterre'],
        'Provence-Alpes-Côte d\'Azur': ['Marseille', 'Nice', 'Toulon', 'Avignon'],
        'Auvergne-Rhône-Alpes': ['Lyon', 'Grenoble', 'Saint-Étienne', 'Clermont-Ferrand'],
        'Nouvelle-Aquitaine': ['Bordeaux', 'Poitiers', 'La Rochelle', 'Limoges'],
        'Occitanie': ['Toulouse', 'Montpellier', 'Nîmes', 'Perpignan'],
      }
    },
    'Italy': {
      'states': ['Lazio', 'Lombardy', 'Campania', 'Sicily', 'Veneto'],
      'cities': {
        'Lazio': ['Rome', 'Latina', 'Frosinone', 'Rieti'],
        'Lombardy': ['Milan', 'Bergamo', 'Brescia', 'Como'],
        'Campania': ['Naples', 'Salerno', 'Avellino', 'Caserta'],
        'Sicily': ['Palermo', 'Catania', 'Messina', 'Syracuse'],
        'Veneto': ['Venice', 'Verona', 'Vicenza', 'Padua'],
      }
    },
    'Spain': {
      'states': ['Andalusia', 'Catalonia', 'Madrid', 'Valencia', 'Galicia'],
      'cities': {
        'Andalusia': ['Seville', 'Malaga', 'Granada', 'Córdoba'],
        'Catalonia': ['Barcelona', 'Girona', 'Tarragona', 'Lleida'],
        'Madrid': ['Madrid'],
        'Valencia': ['Valencia', 'Alicante', 'Castellón'],
        'Galicia': ['Santiago de Compostela', 'La Coruña', 'Pontevedra', 'Ourense'],
      }
    },
    'Japan': {
      'states': ['Tokyo', 'Osaka', 'Kyoto', 'Hokkaido', 'Okinawa'],
      'cities': {
        'Tokyo': ['Tokyo'],
        'Osaka': ['Osaka'],
        'Kyoto': ['Kyoto'],
        'Hokkaido': ['Sapporo', 'Hakodate', 'Asahikawa', 'Obihiro'],
        'Okinawa': ['Naha', 'Okinawa City', 'Urasoe', 'Ishigaki'],
      }
    },
  };

  String selectedCountry = 'India';
  String selectedState = 'Andhra Pradesh';
  String selectedCity = 'Vijayawada';
  String gender = 'Male';
  bool termsAccepted = false;

  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController PostalController = TextEditingController();


  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isPasswordVisible = false; // For password visibility toggle

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign Up', style: TextStyle(fontFamily: 'Cherry Swash', fontSize: 20)),
            SizedBox(height: 4),
            Text('Please enter your credentials', style: TextStyle(fontFamily: 'Cherry Swash', fontSize: 14, color: Colors.white70)),
          ],
        ),
        backgroundColor: Color(0xFF438E96),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                _buildTextField(label: 'Full Name', controller: fullnameController, hint: 'john wick', isRequired: true),


                _buildTextField(label: 'Phone Number', controller: phoneNumberController, hint: '1234567895', keyboardType: TextInputType.phone, isRequired: true),


                _buildTextField(label: 'Email Address', controller: emailController, hint: 'john@gmail.com', keyboardType: TextInputType.emailAddress, isRequired: true),

                // Password
                SizedBox(height: 4),
                Text('Password', style: TextStyle(color: Color(0xFF438E96), fontFamily: 'Roboto')),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password ',
                    labelStyle: TextStyle(fontFamily: 'Roboto'),
                    hintText: 'Password must have: uppercase, number & special character',
                    hintStyle: TextStyle(fontFamily: 'Roboto',color: Color(0xFFB0E0E6),),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),

                // Address
                _buildTextField(label: 'Address', controller: addressController, hint: 'address 1', maxLines: 3, isRequired: true),

                // Country Dropdown
                _buildDropdown(
                  label: 'Country',
                  value: selectedCountry,
                  items: _data.keys.toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value!;
                      selectedState = _data[selectedCountry]!['states'].first; // Reset state
                      selectedCity = _data[selectedCountry]!['cities'][selectedState].first; // Reset city
                    });
                  },
                ),

                // State Dropdown
                _buildDropdown(
                  label: 'State',
                  value: selectedState,
                  items: _data[selectedCountry]!['states'],
                  onChanged: (value) {
                    setState(() {
                      selectedState = value!;
                      selectedCity = _data[selectedCountry]!['cities'][selectedState].first; // Reset city
                    });
                  },
                ),

                // City Dropdown
                _buildDropdown(
                  label: 'City',
                  value: selectedCity,
                  items: _data[selectedCountry]!['cities'][selectedState],
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value!;
                    });
                  },
                ),

                _buildTextField(label: 'Postal Code', controller: PostalController, hint: '123456', keyboardType: TextInputType.emailAddress, isRequired: true),

                // Date of Birth
                SizedBox(height: 4),
                Text('Date of Birth', style: TextStyle(color: Color(0xFF438E96), fontFamily: 'Roboto')),
                SizedBox(height: 16),
                TextFormField(
                  controller: dobController,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth ',
                    labelStyle: TextStyle(fontFamily: 'Roboto'),
                    hintText: 'DD/MM/YYYY',
                    hintStyle: TextStyle(fontFamily: 'Roboto', color: Color(0xFFB0E0E6),),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    return null;
                  },
                ),

                // Gender Selection
                SizedBox(height: 4),
                Text('Gender', style: TextStyle(color: Color(0xFF438E96), fontFamily: 'Roboto')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildGenderRadio('Male'),
                    _buildGenderRadio('Female'),
                    _buildGenderRadio('Prefer not to say'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          termsAccepted = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'I accept the terms and conditions',
                        style: TextStyle(fontFamily: 'Roboto'),
                      ),
                    ),
                  ],
                ),

                // Sign Up Button
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signUp,
                  child: Text('CREATE ACCOUNT', style: TextStyle(color: Colors.white, fontFamily: 'Roboto')),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(318, 56),
                    backgroundColor: Color(0xFF438E96),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required TextEditingController controller, String? hint, int maxLines = 1, TextInputType keyboardType = TextInputType.text, bool isRequired = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(label, style: TextStyle(color: Color(0xFF438E96), fontFamily: 'Roboto')),
        SizedBox(height: 4),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: TextStyle(fontFamily: 'Roboto'),
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return 'Please enter your $label';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDropdown({required String label, required String value, required List<String> items, required ValueChanged<String?> onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(label, style: TextStyle(color: Color(0xFF438E96), fontFamily: 'Roboto')),
        SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: TextStyle(fontFamily: 'Roboto')),
            );
          }).toList(),
          onChanged: onChanged,
          validator: (value) {
            if (value == null) {
              return 'Please select a $label';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildGenderRadio(String genderOption) {
    return Row(
      children: [
        Radio<String>(
          value: genderOption,
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value!;
            });
          },
        ),
        Text(genderOption, style: TextStyle(fontFamily: 'Roboto')),
      ],
    );
  }

  void _signUp() async {
    if (_formKey.currentState!.validate() && termsAccepted) {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // Store user information in Firestore
        await FirebaseFirestore.instance.collection('users').doc(
            userCredential.user?.uid).set({
          'fullName': fullnameController.text,
          'phoneNumber': phoneNumberController.text,
          'country': selectedCountry,
          'state': selectedState,
          'city': selectedCity,
          'dob': dobController.text,
          'gender': gender,
          'address': addressController.text,
          'termsAccepted': termsAccepted,
        });

        // Navigate to group chat screen
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  GroupChatScreen(
                      currentUserFullName: fullnameController.text.trim()),
            )
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
