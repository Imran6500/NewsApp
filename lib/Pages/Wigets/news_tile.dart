// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  String imageUrl;
  String title;
  String time;
  String auther;
  final VoidCallback ontap;
  // String firstLetterOfAuther;
  NewsTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.auther,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        // height: 200,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.background),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        // child: Text(
                        //   firstLetterOfAuther,
                        //   style: const TextStyle(color: Colors.white),
                        // ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 100,
                        child: Text(
                          auther,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
