class NameUtils {
  /// Rút gọn họ đệm thành chữ cái đầu, giữ nguyên phần tên chính
  static String shortenToInitials(String fullName) {
    if (fullName.trim().isEmpty) return '';

    // Tách các từ theo khoảng trắng
    final parts = fullName.trim().split(RegExp(r'\s+'));

    // Nếu chỉ có 1 từ thì trả lại luôn
    if (parts.length == 1) return parts.first;

    // Lấy phần tên chính (thường là 1 hoặc 2 từ cuối)
    final mainName = parts.sublist(parts.length - 2).join(' ');

    // Lấy phần họ đệm (tất cả trừ 2 từ cuối)
    final prefix = parts.sublist(0, parts.length - 2);

    // Viết tắt họ đệm: VD ['Nguyễn', 'Phương'] -> 'N.P'
    final initials = prefix.map((p) => p[0].toUpperCase()).join('.');

    // Gộp lại
    return '$initials $mainName';
  }

  /// Nếu muốn giới hạn ký tự để tránh tràn UI
  static String limitLength(String text, {int maxLength = 18}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength - 3)}...';
  }
}
