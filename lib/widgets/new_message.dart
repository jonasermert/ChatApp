import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ui/app_theme.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() {
    return _NewMessageState();
  }
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    FocusScope.of(context).unfocus();
    _messageController.clear();

    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()!['username'],
      'userImage': userData.data()!['image_url'],
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.only(
        left: spacing.md,
        right: spacing.xs,
        bottom: spacing.md,
        top: spacing.sm,
      ),
      decoration: BoxDecoration(
        color: isDark ? colors.neutral900 : colors.neutral100,
        border: Border(
          top: BorderSide(
            color: isDark ? colors.neutral800 : colors.neutral200,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              style: TextStyle(
                color: isDark ? colors.neutral50 : colors.neutral950,
              ),
              decoration: InputDecoration(
                hintText: 'Send a message...',
                hintStyle: TextStyle(color: colors.neutral500),
                filled: true,
                fillColor: isDark ? colors.neutral800 : colors.neutral200,
                border: OutlineInputBorder(
                  borderRadius: context.borderRadius.full,
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: spacing.md,
                  vertical: spacing.sm,
                ),
              ),
            ),
          ),
          SizedBox(width: spacing.xs),
          IconButton(
            color: isDark ? colors.neutral50 : colors.neutral950,
            icon: const Icon(Icons.send_rounded),
            onPressed: _submitMessage,
          ),
        ],
      ),
    );
  }
}
