package com.banhauniversity.sidalih.controller;

import com.banhauniversity.sidalih.dto.MedicineStatus;
import com.banhauniversity.sidalih.service.OrderMedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/dashboard")
public class DashboardController {

    @Autowired
    OrderMedicineService orderMedicineService;
    @GetMapping("/status")
    public List<MedicineStatus> getMedicineStatus(){
        return orderMedicineService.getMedicineStatus();
    }


}
