import 'package:flutter/material.dart';

class MyTableWidget extends StatelessWidget {
  const MyTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical, // Enable vertical scrolling
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
        child: Table(
          border: TableBorder.all(color: Colors.black, width: 1), // Table border
          children: [
            // Header Row
            const TableRow(
              decoration: BoxDecoration(
                color: Colors.blueAccent, // Header background color
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Fundamentals',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16, // Font size for header
                      color: Colors.white, // Header text color
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'DSML (Machine Learning)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Fullstack Development',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Quality Engineering',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            // First Data Row
            _buildStyledRow(
              ['Software Architecture', 'Python', 'HTML and HTML5', 'Testing Concepts'],
              Colors.grey.shade100, // Row background color
            ),
            // Second Data Row
            _buildStyledRow(
              ['Agile – SDLC', 'Data analysis', 'CSS', 'Selenium WebDriver'],
              Colors.white, // Alternate row background color
            ),
            _buildStyledRow(
              ['JIRA Agile', 'Data Plotting', 'DOM & jQuery', 'Java Programming'],
              Colors.grey.shade100,
            ),
            _buildStyledRow(
              ['UNIX', 'Essential maths for ML', 'Tailwind CSS', 'Cypress'],
              Colors.white,
            ),
            _buildStyledRow(
              ['HTTP', 'ML-supervised learning algorithms', 'React', 'Puppeteer'],
              Colors.grey.shade100,
            ),
            _buildStyledRow(
              ['Web Services', 'Unsupervised learning algorithms', 'Next.js', 'Locust/JMeter'],
              Colors.white,
            ),
            _buildStyledRow(
              ['REST API, Microservices', 'Reinforcement learning', 'Express.js', 'Appium'],
              Colors.grey.shade100,
            ),
            _buildStyledRow(
              ['Containers – Docker', 'Neural network', 'Node.js', 'Karate Framework'],
              Colors.white,
            ),
            _buildStyledRow(
              ['Kubernetes', 'Deep learning', 'MongoDB', 'WebDriverIO'],
              Colors.grey.shade100,
            ),
            _buildStyledRow(
              ['Git + Github + Jenkins', 'Natural language processing (NLP)', 'GraphQL', 'Playwright'],
              Colors.white,
            ),
            _buildStyledRow(
              ['SQL and NoSQL', 'Generative AI', 'Micro Frontends', 'JUnit'],
              Colors.grey.shade100,
            ),
            _buildStyledRow(
              ['AWS – EC2, EKS, S3', 'Computer Vision', 'React Native', 'XPath'],
              Colors.white,
            ),
            _buildStyledRow(
              ['JavaScript', 'TestNG', '', ''],
              Colors.grey.shade100,
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildStyledRow(List<String> data, Color bgColor) {
    return TableRow(
      decoration: BoxDecoration(
        color: bgColor, // Set row background color
      ),
      children: data
          .map(
            (cell) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                cell,
                style: const TextStyle(
                  fontSize: 14, // Cell font size
                ),
                textAlign: TextAlign.center, // Align text in the center
              ),
            ),
          )
          .toList(),
    );
  }
}
