import 'package:flutter/material.dart';
import 'jokes_service.dart';

void main() => runApp(JokeGeneratorApp());

class JokeGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JokeHome(),
    );
  }
}

class JokeHome extends StatefulWidget {
  @override
  _JokeHomeState createState() => _JokeHomeState();
}

class _JokeHomeState extends State<JokeHome> {
  String _joke = '';

  void _fetchJoke() async {
    String joke = await JokesService.fetchRandomJoke();
    setState(() {
      _joke = joke;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Joke'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
              Text(
                _joke,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchJoke,
                child: Text('Fetch Joke'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}