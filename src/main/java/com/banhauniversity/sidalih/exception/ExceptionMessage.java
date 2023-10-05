package com.banhauniversity.sidalih.exception;

public enum ExceptionMessage {
    ID_Not_Found("Element not found with this id"),
    ID_is_Exist("id is Exist id");

    String message;
    ExceptionMessage(String message){
        this.message=message;
    }
}
