package com.no;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

public class writer {
public void writing() {
    try {
//What ever the file path is.
        File statText = new File("/Users/manikandan/Android IDE/Programms/ExampleTestProject_v4.1/readme.txt");
        FileOutputStream is = new FileOutputStream(statText);
        OutputStreamWriter osw = new OutputStreamWriter(is);    
        Writer w = new BufferedWriter(osw);
        w.write("Report Generate");
        w.close();
    } catch (IOException e) {
        System.err.println("Problem writing to the file statsTest.txt");
    }
}

public static void main(String[]args) {
    writer write = new writer();
    write.writing();
}
}