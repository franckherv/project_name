import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../models/product_model.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = "/edit-product";
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _prixfocusNode = FocusNode();
  final _descriptionfoncusNode = FocusNode();
  final _imagefocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _imagefocusNode.addListener(imageUpdate);
    super.initState();
  }

  var _isInit = true;
  var _isInitialValue = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': ''
  };

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)!.settings.arguments as String;
      _editProduct = Provider.of<ProductProviders>(context, listen: false)
          .items
          .firstWhere((element) => element.id == productId);

      if (productId != "") {
        _isInitialValue = {
          'title': _editProduct.title,
          'description': _editProduct.description,
          'price': _editProduct.price.toString(),
          'imageUrl': '',
          //'imageUrl': _editProduct.imageUrl,
        };
        _imageUrlController.text = _editProduct.imageUrl;
      }
      
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _prixfocusNode.dispose();
    _descriptionfoncusNode.dispose();
    _imagefocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void saveForm() {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    _formkey.currentState!.save();
    if (_editProduct.id != "") {
      Provider.of<ProductProviders>(context, listen: false)
          .updateProduct(_editProduct.id, _editProduct);
    } else {
      Provider.of<ProductProviders>(context, listen: false)
          .addProduct(_editProduct);
    }
    Navigator.of(context).pop();
  }

  void imageUpdate() {
    if (!_imagefocusNode.hasFocus) {
      if (!_imageUrlController.text.isNotEmpty ||
          (!_imageUrlController.text.startsWith("http") &&
              !_imageUrlController.text.startsWith("https")) ||
          !_imageUrlController.text.endsWith("png") &&
              !_imageUrlController.text.endsWith("jpg") &&
              !_imageUrlController.text.endsWith("jpeg")) {
        return;
      }
    }
    setState(() {});
  }

  var _editProduct =
      Products(id: "", title: "", price: 0, description: "", imageUrl: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajout de produit"),
        actions: [
          IconButton(
              onPressed: () {
                saveForm();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _isInitialValue["title"],
                decoration: InputDecoration(labelText: "titre"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_prixfocusNode);
                },
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Veuillez renseigner ce champ";
                  }
                },
                onSaved: (value) {
                  _editProduct = Products(
                      id: _editProduct.id,
                      isFavorite: _editProduct.isFavorite,
                      title: value.toString(),
                      price: _editProduct.price,
                      description: _editProduct.description,
                      imageUrl: _editProduct.imageUrl);
                },
              ),
              TextFormField(
                initialValue: _isInitialValue["price"],
                decoration: InputDecoration(labelText: "prix"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Entrer un nombre";
                  }
                  if (double.parse(value) <= 0) {
                    return "Le prix doit être superieur à 0";
                  }
                  if (double.tryParse(value) == null) {
                    return "Le champ doit être renseigné";
                  }
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionfoncusNode);
                },
                onSaved: (value) {
                  _editProduct = Products(
                      id: _editProduct.id,
                      isFavorite: _editProduct.isFavorite,
                      title: _editProduct.title,
                      price: double.parse(value.toString()),
                      description: _editProduct.description,
                      imageUrl: _editProduct.imageUrl);
                },
              ),
              TextFormField(
                initialValue: _isInitialValue["description"],
                decoration: InputDecoration(labelText: "Description"),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                focusNode: _descriptionfoncusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imagefocusNode);
                },
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Entrer la description";
                  }
                  if (value.length <= 10) {
                    return "La description de votre article est insuffisante";
                  }
                },
                onSaved: (value) {
                  _editProduct = Products(
                      id: _editProduct.id,
                      isFavorite: _editProduct.isFavorite,
                      title: _editProduct.title,
                      price: _editProduct.price,
                      description: value.toString(),
                      imageUrl: _editProduct.imageUrl);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8, right: 10),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text("Entrer l'url")
                        : FittedBox(
                            child: Image.asset(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Entrer l'image"),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      focusNode: _imagefocusNode,
                      controller: _imageUrlController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Entrer l'URL";
                        }

                        // if (!value.startsWith("http") && !value.startsWith("https")) {
                        //   return "Lien incorrect";
                        // }
                        if (!value.endsWith("png") &&
                            !value.endsWith("jpg") &&
                            !value.endsWith("jpeg")) {
                          return "type d'image incorrect";
                        }
                      },
                      onSaved: (value) {
                        _editProduct = Products(
                            id: _editProduct.id,
                            isFavorite: _editProduct.isFavorite,
                            title: _editProduct.title,
                            price: _editProduct.price,
                            description: _editProduct.description,
                            imageUrl: value.toString());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
