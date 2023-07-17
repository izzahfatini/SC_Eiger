/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author IZZAH
 */
public class PDFReport {
    public static void main(String[] args) throws ClassNotFoundException, SQLException, FileNotFoundException, DocumentException  {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", "");
        Statement st = con.createStatement(); 
        ResultSet rs = st.executeQuery("SELECT * FROM orders");
        ResultSetMetaData rsmd = rs.getMetaData();
        int colno = rsmd.getColumnCount();
        int rowno = 0;
        while(rs.next())    {
            rowno = rowno + 1;
        }
        rs.first();
        
        Document d = new Document();
        PdfWriter.getInstance(d, new FileOutputStream("report.pdf"));
        PdfPTable pt = new PdfPTable(colno);
        d.open();
        d.add(new Paragraph("Report Sales"));
        
        // Set table properties
        pt.setWidthPercentage(100);
        pt.setSpacingBefore(10f);
        pt.setSpacingAfter(10f);

        // Set table header style
        Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE);
        PdfPCell headerCell;
        for (int i = 1; i <= colno; i++) {
            headerCell = new PdfPCell(new Phrase(rsmd.getColumnName(i), headerFont));
            headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            headerCell.setBackgroundColor(BaseColor.GRAY);
            pt.addCell(headerCell);
        }

        // Set table data style
        Font dataFont = FontFactory.getFont(FontFactory.HELVETICA, 10);
        PdfPCell dataCell;
        for (int i = 0; i < rowno; i++) {
            for (int j = 1; j <= colno; j++) {
                dataCell = new PdfPCell(new Phrase(rs.getString(j), dataFont));
                dataCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                pt.addCell(dataCell);
            }
            rs.next();
        }
        
        d.add(pt);
        d.close();
    }
}
