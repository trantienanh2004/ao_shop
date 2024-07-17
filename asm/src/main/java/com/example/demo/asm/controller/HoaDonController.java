package com.example.demo.asm.controller;


import com.example.demo.asm.entity.*;
import com.example.demo.asm.reponstory.reponstoryNhanvien;
import com.example.demo.asm.service.HoaDonService;
import com.example.demo.asm.service.NhanVienService;
import com.example.demo.asm.service.SanPhamService;
import com.example.demo.asm.service.khachhangSevice;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/San-Pham")
public class HoaDonController {
    int detam = 0;
    @Autowired
    HoaDonService hoaDonService;
    @Autowired
    reponstoryNhanvien reponstoryNhanvien;
    @Autowired
    NhanVienService nhanVienService;
    @Autowired
    HoaDonService hdService ;
    @Autowired
    SanPhamService sanPhamService;
    @Autowired
    DangNhapController dangNhapController;
@Autowired
khachhangSevice khachhangSevice;
    @GetMapping("/HoaDon")
    public String showLoginForm(Model model){
        model.addAttribute("list",nhanVienService.timkiem(dangNhapController.getId()));
        model.addAttribute("spct",sanPhamService.getListSPCT());
       // model.addAttribute("gio",hdService.giohang());
        model.addAttribute("hd",hdService.getListHD());
        model.addAttribute("chiTietHoaDon",new HoaDonChiTiet());

        return "HoaDon";
    }

    @GetMapping("/SuaHD")
    public String showSuaHD(Model model, @RequestParam("id") int id) {
        model.addAttribute("hoaDon",hdService.timkiemHD(id));

        return "form/FormHoaDon";
    }
    @PostMapping("/SuaHD")
    public String SuaHD( @Valid @ModelAttribute("hoaDon")HoaDon hd, BindingResult result) {
        if(result.hasErrors()){
            return "form/FormHoaDon";
        }
       hdService.createHD(hd);

        return "redirect:/San-Pham/HoaDon";
    }
    @GetMapping("/XoaHDtamthoi")
    public String XoaHDtamthoiPro(@RequestParam("id") int id) {
hdService.DeleteHDTamthoi(id);

        return "redirect:/San-Pham/HoaDon";
    }
    @GetMapping("/addHD")
    public String addHD() {

        HoaDon hoaDon = new HoaDon();
        hoaDon.setNhanvien(nhanVienService.timkiem(dangNhapController.getId()));
        hoaDon.setKhachHang(khachhangSevice.timkiem(1));
        hoaDon.setNgaymuahang(LocalDate.now().toString());
        hoaDon.setTrangthai(false);
        hdService.addHD(hoaDon);
        return "redirect:/San-Pham/HoaDon";
    }

    @GetMapping("/showformHD")
    public String showformHD(@RequestParam("id") int id, Model model) {
        model.addAttribute("listformhd", hdService.timkiemHD(id));
        List<SanPhamChiTiet> gio = hdService.giohang();
        int soluong = 0;
        double donGia = 0.0;
        for (SanPhamChiTiet sp : gio) {
            soluong += sp.getSoluong();
            donGia += sp.getDongia();
        }
        model.addAttribute("gio", gio);
        model.addAttribute("donGia", donGia);
        model.addAttribute("soluong", soluong);

        return "forward:/San-Pham/HoaDon";
    }


    @GetMapping("/tronSPCT")
    public String tronSPCT(@RequestParam("id") int id, Model model) {
        hdService.giohangadd(sanPhamService.timkiemspctChi1mathoi(id));
        model.addAttribute("gio", hdService.giohang());

        for (SanPhamChiTiet sp : hdService.giohang()) {
            model.addAttribute("soluong",sp.getSoluong());
            model.addAttribute("donGia", sp.getDongia());
        }
        return "forward:/San-Pham/HoaDon";
    }
    @PostMapping("/thanhtoan")
    public String thanhtoan(@RequestParam("HoaDon") int id,
                            @RequestParam("soluong") int soluong,
                            @RequestParam("donGia") double dongia) {

        HoaDon hoaDon = hdService.timkiemHD(id);
        hoaDon.setTrangthai(true);
        if (hoaDon == null) {
            return "redirect:/error";
        }
        for (SanPhamChiTiet s : hdService.giohang()) {
            HoaDonChiTiet hdct = new HoaDonChiTiet();
            hdct.setHoaDon(hoaDon);
            hdct.setSoluong(soluong);
            hdct.setIdsanPhamct(s);
            hdct.setDongia(dongia);
            hdct.setTrangthai(true);
            hdService.hdctadd(hdct);

        }
        hdService.giohang().clear();
        return "redirect:/San-Pham/HoaDon";
    }

    @GetMapping("/hdctForm")
    public String hdctForm( Model model) {
      model.addAttribute("list",hdService.getListHD());
        return "form/hdct";
    }

    @GetMapping("/detailSPCT")
    public String detailSPCT(Model model ,@RequestParam("id") int id ){
    model.addAttribute("checkten",hdService.timkiemHD(id));
    model.addAttribute("listhdct",hdService.timkiemHDCT(id));
        return "form/HD_SPCT";
    }
}
