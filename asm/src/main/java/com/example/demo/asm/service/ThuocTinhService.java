package com.example.demo.asm.service;

import com.example.demo.asm.entity.KichThuoc;
import com.example.demo.asm.entity.MauSac;
import com.example.demo.asm.entity.NhanVien;
import com.example.demo.asm.reponstory.repostoryThuocTinhKichthuoc;
import com.example.demo.asm.reponstory.repostoryThuocTinhMausac;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service

public class ThuocTinhService {
@Autowired
    repostoryThuocTinhKichthuoc repostoryThuocTinhKichthuoc;
@Autowired
repostoryThuocTinhMausac repostoryThuocTinhMausac;


    public List<MauSac> getListMS(){
        return repostoryThuocTinhMausac.findAll();
    }
    public List<KichThuoc> getListKT(){
        return repostoryThuocTinhKichthuoc.findAll();
    }

    public void addMS(MauSac MauSac) {
       repostoryThuocTinhMausac.save(MauSac);
    }
    public void addKT(KichThuoc KichThuoc) {
       repostoryThuocTinhKichthuoc.save(KichThuoc);
    }
    public void DeleteMS(int id){
        repostoryThuocTinhMausac.deleteById(id);
    }
    public void Deletekt(int id){
        repostoryThuocTinhKichthuoc.deleteById(id);
    }
    public void createKT(KichThuoc KichThuoc){
        repostoryThuocTinhKichthuoc.save(KichThuoc);
    }
    public void createMS(MauSac MauSac){
        repostoryThuocTinhMausac.save(MauSac);
    }

    public MauSac timkiemMS(int ID) {
       return repostoryThuocTinhMausac.findById(ID).get();
    }

    public KichThuoc timkiemKT(int ID) {
        return repostoryThuocTinhKichthuoc.findById(ID).get();
    }
    public boolean tontai (String ten){
      boolean check= true;
        if(repostoryThuocTinhKichthuoc.findByTen(ten)!=null){
            check = false;
        }
        return check;
    }
}
