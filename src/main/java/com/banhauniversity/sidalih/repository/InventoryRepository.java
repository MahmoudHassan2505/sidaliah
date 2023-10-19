package com.banhauniversity.sidalih.repository;

import com.banhauniversity.sidalih.entity.Inventory;
import org.hibernate.type.descriptor.converter.spi.JpaAttributeConverter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InventoryRepository extends JpaRepository<Inventory,Long> {

    Inventory findByMedicineId(long id);
}
