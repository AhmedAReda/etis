import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:etislat/feature/collectionpage/data/repo/collection_repo.dart';
import 'package:flutter/material.dart';

import '../data/model/collection_model.dart';

part 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  CollectionCubit({required this.collectionRepo}) : super(CollectionInitial());
  final CollectionRepo collectionRepo;
  TextEditingController collectionnamecontroler = TextEditingController();
  TextEditingController searchcontroller = TextEditingController();
  TextEditingController editnamecollectioncontroller = TextEditingController();

  FocusNode focusNode = FocusNode();
  GlobalKey<FormState> formkey = GlobalKey();
  List<CollectionModel> filterdcollection = [];
  List<CollectionModel> allcollection = [];
//  List<int> membercount = [];
  @override
  Future<void> close() {
    focusNode.dispose();
    return super.close();
  }

//
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playAudio({required String audio}) async {
    await _audioPlayer.play(AssetSource(audio)); // Play audio from assets
  }

  deleteall() async {
    await collectionRepo.deleteDataBae();
  }

  addcollection() async {
    //  focusNode.requestFocus();
    try {
      emit(CollectionLoadingState());

      await collectionRepo.addCollection(collectionnamecontroler.text.trim());
      final collections = await collectionRepo.getallcollection();
      for (var collection in collections) {
        final count = await collectionRepo
            .getMemberCountByCollectionId(collection.collectoinid);
        collection.memberCount =
            count; // Add the member count to the collection
      }
      allcollection = collections;
      collectionnamecontroler.clear();
      focusNode.unfocus();

      emit(CollectionSucessState(collections: allcollection));
    } catch (e) {
      emit(CollectionError(message: e.toString()));
    }
    collectionnamecontroler.clear();
  }

  getallcollection() async {
    try {
      emit(CollectionLoadingState());

      final collections = await collectionRepo.getallcollection();
      allcollection = collections;

      // Loop through each collection and get the member count
      for (var collection in allcollection) {
        final count = await collectionRepo
            .getMemberCountByCollectionId(collection.collectoinid);
        collection.memberCount =
            count; // Add the member count to the collection
      }

      emit(CollectionSucessState(collections: allcollection));
    } catch (e) {
      emit(CollectionError(message: e.toString()));
    }
  }

  filtercollection({required String value}) {
    if (searchcontroller.text.isNotEmpty) {
      filterdcollection = allcollection
          .where((user) =>
              user.collectionname.toLowerCase().contains(value.toLowerCase()))
          .toList();
      emit(CollectionSucessState(collections: filterdcollection));
    } else {
      emit(CollectionSucessState(collections: allcollection));
    }
  }

  // Update collection name method
  Future<void> updateCollection({required int collectionId}) async {
    try {
      emit(CollectionLoadingState());
      await collectionRepo.updateCollection(
          collectionId, editnamecollectioncontroller.text);
      final collections =
          await collectionRepo.getallcollection(); // fetch updated collections
      for (var collection in collections) {
        final count = await collectionRepo
            .getMemberCountByCollectionId(collection.collectoinid);
        collection.memberCount =
            count; // Add the member count to the collection
      }
      emit(CollectionSucessState(collections: collections));
    } catch (e) {
      emit(CollectionError(message: e.toString()));
    }
    editnamecollectioncontroller.clear();
  }

  Future<void> deleteCollection({required int collectionId}) async {
    try {
      emit(CollectionLoadingState());
      playAudio(audio: 'audio/delete.mp3');
      await collectionRepo.deleteCollection(collectionId);
      final collections =
          await collectionRepo.getallcollection(); // fetch updated collections
      for (var collection in collections) {
        final count = await collectionRepo
            .getMemberCountByCollectionId(collection.collectoinid);
        collection.memberCount =
            count; // Add the member count to the collection
      }
      emit(CollectionSucessState(collections: collections));
    } catch (e) {
      emit(CollectionError(message: e.toString()));
    }
  }
}
