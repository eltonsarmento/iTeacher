

	<section class="container">

		<section class="row">

			<section class="col-lg-12 col-sm-12 col-xs-12">

				<h1 class="text-center">Login</h1>

				<section class="panel panel-dark form-login">

					<section class="panel-body">

						{if $msg_error}
	                    <!-- ERROR -->                        
	                    <div class="alert alert-danger">
	                        {$msg_error} <strong>=(</strong>
	                    </div>
	                    {/if}

	                    {if $msg_success}
	                    <!-- SUCCESS -->                        
	                    <div class="alert alert-success">
	                        {$msg_success} <strong>=D</strong>
	                    </div>
	                    {/if}

						<form action="" method="post">
                        	<input type="hidden" value="1" name="enviar" />

							<section class="form-group">

								<label>Seu e-mail</label>

								<input type="text" name="email" class="form-control">

							</section><!-- /.form-group -->

							<section class="form-group">

								<label>Sua senha</label>

								<input type="password" name="senha" class="form-control">

							</section><!-- /.form-group -->

							<section class="form-group">

								<button class="btn btn-dark btn-block">Login</button>

							</section><!-- /.form-group -->



						</form>

					</section><!-- /.panel-body -->

				</section><!-- /.panel -->

				<h3 class="text-center">ou Cadastre-se</h3>
				<section class="panel panel-dark form-login">
				<a href="{$url_portal}portal/conta/cadastro" class="btn btn-dark btn-block">Criar Conta</a>
			</section>
				<!--
				<section class="panel panel-dark form-login">

					<section class="panel-body">

						<form>

							<section class="form-group">

								<label>Seu nome</label>

								<input type="text" class="form-control">

							</section>

							<section class="form-group">

								<label>Seu e-mail</label>

								<input type="text" class="form-control">

							</section>/.form-group

							<section class="form-group">

								<label>Sua senha</label>

								<input type="text" class="form-control">

							</section>

							<section class="form-group">

								<button class="btn btn-dark btn-block">Criar conta</button>

							</section>
						</form>

					</section> 

				</section> -->

			</section><!-- /.col-lg-12 -->

		</section><!-- /.row -->

	</section><!-- /.container -->