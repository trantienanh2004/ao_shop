package com.example.demo.asm.controller;

import com.example.demo.asm.entity.KichThuoc;
import com.example.demo.asm.entity.MauSac;
import com.example.demo.asm.service.NhanVienService;
import com.example.demo.asm.service.ThuocTinhService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/San-Pham")
public class ThuocTinhController {
    @Autowired
    NhanVienService nhanVienService;

    @Autowired
    ThuocTinhService ttService;
@Autowired
DangNhapController dangNhapController;


    @GetMapping("/ThuocTinh")
    public String nhanvien(Model model) {
        model.addAttribute("list", nhanVienService.timkiem(dangNhapController.getId()));
        model.addAttribute("kichthuoc", ttService.getListKT());
        model.addAttribute("mauSac", ttService.getListMS());

        return "thuoctinh";
    }
   //////////////////////////////
    @GetMapping("/addMau")
    public String Formaddmau(Model model){
        model.addAttribute("mauSac",new MauSac());
        return "form/FormMauSac";
    }
    @PostMapping ("/AddMauSac")
    public String AddMauSac(@Valid @ModelAttribute("mauSac") MauSac ms , BindingResult result){
      if(result.hasErrors()){
          return "form/FormMauSac";
      }
      ttService.addMS(ms);
        return "redirect:/San-Pham/ThuocTinh";
    }
    @GetMapping("/xoams")
    public String xoams(@RequestParam("id") int id){
        ttService.DeleteMS(id);
        return "redirect:/San-Pham/ThuocTinh";
    }
    @GetMapping("/formUpdatems")
    public String formUpdatems(Model model,@RequestParam("id") int id){
        model.addAttribute("mauSac",ttService.timkiemMS(id));
        return "form/Updatemausac";
    }
    @PostMapping("/updateMauSac")
    public String addmau(@Valid @ModelAttribute("mauSac") MauSac ms , BindingResult result){
        if(result.hasErrors()){
            return "form/Updatemausac";
        }
        ttService.createMS(ms);
        return "redirect:/San-Pham/ThuocTinh";
    }
    ////////////////////////////////////////
    @GetMapping("/addTk")
    public String FormaddTK(Model model){
        model.addAttribute("kichThuoc",new KichThuoc());
        return "form/Formkichthuoc";
    }
    @PostMapping ("/AddTk")
    public String AddTK(@Valid @ModelAttribute("kichThuoc") KichThuoc kt , BindingResult result){
        if(result.hasErrors()){
            return "form/Formkichthuoc";
        }
        if(ttService.tontai(kt.getTen())){
            ttService.addKT(kt);
        }
        return "redirect:/San-Pham/ThuocTinh";
    }
    @GetMapping("/xoaTK")
    public String xoaTK(@RequestParam("id") int id){
        ttService.Deletekt(id);
        return "redirect:/San-Pham/ThuocTinh";
    }
    @GetMapping("/formUpdatetk")
    public String formUpdatetk(Model model,
                               @RequestParam("id") int id){
        model.addAttribute("kichThuoc",ttService.timkiemKT(id));
        return "form/updatekichthuoc";
    }
    @PostMapping("/updateTk")
    public String addTk(@Valid @ModelAttribute("kichThuoc") KichThuoc kt ,
                        BindingResult result){
        if(result.hasErrors()){
            return "form/updatekichthuoc";
        }
        ttService.createKT(kt);
        return "redirect:/San-Pham/ThuocTinh";
    }
}

