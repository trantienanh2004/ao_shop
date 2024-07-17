package com.example.demo.asm.reponstory;

import com.example.demo.asm.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface repostoryHD extends JpaRepository<HoaDon,Integer> {

}
