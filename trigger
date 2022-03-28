Bảng chất liệu:
CREATE TRIGGER `insert_ChatLieu` BEFORE INSERT ON `chat_lieu`
 FOR EACH ROW BEGIN
	IF (new.Ma_ChatLieu IN (SELECT Ma_ChatLieu FROM Chat_Lieu)) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'maCL does not exist';
    END IF;
END
-----------------------------------
Bảng chi tiết hóa đơn nhập:
CREATE TRIGGER `insert_CTHDN` BEFORE INSERT ON `chitiethoadonnhap`
 FOR EACH ROW BEGIN
	IF (new.Ma_HDN IN (SELECT Ma_HDN FROM HoaDonNhap)) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'maCV does not exist';
    END IF;
END
------------------------------------------
Bảng Chi tiết hóa đơn xuất:
CREATE TRIGGER `insert_CTHoaDonXuat` BEFORE INSERT ON `chitiethoadonxuat`
 FOR EACH ROW BEGIN
	IF (new.Ma_HDX IN (SELECT Ma_HDX FROM HoaDonXuat)) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'maCV does not exist';
    END IF;
END
------------------------------------------
Bảng Hóa đơn nhập
CREATE TRIGGER `before_insert_HoaDonNhap` BEFORE INSERT ON `hoadonnhap`
 FOR EACH ROW BEGIN
	IF (new.Ma_SP NOT IN (SELECT Ma_SP FROM HoaDonNhap)) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Ma_SP does not exist';
    END IF;
END

---------------------------------------
Bảng Hóa Đơn xuất
Câu a:
CREATE TRIGGER `Update_KhachHang` BEFORE UPDATE ON `hoadonxuat`
 FOR EACH ROW BEGIN
	UPDATE Khach_Hang
    SET Ma_HDX = new.Ma_HDX
    WHERE Ma_HDX = old.Ma_HDX;
END
Câu b:
CREATE TRIGGER `delete_KhachHang` BEFORE DELETE ON `hoadonxuat`
 FOR EACH ROW BEGIN
	IF (old.Ma_KH IN (SELECT Ma_KH FROM Khach_Hang)) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Ma_KH does not exist';
    END IF;
END

---------------------------------------
Bảng Khách hàng
CREATE TRIGGER `insert_KH` BEFORE INSERT ON `khach_hang`
 FOR EACH ROW BEGIN
	IF (new.Ma_KH IN (SELECT Ma_KH FROM Khach_Hang)) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Ma_KH does not exist';
    END IF;
END

---------------------------------------
Bảng Nhà cung cấp
CREATE TRIGGER `insert_NCC` BEFORE INSERT ON `nhacungcap`
 FOR EACH ROW BEGIN
	IF (new.Ma_NCC IN (SELECT Ma_NCC FROM NhaCungCap)) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'maCV does not exist';
    END IF;
END

---------------------------------------
Bảng Nhân viên
CREATE TRIGGER `After_update_nhanvien` BEFORE UPDATE ON `nhan_vien`
 FOR EACH ROW BEGIN
	UPDATE HoaDonNhap
    SET Ma_NV = new.Ma_NV
    WHERE Ma_NV = old.Ma_NV;
END

---------------------------------------
Bảng Sản phẩm
CREATE TRIGGER `after_delete_Product` BEFORE DELETE ON `san_pham`
 FOR EACH ROW BEGIN
	DELETE FROM HoaDonNhap
    WHERE Ma_SP = old.Ma_SP;
END
