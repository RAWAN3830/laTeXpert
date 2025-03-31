import 'package:flutter/material.dart';

Column buildStatColumn(String stat, String label) {
  return Column(
    children: [
      Text(
        stat,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
    ],
  );
}

ListTile buildListTile(IconData icon, String title, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: onTap,
  );
}