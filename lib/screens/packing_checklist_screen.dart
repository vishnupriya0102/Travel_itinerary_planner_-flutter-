import 'package:flutter/material.dart';
import '../widgets/animated_check_item.dart';

class PackingChecklistScreen extends StatefulWidget {
  final String tripTitle;

  PackingChecklistScreen({required this.tripTitle});

  @override
  _PackingChecklistScreenState createState() => _PackingChecklistScreenState();
}

class _PackingChecklistScreenState extends State<PackingChecklistScreen> {
  final List<String> _items = ['Passport', 'Tickets', 'Clothes', 'Toiletries'];
  final List<bool> _checked = [];

  @override
  void initState() {
    super.initState();
    _checked.addAll(List.filled(_items.length, false));
  }

  // Function to add a new item to the checklist
  void _addItem(String item) {
    setState(() {
      _items.add(item);
      _checked.add(false);
    });
  }

  // Function to remove an item from the checklist
  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
      _checked.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.tripTitle} Checklist'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  TextEditingController controller = TextEditingController();
                  return AlertDialog(
                    title: Text('Add Item'),
                    content: TextField(
                      controller: controller,
                      decoration: InputDecoration(labelText: 'Item Name'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            _addItem(controller.text);
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_items[index]),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              _removeItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Item removed')),
              );
            },
            background: Container(color: Colors.red),
            child: AnimatedCheckItem(
              text: _items[index],
              checked: _checked[index],
              onChanged: (value) {
                setState(() {
                  _checked[index] = value;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
