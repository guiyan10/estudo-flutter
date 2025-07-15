import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4F46E5);

  // Secondary Colors
  static const Color secondary = Color(0xFF10B981); // Emerald
  static const Color secondaryLight = Color(0xFF34D399);
  static const Color secondaryDark = Color(0xFF059669);

  // Accent Colors
  static const Color accent = Color(0xFFF59E0B); // Amber
  static const Color accentLight = Color(0xFFFBBF24);
  static const Color accentDark = Color(0xFFD97706);

  // Background Colors
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF1F5F9);

  // Text Colors
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textTertiary = Color(0xFF94A3B8);
  static const Color textInverse = Colors.white;

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Border & Divider Colors
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFF1F5F9);

  // Shadow Colors
  static const Color shadowLight = Color(0x0A000000);
  static const Color shadowMedium = Color(0x1A000000);
  static const Color shadowDark = Color(0x33000000);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTypography {
  // Font Families
  static const String fontFamily = 'Inter';

  // Display Styles
  static const TextStyle displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.25,
    height: 1.3,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.4,
  );

  // Headline Styles
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.4,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.5,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.5,
  );

  // Title Styles
  static const TextStyle titleLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.5,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.6,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.6,
  );

  // Body Styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    height: 1.6,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
    height: 1.6,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
    height: 1.6,
  );

  // Label Styles
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.6,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.6,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.6,
  );
}

class AppSizes {
  // Spacing
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Border Radius
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 999.0;

  // Icon Sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;

  // Button Heights
  static const double buttonSm = 36.0;
  static const double buttonMd = 48.0;
  static const double buttonLg = 56.0;

  // Input Heights
  static const double inputSm = 40.0;
  static const double inputMd = 48.0;
  static const double inputLg = 56.0;

  // Card Sizes
  static const double cardRadius = 16.0;
  static const double cardElevation = 2.0;

  // App Bar
  static const double appBarHeight = 64.0;

  // Bottom Navigation
  static const double bottomNavHeight = 80.0;
}

