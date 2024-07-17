package com.example.demo.asm.controller;

import com.example.demo.asm.entity.NhanVien;
import com.example.demo.asm.service.NhanVienService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/San-Pham")
public class DangNhapController {
    @Autowired
    NhanVienService NVservice;
public int id ;
@GetMapping("/login")
    public String login(Model model){
    model.addAttribute("DangNhap",new NhanVien());
    return "Login";
}
    @PostMapping("/login")
    public String dangnhap(@Valid @ModelAttribute("DangNhap") NhanVien nv, BindingResult result, Model model,@RequestParam("tendangnhap") String tentaikhoan,@RequestParam("matkhau") String matkhau) {
        if (result.hasErrors()) {
            return "Login";
        }
        if (NVservice.taikhoan(tentaikhoan,matkhau)) {
            NhanVien userId = NVservice.layid(tentaikhoan,matkhau);
            id = userId.getId();
            return "redirect:/San-Pham/trangchu?id=" + userId.getId();
        }
        model.addAttribute("errors", "Tên đăng nhập hoặc mật khẩu không đúng");
        return "Login";
    }
    public int getId() {
        return id;
    }
}


