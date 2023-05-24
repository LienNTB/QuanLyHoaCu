#%%
from random import *
import string
soLuongNguoiDung=20
usernameList=["ngocphat","aido", "quynhhuong","bichlien"]
hotenlist=["Nguyễn Ngọc","Nguyễn Thị", "Nguyễn Văn"]
DiaChiList = ['Thủ Đức', "Quận 9", "Quận 2", "Quận 1", "Bình Chánh"]
mainString=""
for i in range(0,soLuongNguoiDung):
    addSanPhamString="INSERT INTO [dbo].[NguoiDung] (MaNguoiDung, TenDangNhap,MatKhau,HoTen,NgaySinh,DiChi,RoleID) VALUES "
    addSanPhamString=addSanPhamString+f"('USER0{i+1}','{choice(usernameList)}{i+1}','123',N'{choice(hotenlist)} {choice(string.ascii_lowercase)}','2002-07-12',N'{choice(DiaChiList)}','001') GO\n"
    mainString+=addSanPhamString

print(mainString)