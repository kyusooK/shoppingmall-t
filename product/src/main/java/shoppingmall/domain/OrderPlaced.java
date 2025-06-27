package shoppingmall.domain;

import java.util.*;
import lombok.*;
import shoppingmall.domain.*;
import shoppingmall.infra.AbstractEvent;

@Data
@ToString
public class OrderPlaced extends AbstractEvent {

    private Long id;
    private String userId;
    private String productName;
    private Integer qty;
    private String address;
    private Object orderStatus;
}
