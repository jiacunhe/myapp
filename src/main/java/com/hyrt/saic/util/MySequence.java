package com.hyrt.saic.util;

import java.io.*;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 14-3-12
 * Time: 下午3:30
 * To change this template use File | Settings | File Templates.
 */
public class MySequence implements Serializable {

    static final long serialVersionUID =  7572548949072456089l;

    private  Integer p=0;

    private  Integer day=0;

    private static MySequence mySequence;

    private static File file;

    private  MySequence(){

    }

    public static int  getSequenceNum(){

        synchronized (MySequence.class) {
            if(mySequence==null) {

                file =new File("d:/order.seq");
                if(file.exists()){
                    mySequence =  readObject(file);
                    System.out.println(mySequence.getP());
                }else{
                    mySequence = new MySequence();

                }


            }
            if(mySequence.getDay() == Calendar.getInstance().get(Calendar.DAY_OF_MONTH)){
                mySequence.setP(mySequence.getP()+1);
            }else{
                mySequence.setP(1);
                mySequence.setDay(Calendar.getInstance().get(Calendar.DAY_OF_MONTH));
            }
            writeObj(mySequence);

        }


        return mySequence.getP();
    }


    private static MySequence readObject(File f){

        try {
            InputStream is=new FileInputStream(f);
            ObjectInputStream ois=new ObjectInputStream(is);

            return (MySequence)ois.readObject();
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.

          return  null;
        }

    }




    private static void writeObj( MySequence obj){
        if(file.exists()){

            file.delete();

        }

        try {
            FileOutputStream os=new FileOutputStream(file);

            //ObjectOutputStream 核心类

            ObjectOutputStream oos=new ObjectOutputStream(os);
            oos.writeObject(obj);

            oos.close();

            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    public static void main(String arg[]){
       /*int i=100;
        while(i>0){
        System.out.println(MySequence.getSequenceNum()+"------------------------------------");
        i--;
        }*/

        ExecutorService exec = Executors.newCachedThreadPool();

        for(int i = 0; i < 10; i++){
         //   exec.execute( );
        }

    }


    public  Integer getP() {
        return p;
    }

    public  void setP(Integer p) {
        this.p = p;
    }

    public  Integer getDay() {
        return day;
    }

    public  void setDay(Integer day) {
        this.day = day;
    }
}
