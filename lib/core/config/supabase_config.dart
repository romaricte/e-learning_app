import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String SUPABASE_URL = 'https://ccyxinbeepbktviacsce.supabase.co';
  static const String SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjeXhpbmJlZXBia3R2aWFjc2NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg5NjU4MjIsImV4cCI6MjA1NDU0MTgyMn0.ewJXQewlKgff6futxcadFAQGtepV8oJZngg5sr9zpuI';

  static SupabaseClient get client => Supabase.instance.client;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: SUPABASE_URL,
      anonKey: SUPABASE_ANON_KEY,
      debug: true // à mettre à false en production
    );
  }
} 