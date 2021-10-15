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

update TB_Phong
set SL_DANG_O=  dbo.count_sl(N'P001')

update TB_Phong
set SL_NGUOI_MAX=8

