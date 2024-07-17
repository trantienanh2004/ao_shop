package com.example.demo.asm.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "KHACH_HANG")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotBlank(message = "Tên không được để trống")
    @Column(name = "ten")
    private String ten;

    @NotNull(message = "Số điện thoại không được để trống")
    @Column(name = "sdt")
    private Integer sdt;

    @NotBlank(message = "Mã khách hàng không được để trống")
    @Column(name = "makh")
    private String makh;
    @Column(name = "trangthai")
    private Boolean trangthai;
}
