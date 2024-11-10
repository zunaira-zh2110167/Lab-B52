import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/article.dart';
import '../providers/article_provider.dart';

class AddNewsArticleForm extends ConsumerStatefulWidget {
  const AddNewsArticleForm({Key? key}) : super(key: key);

  @override
  ConsumerState<AddNewsArticleForm> createState() => _AddNewsArticleFormState();
}

class _AddNewsArticleFormState extends ConsumerState<AddNewsArticleForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the form fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _articleController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String _selectedCategory = 'All'; // Default category
  final List<String> _categories = [
    'All',
    'Business',
    'Politics',
    'Technology',
    'Health',
    'Science'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add News Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title field
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Article content field
                TextFormField(
                  controller: _articleController,
                  decoration: const InputDecoration(
                    labelText: 'Article Content',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the article content';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Image URL field
                TextFormField(
                  controller: _imageController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an image URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Writer field
                TextFormField(
                  controller: _writerController,
                  decoration: const InputDecoration(
                    labelText: 'Writer',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the writer\'s name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Date field
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Date (YYYY-MM-DD)',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Category dropdown
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),

                // Submit button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Create a new article object
                        final newArticle = Article(
                          headline: _titleController.text,
                          content: _articleController.text,
                          image: _imageController.text,
                          writer: _writerController.text,
                          publishDate: _dateController.text
                          category: _selectedCategory,
                        );

                        // Add the article using the provider
                        ref.read(articleNotifierProvider.notifier).addArticle(newArticle);

                        // Show a success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Article submitted successfully')),
                        );

                        // Clear form fields
                        _titleController.clear();
                        _articleController.clear();
                        _imageController.clear();
                        _writerController.clear();
                        _dateController.clear();
                        setState(() {
                          _selectedCategory = 'All';
                        });
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
