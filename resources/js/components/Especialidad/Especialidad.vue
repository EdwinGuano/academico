<template>
  <div>
    <h1 class="text-center">Gestionar Especialidades</h1>
    
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
              <input v-model="especialidad.nombre" type="text" class="form-control" id="nombre" placeholder="Nombre de la Especialidad">
            </div>
            <div class="my-4">
              <label for="descripcion">descripcion</label>
              <input v-model="especialidad.descripcion" type="text" class="form-control" id="descripcion" placeholder="Descripcion de la Especialidad">
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
        <tr v-for="espe in especialidad.data" :key="espe.id">
          <th scope="row">{{ espe.id }}</th>
          <td>{{ espe.nom_especialidad }}</td>
          <td>{{ espe.desc_especialidad }}</td>
          <td>
            <button  @click="modificar=true; abrirModal(espe);" class="btn btn-warning">Editar</button>
          </td>
          <td>
            <button @click="eliminar(espe.id)" class="btn btn-danger">
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
      especialidad:{  },
      id:0,
      modificar:true,
      modal:0,
      tituloModal:'',
      espe: [],
    };
  },
  methods: {
    async listar() {
      const res = await axios.get('http://127.0.0.1:8000/api/especialidad/');
      this.especialidad = res.data;
    },
    async eliminar(id) {
      const res = await axios.delete('http://127.0.0.1:8000/api/especialidad/' + id);
      this.listar();
    },
    async guardar() {
      if(this.modificar){

        const res = await axios.put('http://127.0.0.1:8000/api/especialidad/' + this.id, { 
          
          'nom_especialidad': this.especialidad.nombre,
          'desc_especialidad': this.especialidad.descripcion,

         });

      }else{

        const res = await axios.post('http://127.0.0.1:8000/api/especialidad/', { 
         
          'id': this.update,
          'nom_especialidad': this.especialidad.nombre,
          'desc_especialidad': this.especialidad.descripcion,
         
         });
      }
      this.cerrarModal();
      this.listar();
    },
    abrirModal(data={}){
      this.modal=1;
      if(this.modificar){
        this.id=data.id;
        this.tituloModal="Modificar Especialidad";
        this.especialidad.nombre=data.nom_especialidad;
        this.especialidad.descripcion=data.desc_especialidad;
      }else{
        this.id=0;
        this.tituloModal="Crear Especialidad";
        this.especialidad.nombre='';
        this.especialidad.desccripcion='';
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