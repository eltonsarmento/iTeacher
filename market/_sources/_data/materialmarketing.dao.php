<?php
// ===================================================================
class MaterialmarketingDAO {
    // ===============================================================
    protected $system = null;
    // ===============================================================
    public function __construct() {
        $this->system =& getInstancia();        
    }
    // ================================================================
    public function cadastrarMaterial($campos) {
        $this->system->sql->insert('material_marketing_materiais', array(
            'material'          => $campos['material'],
            'descricao'         => $campos['descricao'],
            'link'              => $campos['link'],
            'data_cadastro'     => date('Y-m-d H:i:s'),
            'data_modificacao'  => date('Y-m-d H:i:s'),
            'categoria_id'      => $campos['categoria_id'],
            'excluido'          => 0,
        )); 
    }
    // ================================================================
    public function atualizarMaterial($campos) {

        $this->system->sql->update('material_marketing_materiais', array(
            'material'          => $campos['material'],
            'descricao'         => $campos['descricao'],
            'link'              => $campos['link'],
            'data_cadastro'     => $campos['data_cadastro'],
            'data_modificacao'  => date('Y-m-d H:i:s'),
            'categoria_id'      => $campos['categoria_id'],
            'excluido'          => 0
        ),
        "id='" . $campos['id'] . "'");
    }
    // ===============================================================
    public function getMaterial($id) {                                            
            $query = $this->system->sql->select('*', 'material_marketing_materiais', " id= '" . $id . "'");
            $dado = end($this->system->sql->fetchrowset($query));    
        return $dado;
    }
    // ===============================================================
    public function getMateriais() {                
        
        
        $query = $this->system->sql->select('m.* , mc.categoria as "nome_categoria"', 'material_marketing_materiais m LEFT JOIN material_marketing_categorias mc ON (m.categoria_id = mc.id AND mc.excluido = 0)', 'm.excluido = 0' );
        $materiais  = $this->system->sql->fetchrowset($query);

        //Recupera o tamanho dos arquivos
        foreach ($materiais as $key => $material) {            
            if ($material['link']){
                //$materiais[$key]['tamanho'] = $this->system->func->tamanhoArquivo($material['link']);
            }
        }
        /*$materiais  = $this->system->sql->fetchrowset($this->system->sql->select('*', 'material_marketing_materiais', 'excluido = 0' ));
        
        foreach ($materiais as $key => $material) {
            
            $categoria = end($this->system->sql->fetchrowset($this->system->sql->select('categoria', "material_marketing_categorias", " excluido = '0' AND id = '" . $material['categoria_id'] ."'"))); 
            
            if(!empty($categoria[0])){
                $materiais[$key]['nome_categoria'] = $categoria['categoria'];
            }else{
                $materiais[$key]['nome_categoria'] = "N/a";
            }
            $materiais[$key]['tamanho'] = $this->system->func->tamanhoArquivo($material['link']);
            
        } */          
        
        return $materiais;
    }
    // ===============================================================
    public function getMateriaisPorErros($id_material = "") {
        $sql_extra = "";
        if(!empty($id_material)){
            $sql_extra = "AND m.id = '".$id_material."'";
        }
        $query = $this->system->sql->select('m.id, m.material, m.link, e.descricao, u.nome,  mc.categoria', 'material_marketing_materiais m, material_marketing_erros e , usuarios u , material_marketing_categorias mc ', 'm.id = e.material_id AND u.id = e.usuario_id AND m.categoria_id = mc.id AND e.status = 0 '.$sql_extra.'ORDER BY m.id');
        $materiais  = $this->system->sql->fetchrowset($query);

        $vDescricao = array();
        $cont = 0;
        //Recupera o tamanho dos arquivos
        foreach ($materiais as $key => $material) {  
            if ($materiais[$key]['id'] != $id_atual){                             
                if($id_atual != 0){
                    $materiais[$indece]['quantidade'] = $cont;
                    $materiais[$indece]["descricoes"] = $vDescricao;     
                    $materiaisErros[]  = $materiais[$indece];  
                    unset($vDescricao);
                    $cont = 0;
                }
                $id_atual = $materiais[$key]['id'];
                $indece = $key;                
            }
            $cont++; 
            $vDescricao[$cont]['usuario'] = $material['nome'];
            $vDescricao[$cont]['descricao'] = $material['descricao'];            
                       
        }
        if(count($vDescricao) > 0){
            $materiais[$indece]['quantidade'] = $cont;
            $materiais[$indece]["descricoes"] = $vDescricao;        
            $materiaisErros[]  = $materiais[$indece];  
        }

        //Recupera o tamanho dos arquivos
        foreach ($materiaisErros as $key => $material) {            
            if ($material['link']){
                //$materiaisErros[$key]['tamanho'] = $this->system->func->tamanhoArquivo($material['link']);
            }
        }        
        return $materiaisErros;
    }
    // ================================================================
    public function atualizarMaterialErros($campos) {

        $this->system->sql->update('material_marketing_erros', array(
            'status'            => 1
        ),
        " material_id='" . $campos['id'] . "'");
    }
    // ===============================================================
    public function getMateriaisPorCategoria() {
        $categorias = $this->system->sql->fetchrowset($this->system->sql->select('id, categoria', 'material_marketing_categorias', 'excluido = 0'));

        foreach ($categorias as $key => $categoria) {
            $categorias[$key]['materiais'] = $this->system->sql->fetchrowset($this->system->sql->select('*', 'material_marketing_materiais', 'excluido = 0 AND categoria_id = ' . $categoria['id'] ));      

            //Recupera o tamanho dos arquivos
            foreach ($categorias[$key]['materiais'] as $key2 => $material) {
                if ($material['link'])
                    $categorias[$key]['materiais'][$key2]['tamanho'] = $this->system->func->tamanhoArquivo($material['link']);
            }

        }
        return $categorias;
    }
    // ===============================================================
    public function getCategorias() {
        $categorias = $this->system->sql->fetchrowset($this->system->sql->select('id, categoria', 'material_marketing_categorias', 'excluido = 0','','categoria'));           
        return $categorias;
    }

