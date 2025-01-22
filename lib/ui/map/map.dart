// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';
// import 'package:http/http.dart' as http;
// import 'package:medicalassiss/core/theming/styles.dart';

// class StreetMap extends StatefulWidget {
//   const StreetMap({super.key});

//   @override
//   State<StreetMap> createState() => _StreetMapState();
// }

// class _StreetMapState extends State<StreetMap> with WidgetsBindingObserver {
//   // Map Controller and Location instances
//   final MapController mapController = MapController();
//   LocationData? currentLocation;
//   final Location location = Location();

//   // Route and Marker management
//   List<LatLng> routePoints = [];
//   List<Marker> markers = [];

//   // OpenRouteService API key
//   final String orsApiKey =
//       "5b3ce3597851110001cf62486516bcd6159c4f189dab4f9d39ba0d41";

//   bool isLoading = true; // Loading flag
//   bool hasError = false; // Error flag

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     initializeLocation();
//   }

//   // Initialize user location with error handling
//   StreamSubscription<LocationData>? _locationSubscription;

//   Future<void> initializeLocation() async {
//     setState(() {
//       isLoading = true;
//       hasError = false;
//     });

//     try {
//       bool serviceEnabled = await location.serviceEnabled();
//       if (!serviceEnabled) {
//         serviceEnabled = await location.requestService();
//         if (!serviceEnabled) {
//           throw Exception("Location services are disabled.");
//         }
//       }

//       PermissionStatus permissionGranted = await location.hasPermission();
//       if (permissionGranted == PermissionStatus.denied) {
//         permissionGranted = await location.requestPermission();
//         if (permissionGranted != PermissionStatus.granted) {
//           throw Exception("Location permission denied.");
//         }
//       }

//       var userLocation = await location.getLocation();
//       if (mounted) {
//         setState(() {
//           currentLocation = userLocation;
//           markers.add(
//             Marker(
//               width: 60,
//               height: 60,
//               point: LatLng(userLocation.latitude!, userLocation.longitude!),
//               child:
//                   const Icon(Icons.my_location, color: Colors.blue, size: 40),
//             ),
//           );
//           isLoading = false;
//         });
//       }

//       // Subscribe to location changes
//       _locationSubscription = location.onLocationChanged.listen((newLocation) {
//         if (mounted) {
//           setState(() {
//             currentLocation = newLocation;
//           });
//         }
//       });
//     } catch (e) {
//       if (mounted) {
//         setState(() {
//           hasError = true;
//           isLoading = false;
//         });
//       }
//       debugPrint("Location initialization error: $e");
//     }
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _locationSubscription?.cancel(); // Cancel the location listener
//     mapController.dispose();
//     super.dispose();
//   }

//   // Fetch route with error handling
//   Future<void> getRoute(LatLng destination) async {
//     if (currentLocation == null) return;

//     final startPoint =
//         LatLng(currentLocation!.latitude!, currentLocation!.longitude!);

//     try {
//       final response = await http.get(
//         Uri.parse(
//           'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${startPoint.longitude},${startPoint.latitude}&end=${destination.longitude},${destination.latitude}',
//         ),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List<dynamic> coords =
//             data['features'][0]['geometry']['coordinates'];

