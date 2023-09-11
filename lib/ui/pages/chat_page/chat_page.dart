import 'package:chat_app/ui/pages/chat_page/chat_bloc.dart';
import 'package:chat_app/ui/pages/chat_page/chat_event.dart';
import 'package:chat_app/ui/pages/chat_page/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatBloc = ChatBloc();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 19, 49),
      body: Column(
        children: [
          SizedBox(
            height: ScreenUtil().statusBarHeight + 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
                const SizedBox(
                  width: 8,
                ),
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
                const Expanded(child: SizedBox()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "Martin Brin",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Sergey White",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "1 FEB 12:00",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    "Write...",
                    chatBloc.chatCtrl,
                    chatBloc,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  height: 40,
                  width: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                    color: Color.fromARGB(255, 4, 27, 66),
                  ),
                  child: const Center(
                    child: Text(
                      "Send",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().bottomBarHeight + 16,
          ),
        ],
      ),
    );
  }

  _buildTextField(String hint, TextEditingController ctrl, ChatBloc chatBloc) {
    return BlocBuilder<ChatBloc, ChatState>(
        bloc: chatBloc,
        builder: (context, state) {
          return SizedBox(
            height: 40,
            child: TextField(
              controller: ctrl,
              cursorColor: const Color.fromARGB(255, 4, 27, 66),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    chatBloc.add(PickImageEvent());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                hintText: hint,
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 16,
                    fontFamily: "Lato"),
                fillColor: Colors.white.withOpacity(0.1),
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                    borderSide: BorderSide.none),
              ),
            ),
          );
        });
  }
}
