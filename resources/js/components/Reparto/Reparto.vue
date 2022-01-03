<template>
  <div>
    <h1>Gestionar Reparto</h1>
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
              <label for="nombre">Nombres</label>
              <input v-model="reparto.nombre" type="text" class="form-control" id="nombre" placeholder="Nombre">
            </div>

            <div class="my-4">
              <label for="descripcion">Descripcion</label>
              <input v-model="reparto.descripcion" type="text" class="form-control" id="descripcion" placeholder="Descripcion">
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
  
    <table class="table table-striped table-hover">
      <thead class="thead-dark">
        <tr>
          <th scope="col" class="text-center">#</th>
          <th scope="col">Nombre</th>
          <th scope="col" >Descripcion</th>
          <th scope="col" colspan="2" class="text-center">Accion</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="repart in repartos.data" :key="repart.id">
          <th scope="row" class="text-center">{{ repart.id }}</th>
          <td scope="row" >{{ repart.nom_reparto }}</td>
          <td scope="row" >{{ repart.desc_reparto }}</td>
          <td scope="row" class="text-center">
            <button @click="modificar=true; abrirModal(repart);" class="btn btn-warning">Editar</button>
          </td>
          <td scope="row" class="text-center">
            <button @click="eliminar(repart.id)" class="btn btn-danger">
              Eliminar
            </button>
            </td>
        </tr>
      </tbody>
    </table>

    <nav>
			<ul class="pagination">
				<li v-if="pagination.current_page > 1">
					<a href="#" @click.prevent="changePage(pagination.current_page - 1)">
						<span>Atras</span>
					</a>
				</li>

				<li v-for="page in pagesNumber" v-bind:class="[ page == isActived ? 'active' : '']">
					<a href="#" @click.prevent="changePage(page)">
						@{{ page }}
					</a>
				</li>

				<li v-if="pagination.current_page < pagination.last_page">
					<a href="#" @click.prevent="changePage(pagination.current_page + 1)">
						<span>Siguiente</span>
					</a>
				</li>
			</ul>
		</nav>
    <div class="col-sm-5">
		<pre>
			@{{ $data }}
		</pre>
	</div>
  </div>
</template>

<script>
export default {
  data() { 
    return {
      reparto:{  },
      id:0,
      modificar:true,
      modal:0,
      tituloModal:'',
      repartos: [],
      pagination: {
			'total': 0,
            'current_page': 0,
            'per_page': 0,
            'last_page': 0,
            'from': 0,
            'to': 0
		},
    newKeep: '',
		fillKeep: {'id': '', 'keep': ''},
		errors: '',
		offset: 3,
    };
  },

  computed: {
		isActived: function() {
			return this.pagination.current_page;
		},
		pagesNumber: function() {
			if(!this.pagination.to){
				return [];
			}

			var from = this.pagination.current_page - this.offset; 
			if(from < 1){
				from = 1;
			}

			var to = from + (this.offset * 2); 
			if(to >= this.pagination.last_page){
				to = this.pagination.last_page;
			}

			var pagesArray = [];
			while(from <= to){
				pagesArray.push(from);
				from++;
			}
			return pagesArray;
		}
	},


  methods: {

    

    async listar() {
     const res = await axios.get('http://127.0.0.1:8000/api/reparto/');
     this.repartos = res.data;
    },
    async eliminar(id) {
      const res = await axios.delete('http://127.0.0.1:8000/api/reparto/' + id);
      //console.log(id)
      this.listar();
    },
    async guardar() {
      
      if(this.modificar){
        
        const res = await axios.put('http://127.0.0.1:8000/api/reparto/' + this.id, { 
          
          'nom_reparto': this.reparto.nombre,
          'desc_reparto': this.reparto.descripcion,

         });
        
      }else{
        
        const res = await axios.post('http://127.0.0.1:8000/api/reparto/', { 
         
          'id': this.update,
          'nom_reparto': this.reparto.nombre,
          'desc_reparto': this.reparto.descripcion,
         
         });
      }
      this.cerrarModal();
      this.listar();
    },
    abrirModal(data={}){
      this.modal=1;
      if(this.modificar){
        this.id=data.id;
        this.tituloModal="Modificar Reparto";
        this.reparto.nombre=data.nom_reparto;
        this.reparto.descripcion=data.desc_reparto;
      }else{
        this.id=0;
        this.tituloModal="Crear Reparto";
        this.reparto.nombre='';
        this.reparto.descripcion='';
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