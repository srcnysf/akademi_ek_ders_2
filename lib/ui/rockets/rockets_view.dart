import 'dart:convert';

import 'package:akademi_ek_ders_2/models/rocket.dart';
import 'package:akademi_ek_ders_2/repository/repository.dart';
import 'package:akademi_ek_ders_2/ui/rockets/rocket_detail_view.dart';
import 'package:flutter/material.dart';

class RocketView extends StatefulWidget {
  const RocketView({Key? key}) : super(key: key);

  @override
  State<RocketView> createState() => _RocketViewState();
}

class _RocketViewState extends State<RocketView> {
  List<Rocket>? rockets;
  final ScrollController scrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  Repository _repository = Repository();
  String? error;
  @override
  void initState() {
    provideRockets();
    super.initState();
  }

  provideRockets() {
    _repository
        .getRockets()
        .then((value) => setState(() {
              error = null;
              rockets = value;
            }))
        .catchError((onError) {
      setState(() {
        error = onError.message;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPACE X"),
      ),
      body: error != null
          ? Center(child: Text(error!))
          : rockets == null
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  key: refreshIndicatorKey,
                  onRefresh: () => provideRockets(),
                  child: ListView.separated(
                      shrinkWrap: true,
                      controller: scrollController,
                      itemBuilder: ((context, index) {
                        var rocket = rockets![index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RocketDetailView(
                                        rocket: rocket,
                                      )),
                            );
                          },
                          title: Text(rocket.name),
                          subtitle: Text(
                            rocket.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: Hero(tag: rocket.id, child: Image.network(rocket.flickr_images.first)),
                        );
                      }),
                      separatorBuilder: (context, int) {
                        return Divider();
                      },
                      itemCount: rockets!.length),
                ),
    );
  }
}
