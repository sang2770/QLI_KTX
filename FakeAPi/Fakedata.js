let TenSV = [
  "Hoàng Vũ Thanh Thủy",
  "Chu Xuân Linh",
  "Ngô Doãn Tình",
  "Phạm Tuấn Tú",
  "Dương Xuân Tùng",
  "Mai Hoàng Nam",
  "Trần Văn Cương",
  "Nguyễn Thành Đô",
  "Nguyễn Văn Đồng",
  "Lê Hoàng Sơn",
  "Nguyễn Thanh Tùng",
];
let QueQuan = [
  "Quảng Ninh",
  " Quảng Bình",
  "Quảng Nam",
  "Hà Nam",
  " Hà Nội",
  " Quảng Bình",
  " Thái Nguyên",
  "Bắc Giang",
  "Hải Dương",
  "Nam Định",
  "Hải Phòng",
];
let SDT = ["0366878852", "0978021816", "0978054817", "01666878854"];
let NgaySinh = [
  "2001/10/20",
  "2001/10/10",
  "2001/01/20",
  "2002/12/20",
  "2002/11/20",
];
let GioiTinh = ["Nam", "Nữ"];
let MaLop = [
  "L000001",
  "L000002",
  "L000003",
  "L000004",
  "L000005",
  "L000006",
  "L000007",
  "L000008",
  "L000009",
  "L000010",
  "L000011",
  "L000012",
  "L000013",
  "L000014",
  "L000015",
  "L000016",
  "L000017",
  "L000018",
  "L000019",
  "L000020",
  "L000021",
];
let MaKhoa = ["K000001", "K000002", "K000003"];
function InsertSV() {
  let MaSV = "SV0";
  let MaHD = "HD0";
  let sizeTen = TenSV.length;
  let sizeQue = QueQuan.length;
  let sizeSDT = SDT.length;
  let sizeNS = NgaySinh.length;
  let sizeKhoa = MaKhoa.length;
  for (let i = 0; i <= 200; i++) {
    let randomsv = i + 1;
    if (randomsv < 10) {
      MaSV += "00" + randomsv;
    } else if (randomsv < 100) {
      MaSV += "0" + randomsv;
    } else {
      MaSV += randomsv;
    }

    let randomhd = i + 1;
    if (randomhd < 10) {
      MaHD += "00" + randomhd;
    } else if (randomhd < 100) {
      MaHD += "0" + randomhd;
    } else {
      MaHD += randomhd;
    }
    let MK = Math.floor(Math.random() * sizeKhoa);
    let ML = 0;

    if (MK == 0) {
      ML = Math.floor(Math.random() * 7);
    } else if (MK == 1) {
      ML = Math.floor(Math.random() * 7) + 7;
    } else {
      ML = Math.floor(Math.random() * 7) + 14;
    }
    console.log("MK" + MK + ":ML:" + ML);
    let result =
      "insert into TB_SINHVIEN values(N'" +
      MaSV +
      "', N'" +
      TenSV[Math.floor(Math.random() * sizeTen)] +
      "', N'" +
      SDT[Math.floor(Math.random() * sizeSDT)] +
      "','" +
      NgaySinh[Math.floor(Math.random() * sizeNS)] +
      "', N'" +
      QueQuan[Math.floor(Math.random() * sizeQue)] +
      "', N'" +
      GioiTinh[Math.floor(Math.random() * 2)] +
      "', N'" +
      MaKhoa[MK] +
      "', N'" +
      MaLop[ML] +
      "',N'" +
      MaHD +
      "')<br/>";
    document.write(result);
    MaSV = "SV0";
    MaHD = "HD0";
  }
}
// InsertSV();

function insertHD() {
  let result = "";
  let MaHD = "HD00";
  let NgayThang = "";
  let MaPhong = "";
  let j = 1;
  let randomIndexPhong = 7;
  for (let i = 0; i < 150; i++) {
    MaHD += i + 1;

    let randomMaNV = Math.floor(Math.random() * 5) + 1;
    let MaNV = "NV0";
    if (randomMaNV < 10) {
      MaNV += "00" + randomMaNV;
    } else if (randomMaNV < 100) {
      MaNV += "0" + randomMaNV;
    } else {
      MaNV += randomMaNV;
    }

    let Han = Math.floor(Math.random() * 2) + 2;
    NgayThang += Math.floor(Math.random() * 2) + 2020 + "/";
    NgayThang += Math.floor(Math.random() * 12) + 1 + "/";
    NgayThang += Math.floor(Math.random() * 30) + 1;
    if (i >= randomIndexPhong) {
      randomIndexPhong += Math.floor(Math.random() * 2) + 6;
      j = j + 1;
    }
    MaPhong = j < 10 ? "P00" + j : "P0" + j;
    result =
      "insert into TB_HOPDONG values(N'" +
      MaHD +
      "', '" +
      NgayThang +
      "'," +
      Han +
      ", N'" +
      MaPhong +
      "', N'" +
      MaNV +
      "')<br/>";
    document.write(result);
    MaHD = "HD00";
    NgayThang = "";
  }
}

insertHD();
