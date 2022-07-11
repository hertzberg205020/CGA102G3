package com.cga102g3.web.prod.entity;

import lombok.*;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/7/6
 **/
@Data
public class CarObj {
    private int prodID ;
    private String title;
    private Integer price;
    private Integer salePrice;
    private String discount;
    private Integer amount;
}
