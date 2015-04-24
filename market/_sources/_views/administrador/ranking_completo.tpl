
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/ranking/listar">Ranking</a></li>
                            <li class="active">Ver todos - Top {if $tipo eq 'curso'}Curso{elseif $tipo eq 'aluno'}Aluno{elseif $tipo eq 'professor'}Professor{elseif $tipo eq 'instituicao'}Instituição{/if}</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Top {if $tipo eq 'curso'}Curso{elseif $tipo eq 'aluno'}Aluno{elseif $tipo eq 'professor'}Professor{elseif $tipo eq 'instituicao'}Instituição{/if}</strong></header>
                            
                            <section class="list-group">
                                
                                {foreach from=$ranking item=rank}
                                
                                    {if $rank.posicao_ranking eq 1}
                                    <li class="list-group-item">
                                        <strong>1. {$rank.nome}</strong>
                                        
                                        <span class="pull-right">
                                            
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            
                                        </span>

                                    </li>
                                    {elseif $rank.posicao_ranking eq 2}
                                    <li class="list-group-item">
                                        2. {$rank.nome} 
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>
                                    {elseif $rank.posicao_ranking eq 3}
                                    <li class="list-group-item">
                                        3. {$rank.nome} 
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>  
                                    {elseif $rank.posicao_ranking eq 4}
                                    <li class="list-group-item">
                                        4. {$rank.nome}
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>  
                                    {elseif $rank.posicao_ranking eq 5}
                                    <li class="list-group-item">
                                        5. {$rank.nome}
                                        <span class="pull-right">
                                            <i class="fa fa-star">
                                            </i>
                                        </span>
                                    </li>
                                    {else}
                                    <li class="list-group-item">{$rank.posicao_ranking}. {$rank.nome}</li>
                                    {/if}  

                                {/foreach}
                                
                                
                                
                            </section><!-- /list-group -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        

