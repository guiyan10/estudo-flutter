import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/constants.dart';
import 'custom_button.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final VoidCallback? onAddToWishlist;
  final bool isInWishlist;
  final bool isLoading;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
    this.onAddToWishlist,
    this.isInWishlist = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          boxShadow: AppShadows.sm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Section
            _buildImageSection(),

            // Product Info Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category Badge
                    if (product.category != null) _buildCategoryBadge(),

                    const SizedBox(height: AppSizes.xs),

                    // Product Name
                    _buildProductName(),

                    const SizedBox(height: AppSizes.xs),

                    // Rating
                    _buildRating(),

                    const SizedBox(height: AppSizes.sm),

                    // Price
                    _buildPrice(),

                    const Spacer(),

                    // Action Buttons
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        // Product Image
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSizes.cardRadius),
              topRight: Radius.circular(AppSizes.cardRadius),
            ),
            color: AppColors.background,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSizes.cardRadius),
              topRight: Radius.circular(AppSizes.cardRadius),
            ),
            child: Image.network(
              product.image ?? 'https://via.placeholder.com/180x160',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.background,
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 48,
                    color: AppColors.textSecondary,
                  ),
                );
              },
            ),
          ),
        ),

        // Wishlist Button
        if (onAddToWishlist != null)
          Positioned(
            top: AppSizes.sm,
            right: AppSizes.sm,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: AppShadows.sm,
              ),
              child: IconButton(
                onPressed: onAddToWishlist,
                icon: Icon(
                  isInWishlist ? Icons.favorite : Icons.favorite_border,
                  color:
                      isInWishlist ? AppColors.error : AppColors.textSecondary,
                  size: AppSizes.iconSm,
                ),
                padding: const EdgeInsets.all(AppSizes.xs),
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
              ),
            ),
          ),

        // Featured Badge
        if (product.isFeatured)
          Positioned(
            top: AppSizes.sm,
            left: AppSizes.sm,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.sm,
                vertical: AppSizes.xs,
              ),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppSizes.radiusFull),
              ),
              child: Text(
                'Featured',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.textInverse,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

        // Stock Badge
        if (!product.isInStock)
          Positioned(
            bottom: AppSizes.sm,
            left: AppSizes.sm,
            right: AppSizes.sm,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.sm,
                vertical: AppSizes.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              child: Text(
                'Out of Stock',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.textInverse,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCategoryBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.sm,
        vertical: AppSizes.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Text(
        product.category?.name ?? 'Category',
        style: AppTypography.labelSmall.copyWith(
          color: AppColors.secondary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildProductName() {
    return Text(
      product.name,
      style: AppTypography.titleMedium.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: AppSizes.iconXs,
          color: AppColors.accent,
        ),
        const SizedBox(width: AppSizes.xs),
        Text(
          product.formattedRating,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Text(
          '(${product.reviewsCount})',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Text(
      product.formattedPrice,
      style: AppTypography.titleLarge.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: AppStrings.addToCart,
            onPressed: product.isInStock ? onAddToCart : null,
            variant: ButtonVariant.primary,
            size: ButtonSize.small,
            isLoading: isLoading,
            icon: Icons.shopping_cart_outlined,
          ),
        ),
      ],
    );
  }
}

// Horizontal Product Card for different layouts
class HorizontalProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final VoidCallback? onAddToWishlist;
  final bool isInWishlist;
  final bool isLoading;

  const HorizontalProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
    this.onAddToWishlist,
    this.isInWishlist = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          boxShadow: AppShadows.sm,
        ),
        child: Row(
          children: [
            // Product Image
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.cardRadius),
                  bottomLeft: Radius.circular(AppSizes.cardRadius),
                ),
                color: AppColors.background,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.cardRadius),
                  bottomLeft: Radius.circular(AppSizes.cardRadius),
                ),
                child: Image.network(
                  product.image ?? 'https://via.placeholder.com/120x120',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.background,
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 32,
                        color: AppColors.textSecondary,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Product Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product.name,
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: AppSizes.xs),

                    // Rating
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: AppSizes.iconXs,
                          color: AppColors.accent,
                        ),
                        const SizedBox(width: AppSizes.xs),
                        Text(
                          product.formattedRating,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Price and Action
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.formattedPrice,
                            style: AppTypography.titleMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (onAddToWishlist != null)
                          IconButton(
                            onPressed: onAddToWishlist,
                            icon: Icon(
                              isInWishlist
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isInWishlist
                                  ? AppColors.error
                                  : AppColors.textSecondary,
                              size: AppSizes.iconSm,
                            ),
                          ),
                        if (onAddToCart != null)
                          IconButton(
                            onPressed: product.isInStock ? onAddToCart : null,
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: product.isInStock
                                  ? AppColors.primary
                                  : AppColors.textTertiary,
                              size: AppSizes.iconSm,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
