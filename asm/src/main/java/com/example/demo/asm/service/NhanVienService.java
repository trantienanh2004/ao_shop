package com.example.demo.asm.service;

import com.example.demo.asm.entity.NhanVien;
import com.example.demo.asm.entity.SanPham;
import com.example.demo.asm.reponstory.reponstoryNhanvien;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class NhanVienService {
    @Autowired
    private reponstoryNhanvien reponstoryNhanvien;

    public List<NhanVien> getList(){
        return reponstoryNhanvien.findAll();
    }
    private static final int Size = 3;

    public Page<NhanVien> phantrang(int pag){
       Sort s = Sort.by(Sort.Direction.ASC,"id");
       Pageable page = PageRequest.of(pag,Size,s);
       return reponstoryNhanvien.findAll(page);
    }

    public boolean taikhoan(String taikhoan, String matkhau){
    if(reponstoryNhanvien.findByTendangnhapAndMatkhau(taikhoan,matkhau)!=null) {
        return true;
    }
        return false;
    }

    public void addNhanVien(NhanVien nhanVien) {
        reponstoryNhanvien.save(nhanVien);
    }

    public void DeleteNhanVien(int id) {
        reponstoryNhanvien.deleteById(id);
    }

    public void create(NhanVien nhanVien) {
        reponstoryNhanvien.save(nhanVien);
    }

    public NhanVien layid(String tenDangNhap, String matKhau) {

        return reponstoryNhanvien.findByTendangnhapAndMatkhau(tenDangNhap,matKhau);
    }

    public NhanVien timkiem(int id) {
        return reponstoryNhanvien.findById(id).get();
    }

    public Boolean timkiemCV(int id) {
    NhanVien nhanvien = reponstoryNhanvien.findById(id).get();
    return nhanvien.getTrangthai();
    }


}
