<%@page import="Model.Receitas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ReceitasDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=”pt-br”>
<head>
<link rel="stylesheet" type="text/css" href="Css/style.css"/>
<meta charset="UTF-8">
<title>Receitas</title>
</head>
<body>

<p>
	<a href = "Principal.html"><button class = "btnVoltar">Voltar para o menu principal</button></a>
</p><br><br>
	<%
		try{
			ReceitasDAO receitasDAO = new ReceitasDAO();
			ArrayList<Receitas> lista = receitasDAO.listar();

				out.print("<table>");
				out.print("<thread>");
				out.print("<tr>");
				out.print("<th>Código</th>");
				out.print("<th>Nome</th>");
				out.print("<th>Detalhes</th>");
				out.print("<th>Data</th>");
				out.print("<th>Excluír Receita</th>");
				out.print("<th>Modificar Receita</th>");
				out.print("<tr>");
				out.print("</thread>");

				out.print("<tbody>");
				for(int i = 0; i < lista.size(); i ++){
				out.print("<tr>");
				out.print("<td> " + lista.get(i).getIdReceita() + "</td>");
				out.print("<td> " + lista.get(i).getNome() + "</td>");
				out.print("<td> " + lista.get(i).getDetalhes() + "</td>");
				out.print("<td> " + lista.get(i).getData() + "</td>");
				
				out.print("<td><a href='FormDeletarReceita.jsp?idReceita="
				+ lista.get(i).getIdReceita() + "&nome="
				+ lista.get(i).getNome() + "&detalhes="
				+ lista.get(i).getDetalhes() + "&data="
				+ lista.get(i).getData() + "'> <button class = 'exc' type='button'> Excluír </button> </a></td>");
				
				out.print("<td><a href='FormAlterarReceita.jsp?idReceita="
				+ lista.get(i).getIdReceita() + "&nome="
				+ lista.get(i).getNome() + "&detalhes="
				+ lista.get(i).getDetalhes() + "&data="
				+ lista.get(i).getData() + "'> <button class = 'edt' type='button'> Editar </button> </a></td>");
				
				out.print("</tr>");
				}
				out.print("</tbody>");
				out.print("</table>");

				
				out.print("<a href='FormCadastroReceita.html'><button class='add' > Adicionar  + </button> </a>");

			
		}catch(Exception erro){
			out.print(erro.getMessage());
		}
	
	%>
	<script type="text/javascript" src="confirmacao.js"></script>
</body>
</html>