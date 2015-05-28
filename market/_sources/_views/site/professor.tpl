<div class="breadcrumbs">
       
        <div class="container">
           
            <div class="row">
               
                <div class="col-lg-12 col-sm-12">
                   
                    <h1 class="text-center">Professor</h1>
                    
                </div><!-- /col-lg-12 -->
                
            </div><!-- /row -->
            
        </div><!-- /container -->
        
    </div><!-- /breadcrumbs -->

	<div class="professor">
		
		<div class="container">
		
		    <div class="row">
		    
                <div class="col-lg-6">

                    <div class="text-center feature-head">

                        <h1>Pré-cadastro</h1>
                        

                    </div><!-- /feature-head -->

                    <form method="post" action="" >
			             <input type="hidden" value="0" name="nova" id="nova" />
			             <input type="hidden" value="1" name="cadastrar" id="cadastrar" />
			         	           
						{if $msg_error}
			             <div class="alert alert-danger">{$msg_error}</div>
			         	{/if}
			         	{if $msg_sucesso}
			             <div class="alert alert-success">{$msg_sucesso}</div>
			         	{/if}

						<div class="form-group">
							
							<input type="text"  class="form-control" placeholder="Nome" value="{$nome}"name="nome" require>
							
							<input type="email"  class="form-control" placeholder="E-mail" value="{$email}" name="email" require>
							
							<input type="password"  class="form-control" placeholder="Senha" value="{$senha}" name="senha" require>
							
						</div><!-- /form-group -->
						
						<div class="checkbox">
						
							<label>
							
								<input type="checkbox" name="termo" {if $termo}checked="checked"{/if}> Li e concordo com os <a href="#">Termos e Condições</a>.
								
							</label>
							
					  	</div>
					  	
					  	<div class="form-group">
							
							<button class="btn btn-success btn-block" type="submit">Pré-cadastro!</button>
							
						</div><!-- /form-group -->		  	
						
					</form>

                </div><!-- /col-lg-6 -->

                <div class="col-lg-6">

                     <div class="embed-responsive embed-responsive-16by9">
                          
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/HxWqoiX0Wv8?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
                          
                    </div>

                </div><!-- /col-lg-6 -->
            
            </div><!-- /row -->
		
		</div><!-- /container -->
		
	</div><!-- /professor -->