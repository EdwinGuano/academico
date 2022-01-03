<template>
  <div>
    <h1 class="text-center">Gestionar Tipo de Sangre</h1>
    <hr />

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
              <label for="nombre">Nombre</label>
              <input v-model="tiposangre.nombre" type="text" class="form-control" id="nombre" placeholder="Nombre del Tipo de Sangre">
            </div>

            <div class="my-4">
              <label for="descripcion">Descripcion</label>
              <input v-model="tiposangre.descripcion" type="text" class="form-control" id="descripcion" placeholder="Descripcion del Tipo de Sangre">
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
          <th scope="col">Nombre</th>
          <th scope="col">Descripcion</th>
          <th scope="col" colspan="2" class="text-center">Accion</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="tpsan in tiposangres.data" :key="tpsan.id">
          <th scope="row">{{ tpsan.id }}</th>
          <td>{{ tpsan.nom_sangre }}</td>
          <td>{{ tpsan.desc_sangre }}</td>
          <td>
            <button  @click="modificar=true; abrirModal(tpsan);" class="btn btn-warning">Editar</button>
          </td>
          <td>
            <button @click="eliminar(tpsan.id)" class="btn btn-danger">
              Eliminar
            </button>
          </td>
        </tr>
      </tbody>
    </table>

    	<nav  aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li  class="page-item disabled">
							<a class="page-link" href="#" tabindex="-1">Previous</a>
						</li>
						<li  class="page-link" href="#" tabindex="-1" @click="getProductos(pagination.prev_page_url)">Previous</a>
						</li>

						<li class="page-link" href="#">@{{ page }}</a>
						</li>
						<li 	class="page-link" href="#" @click="getProductos(pagination.path+'?page='+page)">@{{ page }}</a>
						</li>
						<li class="page-link" href="#">Next</a>
						</li>
						<li 
               <a class="page-link" href="#" >Next</a>
						</li>
					</ul>
				</nav>
    <div class="col-4">
				<h1>Data</h1>
				<pre>
                    @{{ tiposangres}}
                </pre>
			</div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tiposangre:{  },
      id:0,
      modificar:true,
      modal:0,
      tituloModal:'',
      tiposangres: [],
      pagination:{  },
     
    };
    
  },

  mounted() {
    this.listar();
  },
  methods: {
    async listar() {
      const res = await axios.get('http://127.0.0.1:8000/api/tiposangre/');
      this.tiposangres = res.data;
    },
  // //setPaginator:function(data){
    

    async eliminar(id) {
      const res = await axios.delete('http://127.0.0.1:8000/api/tiposangre/' + id);
      this.listar();
    },
    async guardar() {
      if(this.modificar){
        const res = await axios.put('http://127.0.0.1:8000/api/tiposangre/'+ this.id, { 
          
          'nom_sangre': this.tiposangre.nombre,
          'desc_sangre': this.tiposangre.descripcion,

         });

      }else{
        const res = await axios.post('http://127.0.0.1:8000/api/tiposangre/', { 
         
          'id': this.update,
          'nom_sangre': this.tiposangre.nombre,
          'desc_sangre': this.tiposangre.descripcion,
         
         });
      }
      this.cerrarModal();
      this.listar();
    },
    abrirModal(data={}){
      this.modal=1;
      if(this.modificar){
        this.id=data.id;
        this.tituloModal="Modificar Tipo Sangre";
        this.tiposangre.nombre=data.nom_sangre;
        this.tiposangre.descripcion=data.desc_sangre;
      }else{
        this.id=0;
        this.tituloModal="Crear Tipo Sangre";
        this.tiposangre.nombre='';
        this.tiposangre.descripcion='';
      }
    },
    cerrarModal(){
      this.modal=0;
    },
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