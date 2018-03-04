package com.accp.dao;

import com.accp.entity.Bank;

import java.util.List;

public interface BankDao {
    List<Bank>banks(Bank bank);
    Bank bank(Bank bank);
    int modify(Bank bank);
    int add(Bank bank);
}
