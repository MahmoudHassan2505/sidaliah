package com.banhauniversity.sidalih.controller;

import com.banhauniversity.sidalih.dto.MedicineStatus;
import com.banhauniversity.sidalih.repository.InventoryRepository;
import com.banhauniversity.sidalih.repository.UseageMedicineRepository;
import com.banhauniversity.sidalih.repository.UseageRepository;
import com.banhauniversity.sidalih.service.InventoryService;
import com.banhauniversity.sidalih.service.OrderMedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/dashboard")
public class DashboardController {

    @Autowired
    OrderMedicineService orderMedicineService;

    @Autowired
    InventoryService inventoryService;
    @GetMapping("/status/{id}")
    public MedicineStatus getMedicineStatus(@PathVariable long id){
//        return orderMedicineService.getMedicineStatus();
        return inventoryService.Status(id);
    }


}
