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
    final string = 'title: ${title.toString()}';
    return '{$string}';
  }
}
