package com.example.demo.asm.controller;

import com.example.demo.asm.entity.NhanVien;
import com.example.demo.asm.service.NhanVienService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/San-Pham")
public class NhanVienController {
    @Autowired
    NhanVienService VnService;
    @Autowired
    DangNhapController dangNhapController;



    @GetMapping("/NhanVien")
    public String nhanvien(Model model,
                           @RequestParam(value = "x" ,defaultValue = "0") int x) {
        model.addAttribute("list",VnService.timkiem(dangNhapController.getId()));
        model.addAttribute("nv",VnService.phantrang(x));

        return "nhanvien";
    }

    @GetMapping ("/FormNhanVien")
    public String FormNhanvien(Model model){
        model.addAttribute("nhanvien",new NhanVien());
        return "form/FormNhanVien";
    }
    @PostMapping ("/FormNhanVien")
    public String addNhanvien( @Valid @ModelAttribute("nhanvien")NhanVien nv,
                               BindingResult result){
       if(result.hasErrors()){

           return "/form/FormNhanVien";
       }
       VnService.addNhanVien(nv);
        return "redirect:/San-Pham/NhanVien";
    }
    String chucvu ;
    @GetMapping("/xoa")
        public String xoaNhanvien(@RequestParam("idnv") int idnhanvien,
                                  Model model
                                  ){
        chucvu = VnService.timkiemCV(dangNhapController.getId()) ? "admin":"nhan vien";
        if(chucvu.equalsIgnoreCase("admin")){
            if(idnhanvien!=dangNhapController.getId()){
                VnService.DeleteNhanVien(idnhanvien);
                return "redirect:/San-Pham/NhanVien" ;
            }
        }
            model.addAttribute("tb","bạn không đủ quyền để xóa");

        return "redirect:/San-Pham/NhanVien" ;
        }
        @GetMapping("/update")
        public String formupdateNhanvien(Model model,@RequestParam("idnv") int id){
        model.addAttribute("nhanvien",VnService.timkiem(id));
        return "form/updateNhanvien";
        }
    @PostMapping("updatenhanvien")
    public String updatenhanvien(@Valid @ModelAttribute("nhanvien")NhanVien nv,
                                 BindingResult result){
 if(result.hasErrors()){
    return "form/updateNhanvien";
 }
VnService.create(nv);
        return "redirect:/San-Pham/NhanVien" ;
    }
}
