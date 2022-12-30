-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 24, 2021 lúc 12:10 AM
-- Phiên bản máy phục vụ: 5.7.31
-- Phiên bản PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nhom5`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufactures`
--

DROP TABLE IF EXISTS `manufactures`;
CREATE TABLE IF NOT EXISTS `manufactures` (
  `manu_id` int(11) NOT NULL AUTO_INCREMENT,
  `manu_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`manu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `manufactures`
--

INSERT INTO `manufactures` (`manu_id`, `manu_name`) VALUES
(1, 'Apple'),
(2, 'SamSung'),
(3, 'Xiaomi'),
(4, 'Asus'),
(5, 'Huawei');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL,
  `note` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `pro_id`, `pro_name`, `quantity`, `address`, `phone`, `status`, `total`, `note`, `date_create`) VALUES
(17, 6, 1, 'Điện thoại Xiaomi Mi 11 5G', 2, 'thôn 3 bình thành', '03216546', 1, 33980000, '', '2021-12-22 15:16:22'),
(14, 6, 1, 'Điện thoại Xiaomi Mi 11 5G', 2, 'khu 4 vĩnh trung', '0941703353', 1, 33980000, '', '2021-12-22 13:01:34'),
(18, 6, 1, 'Điện thoại Xiaomi Mi 11 5G', 2, 'khu 4 vĩnh nam', '09417032323333333', 1, 33980000, '', '2021-12-22 15:18:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `manu_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `pro_image` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `feature` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `manu_id`, `type_id`, `price`, `pro_image`, `description`, `feature`, `created_at`) VALUES
(1, 'Điện thoại Xiaomi Mi 11 5G', 3, 1, 16990000, 'xiaomi-mi-11-xanhduong-600x600-600x600.jpg', 'Xiaomi Mi 11 một siêu phẩm đến từ Xiaomi, máy cho trải nghiệm hiệu năng hàng đầu với vi xử lý Qualcomm Snapdragon 888, cùng loạt công nghệ đỉnh cao, khiến bất kỳ ai cũng sẽ choáng ngợp về smartphone này.', 1, '2021-10-22 04:15:10'),
(2, 'Samsung Galaxy Watch 3 45mm titanium ', 2, 4, 10990000, 'samsung-galaxy-watch-3-45mm-titanium-thum-1-1-600x600.jpg', 'Đồng hồ Samsung Galaxy Watch 3 45mm titanium được trang bị dây đeo thép không gỉ sang trọng, kết hợp cùng lớp màu Mystic Black độc quyền với nét đẹp huyền bí, tinh tế giúp cho mẫu Samsung Galaxy Watch 3 này trở nên cao cấp và đặc biệt hơn hẳn những phiên bản khác.', 1, '2021-10-22 04:15:10'),
(3, 'Máy tính bảng Samsung Galaxy Tab S7', 2, 3, 15990000, 'samsung-galaxy-tab-s7-gold-new-600x600.jpg', 'Samsung Galaxy Tab S7 chiếc máy tính bảng có thiết kế tuyệt đẹp, màn hình 120 Hz siêu mượt, camera kép ấn tượng, bút S Pen cùng một hiệu năng mạnh mẽ thuộc top đầu thị trường máy tính bảng Android.', 0, '2021-10-22 04:15:10'),
(4, 'Tai nghe Bluetooth True Wireless Galaxy Buds Pro Bạc', 2, 5, 3992000, 'bluetooth-true-wireless-galaxy-buds-pro-bac-ava-600x600.jpg', 'Tai nghe Bluetooth True Wireless Samsung Buds Pro sở hữu vẻ ngoài đẹp mắt thời thượng với hai màu đen và trắng. Thiết kế mới trên hình dạng tai nghe cổ điển, có khả năng làm giảm bớt sự khó chịu khi sử dụng tai nghe trong nhiều giờ và tai nghe cũng nằm chắc chắn phía trong tai khi bạn tập luyện hay vận động. Đồng thời, các lỗ thoát khí giúp cân bằng áp suất trong tai và tăng lưu lượng không khí, tạo cảm giác mềm mại dễ chịu khi sử dụng.', 1, '2021-10-22 04:15:10'),
(5, 'Điện thoại Samsung Galaxy Z Flip3 5G 256GB ', 2, 1, 25990000, 'samsung-galaxy-z-flip-3-violet-1-600x600.jpg', 'Nối tiếp thành công của Galaxy Z Flip 5G, trong sự kiện Galaxy Unpacked vừa qua Samsung tiếp tục giới thiệu đến thế giới về Galaxy Z Flip3 5G 256GB. Sản phẩm có nhiều cải tiến từ độ bền cho đến hiệu năng và thậm chí nó còn vượt xa hơn mong đợi của mọi người.', 1, '2021-10-22 04:15:10'),
(6, 'Samsung Galaxy Book Flex 2 Alpha', 2, 2, 21990000, 'samsung-galaxy-book-flex-2-alpha.jpg', 'Với thiết kế mỏng nhẹ sáng tạo, khả năng hiển thị sống động, đi kèm vi xử lý tốc độ cao cùng hàng loạt công nghệ mới nhất từ hãng; Samsung Galaxy Book Flex2 Alpha sẽ phù hợp với người dùng ưa thích những thương hiệu laptop độc lạ, nhưng vẫn muốn trải nghiệm sử dụng được đảm bảo xứng với tầm tiền. ', 0, '2021-10-22 04:15:10'),
(7, 'Máy tính bảng Xiaomi Pad 5 128GB', 3, 3, 8990000, 'xiaomi-pad-5-white-600x600.jpg', 'Xiaomi đã mang dòng máy tính bảng quay trở lại sau một thời gian dài vắng bóng bằng việc ra mắt Xiaomi Pad 5. Sản phẩm này được trang bị một thiết kế hiện đại cùng hàng loạt nâng cấp về cấu hình và các tính năng hữu ích.', 1, '2021-10-22 04:15:10'),
(8, 'Tai nghe Bluetooth True Wireless Earphones 2 Xiaomi ZBW4493GL Trắng ', 3, 5, 1864000, '226701-600x600.jpg', 'Tai nghe Bluetooth True Wireless Earphones 2 Xiaomi ZBW4493GL có hộp sạc bảo vệ, vừa vặn với kích thước của tai nghe. \r\n\r\nSản phẩm đồng bộ tông màu trắng thanh lịch, dễ phối đồ. Đây là món phụ kiện đặc biệt thích hợp cho các bạn trẻ năng động hiện nay.', 0, '2021-10-22 04:15:10'),
(9, 'Laptop Xiaomi Mi Notebook Air 13.3 Core i7', 3, 2, 21950000, 'Laptop-Xiaomi-Mi-Notebook-Air-13.3-Core-i7.jpg', 'Mi Notebook Air 13.3 có thể được coi là một đối thủ canh tranh trực tiếp với các sản phẩm Macbook của Apple vẫn giữ được tiêu chí tạo ra các sản phẩm ngon – bổ nhưng lại rẻ những thứ đã tạo nên thương hiệu cho Xiaomi đến từ Trung Quốc và chiếc Mi Notebook Air 13.3 được ra với tiêu chí trên cấu hình khủng nhưng giá cực “mềm”', 0, '2021-10-22 04:15:10'),
(10, 'Đồng hồ thông minh Mi Watch', 3, 4, 2590000, 'mi-watch-den-thumb-600x600.jpg', 'Đồng hồ thông minh Mi Watch này mang phong cách trẻ trung, cá tính và đậm chất thể thao. Đồng hồ được trang bị công nghệ màn hình AMOLED với kích thước 1.39 inch cùng độ phân giải 454 x 454 pixels và độ sáng lên đến 450 nits giúp người dùng có thể quan sát thông tin rõ nét, chất lượng. Bên cạnh đó, đồng hồ còn được trang bị mặt kính cường lực Gorilla Glass 3 hạn chế trầy xước và tăng độ bền cho thiết bị.', 1, '2021-10-22 04:15:10'),
(11, 'Điện thoại iPhone 13 Pro Max 128GB', 1, 1, 33990000, 'vi-vn-iphone-13-pro-max-slider-tong-quan.jpg', 'iPhone 13 Pro Max 128GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.', 1, '2021-10-23 13:10:55'),
(12, 'Laptop Apple MacBook Pro M1 2020 16GB/1TB SSD (Z11C000CJ)', 1, 2, 52990000, 'vi-vn-apple-macbook-pro-m1-2020-z11c000cj-01.jpg', 'Laptop Apple Macbook Pro M1 2020 (Z11C000CJ) với chip M1 dành riêng cho MacBook đưa hiệu năng của MacBook Pro 2020 lên một tầm cao mới. Màn hình Retina siêu nét, thời lượng pin ấn tượng và hàng loạt các tính năng hiện đại giúp bạn có được trải nghiệm làm việc chuyên nghiệp nhất.', 1, '2021-10-23 13:10:55'),
(13, 'iPad Pro M1 12.9 inch WiFi Cellular 256GB (2021)', 1, 3, 38490000, 'ipad-pro-m1-129-inch-wifi-cellular-256gb-2021-240521-03332610.jpg', 'Máy tính bảng iPad Pro M1 12.9 inch Wifi Cellular 256GB (2021) trang bị con chip vô cùng mạnh mẽ M1 cùng công nghệ màn hình mới mini-LED được rất nhiều người dùng đón nhận nồng nhiệt và đánh giá rất tốt sản phẩm này đến từ Apple.', 1, '2021-10-23 13:13:52'),
(14, 'Tai nghe Bluetooth AirPods Pro Wireless Charge Apple MWP22', 1, 5, 4990000, 'airpods-pro-wireless-charge-apple-mwp22-ava-1-org.jpg', 'Thiết kế in-ear hoàn toàn mới và độc đáo.Tích hợp công nghệ chống ồn chủ động (Active Noise Cancellation).Chip H1 mạnh mẽ, xử lý âm thanh kỹ thuật số với độ trễ gần như bằng không.Nghe nhạc đến 4.5 giờ khi bật chống ồn, 5 giờ khi tắt chống ồn.Sử dụng song song với hộp sạc có thể dùng được đến 24 giờ nghe nhạc.Hỗ trợ sạc nhanh, cho thời gian sử dụng đến 1 giờ chỉ với 5 phút sạc.Hộp sạc hỗ trợ sạc không dây chuẩn Qi, tiện lợi khi sạc lại.Trang bị chuẩn chống nước IPX4, bảo vệ tai nghe an toàn dưới mưa nhỏ và mồ hôi.Sản phẩm chính hãng Apple, nguyên seal 100%.Lưu ý: Thanh toán trước khi mở seal.', 1, '2021-10-23 13:16:14'),
(15, 'Apple Watch SE 40mm viền nhôm dây cao su', 1, 4, 8450000, 'vi-vn-se-40mm-vien-nhom-day-cao-su-hong-slider-fix.jpg', 'Apple Watch SE 40mm viền nhôm dây cao su hồng có khung viền chắc chắn, thiết kế bo tròn 4 góc giúp thao tác vuốt chạm thoải mái hơn. Mặt kính cường lực Ion-X strengthened glass với kích thước 1.57 inch, hiển thị rõ ràng. Khung viền nhôm chắc chắn cùng dây đeo cao su có độ đàn hồi cao, êm ái, tạo cảm giác thoải mái khi đeo.', 1, '2021-10-23 13:18:29'),
(16, 'ASUS ROG Phone 3', 4, 1, 45657000, 's-l1600.jpg', 'Màn hình AMOLED 10-bit HDR 6,59 \"19,5: 9 (2340 x 1080) 144Hz 1 ms. Độ sáng có thể đọc được ngoài trời 650 nits Delta-E <1 Độ sáng tối đa 1.000 nits Chứng nhận TÜV Low Blue Light (Giải pháp phần cứng) và Giảm nhấp nháy cho mắt. Được chứng nhận HDR10 và HDR10+ 113,3% DCI-P3, 108,8% NTSC, độ phủ gam màu 153,7% sRGB Màn hình AMOLED tỷ lệ tương phản 1.000.000: 1 với Corning® Gorilla® Glass 6 Hỗ trợ hiển thị luôn bật Màn hình cảm ứng điện dung với cảm ứng đa điểm 10 điểm (hỗ trợ cảm ứng găng tay)', 1, '2021-10-23 13:48:54'),
(17, 'Laptop Asus Rog Zephyrus Gaming G14', 4, 2, 28490000, 'asus-rog-zephyrus-g14-ga401qh-r7-hz035t-1020x570.jpg', 'Mạnh mẽ và di động là những đặc tính nổi bật của Asus Rog Zephyrus G14 GA401QH R7 (HZ035T), đây chính là chiếc laptop gaming xứng đáng được bạn sở hữu với CPU AMD Ryzen 7 cùng card đồ hoạ GeForce dòng GTX, mang đến cho người dùng những trải nghiệm làm việc cũng như giải trí hoàn hảo.', 1, '2021-10-23 13:48:54'),
(18, 'Máy tính bản Asus Zenpad Z10', 4, 3, 3190000, 'xdpuz324pmy2j.jpg', 'ASUS ZenPad Z10 nổi bật với một màn hình rộng 9.7 inch cùng vi xử lý mạnh mẽ, thiết kế siêu mỏng nhẹ cũng như sang trọng cùng vỏ nhôm nguyên khối', 1, '2021-10-23 13:51:44'),
(19, 'ĐỒNG HỒ THÔNG MINH ASUS ZENWATCH 3', 4, 4, 11348000, 'dong-ho-thong-minh-asus-zenwatch-3.jpg', 'Đồng Hồ Thông Minh ASUS ZenWatch 3 có phần vỏ làm từ thép không gỉ 316L cao cấp, độ cứng và độ bền cao. Phần viền benzel được làm theo dạng các đường cắt kim cương, cùng các chi tiết được làm vô cùng tỉ mỉ, tạo nên sự thanh lịch và sang trọng cho sản phẩm. Trên viền benzel có 3 nút bấm với vai trò điều khiển các tác vụ một cách nhanh chóng, giúp bạn truy cập vào tính năng hay ứng dụng ưa thích. Nút ở giữa có thể được tuỳ biến truy cập vào nhiều chế độ như: Interactive, Ambient, Theater, hay Brightness Boost. Nút bấm dưới cùng sẽ giúp bạn bật chế độ Eco Mode để kéo dài thời lượng pin. Hình nền trên mặt được tuỳ biến khác nhau và hơn 50 mặt đồng hồ, giúp bạn dễ dàng tạo ra một chiếc đồng hồ phù hợp với phong cách thời trang.', 1, '2021-10-23 13:52:23'),
(20, 'Tai nghe chụp tai Gaming Asus TUF H3 Đen Đỏ', 4, 5, 891000, 'tai-nghe-chup-tai-gaming-asus-tuf-h3-den-do-070820-0509200.jpg', 'Với thiết kế chụp tai cùng phần quai to, dày, Gaming Asus TUF H3 tông màu đen đỏ chủ đạo giúp cố định, hạn chế xê dịch khi bạn chuyển động.', 1, '2021-10-23 13:53:14'),
(21, 'Huawei P40 Pro Chính Hãng Bảo Hành Chính Hãng 10 tháng', 5, 1, 14990000, 'xam_mge8-j2.jpg', 'Huawei P40 Pro được đánh giá là smartphone mang đến những trải nghiệm chụp ảnh đỉnh cao nhờ cụm camera 4 ống kính chất lượng, thiết bị sở hữu thiết kế xứng tầm smartphone cao cấp.\r\nCũng giống như hai người anh em của mình, Huawei P40 Pro cũng sở hữu thiết kế bóng bẩy, sang trọng với khung viền được làm bằng thép chắc chắn cùng mặt lưng kính. ', 0, '2021-10-25 13:10:54'),
(22, 'Laptop Huawei Matebook 13 2020', 5, 2, 21990000, 'laptop-huawei-matebook-13-9.jpg', 'Huawei Matebook 13 2020: Đỉnh cao kết nối – Đỉnh cao hiệu năng\r\nBạn đang tìm kiếm cho bản thân mình một chiếc laptop với các cấu hình phần cứng đáp ứng cả cho việc văn phòng và chơi game giải trí? Bạn đang một trong những sản phẩm điện thoại Huawei và mong muốn kiếm một chiếc laptop của Huawei với nhiều công nghệ thu hút nhất? Mời bạn tham khảo về bài viết Huawei Matebook 13 bên dưới.\r\n\r\nThiết kế nguyên khối sang trọng cùng trọng lượng chỉ xấp xỉ 1.3kg\r\nMang trong mình một thiết kế nguyên khối sáng bóng với các thiết kế diamond cut hiện đại và bóng bẩy, mang lại cho chiếc laptop Huawei Matebook 13 2020 một vẻ đẹp hoàn mỹ.  \r\n\r\n', 1, '2021-10-25 13:10:54'),
(23, 'Máy tính bảng Huawei MatePad 11', 5, 3, 13490000, 'huawei-matepad-11-grey-600x600.jpg', 'MatePad 11 đã được Huawei trình làng với hệ thống giải trí bất tận đáp ứng mọi nhu cầu sáng tạo cùng bút M-Pencil, nâng cấp nhiều về tính năng lẫn sức mạnh xử lý.\r\nHiệu năng mạnh mẽ từ Qualcomm Snapdragon 865, máy có thể chơi hầu hết các tựa game hiện nay như: PUBG, Liên Quân với thiết lập đồ họa cao mà vẫn mượt mà, mang đến cho bạn trải nghiệm giải trí cực kỳ ổn định.\r\n\r\nTrang bị RAM 6 GB có khả năng đa nhiệm thoải mái, bộ nhớ trong 128 GB khá lớn để lưu trữ mọi khoảnh khắc cùng những bức ảnh, video hay một kho game cho việc giải trí bất tận, người dùng còn có thể mở rộng thêm dung lượng thông qua thẻ nhớ MicroSD.', 1, '2021-10-25 13:14:07'),
(24, 'Đồng hồ thông minh Huawei Watch 3 Pro', 5, 4, 12990000, 'dong-ho-thong-minh-huuawei-watch-3-pro-1_2_1.jpg', 'Tiếp tục là sản phẩm smartwatch đến từ thương hiệu Huawei, bộ đôi smartwatch mới Huawei Watch 3 và Huawei Watch 3 Pro được kế thừa nhiều ưu điểm của những người tiền nhiệm đi trước và được nâng cấp bởi công nghệ tân tiến hiện nay, hãy cùng xem liệu đồng hồ thông minh Huawei Watch 3 Pro có chinh phục được người dùng hay không?\r\nHẳn các nhà thiết kế của Huawei cũng đã tìm hiểu rất kỹ về các sản phẩm đồng hồ đeo tay trước đó và dường như họ có cảm giác thân thiện hơn đối với mặt kính hình tròn. Ngay bên cạnh sườn của đồng hồ, có nút xoay tựa như Digital Crown.', 1, '2021-10-25 13:17:06'),
(25, 'Tai nghe không dây Huawei Freebuds 4i', 5, 5, 1690000, 'freebuds-4i_2.jpg', 'Một chiếc tai nghe không dây mang đến cho bạn nhiều sự tiện nghi mà những chiếc tai có dây lại không có, sản phẩm có tên là Huawei Freebuds 4i. Dù trước đây được đánh giá là chất lượng âm thanh không bằng nhưng với công nghệ hiện đại được phát triển bởi Huawei, tai nghe có dây đã phát triển lên tầm cao mới.\r\nĐiều đầu tiên đập vào mắt người dùng đó là một kiểu dáng tai nghe không dây quen thuộc, và thường thấy trên các sản phẩm cao cấp. Đầu tiên là thiết kế earbuds mang đến trải nghiệm thân thiện với tai của người dùng, núm cao su bao bọc lấy phần khoang tai chắc chắn và không thể rơi ra thậm chí là bạn đang vận động mạnh.', 1, '2021-12-19 06:53:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `protypes`
--

DROP TABLE IF EXISTS `protypes`;
CREATE TABLE IF NOT EXISTS `protypes` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `protypes`
--

INSERT INTO `protypes` (`type_id`, `type_name`) VALUES
(1, 'Điện thoại'),
(2, 'Laptop'),
(3, 'Máy tính bảng'),
(4, 'Smartwatch'),
(5, 'Tai nghe');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) NOT NULL,
  `Sell_number` int(11) NOT NULL,
  `Import_quantity` int(11) NOT NULL,
  `Import_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sales`
--

INSERT INTO `sales` (`id`, `Sell_number`, `Import_quantity`, `Import_date`) VALUES
(1, 500, 1000, '2022-11-12 01:41:19'),
(2, 300, 1200, '2022-11-12 01:41:19'),
(3, 1200, 2000, '2022-11-12 01:42:44'),
(4, 100, 1000, '2022-11-12 01:43:12'),
(5, 700, 1500, '2022-11-12 01:43:38'),
(6, 100, 500, '2022-11-12 01:44:04'),
(7, 600, 1000, '2022-11-12 01:44:30'),
(8, 170, 300, '2022-11-12 01:44:52'),
(9, 100, 500, '2022-11-12 01:45:20'),
(10, 150, 400, '2022-11-19 12:29:46'),
(11, 160, 300, '2022-11-19 12:32:39'),
(12, 200, 500, '2022-11-19 12:32:54'),
(13, 320, 540, '2022-11-19 12:33:05'),
(14, 250, 350, '2022-11-19 12:33:17'),
(15, 700, 1000, '2022-11-19 12:33:34'),
(16, 300, 600, '2022-11-19 12:33:49'),
(17, 100, 200, '2022-11-19 12:34:01'),
(18, 500, 1000, '2022-12-14 02:25:29'),
(19, 300, 1250, '2022-12-14 02:25:29'),
(20, 400, 700, '2022-12-14 02:26:09'),
(21, 150, 500, '2022-12-14 02:26:30'),
(22, 190, 700, '2022-12-14 02:26:43'),
(23, 250, 800, '2022-12-14 02:26:58'),
(24, 800, 2000, '2022-12-14 02:27:10'),
(25, 300, 750, '2022-12-14 02:27:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `First_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `image`, `First_name`, `Last_name`, `phone`, `username`, `password`, `role_id`) VALUES
(1, NULL, 'Huỳnh', 'Trọng', 0, 'admin', '123', 1),
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
