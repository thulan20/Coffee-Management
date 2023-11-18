CREATE DATABASE QLBANHANG
GO
USE QLBANHANG
GO
CREATE TABLE NHANVIEN
(
	MANV CHAR(10) NOT NULL,
	TENNV NVARCHAR(50) NOT NULL,
	DIACHINV NVARCHAR(100),
	SDTNV CHAR(10),
	PRIMARY KEY(MANV)
)
GO
CREATE TABLE MON
(
	MAMON CHAR(10) NOT NULL,
	TENMON NVARCHAR(50) NOT NULL,
	GIA NUMERIC(15,0)NOT NULL,
	PRIMARY KEY(MAMON)
)
GO
CREATE TABLE KHACHHANG
(
	MAKH CHAR(10) NOT NULL,
	VITRI CHAR(2) NOT NULL,
	PRIMARY KEY(MAKH)
)
GO
CREATE TABLE HANG
(
	MAHANG CHAR(10) NOT NULL,
	TENHANG NVARCHAR(50) NOT NULL,
	GIA NUMERIC(15,0) NOT NULL,
	DVT NVARCHAR(10),
	PRIMARY KEY (MAHANG)
)
GO
CREATE TABLE NHACUNGCAP
(
	MANCC CHAR(10) NOT NULL,
	TENNB NVARCHAR(50) NOT NULL,
	DIACHINCC NVARCHAR(100),
	SDTNCC CHAR(12),
	PRIMARY KEY (MANCC)
)
GO
CREATE TABLE TAIKHOAN
(
	MATK char(10) primary key,
	MANV char(10) NOT NULL,
	TENDANGNHAP varchar(50) not null,
	MATKHAU varchar(50) not null ,
	FOREIGN KEY (MANV) REFERENCES NHANVIEN
)

CREATE TABLE THANHTOAN
(
	MABL CHAR(10),
	GIOVAO DATETIME,
	TONGTIEN NUMERIC(15,0),
	MAKH CHAR(10),
	MANV CHAR(10),
	PRIMARY KEY (MABL),
	FOREIGN KEY (MANV) REFERENCES NHANVIEN,
	FOREIGN KEY (MAKH) REFERENCES KHACHHANG
)
GO
CREATE TABLE THANHTOANCHITIET
(
	MABL CHAR(10),
	MAMON CHAR(10),
	THANHTIEN NUMERIC(15,0),
	SOLUONG INT,
	PRIMARY KEY (MABL, MAMON),
	FOREIGN KEY (MAMON) REFERENCES MON,
	FOREIGN KEY (MABL) REFERENCES THANHTOAN
)
GO
CREATE TABLE NHAP
(
	MADNH CHAR(10),
	TT int,
	NGAYNH DATE,
	TONGTIEN NUMERIC(15,0),
	MANCC CHAR(10),
	MANV CHAR(10),
	PRIMARY KEY (MADNH),
	FOREIGN KEY (MANV) REFERENCES NHANVIEN,
	FOREIGN KEY (MANCC) REFERENCES NHACUNGCAP
)
GO
CREATE TABLE NHAPCHITIET
(
	MADNH CHAR(10),
	MAHANG CHAR(10),
	THANHTIEN NUMERIC(15,0),
	SOLUONG INT,
	PRIMARY KEY (MADNH, MAHANG),
	FOREIGN KEY (MAHANG) REFERENCES HANG,
	FOREIGN KEY (MADNH) REFERENCES NHAP
)
GO

--Nhập dữ liệu HANG
GO
insert into HANG values ('001',N'Cà phê hạt CULI' ,'65000','KG')
insert into HANG values ('002',N'Cà phê hạt NATURAL','100000','KG')
insert into HANG values ('003',N'Cà phê hạt HONEY','150000','KG')
insert into HANG values ('004',N'Cà phê pha máy MN GOLD 1','75000','KG')
insert into HANG values ('005',N'Cà phê pha máy MN GOLD 2','80000','KG')
insert into HANG values ('006',N'Cà phê pha máy MN DIAMOND 1','105000','KG')
insert into HANG values ('007',N'Cà phê pha máy MN DIAMOND 2','110000','KG')
insert into HANG values ('008',N'Cà phê pha máy MN DIAMOND 3','120000','KG')
insert into HANG values ('009',N'Cà phê Phin MN PREMIUM P1','120000','KG')
insert into HANG values ('010',N'Cà phê Phin MN PREMIUM P2','130000','KG')
insert into HANG values ('011',N'Cà phê Phin MN PREMIUM P3','140000','KG')
insert into HANG values ('012',N'Máy xay cà phê','10000000','Cái')
insert into HANG values ('013',N'Máy pha cà phê','7000000','Cái')

