package com.example.demo.asm.reponstory;

import com.example.demo.asm.entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface reponstoryNhanvien extends JpaRepository<NhanVien,Integer> {
  public NhanVien findByTendangnhapAndMatkhau (String tendangnhap, String matkhau);

}
