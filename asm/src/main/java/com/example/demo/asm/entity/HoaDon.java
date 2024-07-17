package com.example.demo.asm.entity;

import com.example.demo.asm.controller.DangNhapController;
import com.example.demo.asm.service.NhanVienService;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@Entity
@NoArgsConstructor
@Table(name = "HoaDon")
public class HoaDon {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @JoinColumn(name = "idnhanvien", referencedColumnName = "id")
    @OneToOne
    private NhanVien nhanvien;

    @JoinColumn(name = "idkhachhang", referencedColumnName = "id")
    @OneToOne
    private KhachHang khachHang;

    @Column(name = "ngaymuahang")
    private String ngaymuahang;

    @Column(name = "trangthai")
    private Boolean trangthai;


}
