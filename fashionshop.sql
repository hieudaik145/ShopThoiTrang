-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2019 at 05:05 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fashionshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(15) NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '123'),
(2, 'VanHieuVip', '123');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` bigint(25) NOT NULL,
  `user_id` bigint(25) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `payment` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adress` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `user_id`, `total`, `payment`, `adress`, `date`) VALUES
(344166303, 12, 1088000, 'Direct Payment', '56 Võ Mười Thành Phố Quy Nhơn', '2019-01-03 16:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `bill_detail_id` bigint(25) NOT NULL,
  `bill_id` bigint(25) NOT NULL,
  `product_id` bigint(25) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`bill_detail_id`, `bill_id`, `product_id`, `price`, `quantity`) VALUES
(16, 344166303, 67, 90000, 1),
(17, 344166303, 61, 399000, 2),
(18, 344166303, 62, 200000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(20) NOT NULL,
  `category_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `sex`) VALUES
(1, 'Sơ Mi Nữ', 'Nu'),
(2, 'Áo Thun Nữ', 'Nu'),
(3, 'Túi Xách Nữ', 'Nu'),
(4, 'Áo Khoát Nữ', 'Nu'),
(5, 'Quần Dài Nữ', 'Nu'),
(6, 'Quần Shorts, Chân Váy', 'Nu'),
(7, 'Áo Khoác Nam', 'Nam'),
(8, 'Áo Sơ Mi Nam', 'Nam'),
(9, 'Áo Thun Nam', 'Nam'),
(11, 'Quần Short Nam', 'Nam'),
(12, 'Quần Dài Nam', 'Nam'),
(13, 'Phụ Kiện Nữ', 'Nu'),
(14, 'Phụ Kiện Nam', 'Nam');

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`id`, `username`, `password`, `email`, `phone`) VALUES
(1, 'vo van hieu', '123', 'admin@gmail.com', 32679832),
(2, 'hai', '123456', 'hai@gmail.com', 123456789),
(3, 'hieu', '111111', 'hieude@gmail.com', 231),
(4, 'hieu', 'Hieudaik145', 'admin123@gmail.com', 2321),
(5, 'hieu cute', '123', 'hieucute@gmail.com', 1221),
(6, 'hieuvo@gmail.com', '123', 'hieuvo@gmail.com', 123),
(7, 'Hiếu Đẹp Trai', '123', 'vanhieuit97@gmail.com', 3213123),
(8, 'Võ Văn Hiếu', '123456', 'adminhieu@gmail.com', 32679715),
(9, 'Võ Văn Hiếu', '123456', 'hieudaik@gmail.com', 321312312),
(10, 'hi?u xxx', '123456', 'hieuxx@gmail.com', 123456),
(11, 'hiếu xxx pro', '1111', 'hieu@gmail.com', 3213),
(12, 'Thanh Hải Pro', '123', 'hieu206117133@gmail.com', 3333);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(15) NOT NULL,
  `category_id` int(15) DEFAULT NULL,
  `product_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_image1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_image2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `price_old` double DEFAULT NULL,
  `product_description` longtext COLLATE utf8_unicode_ci,
  `product_overview` longtext COLLATE utf8_unicode_ci,
  `product_additional` longtext COLLATE utf8_unicode_ci,
  `product_review` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `product_image`, `product_image1`, `product_image2`, `product_price`, `price_old`, `product_description`, `product_overview`, `product_additional`, `product_review`) VALUES
