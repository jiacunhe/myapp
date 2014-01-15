package com.hyrt.saic.service.impl;

import com.hyrt.saic.dao.CommonMapper;
import com.hyrt.saic.service.CommonService;
import com.hyrt.saic.util.enums.DataOperateType;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-24
 * Time: 上午10:42
 * To change this template use File | Settings | File Templates.
 */

@Service("commonService")
public class CommonServiceImpl<T> implements CommonService<T> {

    @Autowired
    private CommonMapper commonMapper;

    @Override
    public T selectByPrimaryKey(Class clazz, Serializable id){

        Map params = new HashMap();
        Field[] f = clazz.getDeclaredFields();

        params.put("_table",getTableName(clazz));
        params.put("_column",f[0].getName());
        params.put("_id",id);
        if(f[0].getType().getSimpleName().equals("String")){
            params.put("_ptype",1 );
        }else{
            params.put("_ptype",0 );
        }


       Map<String,Object> resmap = commonMapper.selectByPrimaryKey(params);
       //填装属性
        Object obj = null;
        try {
            obj = clazz.getDeclaredConstructor(null).newInstance();
            for(String key :  resmap.keySet()){
                BeanUtils.setProperty(obj,key.toLowerCase(),resmap.get(key));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }



        return (T)obj;
    }


    @Override
    @Transactional
    public void saveOrUpdateOrDeleteAll(Map<DataOperateType,List<Object>> beans) throws Exception{
        Object obj;
        List olist;
        String _table;

        String value;
        Map params;

        for(DataOperateType key : beans.keySet()){
            olist = beans.get(key);
            if(key.toString().equals("INSERT")){
                StringBuffer _column;
                StringBuffer _values;
                for(int i=0;i<olist.size();i++){
                    obj =  olist.get(i);
                    _table= getTableName(obj.getClass());
                    _column=new StringBuffer();
                    _values=new StringBuffer();
                    String _type;

                    Field[] fs = obj.getClass().getDeclaredFields();
                    for(Field f: fs ){
                        value = BeanUtils.getProperty(obj,f.getName());

                        _type = f.getType().getSimpleName();
                        if(value !=null){
                            _column.append(f.getName()+",");
                            if(_type.equals("String") || _type.equals("Timestamp")){
                                _values.append("'"+value+"',");
                            }else{
                                _values.append(value+",");
                            }

                        }
                    }

                    params = new HashMap();
                    params.put("_table",_table);
                    params.put("_column",_column.toString().substring(0,_column.toString().length()-1));
                    params.put("_values",_values.toString().substring(0,_values.toString().length()-1));


                    System.out.println(_column+"===========================");
                    commonMapper.insert(params);
                }
            }else if(key.toString().equals("UPDATE")){

                StringBuffer _set;
                StringBuffer _where;
                for(int i=0;i<olist.size();i++){
                    obj = olist.get(i);
                    _table= getTableName(obj.getClass());
                    _set=new StringBuffer();
                    _where=new StringBuffer();
                    String _type;

                    Field[] fs = obj.getClass().getDeclaredFields();
                    int j=0;
                    for(Field f: fs ){
                        value = BeanUtils.getProperty(obj,f.getName());

                        _type = f.getType().getSimpleName();
                        if(j==0){
                               j=1;
                            _where.append(" and "+f.getName()+"=");
                            if(value !=null){

                                if(_type.equals("String") || _type.equals("Timestamp")){
                                    _where.append("'"+value+"'");
                                } else{
                                    _where.append(value);
                                }
                            }
                        }else if(value !=null){
                            _set.append(f.getName()+"=");
                            if(_type.equals("String")||_type.equals("Timestamp")){
                                _set.append("'"+value+"',");
                            } else{
                                _set.append(value+",");
                            }

                        }
                    }

                    params = new HashMap();
                    params.put("_table",_table);
                    params.put("_set",_set.toString().substring(0,_set.toString().length()-1));
                    params.put("_where",_where.toString());
                    commonMapper.update(params);
                }
            }else if(key.toString().equals("DELETE")){


                StringBuffer _where;
                for(int i=0;i<olist.size();i++){
                    obj = olist.get(i);
                    _table= getTableName(obj.getClass());
                    _where=new StringBuffer();
                    String _type;

                    Field[] fs = obj.getClass().getDeclaredFields();

                    for(Field f: fs ){
                        value = BeanUtils.getProperty(obj,f.getName());

                        _type = f.getType().getSimpleName();


                            if(value !=null){
                                _where.append(" and "+f.getName()+"=");
                                if(_type.equals("String") || _type.equals("Timestamp")){
                                    _where.append("'"+value+"'");
                                } else{
                                    _where.append(value);
                                }

                            }

                        }


                    params = new HashMap();
                    params.put("_table",_table);
                    params.put("_where",_where.toString());
                    commonMapper.delete(params);
                }
            }



        }
    }




    @Override
    @Deprecated
    public List selectBySql(String sql) {
        return commonMapper.selectBySql(sql);
    }

    @Override
    @Deprecated
    public Map selectBySql(String sql, Integer page, Integer pagesize) {

        if (page == null) page = 1;
        int countItem = commonMapper.selectCount("select count(*) from ("+sql+") as xx");

        int totalpage = (countItem + pagesize - 1) / pagesize;
        if (page > totalpage) page = totalpage;
        if (page < 1) page = 1;

        List list = commonMapper.selectBySql(sql+"limit "+(page - 1) * 10+","+pagesize);


        Map res = new HashMap();
        res.put("page",page);
        res.put("totalpage",totalpage);
        res.put("totalitem",countItem);
        res.put("list",list);
        return res;
    }

    /*
        * 组装表名
        * */
    private String getTableName(Class clazz){

        String simpleName = clazz.getSimpleName();
        String tableName = "t"+simpleName;
        int lt=simpleName.length();
        for(int i=0;i<lt;i++){
            if(simpleName.charAt(i)>64 && simpleName.charAt(i)<91){
                tableName=tableName.replaceFirst(String.valueOf(simpleName.charAt(i)),"_"+(char)(simpleName.charAt(i)+32));
            }
        }
        return tableName;
    }

}
