package com.example.demo.asm.controller;

import com.example.demo.asm.service.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/San-Pham")
public class trangchuController {
    @Autowired
    NhanVienService nhanVienService;
    @GetMapping("/trangchu")
    public String SangTrangChu(Model model, @RequestParam("id") int id) {
model.addAttribute("list",nhanVienService.timkiem(id));
        return "Trangchu";
    }
}