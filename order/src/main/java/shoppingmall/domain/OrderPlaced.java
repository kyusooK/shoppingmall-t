package shoppingmall.domain;

import java.time.LocalDate;
import java.util.*;
import lombok.*;
import shoppingmall.domain.*;
import shoppingmall.infra.AbstractEvent;

//<<< DDD / Domain Event
@Data
@ToString
public class OrderPlaced extends AbstractEvent {

    private Long id;
    private String userId;
    private String productName;
    private Integer qty;
    private String address;
    private OrderStatus orderStatus;

    public OrderPlaced(Order aggregate) {
        super(aggregate);
    }

    public OrderPlaced() {
        super();
    }
}
//>>> DDD / Domain Event
