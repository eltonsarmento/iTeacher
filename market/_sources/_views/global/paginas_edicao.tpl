
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/paginas/listar">Páginas</a></li>
                            <li class="active">Editar Página</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                

                {if $msg_alert}
                    <div class="alert alert-danger">{$msg_alert}</div>
                {/if}

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Editar Página - {$pagina.titulo}</strong></header>
                            
                            <section class="panel-body">
                                
                                <section class="row">
                                
                                    <form role="form" method="post" id="formPagina">
                                        <input type="hidden" value="1" name="editar"/>
                                        <input type="hidden" value="{$pagina.id}" name="id"/>                                        
                                        <input type="hidden" value="0" name="nova" id="nova"/>
                                        
                                        <section class="col-lg-12">
                                    
                                            <section id="editor-container">
                                              
                                                <section id="header-editor">
                                                      
                                                    <section id="headerCenter">
                                                              
                                                        <section class="alert alert-info fade in">
                                                                      
                                                            <button type="button" class="close close-sm" data-dismiss="alert"><i class="fa fa-times"></i></button>
                                                                          
                                                            Clique dentro do conteúdo da página para iniciar a edição.
                                                                  
                                                        </section>
                                                  
                                                        <h2 id="sampleTitle" contenteditable="true">{$pagina.titulo}</h2>
                                                  
                                                        <section contenteditable="true" id="conteudo">
                                                      
                                                            <p>{if $pagina.conteudo == '' }Aqui é onde você escreverá sobre esse tema
                                                                {else} {$pagina.conteudo}{/if}
                                                            </p>                                                      
                                                            
                                                        </section><!-- /section --> 
                                                  
                                                    </section><!-- /headerCenter --> 
                                              
                                                </section><!-- /header-editor --> 
        
                                            </section><!-- /editor-container -->  
                                            
                                            <br/>

                                            <!-- Input do conteúdo -->
                                            <input name="conteudoHidden" type="hidden" id="conteudoHidden">

                                            <section class="form-group">
                                                  
                                                <a class="btn btn-success" href="#" id="botaoSalvar" ><i class="fa fa-check-circle"></i> Salvar</a>
                                                <span>ou <a href="{$admin_url}/paginas/listar">voltar a listagem</a></span> 
                                                  
                                            </section><!-- /form-group -->
                                            
                                        </section><!-- /col-lg-12 -->
                                        
                                    </form>
                                    
                                </section><!-- /row --> 
                                
                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->        
    
    </section><!-- /container -->

{literal}
<script type="text/javascript">


$("#botaoSalvar").click(function(e){
    e.preventDefault();
    String.prototype.stripHTML = function() {return this.replace(/<.*?>/g, '');}

    //var conteudo = $('#conteudo').html();   
    var conteudo = $('#conteudo').html().stripHTML();
    $("#conteudoHidden").val(conteudo);

    $('#formPagina').submit();
});

</script>
{/literal}