--Nhập dữ liệu NCC
GO
insert into NHACUNGCAP values ('001', N'Mộc Nguyên', N'30 Vu Lăng, Hòa Phát, Cẩm Lệ, Đà Nẵng', '0942012377')
insert into NHACUNGCAP values ('002', N'Linh Đan', N'38 Trần Cao vân, Thanh Khê, Đà Nẵng', '0375505367')

--Nhập dữ liệu bảng NHÂN VIÊN
insert into NHANVIEN values ('0001', N'Phan Văn Tài', N'67 Lê Văn Hưu, Ngũ Hành Sơn,Đà Nẵng', '0905789357')
insert into NHANVIEN values ('0002', N'Nguyễn Minh Huy', N'120 Châu Thị Vĩnh Tế, Ngũ Hành Sơn,Đà Nẵng', '0983256789')
insert into NHANVIEN values ('0003', N'Hồ Hà Trâm', N'52 Bà Huyện Thanh Quan, Ngũ Hành Sơn, Đà Nẵng', '0904666777')
insert into NHANVIEN values ('0004', N'Trần Văn Thế', N'90 Doãn Uẩn, Ngũ Hành Sơn, Đà Nẵng', '0859256477')
insert into NHANVIEN values ('0005', N'Trần Tiến Đạt', N'100 Trưng Nữ Vương, Hải Châu, Đà Nẵng', '0907888111')
insert into NHANVIEN values ('0006', N'Nguyễn Minh An', N'30 Nại Nam, Hải Châu, Đà Nẵng', '0905167455')
insert into NHANVIEN values ('0007', N'Nguyễn Xuân Minh', N'25 An Trung 3, Sơn Trà, Đà Nẵng', '0378569126')
insert into NHANVIEN values ('0008', N'Lê Minh Quân', N'20 An Hải Đông 1, Sơn Trà, Đà Nẵng', '0905257689')
insert into NHANVIEN values ('0009', N'Hoàng Mai Liễu', N'8 Lê Đình Lý,  Thanh Khê, Đà Nẵng', '0905257689')
insert into NHANVIEN values ('0010', N'Nguyễn Qúy Trung Hiếu', N'40 Hùng Vương, Hải Châu, Đà Nẵng', '0932555478')
insert into NHANVIEN values ('0011', N'Trần Ngọc Thảo', N'436 Ngô Quyền, Sơn Trà, Đà Nẵng','0934658120') 

--Nhập dữ liệu bảng MÓN
insert into MON values('001',N'Cà phê đen',13000)
insert into MON values('002',N'Cappuccino/latte',50000)
insert into MON values('003',N'Bạc xỉu đá)',20000)
insert into MON values('004',N'Cacao nóng',22000)
insert into MON values('005',N'Phin sữa đá',25000)
insert into MON values('006',N'Cà phê trứng muối',25000)
insert into MON values('007',N'Cà phê dứa',35000)
insert into MON values('008',N'Sữa chua đập',18000)
insert into MON values('009',N'Sữa chua hộp',20000)
insert into MON values('010',N'Sữa chua đá',25000)
insert into MON values('011',N'Sữa chua mix vị ',25000)
insert into MON values('012',N'Trà chanh',20000)
insert into MON values('013',N'Trà đào cam sả (Nóng/Đá)',30000)
insert into MON values('014',N'Trà gừng',20000)
insert into MON values('015',N'Trà dâu ổi hồng',30000)
insert into MON values('016',N'Trà việt quất thanh long',30000)
insert into MON values('017',N'Trà chanh dây cam bưởi',30000)
insert into MON values('018',N'Trà sữa thái xanh',30000)
insert into MON values('019',N'Nước chanh (Nóng/Đá)',20000)
insert into MON values('020',N'Chanh dây đá viên',22000)
insert into MON values('021',N'Chanh nha đam hạt chia (Nóng/Đá)',25000)
insert into MON values('022',N'Ổi',25000)
insert into MON values('023',N'Cà rốt',25000)
insert into MON values('024',N'Thơm',25000)
insert into MON values('025',N'Cam',25000)
insert into MON values('026',N'Chanh dây',25000)
insert into MON values('027',N'Nước suối',12000)
insert into MON values('028',N'Khoáng lạt',15000)
insert into MON values('029',N'Sting',18000)
insert into MON values('030',N'Revive',18000)
insert into MON values('031',N'Coca',18000)
insert into MON values('032',N'Trà hoa đậu biếc',35000)
insert into MON values('033',N'Trà hoa hồng',27000)
insert into MON values('034',N'Trà sữa truyền thống',25000)
insert into MON values('035',N'Trà sen vàng',30000)
insert into MON values('036',N'Trà sữa thái xanh truyền thống',25000)
insert into MON values('037',N'Trà thanh đào',30000)
insert into MON values('038',N'Trà sen vàng',30000)
insert into MON values('039',N'Trà sữa khoai môn truyền thống',30000)
insert into MON values('040',N'Trà xanh đậu đỏ',35000)
insert into MON values('041',N'Trà thạch vải',35000)
insert into MON values('042',N'Trà sữa kem trứng dừa nướng',35000)
insert into MON values('043',N'Sữa tươi trân châu đường đen',25000)
insert into MON values('044',N'Sữa tươi kem trứng trân châu đường đen',30000)
insert into MON values('045',N'Sữa tươi trân châu đường đen matcha',30000)
insert into MON values('046',N'Sinh tố xoài',35000)
insert into MON values('047',N'Sinh tố trái cây theo mùa',35000)
insert into MON values('048',N'Sinh tố mãng cầu',35000)
insert into MON values('049',N'Sinh bơ cà phê',30000)
insert into MON values('050',N'Sinh tố cà rốt',30000)
insert into MON values('051',N'Sinh tố dâu chuối',30000)
insert into MON values('052',N'Thạch nhà làm',10000)
insert into MON values('053',N'Banh flan',6000)
insert into MON values('054',N'Pudding',5000)
insert into MON values('055',N'Khúc bạch',5000)
insert into MON values('056',N'Nha đam',5000)
insert into MON values('057',N'Trân châu trắng',5000)
insert into MON values('058',N'Kem trứng',10000)
insert into MON values('059',N'Bông lan trứng muối sốt phô mai',35000)
insert into MON values('060',N'Bông lan kem trứng dừa nướng',30000)
insert into MON values('061',N'Bông lan trứng muối lớn',50000)
insert into MON values('062',N'Bông lan chà bông',15000)  

