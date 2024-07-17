package com.example.demo.asm.controller;

import com.example.demo.asm.entity.SanPham;
import com.example.demo.asm.entity.SanPhamChiTiet;
import com.example.demo.asm.service.NhanVienService;
import com.example.demo.asm.service.SanPhamService;
import com.example.demo.asm.service.ThuocTinhService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/San-Pham")
public class SanPhamController {
    @Autowired
    private SanPhamService sanPhamService;
@Autowired
DangNhapController dangNhapController;
    @Autowired
    private NhanVienService nvService;
    @Autowired
    private ThuocTinhService ttService;
int detamthoi;



    private int detam;

    @GetMapping("/SanPham")
    public String nhanvien(Model model,
                           @RequestParam(value = "x" ,defaultValue = "0") int x) {
        model.addAttribute("list", nvService.timkiem(dangNhapController.getId()));
        model.addAttribute("sp", sanPhamService.phantrang(x));
        return "SanPham";
    }
    @GetMapping("/formSanPham")
    public String formSanPham(Model model){
        model.addAttribute("SanPham", new SanPham());
        return "form/FormSanPham";
    }
    @PostMapping("/addSP")
    public String addSp(@Valid @ModelAttribute("SanPham")SanPham sp ,
                        BindingResult result){
        if(result.hasErrors()){
            return "form/FormSanPham";
        }
        sanPhamService.addSP(sp);
        return "redirect:/San-Pham/SanPham";
    }
    @GetMapping("/formupdateSP")
    public String formupdateSP(Model model,@RequestParam("id") int id){
       // model.addAttribute("list",sanPhamService.timkiem(id) );
        model.addAttribute("SanPham", sanPhamService.timkiem(id));
        return "form/UpdateSanPham";
    }
    @PostMapping("/Update")
    public String updateSP(@Valid @ModelAttribute("SanPham")SanPham sp ,
                        BindingResult result){
        if(result.hasErrors()){
            return "form/FormSanPham";
        }
        sanPhamService.create(sp);
        return "redirect:/San-Pham/SanPham";
    }



    //////////////////////////////////////////////

@GetMapping("/tableSPCT")
    public String tableSPCT(Model model,@RequestParam("id") int id){
        model.addAttribute("id",id);
        model.addAttribute("spct",sanPhamService.getListSPCT());
    detamthoi = id;
        return "form/FormSPCT";
}
    @GetMapping("/addSPCT")
    public String formAddSPCT(Model model,
                          @RequestParam("id") int id){
        model.addAttribute("id",id);
        model.addAttribute("sanpham",sanPhamService.getListSP());
        model.addAttribute("kichthuoc",ttService.getListKT());
        model.addAttribute("mausac",ttService.getListMS());
        model.addAttribute("sanPhamChiTiet",new SanPhamChiTiet());

        return "form/FormAddSPCT";
    }
    @PostMapping("/addSPCT")
    public String addSPCT(@Valid @ModelAttribute("sanPhamChiTiet") SanPhamChiTiet spct, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("kichthuoc", ttService.getListKT());
            model.addAttribute("mausac", ttService.getListMS());
            return "form/FormAddSPCT";
        }

        sanPhamService.addSPCT(spct);
        return "redirect:/San-Pham/tableSPCT?id=" + spct.getIdsanpham().getId();
    }

@GetMapping("/xoaSPCT")
    public String xoaSPCT(@RequestParam("id") int id){
        sanPhamService.DeleteSPCT(id);
    return "redirect:/San-Pham/tableSPCT?id=" + detamthoi;
}

    @GetMapping("/updateSPCT")
    public String updateSPCT(@RequestParam("id") int id,Model model ){
        model.addAttribute("kichthuoc", ttService.getListKT());
        model.addAttribute("mausac", ttService.getListMS());
        model.addAttribute("sanPhamChiTiet",sanPhamService.timkiemspctChi1mathoi(id));
        return "form/updateSPCT";
    }
    @PostMapping("/updateSPCT")
    public String updateSPCTthat(@Valid @ModelAttribute("sanPhamChiTiet") SanPhamChiTiet spct,
                                 BindingResult result, Model model) {
        if (result.hasErrors()) {
          //  model.addAttribute("id", spct.getId());
            model.addAttribute("kichthuoc", ttService.getListKT());
            model.addAttribute("mausac", ttService.getListMS());
            return "form/updateSPCT?id="+detamthoi;
        }

        sanPhamService.createSPCT(spct);
        return "redirect:/San-Pham/tableSPCT?id=" + detamthoi;
    }
@GetMapping("/quaylai")
    public String quaylai(){
    return "redirect:/San-Pham/SanPham?id="+detam;
}
}
