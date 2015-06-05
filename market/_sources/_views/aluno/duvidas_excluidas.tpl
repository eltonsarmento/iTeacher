        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Dúvidas</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <a href="{$admin_url}/duvidas/pendentes/" class="btn btn-warning"><i class="fa fa-question"></i> Dúvidas pendentes</a>
                        <a href="{$admin_url}/duvidas/listar/" class="btn btn-success"><i class="fa fa-check"></i> Dúvidas respondidas</a>
                        <a href="{$admin_url}/duvidas/excluidos/" class="btn btn-danger"><i class="fa fa-trash-o"></i> Dúvidas excluídas</a>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="chat-room">
                            
                            <aside class="left-side">
                                
                                <section class="user-head">
                                    
                                    <i class="fa fa-comment"></i>
                                    <h3>Dúvidas excluídas</h3>
                                    
                                </section>
                                
                                <ul class="chat-list">
                                    
                                    <section class="view-chat">
                                        {if empty($duvidas)}
                                            <a href="#">
                                                <li class="active">
                                                    <span><strong>SEM MENSAGENS</strong></span>
                                                </li>
                                            </a>
                                        {else}
                                            {foreach item=duvidaLateral from=$duvidas}
                                                <li {if $duvidaLateral.id == $duvida_selecionada} class="active"  {elseif $duvidaLateral.mensagem.lido == 0 && $duvidaLateral.mensagem.remetente_id != $usuario_id}  {/if}>
                                                    <a href="{$admin_url}/duvidas/excluidos/{$duvidaLateral.id}">
                                                        <span>{$duvidaLateral.titulo}</span><br>
                                                        <small><i>{$duvidaLateral.aluno.nome}</i>- <strong>{$duvidaLateral.curso.curso}</strong></small>
                                                    </a> 
                                                </li>
                                            {/foreach}
                                        {/if}        
                                    </section>

                                </ul>
                            
                            </aside>
                            {if $duvida.id}
                            <aside class="mid-side">
                                
                                <section class="chat-room-head">
                                    
                                    <h3>{$duvida.titulo} - <strong>{$duvida.curso.curso}</strong></h3>
                                    
                                </section>
                                
                                <section class="view-chat">

                                    <section class="panel-body profile-activity">
                                        {foreach item=mensagem from=$duvida.mensagens}
                                        <section class="activity {if $mensagem.aluno} alt {/if}">

                                            <span><img src="{$url_site}market/uploads/avatar/{$mensagem.remetente.avatar}" width="45" class="img-circle"></span>

                                            <section class="activity-desk">

                                                <section class="panel">

                                                    <section class="panel-body">

                                                        <div class="arrow"></div>

                                                        <h4>{$mensagem.remetente.nome} - <small><i class=" fa fa-clock-o"></i> {$mensagem.data|date_format:"%d/%m/%Y"}</small></h4>
                                                        
                                                        <p>{$mensagem.comentario}</p>
                                                    
                                                    </section>

                                                </section>
                                            
                                            </section>
                                        
                                        </section>
                                        {/foreach}
                                    </section>
                                    
                                </section>
                                
                            </aside>
                            {/if}
                        </section>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
       