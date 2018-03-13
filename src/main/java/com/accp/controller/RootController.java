package com.accp.controller;

import com.accp.biz.ManageBiz;
import com.accp.biz.RootBiz;
import com.accp.entity.Manage;
import com.accp.entity.Role;
import com.accp.entity.Root;
import com.accp.entity.Users;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
public class RootController {
    @Resource(name = "rootBiz")
    private RootBiz rootBiz;

    @Resource(name = "manageBiz")
    private ManageBiz manageBiz;

    @RequestMapping("/queryRoots")
    @ResponseBody
    public Map<String, Object> queryRoots(HttpServletRequest request){
//        管理表的集合
        List<Manage> list=new ArrayList<Manage>();
//        主Map
        Map<String,Object>map=new HashMap<String,Object>();
//        管理表的id
        Set<Integer>set=new HashSet<Integer>();
//        管理表的集合map
        List<Map<String,Object>>manageList=new ArrayList<Map<String, Object>>();
//        管理项的集合map
        List<Map<String,String>>manageItemList;


//        获取当前登陆的用户
        Users user = (Users) request.getSession().getAttribute("user");
//        查询当前用户角色的权限
        Root root=new Root();
        root.setRoleId(user.getRoleId());
        root.setRootState(1);
        List<Root> roots = rootBiz.roots(root);
//       循环排除冗余获取管理表的id
        for (Root item:roots) {
            set.add(item.getManageItem().getManageId());
        }
//        获取管理表的集合
        Manage manage=new Manage();
        for (Integer item:set) {
            manage.setmId(item);
            list.add(manageBiz.getManage(manage));
        }
        Map<String,Object>manageMap;
        Map<String,String>manageItemMap;
        int a=0;
//        添加父菜单
        for (Manage item :list) {
            manageMap=new HashMap<String, Object>();

            manageMap.put("title",item.getmName());
            manageMap.put("icon","fa-cubes");
            if(a<1) {
                manageMap.put("spread", true);
            }else{
                manageMap.put("spread", false);
            }
            a++;

            manageItemList=new ArrayList<Map<String, String>>();
//            添加子菜单
            for (Root item2:roots) {
                if(item2.getManageItem().getManageId()==item.getmId()){
                    manageItemMap=new HashMap<String, String>();
                    manageItemMap.put("title",item2.getManageItem().getTitle());
                    manageItemMap.put("icon","&#xe63c");
                    manageItemMap.put("href",item2.getManageItem().getHref());
                    manageItemList.add(manageItemMap);
                }
            }

            manageMap.put("children",manageItemList);
            manageList.add(manageMap);
        }
        map.put("navs",manageList);
        return map;
    }
    @ResponseBody
    @RequestMapping("/roots")
    public String roots(HttpServletRequest request){
        Root root=new Root();
        String roleId = request.getParameter("roleId");
        int rid=1;
        if(roleId!=null){
            rid=Integer.parseInt(roleId);
        }
        root.setRoleId(rid);
        root.setRootState(1);
        return JSON.toJSONString(rootBiz.roots(root));
    }

    @RequestMapping("/modifyRoot")
    public String modifyRoot(int [] manageItemsId,int roleId){
//        先把该角色所有权限取消
        Root root=new Root();
        root.setRootState(2);
        root.setRoleId(roleId);
        rootBiz.modifyRoot(root);

//        在一个一个的添加权限
        for (int manageId :manageItemsId) {
            root=new Root();
            root.setManageItemId(manageId);
            root.setRoleId(roleId);
            root.setRootState(1);
            rootBiz.modifyRoot(root);
        }

        return "redirect:/queryManages";
    }

}
