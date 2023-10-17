import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                icon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email),
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                icon: Icon(Icons.phone),
              ),
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                icon: Icon(Icons.location_on),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String email = emailController.text;
                String password = passwordController.text;
                String phone = phoneController.text;
                String address = addressController.text;

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return UserInfoPage(
                        name: name,
                        email: email,
                        password: password,
                        phone: phone,
                        address: address,
                      );
                    },
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoPage extends StatelessWidget {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String address;

  UserInfoPage({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 8.0),
                      Text('Имя: $name'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 8.0),
                      Text('Email: $email'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock),
                      SizedBox(width: 8.0),
                      Text('Пароль: $password'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 8.0),
                      Text('Телефон: $phone'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 8.0),
                      Text('Адрес: $address'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}