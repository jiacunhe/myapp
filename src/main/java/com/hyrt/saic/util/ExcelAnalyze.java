package com.hyrt.saic.util;


import jxl.Sheet;
import jxl.Workbook;
import org.apache.commons.fileupload.ObjectPool;
import org.apache.commons.fileupload.UpfileProgress;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-28
 * Time: 上午10:09
 * To change this template use File | Settings | File Templates.
 */
public class ExcelAnalyze implements Runnable{

    private String sn;
    private InputStream inputStream;
    public  ExcelAnalyze(InputStream inputStream, String sn){
        this.sn = sn;
        this.inputStream = inputStream;
    }


    public void run(){

        ObjectPool pool = ObjectPool.getPool();
        UpfileProgress ufp = (UpfileProgress) pool.p.get(sn);
        List reslist=new ArrayList();
        int success=0;
        int error=0;
        try {
            Workbook rwb = Workbook.getWorkbook(inputStream);

            Sheet sheet = rwb.getSheet(0);
            int rowCount = sheet.getRows();

            String code,name,remark=null,cert=null;


            for (int i = 1; i < rowCount; i++) {

                if ( sheet.getCell(0, i).getContents()!=null &&sheet.getCell(1, i).getContents()!=null  && ! sheet.getCell(0, i).getContents().toString().trim().equals("")) {
                    code = sheet.getCell(0, i).getContents().toString().trim();
                    name = sheet.getCell(1, i).getContents().toString().trim();
                    if(sheet.getCell(2, i).getContents()!=null)
                    remark=sheet.getCell(2, i).getContents().toString().trim();
                    if(sheet.getCell(3, i).getContents()!=null)
                    cert=sheet.getCell(3, i).getContents().toString().trim();

                    reslist.add(new String[]{code,name,remark,cert});

                    success++;
                    if (i % 100 == 0) {
                        ufp.write(i, rowCount);
                        System.out.println(i+"/"+ rowCount+"="+ufp.progress+"------------------------------");
                        pool.p.put(sn, ufp);
                    }
                }else{
                    error++;
                }

            }

            ufp.setProgress("100%,成功导入" + success + "个,失败" + error + "个");
        }catch (Exception e) {
            e.printStackTrace();
        }

        pool.p.put(sn, ufp);
        pool.p.put(sn+"reslist",reslist);
    }

}
