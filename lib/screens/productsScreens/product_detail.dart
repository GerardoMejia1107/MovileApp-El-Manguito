import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool showFullDescription = false;
  bool showMoreOption = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final theme = Theme.of(context);
    final description = widget.product["description"] ?? "";

    // Calcular si el texto excede 3 líneas
    final span = TextSpan(
      text: description,
      style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
    );
    final tp = TextPainter(
      text: span,
      maxLines: 3,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 40);

    if (tp.didExceedMaxLines && !showMoreOption) {
      setState(() {
        showMoreOption = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final product = widget.product;

    final String img = product["img"];
    final String name = product["name"];
    final String description = product["description"];
    final String origin = product["origin"] ?? "Origen desconocido";
    final String usage = product["usage"] ?? "Sin información de uso";
    final String location = product["location"] ?? "Ubicación no registrada";
    final List treeImages = product["treeImages"] ?? [];

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: img,
                child: Image.asset(
                  img,
                  width: double.infinity,
                  height: 280,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                left: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: showFullDescription
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 1.5,
                        color: Colors.grey[700],
                      ),
                    ),
                    secondChild: Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 1.5,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  if (showMoreOption)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            showFullDescription = !showFullDescription;
                          });
                        },
                        child: Text(
                          showFullDescription ? "Ver menos" : "Ver más",
                          style: TextStyle(color: theme.primaryColor),
                        ),
                      ),
                    ),
                  const Divider(height: 24),
                  _buildInfoRow("Origen", origin),
                  _buildInfoRow("Usos", usage),
                  _buildInfoRow("Ubicación", location),
                  if (treeImages.isNotEmpty) ...[
                    const Divider(height: 24),
                    Text(
                      "Fotos del árbol o planta:",
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: treeImages.length,
                        separatorBuilder: (_, __) =>
                        const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              treeImages[index],
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String content) {
    final theme = Theme.of(context);
    final icon = _getIconForLabel(label);
    final Color primary = theme.primaryColor;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Alineación vertical
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primary.withOpacity(0.20),
            ),
            child: Center(
              child: Icon(
                icon,
                color: primary,
                size: 24, // Ajusta el tamaño aquí
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  IconData _getIconForLabel(String label) {
    switch (label.toLowerCase()) {
      case 'origen':
        return Icons.public;
      case 'usos':
        return Icons.handyman;
      case 'ubicación':
        return Icons.place;
      default:
        return Icons.info_outline;
    }
  }

}
