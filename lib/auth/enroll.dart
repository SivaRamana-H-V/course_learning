import 'package:course_learning/homepage.dart';
import 'package:flutter/material.dart';

class EnrollmentForm extends StatefulWidget {
  const EnrollmentForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EnrollmentFormState createState() => _EnrollmentFormState();
}

class _EnrollmentFormState extends State<EnrollmentForm> {
  final _formKey = GlobalKey<FormState>();
  String? fullName;
  String? email;
  String? phoneNumber;
  DateTime? dateOfBirth;
  String? gender;
  String? education;
  String? CollegeUniversity;
  String? courseSelection;
  String? learningMode;
  String? learningObjectives;
  String? paymentMethod;
  String? billingAddress;
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
          'Enrollment Form',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                onSaved: (value) => fullName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                keyboardType: TextInputType.phone,
                onSaved: (value) => phoneNumber = value,
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                items: ['Male', 'Female']
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
                onSaved: (value) => gender = value,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Highest Level of Education',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                onSaved: (value) => education = value,
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'Course Selection',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                items: [
                  // Engineering Courses
                  'B.Tech. AI & DS',
                  'B.E. CSE',
                  'B.Tech. IT',
                  'B.Tech. ECE',
                  'B.E. EEE',
                  'B.E. ME',
                  'B.Tech. CE',
                  'B.Tech. ChE',
                  'M.Tech. CSE',
                  'M.Tech. AI',
                  'M.Tech. DS',
                  'M.E. CS',
                  'M.E. PED',
                  'M.E. TE',
                  'M.Tech. SE',
                  'M.Tech. ChE',
                  'Ph.D. CSE',
                  'Ph.D. IT',
                  'Ph.D. ECE',
                  'Ph.D. ME',
                  'Ph.D. CE',
                  'Ph.D. ChE',
                  'Diploma CSE',
                  'Diploma EEE',
                  'Diploma ME',
                  'Diploma CE',
                  'Diploma ChE',

                  // Arts Courses
                  'B.A. English Lit.',
                  'B.A. Economics',
                  'B.A. Pol. Sci.',
                  'B.A. History',
                  'B.A. Sociology',
                  'M.A. English Lit.',
                  'M.A. Economics',
                  'M.A. Pol. Sci.',
                  'M.A. History',
                  'M.A. Sociology',
                  'Ph.D. English Lit.',
                  'Ph.D. Economics',
                  'Ph.D. Pol. Sci.',
                  'Ph.D. History',
                  'Ph.D. Sociology',

                  // Business Courses
                  'B.Com. General',
                  'B.Com. Comp. Apps',
                  'B.Com. Acc & Fin',
                  'B.B.A.',
                  'M.Com.',
                  'M.B.A.',
                  'Ph.D. Commerce',
                  'Ph.D. Management',
                ]
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(
                            label,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    courseSelection = value;
                  });
                },
                onSaved: (value) => courseSelection = value,
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'College/University Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                items: [
                 'KGiSL Institute of Technology',
                  'KCT',
                  'PSG Tech',
                  'Amrita Vishwa Vidyapeetham',
                  'Anna University',
                  'Bharathiar University',
                  'Bharathidasan University',
                  'Madras University',
                  'SRM University',
                  'VIT University',
                  'Others'
                ]
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(
                            label,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    courseSelection = value;
                  });
                },
                onSaved: (value) => CollegeUniversity = value,
              ),
              const SizedBox(
                height: 10,
              ),
              // DropdownButtonFormField<String>(
              //   decoration: InputDecoration(
              //       labelText: 'Preferred Mode of Learning',
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(15))),
              //   items: ['Online', 'In-person', 'Hybrid']
              //       .map((label) => DropdownMenuItem(
              //             value: label,
              //             child: Text(label),
              //           ))
              //       .toList(),
              //   onChanged: (value) {
              //     setState(() {
              //       learningMode = value;
              //     });
              //   },
              //   onSaved: (value) => learningMode = value,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Learning Objectives',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                onSaved: (value) => learningObjectives = value,
              ),
              const SizedBox(
                height: 10,
              ),
              CheckboxListTile(
                title: const Text('I agree to the terms and conditions'),
                value: agreeToTerms,
                onChanged: (bool? value) {
                  setState(() {
                    agreeToTerms = value ?? false;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const homePage(),
                        ));
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: EnrollmentForm()));
