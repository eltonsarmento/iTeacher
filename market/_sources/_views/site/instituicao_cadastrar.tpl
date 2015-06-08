

    <div class="breadcrumbs">
       
        <div class="container">
           
            <div class="row">
               
                <div class="col-lg-12 col-sm-12">
                   
                    <h1 class="text-center">Instituição</h1>
                    
                </div><!-- /col-lg-12 -->
                
            </div><!-- /row -->
            
        </div><!-- /container -->
        
    </div><!-- /breadcrumbs -->
    
    <div class="instituicao">
		
		<div class="container">
		
			<div class="text-center feature-head">
				<br>
				<h1>Pré-cadastro</h1>
				<p>Professional html Template Perfect for Admin Dashboard</p>

			</div><!-- /feature-head -->
		
		</div><!-- /container -->
		
		 
		<form class="form-horizontal tasi-form" method="post" action="" >
             <input type="hidden" value="0" name="nova" id="nova" />
             <input type="hidden" value="1" name="cadastrar" id="cadastrar" />
         	           
			{if $msg_error}
             <div class="alert alert-danger">{$msg_error}</div>
         	{/if}
         	{if $msg_sucesso}
             <div class="alert alert-success">{$msg_sucesso}</div>
         	{/if}
			<div class="form-group">
				<label>Plano: </label>
				<input type="text" placeholder="Plano" class="form-control" value="{$plano.plano}" disabled="disabled">
				<input type="hidden" value="{$plano.id}" id="plano" name="plano" require>
				<br/>
				<input type="text" placeholder="Nome" class="form-control" value="{$nome}" id="nome" name="nome" require>
				
				<input type="text" placeholder="Razão Social" class="form-control" value="{$razao_social}" id="razao_social" name="razao_social" require>
				
				<input type="text" placeholder="CNPJ" class="form-control" value="{$cnpj}" id="cnpj" name="cnpj" require>
				
				<input type="email" placeholder="E-mail" class="form-control" value="{$email}" id="email" name="email" require>
				
				<input type="password" placeholder="Senha" class="form-control" value="{$senha}" id="senha" name="senha" require>
				
			</div><!-- /form-group -->
			
			<div class="checkbox">
			
				<label>
				
					<input type="checkbox" name="termo" {if $termo}checked="checked"{/if} id"termo" > Li e concordo com os <a href="#">Termos e Condições</a>.
					
				</label>
				
		  	</div>
		  	
		  	<div class="form-group">
				
				<button type="submit" class="btn btn-success btn-block">Pré-cadastro!</button>
				
			</div><!-- /form-group -->		  	
			
		</form>
		
	</div><!-- /instituicao -->

    