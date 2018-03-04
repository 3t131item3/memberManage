package com.accp.biz.impl;

import com.accp.biz.BankBiz;
import com.accp.dao.BankDao;
import com.accp.entity.Bank;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("bankBiz")
public class BankBizImpl implements BankBiz {
    @Resource
    private BankDao bankDao;

    public List<Bank> banks(Bank bank) {
        return bankDao.banks(bank);
    }

    public Bank bank(Bank bank) {
        return bankDao.bank(bank);
    }

    public boolean modify(Bank bank) {
        return bankDao.modify(bank)>0;
    }

    public boolean add(Bank bank) {
        return bankDao.add(bank)>0;
    }
}
