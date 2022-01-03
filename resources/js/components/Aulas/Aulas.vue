<template>
  <div>
    <h1 class="text-center">Gestionar Aula</h1>
    <!-- Button to Open the Modal -->
    <button @click="modificar=false; abrirModal();" type="button" class="btn btn-primary my-4">Nuevo</button>

    <!-- The Modal -->
    <div class="modal" :class="{mostrar: modal}">
      <div class="modal-dialog">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
             <h4 class="modal-title">{{tituloModal}}</h4>
            <button @click="cerrarModal();"  type="button" class="close" data-dismiss="modal">
              &times;
            </button> 
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <div class="my-4">
              <label for="nombre">Codigo: </label>
              <input v-model="aula.codigo" type="text" class="form-control" id="codigo" placeholder="Codigo del Aula">
            </div>

            <div class="my-4">
              <label for="numero">Número del Aula: </label>
              <input v-model="aula.numero" type="text" class="form-control" id="numero" placeholder="Número del Aula">
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
              <button @click="cerrarModal();" type="button" class="btn btn-secondary" data-dismiss="modal">
                Cancelar
              </button>
              <button  @click="guardar();" type="button" class="btn btn-success" data-dismiss="modal">
                Guardar
              </button>
            </div>
        </div>
      </div>
    </div>
  </div>

     <table class="table table-striped">
      <thead class="thead-dark">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Codigo</th>
          <th scope="col">Numero</th>
          <th scope="col" colspan="2" class="text-center">Accion</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="aul in aulas.data" :key="aul.id">
          <td scope="row">{{ aul.id }}</td>
          <td>{{ aul.cod_aul }}</td>
          <td>{{ aul.num_aul }}</td>
          <td>
            <button  @click="modificar=true; abrirModal(aul);" class="btn btn-warning">Editar</button>
          </td>
          <td>
            <button @click="eliminar(aul.id)" class="btn btn-danger">
              Eliminar
            </button>
          </td>
        </tr>
      </tbody>
    </table>
    
      <nav> 
          <ul class="pagination justify-content-center ">
             <li class="page-item disabled">
             
              <a href="#" class="page-link "  @click="pagination.page=1; listar();">&laquo;</a>
              </li>
             
             <li class="page-item"><a href="#" class="page-link"   @click="pagination.page--; listar();">&lt;</a>
             </li>
              
              <li class="page-item" > <a href="#" class="page-link"  @click="pagination.page=5; listar();">1</a>
              </li>
              
              <li class="page-item"><a href="#" class="page-link"  @click="pagination.page++; listar();">&gt;</a>
              </li>
             
              <li class="page-item "><a href="#" class="page-link"  @click="pagination.page=last_page; listar();">&raquo;</a>
              </li>
           </ul>
       </nav>    

    
      </div>
    </div>
  
   </div>
</template>

<script>
  export default {
  data() {
    return {
      aula:{  },
      id:0,
      modificar:true,
      modal:0,
      tituloModal:'',
      aulas: [],
      pagination:{
      page:1,
      per_page:2,



      }
    };
  },
  methods: {
    async listar() {
      const res = await axios.get('/api/aula', {params: this.pagination});
      this.aulas = res.data;
    },
    async eliminar(id) {
      const res = await axios.delete('http://127.0.0.1:8000/api/aula/' + id);
      this.listar();
    },
    async guardar() {
      if(this.modificar){
        const res = await axios.put('http://127.0.0.1:8000/api/aula/'+ this.id, { 
          
          'cod_aul': this.aula.codigo,
          'num_aul': this.aula.numero,

         });

      }else{
        const res = await axios.post('http://127.0.0.1:8000/api/aula/', { 
         
          'id': this.update,
          'cod_aul': this.aula.codigo,
          'num_aul': this.aula.numero,
         
         });
      }
      this.cerrarModal();
      this.listar();
    },
    abrirModal(data={}){
      this.modal=1;
      if(this.modificar){
        this.id=data.id;
        this.tituloModal="Modificar Aula";
        this.aula.codigo=data.cod_aul;
        this.aula.numero=data.num_aul;
      }else{
        this.id=0;
        this.tituloModal="Crear Aula";
        this.aula.codigo='';
        this.aula.numero='';
      }
    },
    cerrarModal(){
      this.modal=0;
    },
  },
  created() {
    this.listar();
  },
};
</script>

<style>
  .mostrar{
    display: list-item;
    opacity: 1;
    background: rgba(75, 56, 143, 0.705);
  } 
</style>