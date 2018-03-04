package com.accp.biz;

import com.accp.entity.BankTranRecords;

import java.util.List;

public interface BankTranRecordsBiz {
    List<BankTranRecords>btrs(BankTranRecords bankTranRecords);
    BankTranRecords btr(BankTranRecords bankTranRecords);
    boolean add(BankTranRecords bankTranRecords);
    boolean modify(BankTranRecords bankTranRecords);
    List<BankTranRecords>btrspage(BankTranRecords bankTranRecords, int pageNo, int pageSize);
}
