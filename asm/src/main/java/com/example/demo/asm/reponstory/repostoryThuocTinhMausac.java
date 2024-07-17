package com.example.demo.asm.reponstory;

import com.example.demo.asm.entity.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface repostoryThuocTinhMausac extends JpaRepository<MauSac,Integer> {

}
