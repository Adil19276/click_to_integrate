import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'color.dart';

class dummyeditpage extends StatefulWidget {
  const dummyeditpage({super.key});

  @override
  State<dummyeditpage> createState() => _dummyeditpageState();
}

class _dummyeditpageState extends State<dummyeditpage> {
  final ImagePicker _picker = ImagePicker();
  File? _pickedImageFile;

  // Pick image from gallery (mobile)
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1200,
        maxHeight: 1200,
      );

      if (picked == null) return; // user cancelled

      if (!kIsWeb) {
        setState(() {
          _pickedImageFile = File(picked.path);
        });
      } else {
        // For web, you would use picked.readAsBytes() and MemoryImage
        // but here we focus on mobile usage as requested
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  void _showImageSourceSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.grey),
                title: const Text('Photo Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
              // Optional: Camera option
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.grey),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  try {
                    final XFile? picked = await _picker.pickImage(
                      source: ImageSource.camera,
                      imageQuality: 85,
                    );
                    if (picked != null && !kIsWeb) {
                      setState(() {
                        _pickedImageFile = File(picked.path);
                      });
                    }
                  } catch (e) {
                    debugPrint('Camera error: $e');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Outer circle with border
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border.all(color: Themeorangecolor, width: 3),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Themeorangecolor.withOpacity(0.15),
                            shape: BoxShape.circle,
                            image: _pickedImageFile != null
                                ? DecorationImage(
                                    image: FileImage(_pickedImageFile!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: _pickedImageFile == null
                              ? Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.network(
                                    "https://static.thenounproject.com/png/629576-200.png",
                                    color: Themeorangecolor,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),

                    // Positioned edit icon (bottom-right)
                    Positioned(
                      right: -2,
                      bottom: -2,
                      child: GestureDetector(
                        onTap: _showImageSourceSheet,
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            color: Themeorangecolor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // rest of the UI (example)
            const SizedBox(height: 24),
            const Text('Tap edit icon to change avatar'),
          ],
        ),
      ),
    );
  }
}
