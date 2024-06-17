// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable, non_constant_identifier_names, avoid_print
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HtmlModel {
  Icon? thumbnail;
  String? url;
  String? tittle;
  HtmlModel({
    this.thumbnail,
    this.url,
    this.tittle,
  });

  static List<HtmlModel> VideoList = [
    HtmlModel(
        thumbnail:  const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/Sv6W65w1Tzw?si=fLAdxOCRdj_ex6xy",
        tittle: "Test Video 1"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/Rek0NWPCNOc?si=ow-h7Aslg1II_sbu",
        tittle: "HTML Course | From Beginners to Advance Level | Lecture 1"),
  ];

  static getVideoId(String s) {
    print("url ofnyoutube $s");
    String? videoId = YoutubePlayer.convertUrlToId(s);
    return s;
  }
}
