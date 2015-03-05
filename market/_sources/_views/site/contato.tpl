<div class="breadcrumbs">
	
		<div class="container">
		
			<div class="row">
			
				<div class="col-lg-4 col-sm-4">
				
					<h1>Contato</h1>
					
				</div><!-- /col-lg-4 -->
				
				<div class="col-lg-8 col-sm-8">
				
					<ol class="breadcrumb pull-right">

						<li><a href="#">Home</a></li>
						<li class="active">Contato</li>

					</ol>
				
				</div><!-- /col-lg-8 -->
				
			</div><!-- /row -->
			
		</div><!-- /container -->
		
	</div>

	<div class="container">

		<div class="row">
		
			<div class="col-lg-5 col-sm-5 address">
			
				<p>
				
					<strong>Telefone</strong> <br/>
					<span class="muted">(82) 3034-5153</span><br/>
					<strong>E-mail</strong> <br/>
					<span class="muted">contato@iteacher.com.br</span>
					
				</p>
				
			</div><!-- /col-lg-5 -->
			
			<div class="col-lg-7 col-sm-7 address">
			
				<h4>Envie uma mensagem</h4>
			
				<div class="contact-form">
				
					<form class="form-horizontal tasi-form" method="post" action="" >
			             <input type="hidden" value="0" name="nova" id="nova" />
			             <input type="hidden" value="1" name="contato" id="contato" />
			         	           
						{if $msg_error}
			             <div class="alert alert-danger">{$msg_error}</div>
			         	{/if}
			         	{if $msg_sucesso}
			             <div class="alert alert-success">{$msg_sucesso}</div>
			         	{/if}

						<div class="form-group">
						
							<label>Name</label>
							<input type="text" class="form-control" id="nome" name="nome" placeholder="" require >
							
						</div>
						
						<div class="form-group">
						
							<label>E-mail</label>
							<input type="email" class="form-control" id="" placeholder="" name="email" require >
							
						</div>
						
						<div class="form-group">
						
							<label>Telefone</label>
							<input type="text" class="form-control" id="" name="telefone" require>
							
						</div>
						
						<div class="form-group">
						
							<label>Mensagem</label>
							<textarea class="form-control" rows="5" name="mensagem" placeholder=""></textarea>
							
						</div>
						
						<button type="submit" class="btn btn-danger">Enviar</button>
						
					</form>
					
				</div><!-- /contact-form -->
			
			</div><!-- /col-lg-7 -->
		
		</div><!-- /row -->

	</div><!-- /container -->

	
