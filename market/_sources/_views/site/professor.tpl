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
		
			<p class="text-center">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget est egestas ligula blandit mollis. Ut id purus sodales, luctus tortor ut, gravida tortor. Morbi tempor, elit non interdum eleifend, metus enim volutpat ligula, eget auctor urna arcu a enim. Suspendisse ornare enim et arcu pretium pretium. Pellentesque condimentum finibus magna. Phasellus venenatis eget purus sed commodo. Nullam mattis odio nec dapibus dignissim. Mauris tortor nulla, sodales at faucibus ut, gravida a nisl. Aenean porttitor purus eget leo semper, semper rhoncus felis suscipit. Duis suscipit, sem sed vehicula feugiat, sem lorem varius dui, nec elementum eros eros quis diam. Cras sollicitudin risus velit, at pharetra dui volutpat nec. Donec eros elit, mattis sit amet libero vitae, venenatis finibus massa. Vivamus venenatis quam non magna vestibulum rhoncus.</p>
		
			<div class="text-center feature-head">

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
		
	</div><!-- /professor -->