(76, 7, 'Áo Khoác Phao QN2-KJ1L/18-015', 'images/aophao1.jpg', 'images/aophao2.jpg', 'images/aophao2.jpg', 650000, 1000000, 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam', 'Size Chữ	\r\n\r\nS, M, L, XL', '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao', 'Sản Phẩm Của TheBlue'),
(77, 7, 'Áo Khoác Phao VN-K-J2L/16-005', 'images/aokhoatphao01.jpg', 'images/aokhoatphao02.jpg', 'images/aokhoatphao03.jpg', 450000, 500000, 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam', 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam', '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao', 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam'),
(78, 6, 'Đầm trễ vai nữ tay lững- HK17-UB171', 'images/damtre1.jpg', 'images/damtre2.jpg', 'images/damtre3.jpg', 350000, 400000, 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam', 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam', '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao', 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam'),
(79, 1, 'Quần-short-Jean-nu-WJ2016-0381s', 'images/quansortnu1.jpg', 'images/quansortnu2.jpg', 'images/quansortnu3.jpg', 250000, 400000, 'Đặc điểm nổi bật:      \r\n\r\n    Sản xuất tại Việt Nam', 'Đặc điểm nổi bật:      \r\n\r\n    Sản xuất tại Việt Nam', 'LƯU Ý :\r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao', 'Đặc điểm nổi bật:      \r\n\r\n    Sản xuất tại Việt Nam\r\nSize số	\r\n\r\n26, 27, 28, 29, 30, 31'),
(80, 1, 'Áo Sơ Mi kiểu nữ tay dài-HK17-UB119', 'images/aosominutaydai.jpg', 'images/aosominutaydai2.jpg', 'images/aosominutaydai3.jpg', 250000, 300000, '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao', 'The Blu', 'The Blu', '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao'),
(83, 1, 'Áo Sơ Mi kiểu nữ tay dài-HK17-UB119', 'images/aosominutaydai.jpg', 'images/aosominutaydai2.jpg', 'images/aosominutaydai3.jpg', 400000, 650000, '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao', 'The Blu', 'The Blu', '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao'),
(84, 6, 'Đầm trễ vai nữ tay lững- HK17-UB171', 'images/damtre1.jpg', 'images/damtre2.jpg', 'images/damtre3.jpg', 100000, 400000, 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam', 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam', '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao', 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam'),
(85, 1, 'Áo Sơ Mi kiểu nữ tay dài-HK17-UB119', 'images/aosominutaydai.jpg', 'images/aosominutaydai2.jpg', 'images/aosominutaydai3.jpg', 400000, 1000000, '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao', 'The Blu', 'The Blu', '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao'),
(86, 9, 'Áo Thun Nam In Hình Naruto ', 'images/aothun1.jpg', 'images/aothun2.jpg', 'images/', 69000, 349000, '\r\n\r\nChất liệu vải thun thoáng mát, thấm hút mồ hôi\r\n\r\nThiết kế áo cổ tròn phối tay ngắn đơn giản\r\n\r\nHọa tiết nhân vật Naruto nổi bật tạo điểm nhấn trẻ trung, năng động\r\n\r\nForm áo vừa vặn tôn đường nét mạnh mẽ, tạo sự thoải mái\r\n\r\nDễ dàng kết hợp với nhiều loại trang phục khác nhau\r\n', '', '', '\r\nDỊCH VỤ & KHUYẾN MÃI LIÊN QUAN\r\n\r\n    Nhập mã HITET giảm ngay 200k cho Đơn hàng Thời trang từ 1 triệu đồng. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n\r\n    Nhập mã SAMTET50, giảm 50k cho ĐH Thời Trang từ 499k. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n    Sản phẩm có thể được giao trong vòng 2 tiếng đến các quận/huyện nội thành tại TP Hồ Chí Minh và Hà Nội khi đặt hàng cùng với các sản phẩm hỗ trợ Giao Hàng 2 Tiếng khác (bao gồm dịch vụ BookCare). Chi tiết\r\n\r\n'),
(87, 9, 'Áo Phông Nam Hàn Quốc Orange Factory ', 'images/atn1.jpg', 'images/atn2.jpg', 'images/atn3.jpg', 63000, 699000, '', '\r\n\r\nChất liệu vải thoáng mát, thấm hút mồ hôi\r\n\r\nVải thấm hút tốt tạo cảm giác thoải mái khi mặc\r\n\r\nĐường may chắc chắn, tỉ mỉ\r\n\r\nCó thể mặc đi học, dạo phố hoặc đi du lịch\r\n', '\r\nDỊCH VỤ & KHUYẾN MÃI LIÊN QUAN\r\n\r\n    Hoàn tiền cho thành viên TikiNOW (tối đa 100k/tháng), 1% (630 ₫) - Xem chi tiết\r\n\r\n    Nhập mã HITET giảm ngay 200k cho Đơn hàng Thời trang từ 1 triệu đồng. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n\r\n    Nhập mã SAMTET50, giảm 50k cho ĐH Thời Trang từ 499k. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n    Sản phẩm có thể được giao trong vòng 2 tiếng đến các quận/huyện nội thành tại TP Hồ Chí Minh và Hà Nội khi đặt hàng cùng với các sản phẩm hỗ trợ Giao Hàng 2 Tiếng khác (bao gồm dịch vụ BookCare). Chi tiết\r\n\r\n', ''),
(88, 9, 'Áo Thun Nam Thoát Nhiệt Nhật Bản Gold Rhino ', 'images/a1.jpg', 'images/a2.jpg', 'images/a3.jpg', 139000, 159000, '\r\n\r\nChất liệu cotton mềm mại\r\n\r\nThoát nhiệt Nhật Bản thoáng mát\r\n\r\nCổ tròn và tay ngắn năng động\r\n\r\nKiểu dáng khỏe khoắn, mạnh mẽ\r\n\r\nThiết kế cơ bản dễ phối đồ\r\n', '\r\n\r\nChất liệu cotton mềm mại\r\n\r\nThoát nhiệt Nhật Bản thoáng mát\r\n\r\nCổ tròn và tay ngắn năng động\r\n\r\nKiểu dáng khỏe khoắn, mạnh mẽ\r\n\r\nThiết kế cơ bản dễ phối đồ\r\n', '\r\nDỊCH VỤ & KHUYẾN MÃI LIÊN QUAN\r\n\r\n    Nhập mã HITET giảm ngay 200k cho Đơn hàng Thời trang từ 1 triệu đồng. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n\r\n    Nhập mã SAMTET50, giảm 50k cho ĐH Thời Trang từ 499k. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n\r\n', '\r\nDỊCH VỤ & KHUYẾN MÃI LIÊN QUAN\r\n\r\n    Nhập mã HITET giảm ngay 200k cho Đơn hàng Thời trang từ 1 triệu đồng. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n\r\n    Nhập mã SAMTET50, giảm 50k cho ĐH Thời Trang từ 499k. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n\r\n'),
(89, 9, 'Áo Thun Nam Thoát Nhiệt Nhật Bản Gold Rhino ', 'images/a1.jpg', 'images/a2.jpg', 'images/a3.jpg', 139000, 200000, '\r\n\r\nChất liệu cotton mềm mại\r\n\r\nThoát nhiệt Nhật Bản thoáng mát\r\n\r\nCổ tròn và tay ngắn năng động\r\n\r\nKiểu dáng khỏe khoắn, mạnh mẽ\r\n\r\nThiết kế cơ bản dễ phối đồ\r\n', '\r\n\r\nChất liệu cotton mềm mại\r\n\r\nThoát nhiệt Nhật Bản thoáng mát\r\n\r\nCổ tròn và tay ngắn năng động\r\n\r\nKiểu dáng khỏe khoắn, mạnh mẽ\r\n\r\nThiết kế cơ bản dễ phối đồ\r\n', '\r\nDỊCH VỤ & KHUYẾN MÃI LIÊN QUAN\r\n\r\n    Nhập mã HITET giảm ngay 200k cho Đơn hàng Thời trang từ 1 triệu đồng. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n\r\n    Nhập mã SAMTET50, giảm 50k cho ĐH Thời Trang từ 499k. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n\r\n', '\r\nDỊCH VỤ & KHUYẾN MÃI LIÊN QUAN\r\n\r\n    Nhập mã HITET giảm ngay 200k cho Đơn hàng Thời trang từ 1 triệu đồng. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n\r\n    Nhập mã SAMTET50, giảm 50k cho ĐH Thời Trang từ 499k. SL MGG có hạn. Không áp dụng cho các SP được giao từ nước ngoài. Chi tiết\r\n\r\n'),
(90, 9, 'Áo Thun Nam T2D-TS17242', 'images/aothunnam.jpg', 'images/aothunnam.jpg', 'images/', 3000000, 6000000, '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao', 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam', '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao', 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam'),
(91, 1, 'Áo Sơ Mi Nữ Pro', 'images/pc6.jpg', 'images/', 'images/', 300000, 400000, 'sdf', 'sdf', 'sdf', 'sadfdsf'),
(92, 7, 'Áo Khoác Jean Nam MJK2016-02', 'images/950_1514047416_mjk2016_2_11.jpg', 'images/', 'images/', 250000, 1000000, '', 'Không sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao\r\n\r\nSản phẩm này đã hết hàng hoặc không có sẵn.', '', ''),
(93, 7, 'Áo Khoác Jean Nam MJK2016-02', 'images/950_1514047416_mjk2016_2_11.jpg', 'images/', 'images/', 85000, 100000, '', 'Không sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao\r\n\r\nSản phẩm này đã hết hàng hoặc không có sẵn.', '', ''),
(94, 7, 'Áo Khoác Phao VN-K-J2L/16-005', 'images/aokhoatphao01.jpg', 'images/aokhoatphao02.jpg', 'images/aokhoatphao03.jpg', 200000, 500000, 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam', 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam', '*LƯU Ý :    \r\n\r\nKhông sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao', 'Đặc điểm nổi bật:            \r\n\r\n    Sản xuất tại Việt Nam'),
(95, 7, 'Áo Khoát Jean 2018', 'images/950_1514047416_mjk2016_2_11.jpg', 'images/', 'images/', 250000, 10000000, '', 'Không sử dụng chất tẩy có độ tẩy cao\r\nKhông giặt cùng quần áo khác màu bằng các loại bột giặt có độ tẩy cao\r\nKhông ủi ở nhiệt độ cao\r\nKhông sấy ở nhiệt độ quá cao\r\n\r\nSản phẩm này đã hết hàng hoặc không có sẵn.', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id_kh` int(11) NOT NULL,
  `product_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id_kh`, `product_id`) VALUES
(4, 40),
(5, 34),
(7, 58);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`bill_detail_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` bigint(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344166304;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `bill_detail_id` bigint(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
