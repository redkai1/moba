import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Detecciones'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('detections').orderBy('timestamp', descending: true).limit(7).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final detections = snapshot.data!.docs;

          return ListView.builder(
            itemCount: detections.length,
            itemBuilder: (context, index) {
              final data = detections[index];
              final timestamp = data['timestamp'].toDate();
              return ListTile(
                title: Text('Detección: ${data['type']}'),
                subtitle: Text('Fecha: ${timestamp.toLocal()}'),
              );
            },
          );
        },
      ),
    );
  }
}