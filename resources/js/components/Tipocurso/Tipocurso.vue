<template>
  <div>
    <h1 class="text-center">Gestionar Tipo de Cursos</h1>

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
              <input v-model="tipocurso.nombre" type="text" class="form-control" id="nombre" placeholder="Nombre del Tipo de Curso">
            </div>

            <div class="my-4">
              <label for="descripcion">descripcion</label>
              <input v-model="tipocurso.descripcion" type="text" class="form-control" id="descripcion" placeholder="Descripcion del Tipo de Curso">
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
        <tr v-for="tpcur in tipocurso.data" :key="tpcur.id">
          <th scope="row">{{ tpcur.id }}</th>
          <td>{{ tpcur.nom_curso }}</td>
          <td>{{ tpcur.desc_curso }}</td>
          <td>
            <button  @click="modificar=true; abrirModal(tpcur);" class="btn btn-warning">Editar</button>
          </td>
          <td>
            <button @click="eliminar(tpcur.id)" class="btn btn-danger">
              Eliminar
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tipocurso:{   },
      id:0,
      modificar:true,
      modal:0,
      tituloModal:'',
      tpcur: [],
    };
  },
  methods: {
    async listar() {
      const res = await axios.get('http://127.0.0.1:8000/api/tipocurso');
      this.tipocurso = res.data;
    },
    async eliminar(id) {
      const res = await axios.delete('http://127.0.0.1:8000/api/tipocurso/' + id);
      this.listar();
    },
    async guardar() {
      if(this.modificar){
        const res = await axios.put('http://127.0.0.1:8000/api/tipocurso/'+ this.id, { 
          
          'nom_curso': this.tipocurso.nombre,
          'desc_curso': this.tipocurso.descripcion,

         });

      }else{
        const res = await axios.post('http://127.0.0.1:8000/api/tipocurso/', { 
         
          'id': this.update,
          'nom_curso': this.tipocurso.nombre,
          'desc_curso': this.tipocurso.descripcion,
         
         });
      }
      this.cerrarModal();
      this.listar();
    },
    abrirModal(data={}){
      this.modal=1;
      if(this.modificar){
        this.id=data.id;
        this.tituloModal="Modificar Tipo Curso";
        this.tipocurso.nombre=data.nom_curso;
        this.tipocurso.descripcion=data.desc_curso;
      }else{
        this.id=0;
        this.tituloModal="Crear Tipo Curso";
        this.tipocurso.nombre='';
        this.tipocurso.descripcion='';
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