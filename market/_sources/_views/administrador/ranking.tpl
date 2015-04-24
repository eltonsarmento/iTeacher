      
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Ranking</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading">
                                
                                <strong>Top Curso</strong>
                                
                                <span class="tools pull-right">

                                    <a href="{$admin_url}/ranking/ver-todos-cursos"><i class="fa fa-plus"></i> Ver todos</a>

                                </span>
                            
                            </header>
                            
                            <section class="list-group">
                                
                                {foreach from=$ranking_curso item=curso}
                                
                                    {if $curso.posicao_ranking eq 1}
                                    <li class="list-group-item">
                                        <strong>1. {$curso.curso}</strong>
                                        
                                        <span class="pull-right">
                                            
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            
                                        </span>

                                    </li>
                                    {elseif $curso.posicao_ranking eq 2}
                                    <li class="list-group-item">
                                        2. {$curso.curso} 
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>
                                    {elseif $curso.posicao_ranking eq 3}
                                    <li class="list-group-item">
                                        3. {$curso.curso} 
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>  
                                    {elseif $curso.posicao_ranking eq 4}
                                    <li class="list-group-item">
                                        4. {$curso.curso}
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>  
                                    {elseif $curso.posicao_ranking eq 5}
                                    <li class="list-group-item">
                                        5. {$curso.curso}
                                        <span class="pull-right">
                                            <i class="fa fa-star">
                                            </i>
                                        </span>
                                    </li>
                                    {/if}  

                                {/foreach}  
                                
                            </section><!-- /list-group -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading">
                                
                                <strong>Top Professor</strong>
                                
                                <span class="tools pull-right">

                                    <a href="{$admin_url}/ranking/ver-todos-professores"><i class="fa fa-plus"></i> Ver todos</a>

                                </span>
                            
                            </header>
                            
                            <section class="list-group">
                                
                                {foreach from=$ranking_professor item=professor}
                                
                                    {if $professor.posicao_ranking eq 1}
                                    <li class="list-group-item">
                                        <strong>1. {$professor.nome}</strong>
                                        
                                        <span class="pull-right">
                                            
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            
                                        </span>

                                    </li>
                                    {elseif $professor.posicao_ranking eq 2}
                                    <li class="list-group-item">
                                        2. {$professor.nome} 
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>
                                    {elseif $professor.posicao_ranking eq 3}
                                    <li class="list-group-item">
                                        3. {$professor.nome} 
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>  
                                    {elseif $professor.posicao_ranking eq 4}
                                    <li class="list-group-item">
                                        4. {$professor.nome}
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>  
                                    {elseif $professor.posicao_ranking eq 5}
                                    <li class="list-group-item">
                                        5. {$professor.nome}
                                        <span class="pull-right">
                                            <i class="fa fa-star">
                                            </i>
                                        </span>
                                    </li>
                                    {/if}  

                                {/foreach}
                                
                            </section><!-- /list-group -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading">
                                
                                <strong>Top Aluno</strong>
                                
                                <span class="tools pull-right">

                                    <a href="{$admin_url}/ranking/ver-todos-alunos"><i class="fa fa-plus"></i> Ver todos</a>

                                </span>
                            
                            </header>
                            
                            <section class="list-group">
                                
                                {foreach from=$ranking_aluno item=aluno}
                                
                                    {if $aluno.posicao_ranking eq 1}
                                    <li class="list-group-item">
                                        <strong>1. {$aluno.nome}</strong>
                                        
                                        <span class="pull-right">
                                            
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            
                                        </span>

                                    </li>
                                    {elseif $aluno.posicao_ranking eq 2}
                                    <li class="list-group-item">
                                        2. {$aluno.nome} 
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>
                                    {elseif $aluno.posicao_ranking eq 3}
                                    <li class="list-group-item">
                                        3. {$aluno.nome} 
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>  
                                    {elseif $aluno.posicao_ranking eq 4}
                                    <li class="list-group-item">
                                        4. {$aluno.nome}
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>  
                                    {elseif $aluno.posicao_ranking eq 5}
                                    <li class="list-group-item">
                                        5. {$aluno.nome}
                                        <span class="pull-right">
                                            <i class="fa fa-star">
                                            </i>
                                        </span>
                                    </li>
                                    {/if}  

                                {/foreach}
                                
                            </section><!-- /list-group -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading">
                                
                                <strong>Top Instituição</strong>
                                
                                <span class="tools pull-right">

                                    <a href="{$admin_url}/ranking/ver-todos-instituicoes"><i class="fa fa-plus"></i> Ver todos</a>

                                </span>
                            
                            </header>
                            
                            <section class="list-group">
                                
                                {foreach from=$ranking_instituicao item=instituicao}
                                
                                    {if $instituicao.posicao_ranking eq 1}
                                    <li class="list-group-item">
                                        <strong>1. {$instituicao.nome}</strong>
                                        
                                        <span class="pull-right">
                                            
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            
                                        </span>

                                    </li>
                                    {elseif $instituicao.posicao_ranking eq 2}
                                    <li class="list-group-item">
                                        2. {$instituicao.nome} 
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>
                                    {elseif $instituicao.posicao_ranking eq 3}
                                    <li class="list-group-item">
                                        3. {$instituicao.nome} 
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>  
                                    {elseif $instituicao.posicao_ranking eq 4}
                                    <li class="list-group-item">
                                        4. {$instituicao.nome}
                                        <span class="pull-right">
                                            <i class="fa fa-star"></i> 
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </li>  
                                    {elseif $instituicao.posicao_ranking eq 5}
                                    <li class="list-group-item">
                                        5. {$instituicao.nome}
                                        <span class="pull-right">
                                            <i class="fa fa-star">
                                            </i>
                                        </span>
                                    </li>
                                    {/if}  

                                {/foreach}
                                
                            </section><!-- /list-group -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
