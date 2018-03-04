package com.accp.dao;

import com.accp.entity.BankTranRecords;

import java.util.List;

public interface BankTranRecordsDao {
    List<BankTranRecords>btrs(BankTranRecords bankTranRecords);
    BankTranRecords btr(BankTranRecords bankTranRecords);
    int add(BankTranRecords bankTranRecords);
    int modify(BankTranRecords bankTranRecords);
    List<BankTranRecords>btrspage(BankTranRecords bankTranRecords,int pageNo,int pageSize);
}
