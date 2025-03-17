import 'package:blogclub/data.dart';
import 'package:blogclub/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeData.colorScheme.surface.withOpacity(0),
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_rounded),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(32, 10, 32, 64),
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: themeData.colorScheme.onSurface
                                .withOpacity(0.2),
                          )
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/img/stories/story_8.jpg',
                                    width: 84,
                                    height: 84,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('@Datiego'),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Sabir Bugti',
                                        style: themeData.textTheme.bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Mobile Developer',
                                        style: themeData.textTheme.bodyLarge!
                                            .apply(
                                                color: themeData
                                                    .colorScheme.primary),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                            child: Text(
                              'About me',
                              style: themeData.textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                            child: Text(
                              'Sabir Bugti Sabir Bugti Sabir Bugti Sabir Bugti Sabir Bugti ',
                              style: themeData.textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w200),
                            ),
                          ),
                          const SizedBox(height: 24)
                        ]),
                  ),
                  Positioned(
                      left: 96,
                      right: 96,
                      bottom: 32,
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              color: themeData.colorScheme.onSurface
                                  .withOpacity(0.8))
                        ]),
                      )),
                  Positioned(
                    left: 64,
                    right: 64,
                    bottom: 32,
                    child: Container(
                      height: 68,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: themeData.colorScheme.primary),
                      child: Row(children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff2151CD),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '52',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.onPrimary),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Post',
                                  style: themeData.textTheme.bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w200,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeData.colorScheme.onPrimary),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Following',
                                style: themeData.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: themeData.colorScheme.onPrimary),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5K',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeData.colorScheme.onPrimary),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Followers',
                                style: themeData.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: themeData.colorScheme.onPrimary),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(32)),
                    color: themeData.colorScheme.surface),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          'My Post',
                          style: themeData.textTheme.titleLarge,
                        )),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/img/icons/Grid.svg',
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/img/icons/Table.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++) Post(post: posts[i]),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