--Nhập dữ liệu bảng KHÁCH HÀNG
insert into KHACHHANG values ('KH001','01') 
insert into KHACHHANG values ('KH002','02')
insert into KHACHHANG values ('KH003','03') 
insert into KHACHHANG values ('KH004','04')
insert into KHACHHANG values ('KH005','05')
insert into KHACHHANG values ('KH006','06')
insert into KHACHHANG values ('KH007','07') 
insert into KHACHHANG values ('KH008','08') 
insert into KHACHHANG values ('KH009','09')
insert into KHACHHANG values ('KH010','10')
insert into KHACHHANG values ('KH011','11')
insert into KHACHHANG values ('KH012','12') 
insert into KHACHHANG values ('KH013','13')
insert into KHACHHANG values ('KH014','14')
insert into KHACHHANG values ('KH015','15')
insert into KHACHHANG values ('KH016','16')
insert into KHACHHANG values ('KH017','17')
insert into KHACHHANG values ('KH018','18') 
insert into KHACHHANG values ('KH019','19') 
insert into KHACHHANG values ('KH020','20')

--NHẬP TÀI KHOẢN
insert into  TAIKHOAN values('NhanvienA','0001','phanvantai','0905789357')
insert into  TAIKHOAN values('NhanvienB','0002','nguyenminhhuy','0983256789')
insert into  TAIKHOAN values('NhanvienC','0003','hohatram','0904666777')
insert into  TAIKHOAN values('NhanvienD','0004','tranvanthe','0859256477')
insert into  TAIKHOAN values('NhanvienE','0005','trantiendat','0907888111')
insert into  TAIKHOAN values('Quanly1','0006','nguyenminhan','0905167455')
insert into  TAIKHOAN values('Quanly2','0008','leminhquan','0905257689')
insert into  TAIKHOAN values('Quanly3','0010','nguyenquytrunghieu','0932555478')
insert into  TAIKHOAN values('Quanly4','0007','nguyenxuanminh','0378569126')
insert into  TAIKHOAN values('Quanly5','0009','hoangmailieu','0905257689')
insert into  TAIKHOAN values('NhanvienF','0011','tranngocthao','0934658120')

--Nhập dữ liệu THANH TOÁN
insert into THANHTOAN values('BL001','2023-08-15',NULL,'KH001','0001')
insert into THANHTOAN values('BL002','2023-04-05',NULL,'KH002','0002')
insert into THANHTOAN values('BL003','2023-06-11',NULL,'KH003','0003')
insert into THANHTOAN values('BL004','2023-11-10',NULL,'KH004','0004')
insert into THANHTOAN values('BL005','2023-05-25',NULL,'KH005','0005')
insert into THANHTOAN values('BL006','2023-07-09',NULL,'KH006','0006')                 

