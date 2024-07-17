package com.example.demo.asm.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "SP_CHI_TIET")
public class SanPhamChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotBlank(message = "Mã sản phẩm chi tiết không được để trống")
    @Column(name = "maspct")
    private String maspct;
    @Column(name = "soluong")
    @Min(value = 0, message = "Số lượng không được nhỏ hơn 0")
    private Integer soluong;
    @Column(name="dongia")
    @NotNull(message = "Đơn giá không được để trống")
    @Min(value = 0, message = "Đơn giá không được nhỏ hơn 0")
    private Integer dongia;
    @Column(name="trangthai")
    private boolean trangthai;
////////
    @OneToOne
    @JoinColumn(name = "idkichthuoc")
    private KichThuoc idkichthuoc;
    /////
    @OneToOne
    @JoinColumn(name = "idmausac")
    private MauSac idmausac;
    @OneToOne
    @JoinColumn(name = "idsanpham")
    private SanPham idsanpham;
}
