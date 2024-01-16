import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/imge_picker.dart';

class UserImagePicker extends StatefulWidget {
    const UserImagePicker({super.key})

    @override
    State<_UserImagePickerState> createState() {
        return _UserImagePickerState();
    }
}

class _UserImagePickerState extends State<UserImagePicker> {
    File? pickedImageFile;

    void _pickImage() async {
        final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150,);
    
        if(pickedImage == null) {
            return;
        }

        setState((){
            _pickImageFile = File(pickedImage.path);
        });
    
    }

    @override
    Widget build(BuildContext) {
        return Column(
            children: [
                CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    foregroundImage: _pickImageFile != null ? FileImage(_pickImageFile!) : null,
                ),
                TextButton.icon(oPressed: _pickImage, icon: const Icon(icon.Image), label: Text('Add Image', style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                ),),
            ]
        )
    }
}