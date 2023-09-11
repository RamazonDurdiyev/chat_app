import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(Initial()) {
    on<PickImageEvent>((event, emit) async {
      await _pickImage(emit);
    });
  }

  // Controllers

  TextEditingController chatCtrl = TextEditingController();

  // Data
  File? selectedImage;

  _pickImage(Emitter<ChatState> emit) async {
    try {
      emit(PickImageState(state: State.loading));
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      }
      if (kDebugMode) {
        print("ChatBloc _pickImage image picked succesfully");
      }
      emit(PickImageState(state: State.loaded));
    } catch (e) {
      emit(PickImageState(state: State.error));
      if (kDebugMode) {
        print("ChatBloc _pickImage error => $e");
      }
    }
  }
}
