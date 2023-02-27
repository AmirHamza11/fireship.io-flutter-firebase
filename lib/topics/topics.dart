import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizon/services/firestore.dart';
import 'package:quizon/shared/shared.dart';
import 'package:quizon/topics/topic_item.dart';

import '../services/models.dart';
import 'drawer.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: FirestoreServices().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: ErrorMessage(
                message: snapshot.error.toString(),
              ),
            );
          } else if (snapshot.hasData) {
            var topics = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                title: const Text('Topics'),
              ),
              drawer: TopicDrawer(topics: topics),
              body: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 10.0,
                crossAxisCount: 2,
                children:
                    topics.map((topic) => TopicItem(topic: topic)).toList(),
              ),
              bottomNavigationBar: const BottomNavBar(),
            );
          } else {
            return const Text('No topics found in Firestore. Check database');
          }
        });
  }
}
