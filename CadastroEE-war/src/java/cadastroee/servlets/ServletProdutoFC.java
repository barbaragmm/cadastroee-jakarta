package cadastroee.servlets;

import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class ServletProdutoFC extends HttpServlet {

    @EJB
    ProdutoFacadeLocal facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        String destino = "ProdutoLista.jsp";

        if (acao == null || acao.equals("listar")) {

            List<Produto> lista = facade.findAll();
            request.setAttribute("lista", lista);
            destino = "ProdutoLista.jsp";
        } else if (acao.equals("formIncluir")) {

            destino = "ProdutoDados.jsp";
        } else if (acao.equals("formAlterar")) {

            String idStr = request.getParameter("id");

            if (idStr != null && !idStr.isEmpty()) {
                Integer id = Integer.parseInt(idStr);
                Produto p = facade.find(id);
                request.setAttribute("produto", p);
            }

            destino = "ProdutoDados.jsp";
        } else if (acao.equals("excluir")) {

            String idStr = request.getParameter("id");

            if (idStr != null && !idStr.isEmpty()) {
                Integer id = Integer.parseInt(idStr);
                Produto p = facade.find(id);

                if (p != null) {
                    facade.remove(p);
                }
            }

            List<Produto> lista = facade.findAll();
            request.setAttribute("lista", lista);
            destino = "ProdutoLista.jsp";
        } else if (acao.equals("alterar")) {

            String idStr = request.getParameter("id");

            if (idStr != null && !idStr.isEmpty()) {

                Integer id = Integer.parseInt(idStr);
                Produto p = facade.find(id);

                if (p != null) {

                    String nome = request.getParameter("nome");
                    String quantidadeStr = request.getParameter("quantidade");
                    String precoStr = request.getParameter("precoVenda");

                    p.setNome(nome);

                    if (quantidadeStr != null && !quantidadeStr.isEmpty()) {
                        p.setQuantidade(Integer.parseInt(quantidadeStr));
                    }

                    if (precoStr != null && !precoStr.isEmpty()) {
                        p.setPrecoVenda(Float.parseFloat(precoStr));
                    }

                    facade.edit(p);
                }
            }

            List<Produto> lista = facade.findAll();
            request.setAttribute("lista", lista);
            destino = "ProdutoLista.jsp";
        } else if (acao.equals("incluir")) {

            Produto p = new Produto();

            String idStr = request.getParameter("id");
            String nome = request.getParameter("nome");
            String quantidadeStr = request.getParameter("quantidade");
            String precoStr = request.getParameter("precoVenda");

            if (idStr != null && !idStr.isEmpty()) {
                p.setCodigo(Integer.parseInt(idStr));
            }

            p.setNome(nome);

            if (quantidadeStr != null && !quantidadeStr.isEmpty()) {
                p.setQuantidade(Integer.parseInt(quantidadeStr));
            }

            if (precoStr != null && !precoStr.isEmpty()) {
                p.setPrecoVenda(Float.parseFloat(precoStr));
            }

            facade.create(p);

            List<Produto> lista = facade.findAll();
            request.setAttribute("lista", lista);
            destino = "ProdutoLista.jsp";
        }

        RequestDispatcher rd = request.getRequestDispatcher(destino);
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
