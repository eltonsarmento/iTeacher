function envio() {
    $('#btnEnvio').ajaxStart(function(){ 
        $(this).text("Enviando...");
    });
    
    var nome = $('#nome').val();
    var email = $('#email').val();
    var telefone = $('#telefone').val();
    var descricao = $('#descricao').val();
    
    $.post('../api/send.php', { 
            nome: nome,
            email: email,
            telefone: telefone,
            descricao: descricao,
            contato: true 
        },

        function(data, textStatus) {
            jQuery('#btnEnvio').text("Mensagem enviada com sucesso!");
        }
    );
    
   return false;
    
}