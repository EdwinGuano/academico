<template>
  <div>
    <h1 class="text-center">Cambio de Password</h1>
    <!-- Button to Open the Modal -->
          <!-- Modal body -->
            <div class="my-4">
              <label for="nombre">Pasword Actual: </label>
              <input v-model="user.name" type="text" class="form-control" id="name" placeholder="Pasword Actual">
            </div>

            <div class="my-4">
              <label for="numero">Pasword Nuevo: </label>
              <input v-model="user.mail" type="text" class="form-control" id="mail" placeholder="Pasword Nuevo">
            </div>

            <!-- Modal footer -->
              <button @click="cerrarModal();" type="button" class="btn btn-secondary" data-dismiss="modal">
                Cancelar
              </button>
              <button  @click="guardar();" type="button" class="btn btn-success" data-dismiss="modal">
                Actualizar
              </button>

   </div>

</template>

<script>
  export default {
  data() {
    return {
      user:{  },
      id:0,
      modificar:true,
      modal:0,
      tituloModal:'',
      usr: [],
    };
  },
  methods: {
    async listar() {
      const res = await axios.get('http://127.0.0.1:8000/api/user');
      this.user = res.data;
    },
    async eliminar(id) {
      const res = await axios.delete('http://127.0.0.1:8000/api/user/' + id);
      this.listar();
    },
    async guardar() {
      if(this.modificar){
        const res = await axios.put('http://127.0.0.1:8000/api/user/'+ this.id, { 
          
          'name': this.user.name,
          'email': this.user.email,

         });

      }else{
        const res = await axios.post('http://127.0.0.1:8000/api/user/', { 
         
          'id': this.update,
          'name': this.user.name,
          'email': this.user.enail,
         
         });
      }
      this.cerrarModal();
      this.listar();
    },
    abrirModal(data={}){
      this.modal=1;
      if(this.modificar){
        this.id=data.id;
        this.tituloModal="Modificar Usuario";
        this.user.codigo=data.name;
        this.user.numero=data.email;
      }else{
        this.id=0;
        this.tituloModal="Crear Usuario";
        this.user.nombre='';
        this.user.correo='';
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