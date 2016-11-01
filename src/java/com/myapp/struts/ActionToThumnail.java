package com.myapp.struts;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ActionToThumnail {

    public void createthumbnail(String filename, String filepath) throws IOException, ClassNotFoundException {
        System.out.println("File name : " + filename + " File path " + filepath);
        //Runtime rt = Runtime.getRuntime();
        //try {
        //   rt.exec(new String[]{"cmd.exe", "/c", "start"});
        //} catch (IOException e) {
        // TODO Auto-generated catch block
        //   e.printStackTrace();
        //}
        //try
        /*String[] command = new String[4];
         command[0] = "cmd";
         command[1] = "/C";
         command[2] = "ffmpeg –version";
         //command[3] = "C:\\FFMPEG\\bin";
         //command[3] = "C:\\Users\\SANJAY-PC\\Downloads\\Compressed\\ffmpeg-20140409-git-ed96241-win32-shared\\bin";
         command[3] = "ffmpeg -itsoffset -4  -i test.avi -vcodec mjpeg -vframes 1 -an -f rawvideo -s 320x240 test.jpg";
         //command[3] = "ffmpeg.exe -itsoffset -4  -i test.avi -vcodec mjpeg -vframes 1 -an -f rawvideo -s 320x240 test.jpg";
         Process p = Runtime.getRuntime().exec(command);
         //command[2] = "ffmpeg";
         //command[3] = "ffmpeg -itsoffset -4  -i test.avi -vcodec mjpeg -vframes 1 -an -f rawvideo -s 320x240 test.jpg";
         //p = Runtime.getRuntime().exec(command);
         BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));

         BufferedReader stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));

         String s = null;
         System.out.println("Here is the standard output of the command:\n");
         while ((s = stdInput.readLine()) != null) {
         System.out.println(s);
         }

         // read any errors from the attempted command
         System.out.println("Here is the standard error of the command (if any):\n");
         while ((s = stdError.readLine()) != null) {
         System.out.println(s);
         }
         System.out.println("I am In try");*/
        String imagename = filename.substring(0, filename.lastIndexOf("."));
        //imagename = imagename.substring(0, imagename.indexOf(" "));
        String videofile = filepath + filename;
        String name = imagename + ".jpg";
        String imagefile = filepath + "image\\" + imagename + ".jpg";
        System.out.println("image name " + imagefile + " videofile " + videofile);
        ProcessBuilder builder = new ProcessBuilder("cmd.exe", "/c", "ffmpeg -itsoffset -4  -i \"" + videofile + "\" -vcodec mjpeg -vframes 1 -an -f rawvideo -s 320x240 \"" + imagefile + "\"");
        builder.redirectErrorStream(true);
        Process p = builder.start();
        //Process p1 = Runtime.getRuntime().exec("ffmpeg -i test.avi Pictures%d.jpg");
        BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String line;
        while (true) {
            line = r.readLine();
            if (line == null) {
                break;
            }
            System.out.println(line);
        }
        /*Connection conn = null;
        Statement stmt = null;
        Statement stmt1 = null;
        ResultSet rs = null;         
            
        try {
            Class.forName("com.mysql.jdbc.Driver");            
            conn = DriverManager.getConnection("jdbc:mysql://localhost/dbvidio", "root", "");
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();
            String sql1 = "SELECT `id` FROM `v_vidiodetail` WHERE vidiopath="+filename;
            rs = stmt.executeQuery(sql1);
            int id = rs.getInt("id");
            String sql2 = "UPDATE `v_vidiodetail` SET `thumbnail`='"+name+"' WHERE id="+id;
            stmt1.executeQuery(sql2);
        } catch (SQLException ex) {
            Logger.getLogger(ActionToThumnail.class.getName()).log(Level.SEVERE, null, ex);
        }*/

    }
}
