package com.banhauniversity.sidalih.service;

import com.banhauniversity.sidalih.entity.Inventory;
import com.banhauniversity.sidalih.repository.InventoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InventoryService {

    @Autowired private InventoryRepository inventoryRepository;

    public List<Inventory> findALl(){
        return inventoryRepository.findAll();
    }
}
