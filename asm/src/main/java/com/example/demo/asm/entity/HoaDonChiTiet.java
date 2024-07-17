package com.example.demo.asm.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "HOA_DON_CHI_TIET")
public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idhoadon")
    private HoaDon hoaDon;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdSPCT")
    private SanPhamChiTiet idsanPhamct;
    @Column(name = "soluong")
    private Integer soluong;
    @Column(name = "dongia")
    private Double dongia;
    @Column(name = "trangthai")
    private boolean trangthai;
}
