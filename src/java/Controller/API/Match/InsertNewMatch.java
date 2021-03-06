/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.API.Match;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import dal.MatchDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoan
 */
public class InsertNewMatch extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        JsonObject json = new JsonObject();
        json.addProperty("code", 500);
        json.addProperty("Message", "GET method does not allowed on this API endpoint!");
        response.setStatus(500);
        response.getWriter().println(gson.toJson(json).toString());
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        JsonObject json = new JsonObject();
        int orderID = Integer.parseInt(request.getParameter("orderID"));

        MatchDBContext matchDB = new MatchDBContext();
        int matchID = matchDB.insertNewMatch(orderID);
        if (matchID != -1) {
            json.addProperty("Code", 200);
            json.addProperty("MatchID", matchID);
            json.addProperty("Message", "Match inserted successfully!");
            response.setStatus(200);
            response.getWriter().println(gson.toJson(json).toString());
        } else {
            json.addProperty("Code", 500);
            json.addProperty("Message", "An error occurred when inserting match!");
            response.setStatus(500);
            response.getWriter().println(gson.toJson(json).toString());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
