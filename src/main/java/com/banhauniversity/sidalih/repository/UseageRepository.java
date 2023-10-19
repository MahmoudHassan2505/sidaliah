package com.banhauniversity.sidalih.repository;

import com.banhauniversity.sidalih.entity.Useage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UseageRepository extends JpaRepository<Useage,Long> {
}
