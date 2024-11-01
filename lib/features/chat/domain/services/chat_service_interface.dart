import 'package:fastdelivery_multivendor_restaurant/api/api_client.dart';
import 'package:fastdelivery_multivendor_restaurant/helper/user_type.dart';

abstract class ChatServiceInterface {
  Future<dynamic> getConversationList(int offset);
  Future<dynamic> searchConversationList(String name);
  Future<dynamic> getMessages(int offset, int? userId, UserType userType, int? conversationID);
  Future<dynamic> sendMessage(String message, List<MultipartBody> images, int? conversationId, int? userId, UserType userType);
}