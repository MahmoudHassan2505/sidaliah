package com.banhauniversity.sidalih.service;

import com.banhauniversity.sidalih.entity.Useage;
import com.banhauniversity.sidalih.exception.CustomException;
import com.banhauniversity.sidalih.exception.ExceptionMessage;
import com.banhauniversity.sidalih.repository.UseageRepository;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UseageService {

    @Autowired private UseageRepository useageRepository;


    public List<Useage> findAll(){
        return useageRepository.findAll();
    }

    public Useage findById(long id){
        return useageRepository.findById(id).orElseThrow(()->new CustomException(ExceptionMessage.ID_Not_Found));
    }

    public Useage add(Useage useage){
        return useageRepository.save(useage);
    }

    public Useage update(Useage useage){
        useageRepository.findById(useage.getId()).ifPresent((x)-> new CustomException(ExceptionMessage.ID_Not_Found));
        return useageRepository.save(useage);
    }

    public boolean delete(long id){
        useageRepository.deleteById(id);
        return true;
    }
}
