import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: themeData.colorScheme.primary,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: themeData.colorScheme.primary.withOpacity(0.5),
              )
            ]),
        child: InkWell(
          onTap: () {
            showSnackBar(context, 'Like Button is clicked ');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/img/icons/Thumbs.svg',
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '2.1K',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: themeData.colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: const Text('Article'),
                // pinned: true,
                // floating: true,
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              SliverList(
                  delegate: SliverChildListDelegate.fixed([
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Text(
                    'Read the article you want instantly',
                    style: themeData.textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/img/stories/story_9.jpg',
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Maral',
                              style: themeData.textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              '2m ago ',
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showSnackBar(context, 'Share Button is clicked ');
                          },
                          icon: Icon(
                            CupertinoIcons.share,
                            color: themeData.colorScheme.primary,
                          )),
                      IconButton(
                          onPressed: () {
                            showSnackBar(context, 'Bookmark Button is clicked ');
                          },
                          icon: Icon(
                            CupertinoIcons.bookmark,
                            color: themeData.colorScheme.primary,
                          )),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(32)),
                  child: Image.asset(
                    'assets/img/background/single_post.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                  child: Text(
                    'Esperanto was created with the aim to be a fair communication tool',
                    style: themeData.textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                  child: Text(
                    'It is the most appropriate language to eliminate language barriers and to allow international communication for everybody on a basis of mutual respect and understanding. The aim of Esperanto is not to replace the other languages but to be a “bridge” between different language communities. We have multicultural events: It is wonderful to meet people from all over the world and to be able to communicate fluently with them: we can debate,  we can visit new countries, we can play and dance together. The most important event is the “Universala Kongreso” which brings together thousands of Esperanto speakers from all over the world for one week every year. There are many other events as well, such as the IJK, dedicated to the youth. Every day there is an Esperanto event somewhere in the world.',
                    style: themeData.textTheme.bodyMedium,
                  ),
                ),
              ])),
            ],
          ),
      Positioned(
        bottom: 0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 116,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
              themeData.colorScheme.surface,
               themeData.colorScheme.surface.withOpacity(0),
            ])
          ),
        ),
      )
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
          behavior: SnackBarBehavior.floating,

      ),
    );
  }
}
