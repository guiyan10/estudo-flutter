import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/constants.dart';

enum TextFieldVariant { outlined, filled, underlined }

enum TextFieldSize { small, medium, large }

class CustomTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextFieldVariant variant;
  final TextFieldSize size;
  final bool isRequired;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.textInputAction,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.variant = TextFieldVariant.outlined,
    this.size = TextFieldSize.medium,
    this.isRequired = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _hasFocus = hasFocus;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Row(
              children: [
                Text(
                  widget.label!,
                  style: _getLabelStyle(),
                ),
                if (widget.isRequired)
                  Text(
                    ' *',
                    style: _getLabelStyle().copyWith(
                      color: AppColors.error,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSizes.xs),
          ],
          _buildTextField(),
          if (widget.helperText != null && widget.errorText == null) ...[
            const SizedBox(height: AppSizes.xs),
            Text(
              widget.helperText!,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
          if (widget.errorText != null) ...[
            const SizedBox(height: AppSizes.xs),
            Text(
              widget.errorText!,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.error,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTextField() {
    switch (widget.variant) {
      case TextFieldVariant.outlined:
        return _buildOutlinedTextField();
      case TextFieldVariant.filled:
        return _buildFilledTextField();
      case TextFieldVariant.underlined:
        return _buildUnderlinedTextField();
    }
  }

  Widget _buildOutlinedTextField() {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      style: _getInputStyle(),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: _getHintStyle(),
        prefixIcon: widget.prefixIcon,
        suffixIcon: _buildSuffixIcon(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: BorderSide(
            color: widget.errorText != null
                ? AppColors.error
                : _hasFocus
                    ? AppColors.primary
                    : AppColors.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: BorderSide(
            color:
                widget.errorText != null ? AppColors.error : AppColors.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        contentPadding: _getContentPadding(),
        filled: false,
      ),
    );
  }

  Widget _buildFilledTextField() {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      style: _getInputStyle(),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: _getHintStyle(),
        prefixIcon: widget.prefixIcon,
        suffixIcon: _buildSuffixIcon(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        contentPadding: _getContentPadding(),
        filled: true,
        fillColor: widget.errorText != null
            ? AppColors.error.withOpacity(0.05)
            : _hasFocus
                ? AppColors.primary.withOpacity(0.05)
                : AppColors.surfaceVariant,
      ),
    );
  }

  Widget _buildUnderlinedTextField() {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      style: _getInputStyle(),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: _getHintStyle(),
        prefixIcon: widget.prefixIcon,
        suffixIcon: _buildSuffixIcon(),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.errorText != null ? AppColors.error : AppColors.border,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.errorText != null ? AppColors.error : AppColors.border,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        contentPadding: _getContentPadding(),
        filled: false,
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: AppColors.textSecondary,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }
    return widget.suffixIcon;
  }

  double _getBorderRadius() {
    switch (widget.size) {
      case TextFieldSize.small:
        return AppSizes.radiusSm;
      case TextFieldSize.medium:
        return AppSizes.radiusMd;
      case TextFieldSize.large:
        return AppSizes.radiusLg;
    }
  }

  EdgeInsets _getContentPadding() {
    switch (widget.size) {
      case TextFieldSize.small:
        return const EdgeInsets.symmetric(
          horizontal: AppSizes.md,
          vertical: AppSizes.sm,
        );
      case TextFieldSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.md,
        );
      case TextFieldSize.large:
        return const EdgeInsets.symmetric(
          horizontal: AppSizes.xl,
          vertical: AppSizes.lg,
        );
    }
  }

  TextStyle _getLabelStyle() {
    switch (widget.size) {
      case TextFieldSize.small:
        return AppTypography.labelMedium;
      case TextFieldSize.medium:
        return AppTypography.labelLarge;
      case TextFieldSize.large:
        return AppTypography.titleSmall;
    }
  }

  TextStyle _getInputStyle() {
    switch (widget.size) {
      case TextFieldSize.small:
        return AppTypography.bodyMedium;
      case TextFieldSize.medium:
        return AppTypography.bodyLarge;
      case TextFieldSize.large:
        return AppTypography.titleMedium;
    }
  }

  TextStyle _getHintStyle() {
    switch (widget.size) {
      case TextFieldSize.small:
        return AppTypography.bodySmall.copyWith(
          color: AppColors.textTertiary,
        );
      case TextFieldSize.medium:
        return AppTypography.bodyMedium.copyWith(
          color: AppColors.textTertiary,
        );
      case TextFieldSize.large:
        return AppTypography.bodyLarge.copyWith(
          color: AppColors.textTertiary,
        );
    }
  }
}
