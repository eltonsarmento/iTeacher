       
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Totais</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row state-overview">
                    
                    <section class="col-lg-12">
                            
                        <section class="panel">
                            
                            <section class="symbol green"><i class="fa fa-briefcase"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">R$ {$totalInstituicoes.total}</h1>
                                <p>Total de Instituições</p>                                
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-6">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-dollar"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">R$ {$totais.total}</h1>
                                <p>Total professor</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-dollar"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">R$ {$totais.liquido}</h1>
                                <p>Total professor Líquido</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <section class="panel-heading">
                                
                                <strong>Instituições A Receber</strong>
                                
                                <span class="tools pull-right">

                                    <a href="{$admin_url}/financeiro/totais-receber"><i class="fa fa-plus"></i> Ver todas</a>

                                </span>
                                
                            </section><!-- /panel-heading -->
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-briefcase"></i> Instituição</th>
                                            <th><i class="fa fa-calendar"></i> Data Pagamento</th>
                                            <th class="hidden-xs"><i class="fa fa-signal"></i> Status</th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$faturasReceber item=fatura}
                                            <tr>
                                                
                                                <td>{$fatura.nome}</td>
                                                <td><strong>{$fatura.data_pagamento|date_format:"%d/%m/%Y"}</strong></td>
                                                <td>
                                                    {if $fatura.status eq 2}
                                                        <span class="label label-primary">Vencimento Próximo</span>
                                                    {elseif $fatura.status eq 3}
                                                        <span class="label label-warning">Vencida</span>
                                                    {elseif $fatura.status eq 4}
                                                        <span class="label label-danger">Bloqueada</span>
                                                    {/if}
                                                
                                                </td>
                                                
                                            </tr>
                                        {/foreach}
                                        
                                        <!-- <tr>
                                            
                                            <td>Cursos IAG</td>
                                            <td><strong>01/04/2014</strong></td>
                                            <td><button class="btn btn-warning btn-xs">Em Atraso</button></td>
                                            
                                        </tr> -->
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen -->
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <section class="panel-heading">
                                
                                <strong>Instituições Pagas</strong>
                                
                                <span class="tools pull-right">

                                    <a href="{$admin_url}/financeiro/totais-pagas"><i class="fa fa-plus"></i> Ver todas</a>

                                </span>
                            
                            </section><!-- /panel-heading -->
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-briefcase"></i> Instituição</th>
                                            <th><i class="fa fa-calendar"></i> Data Pagamento</th>
                                            <th class="hidden-xs"><i class="fa fa-signal"></i> Status</th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$faturasPagas item=fatura}
                                            <tr>
                                                
                                                <td>{$fatura.nome}</td>
                                                <td><strong>{$fatura.data_pagamento|date_format:"%d/%m/%Y"}</strong></td>
                                                <td><span class="label label-success">Paga</span></td>
                                                
                                            </tr>
                                        {/foreach}                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen -->
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        

