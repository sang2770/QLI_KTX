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