--Nhập dữ liệu THANH TOÁN CHI TIẾT
insert into  THANHTOANCHITIET values('BL002','001',null,1)
insert into  THANHTOANCHITIET values('BL003','001',null,2)
insert into  THANHTOANCHITIET values('BL004','001',null,1)
insert into  THANHTOANCHITIET values('BL005','001',null,1)
insert into  THANHTOANCHITIET values('BL001','001',null,3)
insert into  THANHTOANCHITIET values('BL006','001',null,1)
insert into  THANHTOANCHITIET values('BL007','002',null,4)
insert into  THANHTOANCHITIET values('BL008','002',null,1)
insert into  THANHTOANCHITIET values('BL009','002',null,1)
insert into  THANHTOANCHITIET values('BL010','003',null,1)
insert into  THANHTOANCHITIET values('BL011','003',null,6)
insert into  THANHTOANCHITIET values('BL012','004',null,2)
insert into  THANHTOANCHITIET values('BL013','004',null,1)
insert into  THANHTOANCHITIET values('BL014','004',null,2)
insert into  THANHTOANCHITIET values('BL015','005',null,2)
insert into  THANHTOANCHITIET values('BL016','005',null,2)
insert into  THANHTOANCHITIET values('BL017','005',null,2)
insert into  THANHTOANCHITIET values('BL018','005',null,2)
insert into  THANHTOANCHITIET values('BL019','005',null,2)

--Nhập dữ liệu NHAP
insert into NHAP values ('N001','001','2023-05-25','65000','001','0001')
insert into NHAP values ('N002','002','2023-07-26','100000','001','0002')
insert into NHAP values ('N003','003','2023-09-05','150000','001','0003')
insert into NHAP values ('N004','004','2023-11-09','75000','001','0004')
insert into NHAP values ('N005','005','2023-03-30','80000','001','0005')
insert into NHAP values ('N006','006','2023-05-15','105000','001','0006')
insert into NHAP values ('N007','007','2023-07-20','110000','001','0007')
insert into NHAP values ('N008','008','2023-09-05','120000','001','0008')
insert into NHAP values ('N009','009','2023-10-08','120000','001','0009')
insert into NHAP values ('N010','010','2023-10-28','130000','001','0010')

--Nhập dữ liệu NHAPCHITIET
insert into NHAPCHITIET values ('N001','001',null,1)
insert into NHAPCHITIET values ('N001','003',null,2)
insert into NHAPCHITIET values ('N001','002',null,2)
insert into NHAPCHITIET values ('N001','006',null,1)
insert into NHAPCHITIET values ('N001','009',null,2)
insert into NHAPCHITIET values ('N002','010',null,1)
insert into NHAPCHITIET values ('N002','011',null,2)
insert into NHAPCHITIET values ('N002','012',null,2)
insert into NHAPCHITIET values ('N002','013',null,1)
insert into NHAPCHITIET values ('N003','004',null,2)
insert into NHAPCHITIET values ('N003','005',null,1)
insert into NHAPCHITIET values ('N003','007',null,4)
insert into NHAPCHITIET values ('N003','009',null,5)
insert into NHAPCHITIET values ('N004','010',null,3)
insert into NHAPCHITIET values ('N004','011',null,3)
insert into NHAPCHITIET values ('N004','012',null,2)
insert into NHAPCHITIET values ('N004','013',null,4)
insert into NHAPCHITIET values ('N004','012',null,2)
insert into NHAPCHITIET values ('N005','001',null,2)
insert into NHAPCHITIET values ('N005','002',null,3)
insert into NHAPCHITIET values ('N005','003',null,1)
insert into NHAPCHITIET values ('N005','007',null,3)
insert into NHAPCHITIET values ('N005','008',null,3)
insert into NHAPCHITIET values ('N006','002',null,2)
insert into NHAPCHITIET values ('N006','003',null,3)
insert into NHAPCHITIET values ('N006','009',null,4)
insert into NHAPCHITIET values ('N007','012',null,6)
insert into NHAPCHITIET values ('N007','013',null,6)
insert into NHAPCHITIET values ('N008','002',null,2)
insert into NHAPCHITIET values ('N008','004',null,2)
insert into NHAPCHITIET values ('N008','006',null,2)
insert into NHAPCHITIET values ('N008','007',null,6)
insert into NHAPCHITIET values ('N009','011',null,6)
insert into NHAPCHITIET values ('N010','010',null,4)
insert into NHAPCHITIET values ('N010','012',null,5)
