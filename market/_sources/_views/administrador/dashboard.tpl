<section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row state-overview">
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo de Estatísticas</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-briefcase"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$instituicoes}</h1>
                                <p>Instituições</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-users"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$professores_autonomos}</h1>
                                <p>Professores</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-user"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$alunos}</h1>
                                <p>Alunos</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo Financeiro</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol green"><i class="fa fa-dollar"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">R$ {$valor_instituicoes}</h1>
                                <p>Valores do mês - Instituições</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol red"><i class="fa fa-dollar"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">R$ {$saldo_professores}</h1>
                                <p>Vendas do mês - Professores</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol yellow"><i class="fa fa-dollar"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">R$ {$vendas_professores}</h1>
                                <p>Líquido - Professor</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo do Ranking</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading">
                                
                                <strong>Top Curso</strong>
                                
                                <span class="tools pull-right">

                                    <a href="{$admin_url}/ranking/listar"><i class="fa fa-plus"></i> Ver todos</a>

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

                                    <a href="{$admin_url}/ranking/listar"><i class="fa fa-plus"></i> Ver todos</a>

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

                                    <a href="{$admin_url}/ranking/listar"><i class="fa fa-plus"></i> Ver todos</a>

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

                                    <a href="{$admin_url}/ranking/listar"><i class="fa fa-plus"></i> Ver todos</a>

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