//         setState(() {
//           routePoints =
//               coords.map((coord) => LatLng(coord[1], coord[0])).toList();
//           markers.add(
//             Marker(
//               width: 60,
//               height: 60,
//               point: destination,
//               child: const Icon(Icons.location_on, color: Colors.red, size: 40),
//             ),
//           );
//         });
//       } else {
//         throw Exception("Failed to fetch route.");
//       }
//     } catch (e) {
//       print("Error fetching route: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content:
//               Text("Failed to fetch route. Check your internet connection."),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   // Add destination marker and fetch route
//   void addDestinationMarker(LatLng point) {
//     setState(() {
//       markers.add(
//         Marker(
//           width: 60,
//           height: 60,
//           point: point,
//           child: const Icon(Icons.location_on, color: Colors.red, size: 40),
//         ),
//       );
//     });
//     getRoute(point);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (hasError) {
//       return Scaffold(
//         appBar: AppBar(title: const Text("Error")),
//         body: const Center(
//           child: Text(
//             "Error fetching location. Please enable location services.",
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.red, fontSize: 16),
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(colors: [
//             Color.fromRGBO(227, 242, 253, 1),
//             Colors.orange,
//           ])),
//         ),
//         title: Text(
//           'Safe Street Map',
//           style: TextStyles.appBarTextStyle,
//         ),
//         centerTitle: true,
//       ),
//       body: isLoading || currentLocation == null
//           ? const Center(child: CircularProgressIndicator())
//           : FlutterMap(
//               mapController: mapController,
//               options: MapOptions(
//                 initialCenter: LatLng(
//                   currentLocation!.latitude!,
//                   currentLocation!.longitude!,
//                 ),
//                 initialZoom: 15.0,
//                 onTap: (tapPosition, point) => addDestinationMarker(point),
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
//                 ),
//                 MarkerLayer(markers: markers),
//                 PolylineLayer(
//                   polylines: [
//                     Polyline(
//                       points: routePoints,
//                       strokeWidth: 5.0,
//                       color: Colors.blue.shade600,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: Colors.orange,
//         onPressed: () {
//           if (currentLocation != null) {
//             mapController.move(
//               LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
//               15.0,
//             );
//           }
//         },
//         label: Text(
//           'Me',
//           style: TextStyles.secondhintStyle.copyWith(color: Colors.white),
//         ),
//         icon: const Icon(Icons.my_location, color: Colors.white),
//       ),
//     );
//   }
// }
/////////////////////////////////////////////////////////////////////////////////////////////////////////
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';
// import 'package:http/http.dart' as http;
// import 'package:permission_handler/permission_handler.dart' as ph;

// class StreetMap extends StatefulWidget {
//   const StreetMap({super.key});

//   @override
//   State<StreetMap> createState() => _StreetMapState();
// }

// class _StreetMapState extends State<StreetMap> with WidgetsBindingObserver {
//   final MapController mapController = MapController();
//   LocationData? currentLocation;
//   final Location location = Location();
//   List<LatLng> routePoints = [];
//   List<Marker> markers = [];
//   final String orsApiKey =
//       "5b3ce3597851110001cf62486516bcd6159c4f189dab4f9d39ba0d41";
//   bool isLoading = true;
//   bool hasError = false;

//   StreamSubscription<LocationData>? _locationSubscription;

//   // List of hospitals (dummy data for illustration)
//   List<Map<String, dynamic>> hospitals = [
//     {"name": "City Hospital", "lat": 40.730610, "lon": -73.935242},
//     {"name": "Green Hospital", "lat": 40.720610, "lon": -73.925242},
//     {"name": "Sunshine Health", "lat": 40.710610, "lon": -73.915242},
//     // Add more hospitals here
//   ];

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     initializeLocation();
//   }

//   // Initialize location with permission handling
//   Future<void> initializeLocation() async {
//     setState(() {
//       isLoading = true;
//       hasError = false;
//     });

//     try {
//       // Use the 'ph' prefix for PermissionStatus from permission_handler
//       ph.PermissionStatus permissionStatus =
//           await ph.Permission.location.request();

//       if (!permissionStatus.isGranted) {
//         throw Exception("Location permission denied.");
//       }

//       // Request location service if not enabled
//       bool serviceEnabled = await location.serviceEnabled();
//       if (!serviceEnabled) {
//         serviceEnabled = await location.requestService();
//         if (!serviceEnabled) {
//           throw Exception("Location services are disabled.");
//         }
//       }

//       var userLocation = await location.getLocation();
//       if (mounted) {
//         setState(() {
//           currentLocation = userLocation;
//           markers.add(
//             Marker(
//               width: 60,
//               height: 60,
//               point: LatLng(userLocation.latitude!, userLocation.longitude!),
//               child:
//                   const Icon(Icons.my_location, color: Colors.blue, size: 40),
//             ),
//           );
//           isLoading = false;
//         });
//       }

//       // Subscribe to location changes
//       _locationSubscription = location.onLocationChanged.listen((newLocation) {
//         if (mounted) {
//           setState(() {
//             currentLocation = newLocation;
//           });
//         }
//       });
//     } catch (e) {
//       if (mounted) {
//         setState(() {
//           hasError = true;
//           isLoading = false;
//         });
//       }
//       debugPrint("Location initialization error: $e");
//     }
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _locationSubscription?.cancel();
//     mapController.dispose();
//     super.dispose();
//   }

//   // Fetch route from OpenRouteService API
//   Future<void> getRoute(LatLng destination) async {
//     if (currentLocation == null) return;

//     final startPoint =
//         LatLng(currentLocation!.latitude!, currentLocation!.longitude!);

//     try {
//       final response = await http.get(
//         Uri.parse(
//           'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${startPoint.longitude},${startPoint.latitude}&end=${destination.longitude},${destination.latitude}',
//         ),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List<dynamic> coords =
//             data['features'][0]['geometry']['coordinates'];

//         setState(() {
//           routePoints =
//               coords.map((coord) => LatLng(coord[1], coord[0])).toList();
//           markers.add(
//             Marker(
//               width: 60,
//               height: 60,
//               point: destination,
//               child: const Icon(Icons.location_on, color: Colors.red, size: 40),
//             ),
//           );
//         });
//       } else {
//         throw Exception("Failed to fetch route.");
//       }
//     } catch (e) {
//       print("Error fetching route: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content:
//               Text("Failed to fetch route. Check your internet connection."),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   // Add destination marker and fetch route
//   void addDestinationMarker(LatLng point) {
//     setState(() {
//       markers.add(
//         Marker(
//           width: 60,
//           height: 60,
//           point: point,
//           child: const Icon(Icons.location_on, color: Colors.red, size: 40),
//         ),
//       );
//     });
//     getRoute(point);
//   }

//   // Function to add markers for all hospitals
//   void addHospitalMarkers() {
//     for (var hospital in hospitals) {
//       markers.add(
//         Marker(
//           width: 60,
//           height: 60,
//           point: LatLng(hospital['lat'], hospital['lon']),
//           // Instead of builder, use child to show the marker icon
//           child: Container(
//             child: const Icon(
//               Icons.local_hospital,
//               color: Colors.green,
//               size: 40,
//             ),
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (hasError) {
//       return Scaffold(
//         appBar: AppBar(title: const Text("Error")),
//         body: const Center(
//           child: Text(
//             "Error fetching location. Please enable location services.",
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.red, fontSize: 16),
//           ),
//         ),
//       );
//     }

//     // Add hospital markers once the map is loaded
//     if (!isLoading && currentLocation != null && markers.length == 1) {
//       addHospitalMarkers();
//     }

//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(colors: [
//             Color.fromRGBO(227, 242, 253, 1),
//             Colors.orange,
//           ])),
//         ),
//         title: const Text(
//           'Safe Street Map',
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         centerTitle: true,
//       ),
//       body: isLoading || currentLocation == null
//           ? const Center(child: CircularProgressIndicator())
//           : FlutterMap(
//               mapController: mapController,
//               options: MapOptions(
//                 initialCenter: LatLng(
//                   currentLocation!.latitude!,
//                   currentLocation!.longitude!,
//                 ),
//                 initialZoom: 15.0,
//                 onTap: (tapPosition, point) => addDestinationMarker(point),
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
//                 ),
//                 MarkerLayer(markers: markers),
//                 PolylineLayer(
//                   polylines: [
//                     Polyline(
//                       points: routePoints,
//                       strokeWidth: 5.0,
//                       color: Colors.blue.shade600,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: Colors.orange,
//         onPressed: () {
//           if (currentLocation != null) {
//             mapController.move(
//               LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
//               15.0,
//             );
//           }
//         },
//         label: const Text('Me', style: TextStyle(color: Colors.white)),
//         icon: const Icon(Icons.my_location, color: Colors.white),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart' as ph;

class StreetMap extends StatefulWidget {
  const StreetMap({super.key});

  @override
  State<StreetMap> createState() => _StreetMapState();
}

class _StreetMapState extends State<StreetMap> with WidgetsBindingObserver {
  final MapController mapController = MapController();
  LocationData? currentLocation;
  final Location location = Location();
  List<LatLng> routePoints = [];
  List<Marker> markers = [];
  final String orsApiKey =
      "5b3ce3597851110001cf62486516bcd6159c4f189dab4f9d39ba0d41";
  bool isLoading = true;
  bool hasError = false;

  StreamSubscription<LocationData>? _locationSubscription;

  // List of hospitals (dummy data for illustration)
  List<Map<String, dynamic>> hospitals = [
    {"name": "City Hospital", "lat": 40.730610, "lon": -73.935242},
    {"name": "Green Hospital", "lat": 40.720610, "lon": -73.925242},
    {"name": "Sunshine Health", "lat": 40.710610, "lon": -73.915242},
    // Add more hospitals here
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initializeLocation();
  }

  // Initialize location with permission handling
  Future<void> initializeLocation() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      // Request location permission using permission_handler
      ph.PermissionStatus permissionStatus =
          await ph.Permission.location.request();
      print("Location Permission Status: ${permissionStatus.isGranted}");

      if (!permissionStatus.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Location permission is required. Please enable it."),
            backgroundColor: Colors.red,
          ),
        );
      }

      // Check if location services are enabled
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          throw Exception("Location services are disabled.");
        }
      }

      // Fetch the location if permission is granted and services are enabled
      var userLocation = await location.getLocation();
      if (mounted) {
        setState(() {
          currentLocation = userLocation;
          isLoading = false;
        });
      }

      // Subscribe to location changes
      _locationSubscription = location.onLocationChanged.listen((newLocation) {
        if (mounted) {
          setState(() {
            currentLocation = newLocation;
          });
        }
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
      debugPrint("Location initialization error: $e");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _locationSubscription?.cancel();
    mapController.dispose();
    super.dispose();
  }

  // Fetch route from OpenRouteService API
  Future<void> getRoute(LatLng destination) async {
    if (currentLocation == null) return;

    final startPoint =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);

    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${startPoint.longitude},${startPoint.latitude}&end=${destination.longitude},${destination.latitude}',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> coords =
            data['features'][0]['geometry']['coordinates'];

        setState(() {
          routePoints =
              coords.map((coord) => LatLng(coord[1], coord[0])).toList();
          markers.add(
            Marker(
              width: 60,
              height: 60,
              point: destination,
              child: const Icon(Icons.location_on, color: Colors.red, size: 40),
            ),
          );
        });
      } else {
        throw Exception("Failed to fetch route.");
      }
    } catch (e) {
      print("Error fetching route: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("Failed to fetch route. Check your internet connection."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Add destination marker and fetch route
  void addDestinationMarker(LatLng point) {
    setState(() {
      markers.add(
        Marker(
          width: 60,
          height: 60,
          point: point,
          child: const Icon(Icons.location_on, color: Colors.red, size: 40),
        ),
      );
    });
    getRoute(point);
  }

  // Function to add markers for all hospitals
  void addHospitalMarkers() {
    for (var hospital in hospitals) {
      markers.add(
        Marker(
          width: 60,
          height: 60,
          point: LatLng(hospital['lat'], hospital['lon']),
          // Instead of builder, use child to show the marker icon
          child: Container(
            child: const Icon(
              Icons.local_hospital,
              color: Colors.green,
              size: 40,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hasError) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text(
            "Error fetching location. Please enable location services.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );
    }

    // Add hospital markers once the map is loaded
    if (!isLoading && currentLocation != null && markers.length == 1) {
      addHospitalMarkers();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white, // Set the back icon color to orange
          onPressed: () {
            // Define what happens when the back button is pressed
            Navigator.of(context).pop();
          },
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(227, 242, 253, 1),
            Colors.orange,
          ])),
        ),
        title: const Text(
          'Safe Street Map',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: isLoading || currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
                initialZoom: 15.0,
                onTap: (tapPosition, point) => addDestinationMarker(point),
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
                MarkerLayer(markers: markers),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: routePoints,
                      strokeWidth: 5.0,
                      color: Colors.blue.shade600,
                    ),
                  ],
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        onPressed: () {
          if (currentLocation != null) {
            mapController.move(
              LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
              15.0,
            );
          }
        },
        label: const Text('Me', style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.my_location, color: Colors.white),
      ),
    );
  }
}
