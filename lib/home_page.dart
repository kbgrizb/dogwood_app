// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dogwood_app/detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart' // new
    hide EmailAuthProvider, PhoneAuthProvider;    // new
import 'package:flutter/material.dart';           // new
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';          // new

import 'app_state.dart';                          // new
import 'src/authentication.dart';  

import 'src/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Consumer<ApplicationState>(
        builder: (context, appState, _) => ListView(
          children: [
            const SizedBox(height: 8),
            AuthFunc(
              loggedIn: appState.loggedIn,
              signOut: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            if (appState.loggedIn) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text('Dog'),
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage(title: 'Dog')),
                  );
                 },
                ),
            ),
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text('Cat'),
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage(title: 'Cat')),
                  );
                 },
                ),
            )
            ],
          ],
        ),
      ),
    );
  }
}
