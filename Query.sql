use QLI_KTX

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
update TB_Phong set SL_DANG_O=Temp.SL from (select MA_PHONG, count(Ma_Phong)as SL from TB_HOPDONG group by MA_PHONG )as Temp where TB_Phong.MA_PHONG=Temp.Ma_Phong
update TB_Phong
set SL_DANG_O=  dbo.count_sl(N'P001')

update TB_Phong
set SL_NGUOI_MAX=8

alter table tb_nhanvien
add hinhanh nvarchar(20) null

alter table tb_sinhvien
add hinhanh nvarchar(20) null


-- trigger Xóa hợp đồng cập nhật lại số sinh viên trong phòng
create trigger DeleteHD_UpdatePhong on TB_HOPDONG
for delete
as
begin
	declare @MaPhong nvarchar(20)
	select @MaPhong=Ma_Phong from deleted
	update TB_Phong set SL_DANG_O=SL_DANG_O-1 where MA_PHONG=@MaPhong
end
select * from TB_Phong
