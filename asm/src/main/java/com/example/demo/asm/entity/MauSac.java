package com.example.demo.asm.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "MAU_SAC")
public class MauSac {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id")
        private int id;

        @NotBlank(message = "Mã không được để trống")
        @Size(max = 50, message = "Mã không được vượt quá 50 ký tự")
        @Column(name = "ma")
        private String ma;

        @NotBlank(message = "Tên không được để trống")
        @Size(max = 100, message = "Tên không được vượt quá 100 ký tự")
        @Column(name = "ten")
        private String ten;
        @Column(name = "trangthai")
        private boolean trangthai;



}
