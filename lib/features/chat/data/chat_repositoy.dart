import 'package:aichatbot/common/netwrok/api_service.dart';

class ChatRepository {
  final ApiService apiService;
  ChatRepository(this.apiService);

  Future<String> fetchResponse(String userId, String message) async {
    try {
      return await apiService.sendMessage(userId, message);
    } catch (e) {
      throw Exception('Failed to fetch response: $e');
    }
  }

  Future<bool> resetChat(String userId) async {
    try {
      return await apiService.resetChat(userId);
    } catch (e) {
      throw Exception('Failed to reset chat: $e');
    }
  }
}
