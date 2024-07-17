package com.example.demo.asm.reponstory;

import com.example.demo.asm.entity.KichThuoc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface repostoryThuocTinhKichthuoc extends JpaRepository<KichThuoc,Integer> {
 public KichThuoc findByTen(String ten);
}
