<template>
  <div>
    <h1 class="text-center">Gestionar Periodos</h1>
 
     <!-- Button to Open the Modal -->
    <div class="row">
        <div class="col-lg-12">
            <div class="form-group">
                <button @click="modificar=false; abrirModal();" type="button" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Agregar</button>
            </div>
        </div>
    </div>

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

                <form @submit.prevent="guardar()">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-12 form-group">
                                <label for="ano">Año</label>
                                <div v-if="message_validation.ano_per != ''" v-text='message_validation.ano_per' class="text-danger"></div>
                                <input v-model="periodo.ano" type="text" class="form-control" id="ano" placeholder="Año" >
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-12 form-group">
                                <label for="periodo">Periodo</label>
                                <div v-if="message_validation.peri_per != ''" v-text='message_validation.peri_per' class="text-danger"></div>
                                <input v-model="periodo.periodo" type="tePt" class="form-control" id="periodo" placeholder="Periodo" >
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-12 form-group">
                                <label for="stock">Inicio del Periodo</label>
                                <div v-if="message_validation.finic_per != ''" v-text='message_validation.finic_per' class="text-danger"></div>
                                <input v-model="periodo.inicia" type="date" class="form-control" id="inicioperiodo" placeholder="Inicio del Periodo" >
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-12 form-group">
                                <label for="stock">Fin del Periodo</label>
                                <div v-if="message_validation.ffin_per != ''" v-text='message_validation.ffin_per' class="text-danger"></div>
                                <input v-model="periodo.final" type="date" class="form-control" id="finperiodo" placeholder="Fin del Periodo" >
                            </div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button @click="cerrarModal();" type="button" class="btn btn-secondary" data-dismiss="modal">
                            Cancelar
                        </button>
                        <button class="btn btn-success" data-dismiss="modal">
                            Guardar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <table class="table table-striped">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Año</th>
                <th scope="col">Periodo</th>
                <th scope="col">Inicio</th>
                <th scope="col">Cul mina</th>
                <th scope="col">Estado</th>
                <th scope="col" colspan="2" class="text-center">Accion</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="per in periodos.data" :key="per.id">
                <td>{{ per.ano_per }}</td>
                <td>{{ per.peri_per }}</td>
                <td>{{ per.finic_per.split('-').reverse().join('/') }} </td>
                <td>{{ per.ffin_per.split('-').reverse().join('/') }}</td>
                <td>
                    <button v-if="per.estado == 'En curso'" class="btn btn-success btn" @click="finalizar(per.id)">{{ per.estado }}</button>
                    <div v-if="per.estado != 'En curso'" class="alert alert-danger">{{ per.estado }}</div>
                </td>
                <td>
                    <button v-if="per.estado == 'En curso'" @click="modificar=true; abrirModal(per);" class="btn btn-warning">Editar</button>
                </td>
                <td>
                    <button @click="eliminar(per.id)" class="btn btn-danger">
                        Eliminar
                    </button>
                </td>
            </tr>
        </tbody>
    </table>

      <div class="row ">
    <div class="col-5 md-5 text-right text-primary">
     Del  {{periodos.from}}  al  {{periodos.to}} de un total de:  {{periodos.total}}  Registros

    </div>
    <div class="col-1 md-1">
     <select class="form-control" v-model="pagination.per_page" @change="listar();" >
                  <option value="3" >3</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="10">10</option>
                </select>
    </div>
    <div class="col-4 md-4">
      <nav> 
                  <ul class="pagination">
                    <li class="page-item" :class="{disabled:pagination.page==1}"><a href="#" class="page-link "  @click="pagination.page=1; listar();">&laquo;</a></li>
                    <li class="page-item" :class="{disabled:pagination.page==1}"><a href="#" class="page-link"   @click="pagination.page--; listar();">&lt;</a></li>
                    <li class="page-item" v-for="n in paginas" :key="n" :class="{active:pagination.page==n}"><a href="#" class="page-link"  @click="pagination.page=n; listar();">{{n}}</a></li>
                    <li class="page-item" :class="{disabled:pagination.page==periodos.last_page}"><a href="#" class="page-link"  @click="pagination.page++; listar();">&gt;</a></li>
                    <li class="page-item" :class="{disabled:pagination.page==periodos.last_page}"><a href="#" class="page-link"  @click="pagination.page=periodos.last_page; listar();">&raquo;</a></li>
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

            periodo:{   },
            id:0,
            modificar:true,
            modal:0,
            tituloModal:'',
            periodos: [],
             pagination:{
                page:1,
                per_page:4,
                },

            message_validation: {

                ano_per: '',
                peri_per: '',
                finic_per: '',
                ffin_per: '',
            },
        };
    },

    methods: {
        
        async listar() {
      const res = await axios.get('http://127.0.0.1:8000/api/periodo/',  {params: this.pagination });
      this.periodos = res.data;
      this.listarPaginas();
    },
    
     listarPaginas(){
      const n=2
      let arrayN=[]
      let ini = this.pagination.page -2
      if(ini<1){
        ini=1
      }     
      let fin = this.pagination.page +2
      if(fin>this.periodos.last_page){
        fin=this.periodos.last_page
      } 

      for(let i=ini; i<=fin;i++){
        arrayN.push(i)
      }
      this.paginas=arrayN

    },












    async eliminar(id) {
        const res = await axios.delete('http://127.0.0.1:8000/api/periodo/' + id);
        this.listar();
    },

    async guardar()
    {
        if(this.modificar)
        {
            this.LimpiarMensajesErrores();

            let url = 'http://127.0.0.1:8000/api/periodo/' + this.id;

            axios.put(url, { 

                'ano_per': this.periodo.ano,
                'peri_per': this.periodo.periodo,
                'finic_per': this.periodo.inicia,
                'ffin_per': this.periodo.final,
             })
            .then(response => {

                if(response.data.estado_accion)
                {
                    this.cerrarModal();
                    this.listar();

                    swal('Correcto!', 'El Periodo fue actualizado', 'success');
                }
                else
                {
                    swal('Atención!', response.data.mensaje, 'warning');
                }
            })
            .catch(error => {

                if(error.response.status == 422)
                {
                    let errors = error.response.data.errors

                    this.ErrorMessages(errors);

                    swal('Error!', 'Revise el formulario y corrija los campos de color rojo', 'error');
                }
            });

        }
        else
        {
            this.LimpiarMensajesErrores();

            let url = 'http://127.0.0.1:8000/api/periodo/';

            axios.post(url, { 
             
                'id': this.update,
                'ano_per': this.periodo.ano,
                'peri_per': this.periodo.periodo,
                'finic_per': this.periodo.inicia,
                'ffin_per': this.periodo.final,
             })
            .then(response => {

                if(response.data.estado_accion)
                {
                    this.cerrarModal();
                    this.listar();

                    swal('Correcto!', 'El Periodo fue registrado', 'success');
                }
                else
                {
                    swal('Atención!', response.data.mensaje, 'warning');
                }
            })
            .catch(error => {

                if(error.response.status == 422)
                {
                    let errors = error.response.data.errors

                    this.ErrorMessages(errors);

                    swal('Error!', 'Revise el formulario y corrija los campos de color rojo', 'error');
                }
            });
        }
    },

    ErrorMessages(errors)
    {
        for (const index in errors)
        {
            this.message_validation[index] = errors[index][0]
        }
    },

    LimpiarMensajesErrores()
    {
        this.message_validation.ano_per   = '';
        this.message_validation.peri_per  = '';
        this.message_validation.finic_per = '';
        this.message_validation.ffin_per  = '';
    },

    abrirModal(data={})
    {
        this.modal=1;

        if(this.modificar)
        {
            this.id=data.id;
            this.tituloModal="Modificar Periodo";
            this.periodo.ano=data.ano_per;
            this.periodo.periodo=data.peri_per;
            this.periodo.inicia=data.finic_per
            this.periodo.final=data.ffin_per
        }
        else
        {
            this.id=0;
            this.tituloModal="Crear Periodo";
            this.periodo.ano='';
            this.periodo.periodo='';
            this.periodo.inicia='';
            this.periodo.final='';
        }
    },
    cerrarModal(){
      this.modal=0;
    },

    finalizar(id)
    {
        swal({
            title: "¿Esta seguro de guardar la planificación?",
            text: "Una vez guardado la planificación no se podra modificar!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
        .then((response) => {

            if(response)
            {
                var url = 'http://127.0.0.1:8000/api/periodo/finalizar/' + id;

                axios.get(url)
                .then(response => {

                    swal('Correcto!', 'Se finalizó el periodo', 'success');

                    this.listar();
                })
                .catch(error => {

                    console.log(error);
                });
            }
        });
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