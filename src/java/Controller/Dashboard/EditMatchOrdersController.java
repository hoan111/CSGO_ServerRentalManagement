/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Dashboard;

import Controller.Login.BaseAuthController;
import Model.MatchOrder;
import Model.Server;
import dal.MatchDBContext;
import dal.ServerDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoan
 */
public class EditMatchOrdersController extends BaseAuthController {

    private static int rawId = 0;

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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try {
            rawId = Integer.parseInt(request.getParameter("id"));
            MatchDBContext matchDB = new MatchDBContext();
            ServerDBContext serverDB = new ServerDBContext();
            ArrayList<Server> activeServers = serverDB.getActiveServers();
            MatchOrder mo = matchDB.GetMatchOrderByID(rawId);
            request.setAttribute("matchorder", mo);
            request.setAttribute("activeservers", activeServers);
            request.getRequestDispatcher("../../Dashboard/EditMatchOrder.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/match/orders");
        }
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(request.getParameter("orderID"));
        int type = Integer.parseInt(request.getParameter("selectMatchType"));
        double price = Double.parseDouble(request.getParameter("price"));
        String facebook = request.getParameter("facebookLink");
        String comment = request.getParameter("comment");
        int status = Integer.parseInt(request.getParameter("selectMatchStatus"));
        int serverID = Integer.parseInt(request.getParameter("serverAssign"));
        try {
            MatchDBContext matchDB = new MatchDBContext();
            matchDB.updateMatchOrder(rawId, serverID, type, price, status, facebook, comment);
            request.setAttribute("isSuccess", true);
            request.setAttribute("msg", "Server edited successfully!");
            request.getRequestDispatcher("../../Dashboard/EditMatchOrder.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("isSuccess", false);
            request.setAttribute("msg", "Edit server failed because an error occured!");
            request.getRequestDispatcher("../../Dashboard/EditMatchOrder.jsp").forward(request, response);
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
