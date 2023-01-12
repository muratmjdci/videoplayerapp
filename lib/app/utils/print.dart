// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:developer' as developer;

class Print {
  const Print._();
  static void log(dynamic message, [String? service]) {
    developer.log('$message', name: service ?? '');
  }

  static void info(dynamic info, [String? service]) {
    service == null ? service = '[INFO]' : service = '[$service]';
    print('\u001b[32m 🍀 $service $info');
  }

  static void warning(dynamic warning, [String? service]) {
    service == null ? service = '[WARNING]' : service = '[$service]';
    print('\u001B[34m 🔥 $service $warning');
  }

  static void error(dynamic error, [String? service]) {
    service == null ? service = '[ERROR]' : service = '[$service]';
    print('\u001b[31m 💀 $service $error');
  }

  static void json(dynamic message) => developer.log(jsonEncode(message));
}