// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapsViewModel on MapsViewBase, Store {
  final _$titleAtom = Atom(name: 'MapsViewBase.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$dogIconAtom = Atom(name: 'MapsViewBase.dogIcon');

  @override
  BitmapDescriptor get dogIcon {
    _$dogIconAtom.context.enforceReadPolicy(_$dogIconAtom);
    _$dogIconAtom.reportObserved();
    return super.dogIcon;
  }

  @override
  set dogIcon(BitmapDescriptor value) {
    _$dogIconAtom.context.conditionallyRunInAction(() {
      super.dogIcon = value;
      _$dogIconAtom.reportChanged();
    }, _$dogIconAtom, name: '${_$dogIconAtom.name}_set');
  }

  final _$flightListAtom = Atom(name: 'MapsViewBase.flightList');

  @override
  List<FlightMap> get flightList {
    _$flightListAtom.context.enforceReadPolicy(_$flightListAtom);
    _$flightListAtom.reportObserved();
    return super.flightList;
  }

  @override
  set flightList(List<FlightMap> value) {
    _$flightListAtom.context.conditionallyRunInAction(() {
      super.flightList = value;
      _$flightListAtom.reportChanged();
    }, _$flightListAtom, name: '${_$flightListAtom.name}_set');
  }

  final _$MapsViewBaseActionController = ActionController(name: 'MapsViewBase');

  @override
  void changeAppBarName(String text) {
    final _$actionInfo = _$MapsViewBaseActionController.startAction();
    try {
      return super.changeAppBarName(text);
    } finally {
      _$MapsViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'title: ${title.toString()},dogIcon: ${dogIcon.toString()},flightList: ${flightList.toString()}';
    return '{$string}';
  }
}
