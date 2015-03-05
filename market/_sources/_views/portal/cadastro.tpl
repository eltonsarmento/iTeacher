

	<section class="container">

		<section class="row">

			<section class="col-lg-12 col-sm-12 col-xs-12">

				<h1 class="text-center">Cadastro</h1>
							
			</section>
				
				<section class="panel panel-dark form-login">

					<section class="panel-body">

						<form action="" method="post" class="form-page">
                        <input type="hidden" value="1" name="editar"/>

                        {if $msgErro}
                        <!-- ERROR -->                        
                        <span class="alert alert-error">
                            {$msgErro} <strong>=(</strong>
                        </span>
                        {/if}

                        {if $msgSucesso}
                        <!-- SUCESSO -->
                        <span class="alert alert-success">
                            {$msgSucesso} <strong>=D</strong>
                        </span>
                        {/if}
                        

                        <section class="form-group">

							<label>Seu nome</label>

							<input type="text"  name="nome" value="{$nome}" class="form-control">

						</section>

						<section class="form-group">

							<label>Seu e-mail</label>

							<input type="text"  name="email" value="{$email}" class="form-control">

						</section>
						
						<section class="form-group">

							<label>Sua senha</label>

							<input type="password"  name="senha" value="" class="form-control">

						</section>


                        <section class="info-confirm">
                            <span><input type="checkbox" name="check" value="" onclick="teste()" id="check"><label class="check"></label> <p>Li e concordo com os <a href="{$url_portal}portal/pagina/index/Termos-e-Condições" target="_blank">Termos de Serviços</a></p></span>
                            <button class="btn btn-dark btn-block"  disabled="disabled" id="cadastro" >Criar Conta</button>                                                        
                        </section><!--.info-confirm-->
						</form>

					</section> 

				</section> 

			</section><!-- /.col-lg-12 -->

		</section><!-- /.row -->

	</section><!-- /.container -->

{literal}
<script type="text/javascript">
//Mascara Telefone    
    
    function teste() {
        if($("#check").prop('checked'))
            $("#cadastro").removeAttr('disabled');
        else
            $("#cadastro").attr('disabled','disabled');
    }

</script>
{/literal}