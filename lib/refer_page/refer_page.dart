/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

class ReferPage extends StatefulWidget {
  const ReferPage({super.key});

  @override
  State<ReferPage> createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {
  var refCode = "";
  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();
    handleUri();
  }

  handleUri() async {
    // Get the initial URI when the app is started from a terminated state
    final Uri? uri = await getInitialUri();
    if (uri != null) {
      setReferralCodeFromUri(uri);
    }
    // Listen for any incoming URIs while the app is running
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        setReferralCodeFromUri(uri);
      }
    });
  }

  setReferralCodeFromUri(Uri uri) {
    setState(() {
      refCode = uri.queryParameters["code"] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Referral code = $refCode',
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
*/


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

class ReferPage extends StatefulWidget {
  const ReferPage({super.key});

  @override
  State<ReferPage> createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {
  String? imageUrl;
  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();
    handleUri();
  }

  handleUri() async {
    // Get the initial URI when the app is started from a terminated state
    final Uri? uri = await getInitialUri();
    if (uri != null) {
      setImageUrlFromUri(uri);
    }
    // Listen for any incoming URIs while the app is running
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        setImageUrlFromUri(uri);
      }
    });
  }

  setImageUrlFromUri(Uri uri) {
    setState(() {
      imageUrl = uri.queryParameters["image"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: imageUrl != null
            ? Image.network(
          imageUrl!,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'Failed to load image',
              style: TextStyle(fontSize: 25),
            );
          },
        )
            : const Text(
          'No image to display',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