class AppShadows {
  static const List<BoxShadow> sm = [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> md = [
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  static const List<BoxShadow> lg = [
    BoxShadow(
      color: AppColors.shadowDark,
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> xl = [
    BoxShadow(
      color: AppColors.shadowDark,
      blurRadius: 24,
      offset: Offset(0, 8),
    ),
  ];
}

class AppStrings {
  // App Info
  static const String appName = 'ShopHub';
  static const String appTagline = 'Your Premium Shopping Experience';
  static const String appVersion = '1.0.0';

  // Auth
  static const String login = 'Sign In';
  static const String register = 'Create Account';
  static const String email = 'Email Address';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String name = 'Full Name';
  static const String forgotPassword = 'Forgot Password?';
  static const String dontHaveAccount = "Don't have an account?";
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String signUp = 'Sign Up';
  static const String signIn = 'Sign In';

  // Navigation
  static const String home = 'Home';
  static const String products = 'Products';
  static const String categories = 'Categories';
  static const String cart = 'Cart';
  static const String orders = 'Orders';
  static const String profile = 'Profile';
  static const String search = 'Search';
  static const String wishlist = 'Wishlist';

  // Product
  static const String addToCart = 'Add to Cart';
  static const String buyNow = 'Buy Now';
  static const String outOfStock = 'Out of Stock';
  static const String inStock = 'In Stock';
  static const String price = 'Price';
  static const String description = 'Description';
  static const String reviews = 'Reviews';
  static const String rating = 'Rating';
  static const String quantity = 'Quantity';
  static const String total = 'Total';
  static const String subtotal = 'Subtotal';
  static const String shipping = 'Shipping';
  static const String tax = 'Tax';

  // Cart & Checkout
  static const String checkout = 'Checkout';
  static const String emptyCart = 'Your cart is empty';
  static const String continueShopping = 'Continue Shopping';
  static const String remove = 'Remove';
  static const String update = 'Update';
  static const String clearCart = 'Clear Cart';
  static const String applyCoupon = 'Apply Coupon';
  static const String couponCode = 'Coupon Code';

  // Orders
  static const String orderHistory = 'Order History';
  static const String orderDetails = 'Order Details';
  static const String orderNumber = 'Order #';
  static const String orderDate = 'Order Date';
  static const String orderStatus = 'Status';
  static const String trackingNumber = 'Tracking Number';
  static const String deliveryAddress = 'Delivery Address';
  static const String paymentMethod = 'Payment Method';

  // Status
  static const String pending = 'Pending';
  static const String processing = 'Processing';
  static const String shipped = 'Shipped';
  static const String delivered = 'Delivered';
  static const String cancelled = 'Cancelled';
  static const String refunded = 'Refunded';

  // Actions
  static const String save = 'Save';
  static const String cancel = 'Cancel';
  static const String confirm = 'Confirm';
  static const String delete = 'Delete';
  static const String edit = 'Edit';
  static const String back = 'Back';
  static const String next = 'Next';
  static const String finish = 'Finish';
  static const String retry = 'Retry';

  // Messages
  static const String loading = 'Loading...';
  static const String error = 'Error';
  static const String success = 'Success';
  static const String noData = 'No data found';
  static const String noInternet = 'No internet connection';
  static const String serverError = 'Server error';
  static const String unknownError = 'Unknown error occurred';
  static const String tryAgain = 'Please try again';

  // Validation
  static const String requiredField = 'This field is required';
  static const String invalidEmail = 'Please enter a valid email';
  static const String invalidPassword =
      'Password must be at least 6 characters';
  static const String passwordMismatch = 'Passwords do not match';
  static const String invalidPhone = 'Please enter a valid phone number';
}

class AppConstants {
  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // API Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration cacheTimeout = Duration(hours: 1);

  // Pagination
  static const int pageSize = 20;
  static const int maxPages = 100;

  // Image Quality
  static const double imageQuality = 0.8;
  static const int maxImageSize = 1024;

  // Cache Keys
  static const String userKey = 'user_data';
  static const String tokenKey = 'auth_token';
  static const String cartKey = 'cart_data';
  static const String wishlistKey = 'wishlist_data';
  static const String settingsKey = 'app_settings';

  // Shared Preferences Keys
  static const String isLoggedInKey = 'is_logged_in';
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';
  static const String notificationsKey = 'notifications_enabled';
}

class ApiConstants {
  // Base URL
  static const String baseUrl = 'http://localhost:8000/api';

  // Auth Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refresh = '/auth/refresh';
  static const String user = '/auth/user';

  // Product Endpoints
  static const String products = '/products';
  static const String featuredProducts = '/products/featured';
  static const String popularProducts = '/products/popular';
  static const String searchProducts = '/products/search';

  // Category Endpoints
  static const String categories = '/categories';

  // Cart Endpoints
  static const String cart = '/cart';
  static const String addToCart = '/cart/add';
  static const String updateCart = '/cart/update';
  static const String removeFromCart = '/cart/remove';
  static const String clearCart = '/cart/clear';

  // Order Endpoints
  static const String orders = '/orders';
  static const String createOrder = '/orders/create';
  static const String orderHistory = '/orders/history';

  // Wishlist Endpoints
  static const String wishlist = '/wishlist';
  static const String addToWishlist = '/wishlist/add';
  static const String removeFromWishlist = '/wishlist/remove';

  // Review Endpoints
  static const String reviews = '/reviews';
  static const String productReviews = '/products/{id}/reviews';

  // User Endpoints
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/profile/update';
  static const String changePassword = '/user/password/change';
}

class OrderStatus {
  static const String pending = 'pending';
  static const String processing = 'processing';
  static const String shipped = 'shipped';
  static const String delivered = 'delivered';
  static const String cancelled = 'cancelled';
  static const String refunded = 'refunded';

  static String getDisplayName(String status) {
    switch (status) {
      case pending:
        return 'Pending';
      case processing:
        return 'Processing';
      case shipped:
        return 'Shipped';
      case delivered:
        return 'Delivered';
      case cancelled:
        return 'Cancelled';
      case refunded:
        return 'Refunded';
      default:
        return 'Unknown';
    }
  }

  static Color getStatusColor(String status) {
    switch (status) {
      case pending:
        return AppColors.warning;
      case processing:
        return AppColors.info;
      case shipped:
        return AppColors.primary;
      case delivered:
        return AppColors.success;
      case cancelled:
        return AppColors.error;
      case refunded:
        return AppColors.textSecondary;
      default:
        return AppColors.textTertiary;
    }
  }
}
