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
@Table(name = "NHAN_VIEN")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
  //  @NotBlank(message = "không để trống")
  @Column(name = "ten")
    private String ten;
 //   @NotBlank(message = "không để trống")
 @Column(name = "manv")
    private String manv;
    @NotBlank(message = "không để trống")
    @Column(name = "tendangnhap")
    private String tendangnhap;
    @NotBlank(message = "không để trống")
    @Column(name = "matkhau")
    private String matkhau;
  //  @NotNull(message = "không để trống")
  @Column(name = "trangthai")
    private Boolean trangthai;
}
