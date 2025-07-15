import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_service.dart';
import '../models/user.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = false;
  String? _token;
  User? _user;
  String? _error;

  final AuthService _authService = AuthService();

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  String? get token => _token;
  User? get user => _user;
  String? get error => _error;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _authService.login(email, password);

      if (result['success'] == true) {
        _token = result['data']['token'];
        _user = User.fromJson(result['data']['user']);
        _isAuthenticated = true;

        // Salvar token localmente
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token!);
        await prefs.setString('user', result['data']['user'].toString());

        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _error = result['message'] ?? 'Login failed';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = 'Network error: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String name, String email, String password,
      String confirmPassword) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _authService.register({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      });

      if (result['success'] == true) {
        _token = result['data']['token'];
        _user = User.fromJson(result['data']['user']);
        _isAuthenticated = true;

        // Salvar token localmente
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token!);
        await prefs.setString('user', result['data']['user'].toString());

        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _error = result['message'] ?? 'Registration failed';
        if (result['errors'] != null) {
          // Handle validation errors
          final errors = result['errors'] as Map<String, dynamic>;
          _error = errors.values.first.toString();
        }
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = 'Network error: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      if (_token != null) {
        await _authService.logout(_token!);
      }
    } catch (e) {
      print('Logout error: $e');
    }

    _isAuthenticated = false;
    _token = null;
    _user = null;
    _error = null;

    // Remover dados localmente
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('user');

    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('token');

    if (savedToken != null) {
      _token = savedToken;

      try {
        final user = await _authService.getUser(savedToken);
        if (user != null) {
          _user = user;
          _isAuthenticated = true;
        } else {
          // Token inválido, limpar dados
          await prefs.remove('token');
          await prefs.remove('user');
        }
      } catch (e) {
        print('Error checking auth status: $e');
        // Token inválido, limpar dados
        await prefs.remove('token');
        await prefs.remove('user');
      }

      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
