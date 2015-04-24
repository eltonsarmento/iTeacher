
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="cursos.html">Cursos</a></li>
                            <li class="active">{$curso.curso}</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                {if $msg_alert}
                <section class="row">
                    <section class="col-lg-12">
                        <div class="alert alert-info">{$msg_alert}</div>      
                    </section><!-- /col-lg-12 -->
                </section><!-- /row -->
                {/if}
                
                <section class="row">
                    
                    <section class="col-lg-4">
                    
                        <section class="panel">
                            
                            <section class="panel-heading"><strong>Informações do Curso</strong></section><!-- /panel-heading -->
                            
                            <section class="panel-body">
                            
                                <strong class="text-margin-no">{$curso.curso}</strong>
                                
                                <br><br>
                                
                                <p>{$curso.descricao}</p>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        
                        <section class="panel">
                            
                            <section class="panel-heading"><strong>Informações do Professor</strong></section><!-- /panel-heading -->
                            
                            <section class="panel-body">
                            
                                <aside class="profile-nav alt orange-border">
                                    
                                    <section class="panel">
                                        
                                        <section class="user-heading alt orange-bg">
                                            
                                            <a href="#"><img alt="" src="{$url_site}market/uploads/avatar/{$professor.avatar}"></a>
                                            
                                            <h1>{$professor.nome}</h1>
                                            <p>{$professor.email}</p>
                                            
                                        </section>
        
                                        <section class="panel-body">{if $professor.minicurriculo}{$professor.minicurriculo}{else}Este professor não contém mini curriculo{/if}</section><!-- /panel-body -->
        
                                    </section>
                                    
                                </aside>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-8">
                        
                        <section class="row">
                            
                            <section class="col-lg-2">
                                
                                <section class="panel">
                            
                                    <section class="panel-heading"><strong>Legendas</strong></section><!-- /panel-heading -->
                                    
                                    <section class="panel-body">
                                    
                                        <span class="label label-dark label-full">Visto</span>
                                        <span class="label label-primary label-full">Atual</span>
                                        <span class="label label-white label-full">Não Visto</span>
                                        
                                    </section><!-- /panel-body -->
                                
                                </section><!-- /panel -->
                                
                            </section><!-- /col-lg-2 -->
                            
                            <section class="col-lg-10">
                                
                                <section class="panel">
                            
                                    <section class="panel-heading"><strong>Estatísticas</strong></section><!-- /panel-heading -->
                                    
                                    <section class="panel-body">
                                    
                                        <section class="progress">
                                                    
                                            <section class="progress-bar progress-bar-info"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: {$completo}%">
                                                
                                                <span>{$completo}% Concluído</span>
                                                
                                            </section>
                                            
                                        </section>
                                        
                                        <br>
                                        
                                        <ul class="summary-list">
                                    
                                            <li>

                                                <i class="fa fa-calendar"></i> Data Expiração: <br><strong class="text-danger">{$cursoAluno.expira|date_format:"%d/%m/%Y"}</strong>
                                                      
                                            </li>
                                            
                                            <li>
                                                      
                                                <i class="fa fa-comment"></i> Quiz Respondidos: <br><strong class="text-mutted">{$totalQuizRespondido}</strong>
                                                      
                                            </li>
                                            
                                            <li>
                                                      
                                                 <i class="fa fa-question-circle"></i> Dúvidas Enviadas: <br><strong class="text-mutted">{$totalDuvidas}</strong>
                                                      
                                            </li>
                                            
                                            <li>
                                                      
                                                <i class="fa fa-check-circle"></i> Dúvidas Respondidas: <br><strong class="text-mutted">{$totalDuvidasRespondidas}</strong>
                                                      
                                            </li>
                                            
                                            <li>

                                                <i class="fa fa-clock-o"></i> Último Acesso: <br><strong class="text-primary">{$cursoAluno.ultimo_acesso|date_format:"%d/%m/%Y"}</strong>
                                                      
                                            </li>
                                            
                                        </ul>
                                        
                                    </section><!-- /panel-body -->
                                
                                </section><!-- /panel -->
                                
                            </section><!-- /col-lg-10 -->
                            
                        </section><!-- /row -->
                        <!-- panel-dark - visto -->
                        <!-- panel-primary - atual -->
                        <!-- panel - não visto -->
                        {foreach item=capitulo key=k from=$capitulos}
                            <section class="panel {if $capitulo.status == 1} panel-primary {elseif $capitulo.status == 0} {else} panel-dark {/if}">
                                
                                <section class="panel-heading">
                                    
                                    <strong>Capítulo {$k+1} </strong> - {$capitulo.descricao}
                                    
                                    <span class="tools pull-right">
                                        
                                        <a class="fa fa-chevron-up" href="javascript:;"></a>
                                        
                                    </span>
                                
                                </section><!-- /panel-heading -->
                                
                                <section class="panel-body">         
                                    <ul class="nav nav-pills nav-stacked">
                                        {foreach item=aula key=j from=$capitulo.aulas}
                                            <li {if $aula.aula_id == $aulaAtual}  {elseif $aula.aula_id|in_array:$aulasCompletadas} class="active" {/if}><a href="{$admin_url}/cursos/aula/{$aula.aula_id}">Aula {$j+1} - {$aula.nome} <span class="pull-right text-mutted">{$aula.duracao}</span></a></li>  
                                        {/foreach}
                                    </ul>
                                    
                                </section><!-- /panel-body -->
                            
                            </section><!-- /panel -->
                        {/foreach}
                    </section><!-- /col-lg-8 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
 