package com.example.demo.asm.service;

import com.example.demo.asm.entity.HoaDon;
import com.example.demo.asm.entity.KhachHang;
import com.example.demo.asm.entity.NhanVien;
import com.example.demo.asm.reponstory.reponstoryKhachhang;
import com.example.demo.asm.reponstory.reponstoryNhanvien;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
public class khachhangSevice {

@Autowired
    reponstoryKhachhang reponstoryKhachhang;

    public java.util.List getListKH(){
        return reponstoryKhachhang.findAll();
    }

    public void addNhanVien(KhachHang khachHang) {
        reponstoryKhachhang.save(khachHang);
    }
    public void deleteKhach(int id){
        reponstoryKhachhang.deleteById(id);
    }
    public void create(KhachHang KhachHang){
        reponstoryKhachhang.save(KhachHang);
    }

    public KhachHang timkiem(int ID) {
       return reponstoryKhachhang.findById(ID).get();
    }


}
