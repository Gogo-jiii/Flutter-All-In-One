import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarScreen extends StatefulWidget {
  const RatingBarScreen({Key? key}) : super(key: key);

  @override
  State<RatingBarScreen> createState() => _RatingBarScreenState();
}

class _RatingBarScreenState extends State<RatingBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context, "Rating Bar"),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                const GetTitle("Horizontal Rating Bar"),
                const SizedBox(height: 16),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  glowColor: Colors.green,
                  maxRating: 5,
                  unratedColor: Colors.grey,
                  allowHalfRating: true,
                  glow: true,
                  direction: Axis.horizontal,
                  glowRadius: 2,
                  itemCount: 5,
                  updateOnDrag: false,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    showToast("Rating: $rating");
                  },
                ),
                const SizedBox(height: 32),
                const GetTitle("Vertical Rating Bar"),
                const SizedBox(height: 16),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  glowColor: Colors.green,
                  maxRating: 5,
                  unratedColor: Colors.grey,
                  allowHalfRating: true,
                  glow: true,
                  direction: Axis.vertical,
                  glowRadius: 2,
                  itemCount: 5,
                  updateOnDrag: false,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    showToast("Rating: $rating");
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class GetTitle extends StatelessWidget {
  final String title;

  const GetTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
          decoration: TextDecoration.underline),
    );
  }
}