    public function getMateriaisPorCategoriaDashboard(){
        $categorias = $this->system->sql->fetchrowset($this->system->sql->select('id, categoria', 'material_marketing_categorias', 'excluido = 0 LIMIT 0,4'));
        
        foreach ($categorias as $key => $categoria) {
            $categorias[$key]['materiais'] = $this->system->sql->fetchrowset($this->system->sql->select('*', 'material_marketing_materiais', 'excluido = 0 AND categoria_id = ' . $categoria['id'] ));      

            //Recupera o tamanho dos arquivos
            foreach ($categorias[$key]['materiais'] as $key2 => $material) {
                if ($material['link'])
                    $categorias[$key]['materiais'][$key2]['tamanho'] = $this->system->func->tamanhoArquivo($material['link']);
            }

        }
        return $categorias;   
    }
    // ================================================================
    public function reportarErro($campos) {
        $this->system->sql->insert('material_marketing_erros', array(
            'descricao'     => $campos['descricao'],
            'usuario_id'    => $campos['usuario_id'],
            'material_id'   => $campos['material_id'],
            'data_cadastro' => date('Y-m-d'),
        ));

        return $this->system->sql->nextid();
    }
    // ===============================================================
    public function salvarCategoriaPorId($id, $categoria) {
        if (!$this->system->sql->querycountunit($this->system->sql->select('id', 'material_marketing_categorias', "id= '" . $id. "'")))
            $this->system->sql->insert('material_marketing_categorias', array('id' => $id, 'categoria' => $categoria));
        $this->system->sql->update('material_marketing_categorias', array('categoria' => $categoria), "id='" . $id . "'");
    }
    // ===============================================================    
    public function getCategoriaPorId($id) {
        return $this->system->sql->querycountunit($this->system->sql->select('categoria', 'material_marketing_categorias', "id= '" . $id . "'"));
    }
    // ===============================================================    
    public function deletarCategoria($id){
        $this->system->sql->update('material_marketing_categorias', array('excluido' => 1), "id='". $id ."'");
    }
    // ===============================================================
    public function deletarMarketing($id){
        $this->system->sql->update('material_marketing_materiais', array('excluido' => 1), "id='". $id ."'");   
    }
}
// ===================================================================