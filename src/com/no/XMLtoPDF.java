package com.no;

import java.io.*;
import com.lowagie.text.DocumentException;
import com.pdfcrowd.Client;
import com.pdfcrowd.PdfcrowdError;

import org.xhtmlrenderer.pdf.ITextRenderer;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
public class XMLtoPDF {    
    public static void main(String[] args) 
            throws IOException, DocumentException, TransformerException,TransformerConfigurationException,FileNotFoundException,PdfcrowdError {                  
        TransformerFactory tFactory = TransformerFactory.newInstance();
        Transformer transformer = tFactory.newTransformer(new StreamSource("sample.xsl"));
        transformer.transform(new StreamSource("SampledomeTest7.xml"),new StreamResult(new FileOutputStream("sample.html")));
        String File_To_Convert = "sample.html";
        String url = new File(File_To_Convert).toURI().toURL().toString();
        System.out.println(""+url);
//        String HTML_TO_PDF = "ConvertedFile.pdf";
        // create an API client instance
        Client client = new Client("manikandan87", "1059b11b946ca9a85bafd3faa9733af6");
     // convert an HTML file
        OutputStream os = new FileOutputStream("file.pdf");
        client.convertFile("/Users/manikandan/Robo/NoTestword/sample.html", os);
        os.close();
        Integer ntokens = client.numTokens();
          
//        OutputStream os = new FileOutputStream(HTML_TO_PDF);       
//        ITextRenderer renderer = new ITextRenderer();
//        renderer.setDocument(url);      
//        renderer.layout();
//        renderer.createPDF(os);        
//        os.close();
    }
    
}
