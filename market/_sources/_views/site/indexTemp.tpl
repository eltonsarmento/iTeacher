<!DOCTYPE html>
<html lang="pt-br">
<head>
   
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>iTeacher</title>
    
    <!-- style css -->
    <link rel="stylesheet" type="text/css" href="{$url_site}market/common/siteTemp/css/style.css">
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
</head>
<body>
    
    <div class="bar-top">
        
        <div class="container">
            
            <div class="row">
                
                <div class="col-lg-12 col-md-12">
                    
                    <div class="logo">

                        <a href="">

                            <img class="img img-responsive" src="{$url_site}market/common/siteTemp/imgs/logo-iteacher.png" >

                        </a>
                   
                    </div><!-- /logo -->
                   
                </div><!-- /col-lg-12 -->

            </div><!-- /row -->
            
        </div><!-- /container -->
    
    </div><!-- /bar-top -->


<main class="main">

        <div class="container">

            <div class="row">
                
                <div class="col-lg-7 col-md-12 col-sm-12 col-xs-12">
                    
                    <div class="text">
                       
                        <h1>A plataforma EAD que trabalha por você!<strong></strong></h1>
                        
                        <p>Faça o pré-cadastro para utilizar a melhor plataforma EAD já lançada no mercado!</p>
                        
                        <ul>
                            <li>Liberação e bloqueio automático de pedidos sem necessidade alguma de intervenção humana;</li>
                            <li>Gerenciamento de cursos, aulas e questionários com certificado automático;</li>
                            <li>Plataforma totalmente responsiva (funciona em qualquer tablet, pc ou smartphone);.</li>
                            <li>Relatórios de vendas em tempo real e opção para parceiros revenderem seus cursos;</li>
                            <li>E muitos outros recursos...</li>
                        </ul>
                        
                    </div><!-- /title -->
                    
                </div><!-- /col-lg-6 -->
                
                <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
                    
                    <div class="cadastro">
                       
                       <header>
                           
                           <h2>Interessado no <strong>iTeacher?</strong></h2>  
                           <p>Preencha o formulário e descreva sua necessidade.</p>
                           {if $msg_alert}
                              <div class="alert alert-danger">{$msg_alert}</div>
                           {elseif $msg_alert_sucesso}
                              <div class="alert alert-success">{$msg_alert_sucesso}</div>
                           {/if}
                       </header>
                                 
                       <form  method="post">
                            <input type="hidden"  value="1" name="enviar">
                          <div class="form-group">
                           
                            <label for="nome">*Nome</label>
                            <input type="text" class="form-control" value="{$formulario.deNome}" name="deNome">
                            
                          </div>
                          
                          <div class="form-group">
                           
                            <label for="e-mail">*E-mail</label>
                            <input type="email" class="form-control" maxlength="30" name="deEmail" value="{$formulario.deEmail}">
                            
                          </div>
                          
                           <div class="form-group">
                           
                            <label for="telefone">Telefone</label>
                            <input type="text" class="form-control" maxlength="15" name="telefone" value="{$formulario.telefone}">
                            
                          </div>
                          
                          <div class="form-group">
                           
                            <label for="descricao">Descreva sua necessidade</label>
                            <input type="text" class="form-control" name="mensagem" value="{$formulario.mensagem}">
                            
                          </div>
                        
                          <button class="btn btn-default" type="submit">Enviar Pré-cadastro</button>
                          
                        </form>
                        
                    </div><!-- /title -->
                    
                </div><!-- /col-lg-6 -->

            </div><!-- /row -->

        </div><!-- /container -->

    </main><!-- /main -->

    <footer></footer>
    
    <!--  jquery js -->
    <!--<script type="text/javascript" src="js/plugins/jquery/jquery.js"></script>-->
    <script src="{$url_site}market/common/siteTemp/js/jquery.js"></script>

    <!-- functions -->
    <!--<script type="text/javascript" src="js/functions.js"></script>-->
    <script type="text/javascript" src="{$url_site}market/common/siteTemp/js/functions.js"></script>    
    
</body>
</html> 