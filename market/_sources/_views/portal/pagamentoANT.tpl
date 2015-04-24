    
        <section class="container">
            
            <section class="page">


                <section class="page-title">
                    <h1>Pagamento</h1>
                    <p>Qual a melhor forma de pagamento?</p>
                </section><!--.page-title-->

                <section class="page-content">
                    <section class="payment-content">
                        <h1 class="payment-title">Seu pedido</h1>
                        <section class="payment-info">
                            <table cellspacing="0">

                                <thead>
                                    <tr>
                                        <th align="left">Curso</th>
                                        <th align="left">Preço</th>
                                        <th align="left">Total</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    {foreach item=produto key=k from=$produtos}
                                    <tr>
                                        <td align="left">
                                            {if $produto.tipo == 'curso'}
                                            <a href="{$url_portal}portal/curso/{$produto.url}">{$produto.produto}</a>
                                            {else}
                                            <a href="{$url_portal}portal/assinaturas/">{$produto.produto}</a>
                                            {/if}
                                        </td>
                                        <td align="left">R$ {$produto.preco}</td>
                                        <td align="left">R$ {$produto.precoTotal}</td>
                                    </tr>
                                    {/foreach}
                                    <tr>

                                        <td align="right" colspan="2">Subtotal:</td>
                                        <td align="right" colspan="2"><strong>R$ {$total}</strong></td>

                                    </tr>

                                </tbody>

                            </table>

                        </section><!--.payment-info-->

                        <section class="payment-info-confirm">

                            <span><input type="checkbox" name="check-payment" id="check-termos" value=""><label class="check-payment"></label> <p>Li e concordo com os <a href="{$url_portal}portal/pagina/termos" target="_blank">Termos de Serviços</a></p></span>

                        </section><!--.payment-info-confirm-->

                        <h1 class="payment-title">Formas de Pagamento</h1>

                        <button class="btn btn-orange" onclick="finalizarPagamento();">Finalizar pedido</button>
                        <button class="btn btn-default" onclick="window.location.href='{$url_portal}portal/carrinho/cancelar/'">Cancelar pedido e restaurar carrinho</button>

                    </section><!--.payment-content-->

                </section><!--.page-content-->

            </section><!--.page-->
        
        </section><!--.container-->
        
<div id="retornoPagamento"></div>
<script type="text/javascript" src="{$url_site}lms/common/site/js/tabs.checkout.min.js"></script> 
<script type="text/javascript" src="{$url_site}lms/common/site/js/jquery.mask.js"></script>
<script type="text/javascript" src="{$url_site}lms/common/site/js/jquery.mask.min.js"></script>
<div id="popUp">
    <h1>Você será redirecionado para a pagina de pagamento!</h1><br/>
    <input type="hidden" value="" id="linkEscondido"/>
    <input type="button" value="Clique aqui para continuar!" onclick="abrePaginaPagamento();"/>
</div>
{literal}
<script type="text/javascript">
////// PagSeguro ////
function pagarPagSeguro() {
    $.post('/carrinho/concluirPagSeguro/', function html(html) { $('#retornoPagamento').html(html)});
}

function finalizarPagamento() {
    if ($('#check-termos').is(':checked')) {
        pagarPagSeguro();
    } else {
        alert('Aceite os termos de compromisso!');
    }
    
}

function abrePaginaPagamento() {
    window.open($('#linkEscondido').val(), '_blank');
    {/literal}
    window.location.href='{$url_portal}portal/carrinho/confirmacao';
    {literal}
}

</script>
{/literal}