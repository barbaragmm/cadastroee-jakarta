<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cadastroee.model.Produto"%>

<%
    Produto produto = (Produto) request.getAttribute("produto");
    boolean alterar = (produto != null);
    String acao = alterar ? "alterar" : "incluir";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dados do Produto</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
              crossorigin="anonymous">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
    </head>

    <body class="container mt-4">

        <h1>Dados do Produto</h1>

        <form action="ServletProdutoFC" method="post">

            <input type="hidden" name="acao" value="<%= acao%>"/>

            <% if (alterar) {%>
            <input type="hidden" name="id" value="<%= produto.getCodigo()%>"/>
            <% }%>

            <div class="mb-3">
                <label class="form-label">Nome</label>
                <input type="text"
                       name="nome"
                       class="form-control"
                       value="<%= alterar ? produto.getNome() : ""%>"
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">Quantidade</label>
                <input type="number"
                       name="quantidade"
                       class="form-control"
                       value="<%= alterar ? produto.getQuantidade() : ""%>"
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">Preço de Venda</label>
                <input type="number"
                       step="0.01"
                       name="precoVenda"
                       class="form-control"
                       value="<%= alterar ? produto.getPrecoVenda() : ""%>"
                       required>
            </div>

            <% if (!alterar) { %>
            <div class="mb-3">
                <label class="form-label">Código</label>
                <input type="number"
                       name="id"
                       class="form-control"
                       required>
            </div>
            <% }%>

            <button type="submit" class="btn btn-primary">
                <%= alterar ? "Alterar Produto" : "Adicionar Produto"%>
            </button>

            <a href="ServletProdutoFC?acao=listar" class="btn btn-secondary ms-2">
                Voltar
            </a>

        </form>

    </body>
</html>