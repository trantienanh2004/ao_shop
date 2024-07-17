package com.example.demo.asm.service;

import com.example.demo.asm.entity.*;
import com.example.demo.asm.reponstory.repostorySPCT;
import com.example.demo.asm.reponstory.repostorySanPham;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class SanPhamService {
    @Autowired
    ThuocTinhService ttservice;
    @Autowired
    repostorySanPham repostorySanPham;
    @Autowired
    repostorySPCT repostorySPCT;

    private static final int Size = 3;
        public java.util.List getListSP(){
            return repostorySanPham.findAll();
        }
        public java.util.List getListSPCT(){
            return repostorySPCT.findAll();
        }

        public Page<SanPham> phantrang(int pag){
            Sort sort = Sort.by(Sort.Direction.ASC,"id");
            Pageable page = PageRequest.of(pag,Size,sort);
           return repostorySanPham.findAll(page);
        }

        public void addSP(SanPham sanpham) {
           repostorySanPham.save(sanpham);
        }
    public void addSPCT(SanPhamChiTiet SPCT) {
       repostorySPCT.save(SPCT);
    }

    public void DeleteSP(int id){                         ///????
            repostorySanPham.deleteById(id);
        }
    public void DeleteSPCT(int id){                         ///????
        repostorySPCT.deleteById(id);
    }
        public void create(SanPham sanpham){
            repostorySanPham.save(sanpham);
        }
    public void createSPCT(SanPhamChiTiet spct) {
        repostorySPCT.save(spct);

    }



    public SanPham timkiem(int ID) {
           return repostorySanPham.findById(ID).get();
        }
    public SanPhamChiTiet timkiemspctChi1mathoi(int ID) {
         return repostorySPCT.findById(ID).get();
    }


    public String timtensp( int ID){
    return repostorySanPham.findById(ID).get().getTen();
}


    }

