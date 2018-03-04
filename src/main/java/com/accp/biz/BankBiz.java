package com.accp.biz;

import com.accp.entity.Bank;

import java.util.List;

public interface BankBiz {
    List<Bank> banks(Bank bank);
    Bank bank(Bank bank);
    boolean modify(Bank bank);
    boolean add(Bank bank);
}
