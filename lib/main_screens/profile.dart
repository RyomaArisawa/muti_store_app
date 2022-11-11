import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            expandedHeight: 140,
            flexibleSpace: LayoutBuilder(
              builder: (context, constrains) {
                return FlexibleSpaceBar(
                  centerTitle: true,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: constrains.biggest.height <= 120 ? 1 : 0,
                    child: const Text(
                      'Account',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow,
                          Colors.brown,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: TextButton(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Center(
                              child: Text(
                                'Cart',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        color: Colors.yellow,
                        child: TextButton(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Center(
                              child: Text(
                                'Orders',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: TextButton(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Center(
                              child: Text(
                                'WishList',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 150,
                  child: Image(
                    image: AssetImage('images/inapp/logo.jpg'),
                  ),
                ),
                const ProfileHeaderLabel(
                  headerLabel: 'Account Info.',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: const [
                        RepeatedListTile(
                          title: 'Email Address',
                          subtitle: 'example@email.com',
                          iconData: Icons.email,
                        ),
                        YellowDivider(),
                        RepeatedListTile(
                          title: 'Phone Number',
                          subtitle: '+11111',
                          iconData: Icons.phone,
                        ),
                        YellowDivider(),
                        RepeatedListTile(
                          title: 'Address',
                          subtitle: 'example:140 - st - New Gersy',
                          iconData: Icons.location_pin,
                        ),
                      ],
                    ),
                  ),
                ),
                const ProfileHeaderLabel(
                  headerLabel: 'Account Settings',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 210,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        RepeatedListTile(
                          title: 'Edit Profile',
                          iconData: Icons.edit,
                          onTap: () {},
                        ),
                        YellowDivider(),
                        RepeatedListTile(
                          title: 'Change Password',
                          iconData: Icons.lock,
                          onTap: () {},
                        ),
                        YellowDivider(),
                        RepeatedListTile(
                          title: 'Log Out',
                          iconData: Icons.logout,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String? subtitle;
  final VoidCallback? onTap;

  const RepeatedListTile({Key? key, required this.title, required this.iconData, this.subtitle, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        leading: Icon(iconData),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;

  const ProfileHeaderLabel({
    Key? key,
    required this.headerLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              headerLabel,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
