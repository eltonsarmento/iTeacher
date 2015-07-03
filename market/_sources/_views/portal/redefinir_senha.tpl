
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
        
        <form class="form-signin" method="post" action="">
          <input type="hidden" name="logar" value="1"/>
          <input type="hidden" name="usuario_id" value="{$usuario.id}"/>          
          
        <h2 class="form-signin-heading">
            
            <img class="logo-iteacher" src="{$url_site}market/common/market/img/logo-iteacher-small.png" alt="iTeacher">    
        
        </h2>
            
        <section class="login-wrap">
            {if $mensagem_erro}<p style="text-align:center;">{$mensagem_erro}</p>{/if}
            {if $mensagem_sucesso}
            	<p class="alert alert-success" style="text-align:center;">{$mensagem_sucesso}</p>
            	<a class="btn btn-lg btn-logins btn-block" href="{$url_site}market/" >Logar</a>
            {else}
	           	<input type="hidden" value="1" name="editar"/>

	            <p style="text-align:center;">
	            	<strong>
	            		Alteraçao de Senha <br>
	  					Usuário: {$usuario.nome}
	  				</strong>
	  			</p>

	            <input type="password" class="form-control" name="senha" placeholder="Nova Senha" autofocus>
	            
	            <input type="password" class="form-control" name="senha2" placeholder="Confirme a Nova Senha">
	            
	            
	            <button class="btn btn-lg btn-login btn-block" type="submit">Salvar</button>
            {/if}

       </section><!-- /login-wrap -->

          
            
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