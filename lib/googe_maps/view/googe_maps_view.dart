import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/device/constants.dart';
import '../../core/view/widgets/card/pet_card.dart';
import '../../core/view/widgets/divider/row_divider.dart';
import '../../core/view/widgets/image/cached_image.dart';
import '../model/flight_map_model.dart';
import '../vm/googe_maps_view_model.dart';
import '../vm/maps_vm.dart';

class GoogeMapsView extends GoogeMapsViewModel {
  final MapsViewModel mapsViewModel = MapsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildGoogleMap,
          bottomListView,
          buildPositionedAppBar(context),
        ],
      ),
    );
  }

  Positioned buildPositionedAppBar(BuildContext context) {
    return Positioned(
      height: pageHeight(context) * 0.15,
      top: 20,
      left: 0,
      right: 0,
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Observer(
          builder: (_) => Text(
            mapsViewModel.title ?? "",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => initMapItemList());
  }

  Widget get bottomListView => Positioned(
        bottom: 20,
        left: -(pageWidth(context) * 0.05),
        right: 5,
        height: 100,
        child: flightList.isEmpty ? loadingWidget : listViewFlights(),
      );

  Widget get loadingWidget => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
      );

  Widget listViewFlights() {
    return PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        scrollDirection: Axis.horizontal,
        itemCount: flightList.length,
        onPageChanged: (index) {
          mapsViewModel.changeAppBarName(flightList[index].country);
          navigateToRoot(index);
        },
        itemBuilder: (context, index) {
          return buildPetCard(flightList[index]);
        });
  }

  Widget buildPetCard(FlightMap item) {
    return PetCard(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          enableDrag: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          builder: (context) {
            return _bottomSheet(item.detail);
          },
        );
      },
      imageUrl: item.detail.photoUrl,
      title: item.country,
    );
  }

  Widget _bottomSheet(Detail detail) => Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          RowDivider(indent: 0.45),
          FLightCacheImage(
            imageUrl: detail.photoUrl,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: AutoSizeText(
                detail.description,
                maxFontSize: 12,
                minFontSize: 10,
              ),
            ),
          )
        ],
      );

  Widget get buildGoogleMap => GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: kLake,
        onMapCreated: (map) async {
          controller = map;
          await createMarkerImageFromAsset(context);
        },
        markers: createMarker(),
      );

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        controller.animateCamera(
            CameraUpdate.newLatLng(AppConstant.TURKEY_CENTER_LAT_LONG));
      },
    );
  }
}

extension _GoogleMapsMarker on GoogeMapsView {
  Set<Marker> createMarker() {
    return flightList
        .map((e) => Marker(
            markerId: MarkerId(e.hashCode.toString()),
            position: e.latlong,
            icon: dogIcon,
            zIndex: 10,
            infoWindow: InfoWindow(title: e.country)))
        .toSet();
  }

  Future<void> createMarkerImageFromAsset(BuildContext context) async {
    final ImageConfiguration imageConfiguration =
        createLocalImageConfiguration(context);
    var bitmap = await BitmapDescriptor.fromAssetImage(
        imageConfiguration, 'assets/images/dog.png');

    setState(() {
      dogIcon = bitmap;
    });
    // print(dogIcon);
  }
}
