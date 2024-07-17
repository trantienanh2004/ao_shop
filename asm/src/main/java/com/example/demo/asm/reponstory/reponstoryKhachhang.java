package com.example.demo.asm.reponstory;

import com.example.demo.asm.entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface reponstoryKhachhang extends JpaRepository<KhachHang,Integer> {
}
