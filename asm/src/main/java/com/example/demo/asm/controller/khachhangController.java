package com.example.demo.asm.controller;

import com.example.demo.asm.entity.KhachHang;
import com.example.demo.asm.entity.MauSac;
import com.example.demo.asm.service.NhanVienService;
import com.example.demo.asm.service.khachhangSevice;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/San-Pham")
public class khachhangController {
    @Autowired
    NhanVienService nhanVienService;
@Autowired
    khachhangSevice KHSservice;
int detam;
    @GetMapping("/khachhang")
    public String nhanvien(Model model, @RequestParam("id") int id) {
        model.addAttribute("list", nhanVienService.timkiem(id));
        model.addAttribute("kh", KHSservice.getListKH());
        detam = id;
        return "form/khachhang";
    }
    @GetMapping("/addkh")
    public String Foraddkh(Model model){
        model.addAttribute("khachhang",new KhachHang());
        return "form/formkhachhang";
    }
    @PostMapping("/Addkhachhang")
    public String Addkhachhang(@Valid @ModelAttribute("khachhang") KhachHang kh , BindingResult result){
        if(result.hasErrors()){
            return "form/formkhachhang";
        }
        KHSservice.addNhanVien(kh);
        return "redirect:/San-Pham/khachhang?id="+detam;
    }
    @GetMapping("/deleteKH")
    public String deleteKH(@RequestParam("id") int id){
        KHSservice.deleteKhach(id);
        return "redirect:/San-Pham/khachhang?id="+detam;
    }
    @GetMapping("/formUpdateKT")
    public String formUpdateKT(Model model,@RequestParam("id") int id){
        model.addAttribute("khachhang",KHSservice.timkiem(id));
        return "form/updatekhachhang";
    }@PostMapping("/UpdateKT")
    public String addmau(@Valid @ModelAttribute("khachhang") KhachHang kt , BindingResult result){
        if(result.hasErrors()){
            return "form/Updatemausac";
        }
        KHSservice.create(kt);
        return "redirect:/San-Pham/khachhang?id="+detam;
    }
    @GetMapping("/quaylaiHD")
    public String quaylaiHD(){
        return "redirect:/San-Pham/HoaDon?id="+detam;
    }
}
