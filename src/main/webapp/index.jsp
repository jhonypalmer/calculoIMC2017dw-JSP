<%@page contentType="text/html" import="java.util.*, java.text.*, java.lang.String, java.io" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Calculo de IMC - JSP</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  </head>
  <body>
    <div class="col-md-12">
        <div class="modal-dialog" style="margin-bottom:0">
            <div class="modal-content">
                <div class="panel-heading">
                    <h1 class="panel-title">Cálculo de IMC - JSP</h1>
                </div>
                <div class="panel-body">
                <form name="formulario">
                    <fieldset>
                        <div class="form-group">
                            <label>Altura:</label>
                            <input class="form-control" placeholder="metros" name="altura" type="text" autofocus="">
                        </div>
                        <div class="form-group">
                            <label>Peso:</label>
                            <input class="form-control" placeholder="quilos" name="peso" type="text" autofocus="">
                        </div>
                        <div class="form-group">
                            <label>Sexo:</label>
                            <input class="form-control" placeholder="sexo" name="sexo" type="text" autofocus="">
                        </div>
                        <button class="btn btn-sm btn-success">Calcular</button>
                    </fieldset>
                </form>
            </div>
        </div>
            
<!-- Scriptlet. Código Java na página JSP. -->
<%
    String alturaStr = request.getParameter("altura");
    String pesoStr = request.getParameter("peso");
    String sexo = request.getParameter("sexo");
    float altura = Float.parseFloat(alturaStr);
    float peso = Float.parseFloat(pesoStr);
    float imc = 0;
    imc = peso / (altura * altura);
    
    String mensagem = "";
    String tipoMensagem = "";
     
    if (altura <= 0 && peso <= 0) {
      
        if (sexo == "masculino") {
            if (imc < 20.7) {
                mensagem = "Abaixo do Peso!";
            } else if (imc > 20.7 && imc < 26.4) {
                mensagem = "Peso Normal!";                            
            } else if (imc > 26.4 && imc < 27.8) {
                mensagem = "Acima do Peso!";                            
            } else if (imc > 27.8 && imc < 31.1) {
                mensagem = "Abaixo do Peso Ideal!";                           
            } else if (imc > 31.1) {
                mensagem = "Obeso!!!!";                           
            }
        } else if (sexo == "feminino") {
            if (imc < 19.1) {
                mensagem = "Abaixo do Peso!";
            } else if (imc > 19.1 && imc < 25.8) {
                mensagem = "Peso Normal!";                            
            } else if (imc > 25.8 && imc < 27.3) {
                mensagem = "Acima do Peso!";                            
            } else if (imc > 27.3 && imc < 32.3) {
                mensagem = "Abaixo do Peso Ideal!";                            
            } else if (imc > 32.3) {
                mensagem = "Obeso!!!!";                            
            }
        }
   
    } else {
        mensagem = "Altura ou Peso Inválidos!!!";
    }
            
   
%>

            <!--
String idadeStr = request.getParameter("idade");
int idade = Integer.parseInt(idadeStr);
String mensagem = "";
String tipoMensagem = "";
if (maior(idade)) {
    mensagem = "De Maior! :)";
    tipoMensagem = "success";
} else {
    mensagem = "De Menor! :(";
    tipoMensagem = "warning";
}
-->
      <!-- Utilização de vaviáveis em expressões JSP. -->
      <div class="alert alert-<%=tipoMensagem%>" role="alert" style="margin-top:45px"><%=mensagem%></div>
    </div>
  </body>
</html>