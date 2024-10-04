import 'package:flutter/material.dart';

class PresentationWidget extends StatelessWidget {
  final String selectedOption;

  const PresentationWidget({Key? key, required this.selectedOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.construction,
              size: 80.0,
              color: Colors.amber,
            ),
            const SizedBox(height: 18),
            Text(
              '$selectedOption page is under construction!',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'We\'re working hard to bring this feature to you.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
