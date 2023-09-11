import 'package:chat_app/ui/pages/chat_page/chat_page.dart';
import 'package:chat_app/ui/pages/home_page/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeBloc();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 19, 49),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenUtil().statusBarHeight + 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage("assets/images/logo.png"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    "Durdiyev R",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _buildTextField("Search...", homeBloc.searchCtrl),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Chatrooms",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _buildChatrooms(),
            const SizedBox(
              height: 16,
            ),
            _buildChatsList(context),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 1, 19, 49),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 4, 27, 66)),
              accountName: Text('John Doe'),
              accountEmail: Text('johndoe@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home,color: Colors.white,),
              title: const Text('Home',style: TextStyle(color: Colors.white,),),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings,color: Colors.white,),
              title: const Text('Settings',style: TextStyle(color: Colors.white,),),
              onTap: () {},
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app,color: Colors.white,),
              title: const Text('Logout',style: TextStyle(color: Colors.white,),),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  _buildChatrooms() {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 8),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildChatroomItem();
        },
      ),
    );
  }

  _buildChatroomItem() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 140,
        width: 95,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          color: Colors.indigo,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tom \nHolland",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              Row(
                children: const [
                  Expanded(
                    child: SizedBox(),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextField(String hint, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 40,
        child: TextField(
          controller: ctrl,
          cursorColor: const Color.fromARGB(255, 4, 27, 66),
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white.withOpacity(0.5),
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
      ),
    );
  }

  _buildChatsList(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildChatItem(context);
      },
    );
  }

  Widget _buildChatItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ChatPage();
              },
            ),
          );
        },
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 4, 27, 66),
              radius: 24,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hamroyev Shavkat",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  "Hamroyev Shavkat",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Text(
              "Sun",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
