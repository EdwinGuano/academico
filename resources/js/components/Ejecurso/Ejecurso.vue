<template>
  <div>
    <h1 class="text-center">Gestionar Eje de Cursos</h1>

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
              <input v-model="ejecurso.nombre" type="text" class="form-control" id="nombre" placeholder="Nombre del Eje de Curso">
            </div>

            <div class="my-4">
              <label for="descripcion">Descripcion</label>
              <input v-model="ejecurso.descripcion" type="text" class="form-control" id="descripcion" placeholder="Descripcion del Eje de Curso">
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
        <tr v-for="ejcur in ejecursos.data" :key="ejcur.id">
          <td>{{ ejcur.id }}</td>
          <td>{{ ejcur.nom_ejecurso }}</td>
          <td>{{ ejcur.desc_ejecurso }}</td>
          <td>
            <button  @click="modificar=true; abrirModal(ejcur);" class="btn btn-warning">Editar</button>
          </td>
          <td>
            <button @click="eliminar(ejcur.id)" class="btn btn-danger">
              Eliminar
            </button>
          </td>
        </tr>
      </tbody>
    </table>
     <pagination :data="ejecursos" @pagination-change-page="getResults"></pagination>
  </div>
</template>

<script>
export default {
  data() {
    return {
      ejecurso:{   },
      id:0,
      modificar:true,
      modal:0,
      tituloModal:'',
      ejecursos: [],
    };
  },
   mounted() {
    this.getResults();
  },
  methods: {

    getResults(page = 1) {
			axios.get('/api/ejecurso?page=' + page)
				.then(response => {
					this.ejecursos = response.data;
				});
		},
   // async listar() {
     // const res = await axios.get('http://127.0.0.1:8000/api/ejecurso');
     // this.ejecurso = res.data;
    //},
    async eliminar(id) {
      
      
      const res = await axios.delete('http://127.0.0.1:8000/api/ejecurso/' + id);
      this.getResults();
    },
    async guardar() {
      if(this.modificar){
        const res = await axios.put('http://127.0.0.1:8000/api/ejecurso/'+ this.id, { 
          
          'nom_ejecurso': this.ejecurso.nombre,
          'desc_ejecurso': this.ejecurso.descripcion,

         });

      }else{
        const res = await axios.post('http://127.0.0.1:8000/api/ejecurso/', { 
         
          'id': this.update,
          'nom_ejecurso': this.ejecurso.nombre,
          'desc_ejecurso': this.ejecurso.descripcion,
         
         });
      }
      this.cerrarModal();
      this.listar();
    },
    abrirModal(data={}){
      this.modal=1;
      if(this.modificar){
        this.id=data.id;
        this.tituloModal="Modificar eje Curso";
        this.ejecurso.nombre=data.nom_ejecurso;
        this.ejecurso.descripcion=data.desc_ejecurso;
      }else{
        this.id=0;
        this.tituloModal="Crear eje Curso";
        this.ejecurso.nombre='';
        this.ejecurso.descripcion='';
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