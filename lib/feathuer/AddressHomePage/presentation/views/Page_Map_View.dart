import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_project/core/widgets/custom_Buttom_Small.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PageMapView extends StatefulWidget {
  static const routeName = 'PageMapView';
  final LatLng? initialLocation;
  final Function(LatLng) onSelectLocation;

  const PageMapView({
    super.key,
    this.initialLocation,
    required this.onSelectLocation,
  });

  @override
  _PageMapViewState createState() => _PageMapViewState();
}

class _PageMapViewState extends State<PageMapView> {
  late GoogleMapController _mapController;
  Marker? _selectedMarker;
  LatLng? _selectedLocation;
  final TextEditingController _searchController = TextEditingController();
  static const LatLng _defaultLocation = LatLng(24.7136, 46.6753);
  String? _selectedAddress;
  Marker? _currentLocationMarker;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      _getCurrentLocation();
    } else {
      print('Location permission denied');
    }
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentLocationMarker = Marker(
        markerId: const MarkerId('current_location'),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      );
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    if (widget.initialLocation != null) {
      _mapController
          .moveCamera(CameraUpdate.newLatLng(widget.initialLocation!));
    } else {
      _mapController.moveCamera(CameraUpdate.newLatLng(_defaultLocation));
    }
  }

  Future<void> _setMarker(LatLng position) async {
    setState(() {
      _selectedLocation = position;
      _selectedMarker = Marker(
        markerId: const MarkerId('selected_location'),
        position: position,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
    });

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (placemarks.isNotEmpty) {
      setState(() {
        _selectedAddress =
            '${placemarks.first.street}, ${placemarks.first.locality}, ${placemarks.first.country}';
      });
    }
  }

  Future<void> _searchLocation(String query) async {
    List<Location> locations = await locationFromAddress(query);
    if (locations.isNotEmpty) {
      LatLng position =
          LatLng(locations.first.latitude, locations.first.longitude);
      _mapController.moveCamera(CameraUpdate.newLatLng(position));
      _setMarker(position);
    } else {
      print('Location not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _buildSearchBar(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.my_location,
              size: 35,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              if (_currentLocationMarker != null) {
                _mapController.moveCamera(
                    CameraUpdate.newLatLng(_currentLocationMarker!.position));
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            onTap: _setMarker,
            markers: {
              if (_selectedMarker != null) _selectedMarker!,
              if (_currentLocationMarker != null) _currentLocationMarker!,
            },
            initialCameraPosition: const CameraPosition(
              target: _defaultLocation,
              zoom: 12,
            ),
          ),
          if (_selectedLocation != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: _buildLocationDetails(),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'ابحث عن موقع...',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
        onSubmitted: (value) {
          _searchLocation(value);
        },
      ),
    );
  }

  Widget _buildLocationDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'الموقع المحدد:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedAddress ?? 'لم يتم تحديد عنوان بعد',
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(height: 16),
          customButtonSmall(
            onPressed: () {
              if (_selectedLocation != null) {
                widget.onSelectLocation(_selectedLocation!);
                Navigator.pop(context, _selectedLocation);
              }
            },
            title: 'تاكيد هذا الموقع',
          ),
        ],
      ),
    );
  }
}
