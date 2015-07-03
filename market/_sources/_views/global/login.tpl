<!DOCTYPE html>
<html lang="pt-br">
<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keyword" content="">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>iTeacher</title>

    <!-- Bootstrap core CSS -->
      
    <link href="{$url_site}market/common/market/css/bootstrap.min.css" rel="stylesheet">
    <link href="{$url_site}market/common/market/css/bootstrap-reset.css" rel="stylesheet">
      
    <!-- External CSS -->
      
    <link href="{$url_site}market/common/market/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom Styles -->
      
    <link href="{$url_site}market/common/market/css/style.css" rel="stylesheet">
    <link href="{$url_site}market/common/market/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="{$url_site}market/common/market/js/html5shiv.js"></script>
      <script src="{$url_site}market/common/market/js/respond.min.js"></script>
    <![endif]-->
      
</head>

<body class="login-body">

    <section class="container">
        
        <form class="form-signin" method="post" action="{$form_action}">
          <input type="hidden" name="logar" value="1"/>
          
        <h2 class="form-signin-heading">
            
            <img class="logo-iteacher" src="{$url_site}market/common/market/img/logo-iteacher-small.png" alt="iTeacher">    
        
        </h2>
            
        <section class="login-wrap">
             {if $mensagem_erro}<p style="text-align:center;">{$mensagem_erro}</p>{/if}
            <input type="text" class="form-control" name="usuario" placeholder="E-mail" autofocus>
            
            <input type="password" class="form-control" name="senha" placeholder="Senha">
            
            <label class="checkbox">
                
                <input type="checkbox" value="remember-me"> Mantenha-me logado
                
                <span class="pull-right"><a data-toggle="modal" href="#myModal"> Esqueceu a senha?</a></span>
                
            </label>
            
            <button class="btn btn-lg btn-login btn-block" type="submit">Login</button>
            
          </section><!-- /login-wrap -->

          <!-- Modal -->
            
          <section aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
              
              <section class="modal-dialog">
                  
                  <section class="modal-content">
                      
                      <section class="modal-header">
                          
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h4 class="modal-title">Esqueceu a senha?</h4>
                          
                      </section><!-- /modal-header -->
                                                        
                      <section class="modal-body">
                          
                          <p>Digite abaixo seu endereço de e-mail para redefinir sua senha.</p>
                          <br>
                          <div id="retornoModalEsqueceuSenha"></div>
                          <br>
                          <input type="text" id="email" name="email" placeholder="E-mail" autocomplete="off" class="form-control placeholder-no-fix">

                      </section><!-- /modal-body -->
                      
                      <section class="modal-footer">
                          <button data-dismiss="modal" class="btn btn-default" type="button">Cancelar</button>
                          <button class="btn btn-success" onclick="enviarModalLembrarSenha(); return false;">Enviar</button>
                          
                      </section><!-- /modal-footer -->

                  </section><!-- /modal-content -->
                  
              </section><!-- /modal-dialog -->
              
          </section><!-- /modal -->

      </form>

    </section><!-- /container -->

    <!-- JS -->
    
<script src="{$url_site}market/common/market/js/jquery.js"></script>
<script src="{$url_site}market/common/market/js/bootstrap.min.js"></script>


{literal}

<script type="text/javascript">
//Esqueceu senha
function enviarModalLembrarSenha() {  
    $.post('/portal/conta/lembrarSenha/', {enviar: 1, email : $('#email').val()}, function html(html) { 

      $('#retornoModalEsqueceuSenha').html('<p>'+html+'</p>');
    });
}
</script>
{/literal}
</body>
</html>