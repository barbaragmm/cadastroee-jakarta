<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cadastroee.model.Produto"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listagem de Produtos</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" 
              crossorigin="anonymous">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" 
        crossorigin="anonymous"></script>
    </head>

    <body class="container">

        <h1 class="mt-4">Listagem de Produtos</h1>

        <a href="ServletProdutoFC?acao=formIncluir"
           class="btn btn-primary m-2">
            Novo Produto
        </a>

        <table class="table table-striped">

            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                    <th>Quantidade</th>
                    <th>Preço de Venda</th>
                    <th>Opções</th>
                </tr>
            </thead>

            <tbody>

                <%
                    List<Produto> lista = (List<Produto>) request.getAttribute("lista");

                    if (lista != null) {
                        for (Produto p : lista) {
                %>

                <tr>
                    <td><%= p.getCodigo()%></td>
                    <td><%= p.getNome()%></td>
                    <td><%= p.getQuantidade()%></td>
                    <td><%= p.getPrecoVenda()%></td>
                    <td>
                        <a href="ServletProdutoFC?acao=formAlterar&id=<%= p.getCodigo()%>"
                           class="btn btn-primary btn-sm">
                            Alterar
                        </a>

                        <a href="ServletProdutoFC?acao=excluir&id=<%= p.getCodigo()%>"
                           class="btn btn-danger btn-sm">
                            Excluir
                        </a>
                    </td>
                </tr>

                <%
                        }
                    }
                %>

            </tbody>
        </table>

    </body>
</html>