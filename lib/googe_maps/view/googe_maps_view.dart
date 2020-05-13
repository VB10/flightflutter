import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/base/base_state.dart';
import '../../core/device/constants.dart';
import '../../core/init/locale_keys.g.dart';
import '../../core/view/widgets/card/pet_card.dart';
import '../../core/view/widgets/divider/row_divider.dart';
import '../../core/view/widgets/image/cached_image.dart';
import '../../core/view/widgets/text/locale_text.dart';
import '../model/flight_map_model.dart';
import '../vm/maps_vm.dart';

class GoogeMaps extends StatefulWidget {
  @override
  GoogeMapsView createState() => new GoogeMapsView();
}

class GoogeMapsView extends BaseState<GoogeMaps> {
  final MapsViewModel mapsViewModel = MapsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: <Widget>[
          buildGoogleMap,
          bottomListView,
          buildPositionedAppBar(context),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: LocaleText(text: LocaleKeys.project_name),
      actions: [buildFlatButtonLanguage],
    );
  }

  FlatButton get buildFlatButtonLanguage {
    return FlatButton(
      onPressed: () => mapsViewModel.changeLanguage(),
      child: Text(
        context.locale.languageCode,
        style:
            Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
      ),
    );
  }

  Positioned buildPositionedAppBar(BuildContext context) {
    return Positioned(
      height: pageHeightDyanmic(0.1),
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
    mapsViewModel.setContext(context);
  }

  Widget get bottomListView => Positioned(
        bottom: 20,
        left: -(pageWidthDyanmic(0.1)),
        right: 5,
        height: 100,
        child: Observer(
          builder: (context) => mapsViewModel.flightList.isEmpty
              ? loadingWidget
              : listViewFlights(),
        ),
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
        itemCount: mapsViewModel.flightList.length,
        onPageChanged: (index) => mapsViewModel.changePageViewCardIndex(index),
        itemBuilder: (context, index) {
          return buildPetCard(mapsViewModel.flightList[index]);
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

  Widget get buildGoogleMap => Observer(
        builder: (context) => GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: mapsViewModel.kLake,
          onMapCreated: (map) => mapsViewModel.mapsInit(map),
          markers: createMarker(),
        ),
      );

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        mapsViewModel.controller.animateCamera(
            CameraUpdate.newLatLng(AppConstant.TURKEY_CENTER_LAT_LONG));
      },
    );
  }
}

extension _GoogleMapsMarker on GoogeMapsView {
  Set<Marker> createMarker() {
    return mapsViewModel.flightList
        .map((e) => Marker(
            markerId: MarkerId(e.hashCode.toString()),
            position: e.latlong,
            icon: mapsViewModel.dogIcon,
            zIndex: 10,
            infoWindow: InfoWindow(title: e.country)))
        .toSet();
  }
}
