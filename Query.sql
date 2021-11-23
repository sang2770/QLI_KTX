use QLI_KTX
--Hung
create function count_sl(@maphong nvarchar(20))
returns int
as
begin
	declare @sl int
	select @sl=count(MaHopDong)
	from TB_HOPDONG
	where @maphong=Ma_Phong
return @sl
end
-- cap nhat so luong dang o
go
declare cc cursor for select TB_Phong.MA_PHONG from tb_phong
open cc
declare @ma nvarchar(20)
fetch next from cc into @ma
while(@@FETCH_STATUS=0)
begin
	declare @sl int
	set @sl=dbo.count_sl(@ma)
	update TB_Phong set SL_DANG_O=@sl where tb_phong.ma_phong=@ma
	fetch next from cc into @ma
end
close cc
deallocate cc


go


update TB_Phong
set SL_NGUOI_MAX=8

alter table tb_nhanvien
add hinhanh nvarchar(20) null

alter table tb_sinhvien
add hinhanh nvarchar(20) null

Alter table tb_thiet_bi 
add hinhanh nvarchar(20) 


go
update TB_THIET_BI 
set tb_thiet_bi.hinhanh=N'giuong.jpg'
where TEN_TB=N'GIƯỜNG'

update TB_THIET_BI 
set tb_thiet_bi.hinhanh=N'den.jpg'
where TEN_TB=N'ĐÈN'

update TB_THIET_BI 
set tb_thiet_bi.hinhanh=N'quat.jpg'
where TEN_TB=N'QUẠT'

update TB_THIET_BI 
set tb_thiet_bi.hinhanh=N'dieuhoa.jpg'
where TEN_TB=N'ĐIỀU HÒA'

update TB_THIET_BI 
set tb_thiet_bi.hinhanh=N'nonglanh.jpg'
where TEN_TB=N'NÓNG LẠNH'
--trigger cap nhat lai sau khi them or sua traphong
 create trigger them_traphong on tb_tra_phong
 for insert,update,delete
 as
 begin
	declare @count1 int , @count2 int,@masv nvarchar(20)
	set @count1=0
	set @count2=0
	select @count1=count(*) from inserted
	select @count2=count(*) from deleted
	if(@count1>0)
	begin
		
		select @masv =masv from inserted	
		delete from TB_HOPDONG where MaSV=@masv
		set @count2=0
	end
	if(@count2>0)
	begin
		
		select @masv =masv from deleted
		delete from tb_sinhvien where masv=@masv
	end
 end


 go
 --tao cot trang thai
 Alter table tb_chiphi
add trangthai nvarchar(20) 

go
update TB_CHIPHI
set trangthai=N'Đã Thanh Toán'


--Sang

update TB_NHANVIEN set hinhanh=N'Layer 1.jpg'
update TB_SINHVIEN set hinhanh=N'Layer 1.jpg'

alter function TK_SVDKI(@Nam int)
returns table
as
return 
select 
sum(case when month(NgayLap) = 1 then 1 else 0 end) as Thang1,
sum(case when month(NgayLap) = 2 then 1 else 0 end) as Thang2,
sum(case when month(NgayLap) = 3 then 1 else 0 end) as Thang3,
sum(case when month(NgayLap) = 4 then 1 else 0 end) as Thang4,
sum(case when month(NgayLap) = 5 then 1 else 0 end) as Thang5,
sum(case when month(NgayLap) = 6 then 1 else 0 end) as Thang6,
sum(case when month(NgayLap) = 7 then 1 else 0 end) as Thang7,
sum(case when month(NgayLap) = 8 then 1 else 0 end) as Thang8,
sum(case when month(NgayLap) = 9 then 1 else 0 end) as Thang9,
sum(case when month(NgayLap) = 10 then 1 else 0 end) as Thang10,
sum(case when month(NgayLap) = 11 then 1 else 0 end) as Thang11,
sum(case when month(NgayLap) =  12 then 1 else 0 end) as Thang12,
from TB_HOPDONG where YEAR(NgayLap)=@Nam;

select * from TK_SVDKI(2021)

-- Trigger thêm hợp đồng thì cập nhật lại số người trong phòng

select * from TB_HOPDONG

alter trigger UpdateSL_Phong on TB_HOPDONG
for insert, delete, update
as
begin
	declare @MaPhong nvarchar(50), @SL1 int =0 , @SL2 int =0
	if(exists (select * from inserted))
	begin 
		select @MaPhong= Ma_Phong from inserted
		set @SL1=1;
	end
	if(exists (select * from deleted))
	begin
		select @MaPhong =Ma_Phong from deleted
		set @SL2=1;
	end
	update TB_Phong set SL_DANG_O=SL_DANG_O+@SL1-@SL2 where MA_PHONG=@MaPhong

end

select * from TB_Phong

select * from TB_SINHVIEN
select SL_DANG_O, SL_NGUOI_MAX from TB_Phong where MA_PHONG='P001'

 
 GO
ALTER TABLE TB_NHANVIEN
ADD Trangthai NVARCHAR(20) NULL
GO
UPDATE TB_NHANVIEN SET Trangthai = N'Đang làm'

