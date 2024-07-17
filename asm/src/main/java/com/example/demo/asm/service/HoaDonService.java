package com.example.demo.asm.service;

import com.example.demo.asm.controller.DangNhapController;
import com.example.demo.asm.entity.*;
import com.example.demo.asm.reponstory.reponstoryHDCT;
import com.example.demo.asm.reponstory.repostoryHD;
import com.example.demo.asm.reponstory.repostorySPCT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
public class HoaDonService {
@Autowired
    repostoryHD repostoryHD ;
    @Autowired
    repostorySPCT repostorySPCT ;
    @Autowired
    NhanVienService nhanVienService;
    @Autowired
    DangNhapController dangNhapController;
@Autowired
    reponstoryHDCT reponstoryHDCT;
    List<SanPhamChiTiet> gio = new ArrayList<>();
    public List<SanPhamChiTiet> giohang(){
        return gio;
    }

    public void giohangadd(SanPhamChiTiet sanPhamChiTiet){
        gio.add(sanPhamChiTiet);
    }
    public java.util.List getListHD(){
        return repostoryHD.findAll();
    }
    public java.util.List getListSPCT(){
        return repostorySPCT.findAll();
    }
    public void addHDCT(SanPhamChiTiet SanPhamChiTiet) {
        repostorySPCT.save(SanPhamChiTiet);
    }
    public void addHD(HoaDon hoaDon) {

      repostoryHD.save(hoaDon);
    }
    public void hdctadd(HoaDonChiTiet HoaDonChiTiet) {

        reponstoryHDCT.save(HoaDonChiTiet);
    }
    public HoaDon timkiemHD(int ID) {
        return repostoryHD.findById(ID).get();
    }
    public void createHD(HoaDon HoaDon){
        repostoryHD.save(HoaDon);
    }
    public void DeleteHDTamthoi(int id){
        repostoryHD.deleteById(id);
    }


    public String HienThiNgayThangNam (){

            LocalDate ngayHienTai = LocalDate.now();

            // Định dạng ngày theo kiểu dd/MM/yyyy
            DateTimeFormatter dinhDang = DateTimeFormatter.ofPattern("dd/MM/yyyy");

            // Chuyển đổi ngày hiện tại thành chuỗi định dạng
            String ngayDangChuoi = ngayHienTai.format(dinhDang);


        return ngayDangChuoi;
    }
    public List<HoaDonChiTiet> listhd(){
       return reponstoryHDCT.findAll();
    }
    public List<HoaDonChiTiet> timkiemHDCT(int id){
        return reponstoryHDCT.findByHoaDonId(id);
    }
}
