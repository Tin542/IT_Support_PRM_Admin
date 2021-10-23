import 'package:it_support/models/user_model.dart';

class Message {
  final Users sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: ironMan,
    time: '5:30 PM',
    text: 'Rất vui vì được hỗ trợ cho bạn. Chúc bạn một ngày tốt lành.',
    unread: true,
  ),
  Message(
    sender: captainAmerica,
    time: '4:30 PM',
    text: 'Chúng tôi có thể giúp gì cho bạn?',
    unread: true,
  ),
  Message(
    sender: blackWindow,
    time: '3:30 PM',
    text: 'Cảm ơn bạn đã sử dụng dịch vụ.',
    unread: false,
  ),
  Message(
    sender: spiderMan,
    time: '2:30 PM',
    text: 'Hẹn sớm gặp lại bạn.',
    unread: true,
  ),
  Message(
    sender: hulk,
    time: '1:30 PM',
    text: 'Chúc một ngày tốt lành.',
    unread: false,
  ),
  Message(
    sender: thor,
    time: '12:30 PM',
    text: 'Chúng tôi có thể giúp bạn kiểm tra điện thoại.',
    unread: false,
  ),
  Message(
    sender: scarletWitch,
    time: '11:30 AM',
    text: 'Laptop của bạn không hoạt động ?',
    unread: false,
  ),
  Message(
    sender: captainMarvel,
    time: '12:45 AM',
    text: 'Bạn hãy thử tắt nguồn và mở lại thiết bị của mình xem.',
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: ironMan,
    time: '5:30 PM',
    text: 'Rất vui vì được hỗ trợ cho bạn. Nếu còn vấn đề gì hãy cho tôi biết. Chúc bạn một ngày tốt lành. ',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Cảm ơn bạn, sau khi thử cách của bạn máy tính của tôi đã mở lên được.',
    unread: true,
  ),
  Message(
    sender: ironMan,
    time: '3:45 PM',
    text: 'Việc máy nguồn máy tính mở trong vài giây và tắt sau đó là hiện tượng của RAM không được cắm chặt. Bạn có thể mở máy của mình ra và thử cắm lại RAM.',
    unread: true,
  ),
  Message(
    sender: ironMan,
    time: '3:15 PM',
    text: 'Tôi xin tiếp nhận trường hợp của bạn.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Tôi sử dụng laptop MSI mã máy A69G144S. Máy tính của tôi khi khởi động có âm thanh lạ. Đèn nguồn bật lên trong vài giây sau đó tắt.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Tôi đang có một vài vấn đề với máy tính cá nhân của tôi. Hy vọng bạn có thể giúp tôi tìm ra giải pháp.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Chào bạn !',
    unread: true,
  ),
  Message(
    sender: ironMan,
    time: '2:00 PM',
    text: 'Xin chào, chúng tôi có thể giúp gì cho bạn ?',
    unread: true,
  ),
];
