package com.accp.biz.impl;

import com.accp.biz.BankTranRecordsBiz;
import com.accp.dao.BankTranRecordsDao;
import com.accp.entity.BankTranRecords;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("bankTranRecordsBiz")
public class BankTranRecordsBizImpl implements BankTranRecordsBiz{

    @Resource
    private BankTranRecordsDao bankTranRecordsDao;
    public List<BankTranRecords> btrs(BankTranRecords bankTranRecords) {
        return bankTranRecordsDao.btrs(bankTranRecords);
    }

    public BankTranRecords btr(BankTranRecords bankTranRecords) {
        return bankTranRecordsDao.btr(bankTranRecords);
    }

    public boolean add(BankTranRecords bankTranRecords) {
        return bankTranRecordsDao.add(bankTranRecords)>0;
    }

    public boolean modify(BankTranRecords bankTranRecords) {
        return bankTranRecordsDao.modify(bankTranRecords)>0;
    }

    public List<BankTranRecords> btrspage(BankTranRecords bankTranRecords, int pageNo, int pageSize) {
        return bankTranRecordsDao.btrspage(bankTranRecords,pageNo,pageSize);
    }
}
