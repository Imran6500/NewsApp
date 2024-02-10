// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  String imageUrl;
  String title;
  String time;
  String auther;
  String tag;
  String firstLetterOfAuther;
  final VoidCallback ontap;
  TrendingCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.time,
      required this.auther,
      required this.tag,
      required this.firstLetterOfAuther,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(5),
        // height: 250,
        width: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Column(
          children: [
            //container for image
            Container(
              height: 200,
              // width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Theme.of(context).colorScheme.background
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tag,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    firstLetterOfAuther,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(auther),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
