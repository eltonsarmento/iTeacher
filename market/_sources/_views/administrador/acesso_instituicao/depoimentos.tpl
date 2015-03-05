        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Depoimentos</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Gerenciar Depoimentos</strong></header>
                            
                            <section class="panel-body">
                                {foreach from=$depoimentos key=k item=depoimento}
                                <article class="media">
                                    
                                    <a class="pull-left thumb p-thumb"><img src="{$url_site}market/uploads/avatar/{$depoimento.aluno.avatar}"></a>
                                    
                                    <section class="media-body">
                                        
                                        <a class="cmt-head">{$depoimento.aluno.nome}</a>
                                        <p><i class="fa fa-clock-o"></i> {$depoimento.tempo_cadastrado}</p>
                                        
                                        <p>{$depoimento.mensagem}</p>
                                    
                                    </section><!-- /media-body -->
                                    
                                </article><!-- /media -->
                                
                                <hr/>
                                {/foreach}
                                
                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
