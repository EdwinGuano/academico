<template>
  <div>
    <h1 class="text-center">Gestionar Plan de Evaluación</h1>
    
    <div class="my-4">

      <v-row style="display: none;">
        <v-col cols="14" md="2">

          <div class="my-4">
            <label for="periodo">Periodo</label>
            <v-select v-model="actividadeva.periodo" :items= "peri" item-text="peri_per" item-value="id" dense solo id="id" ></v-select> 
            <br>
            <button v-on:keyup.enter="buscardata();" @click="buscardata();" type="button" class="btn btn-success" data-dismiss="modal">Buscar</button>          
          </div>

        </v-col>

        <v-col cols="12" md="2">

          <div class="my-4">
            <label for="materia">Curso</label>
            <v-select v-model="actividadeva.curso" :items= "cur" item-text="nom_cur" item-value="id" dense solo id="id" ></v-select> 
          </div>  
        
        </v-col>
        
        <v-col cols="12" md="8">
        
          <div class="my-4">      
            <label for="buscar">Buscar:</label>
            <input v-model="buscar" type="text" v-on:keyup.enter="buscardata();" class="form-control" id="buscar" placeholder="Buscar Nombre y Apellido">
          </div>
        
        </v-col>
        
      </v-row>
            
        <table class="table table-secondary">
            <thead class="thead-light">
                <tr>
                    <th scope="col">DNI</th>          
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Periodo</th>          
                    <th scope="col">Aula</th>          
                    <th scope="col">Sección</th>
                    <th scope="col">Curso/Materia</th>
                    <th scope="col">Porcentajes</th>
                    <th scope="col" class="text-center">Accion</th>
                </tr>
            </thead>
            <tbody>
              <tr v-for="asidoc in asignadoc.data" :key="asidoc.id">
                <td>
                  <span v-for="(n,indice) in asidoc.docente" :key="indice">
                      {{n.dni_doc}}
                  </span>  
                </td>
                <td>
                  <span v-for="(n,indice) in asidoc.docente" :key="indice">
                    {{n.nom_doc}}
                  </span>  
                </td>
                <td>
                  <span v-for="(n,indice) in asidoc.docente" :key="indice">
                    {{n.ape_doc}}
                  </span>  
                </td>
                <td>
                  <span v-for="(n,indice) in asidoc.periodo" :key="indice">
                    {{n.ano_per}}
                  </span>  
                </td>
                <td>
                  <span v-for="(n,indice) in asidoc.aula" :key="indice">
                    {{n.num_aul}}
                  </span>  
                </td>
                <td>
                  <span v-for="(n,indice) in asidoc.seccion" :key="indice">
                    {{n.cod_sec}}
                  </span>  
                </td>
                <td>
                    <span v-for="(n,indice) in asidoc.curso" v-if="n.id == asidoc.curso_id" :key="indice">
                        <b>{{n.nom_cur}}:</b>
                        <span v-for="(n,indice) in asidoc.materia" :key="indice">
                             {{n.nom_mat}}
                        </span>
                    </span>  
                </td>
                <td>
                    <span v-text="'Individual: '+ asidoc.porcentaje_individual +' %'" :key="indice">
                    </span>
                    <span v-text="'Grupal: '+ asidoc.porcentaje_grupal +' %'" :key="indice">
                    </span>
                    <span v-text="'Actitudinal: '+ asidoc.porcentaje_actitudinal +' %'" :key="indice">
                    </span>
                </td>

                <td class="text-center">
                    <button v-if="asidoc.estado == 'Asignado'" @click="modificar=false; abrirModal(asidoc);" type="button" class="btn btn-primary">Planificar</button>
                    <button v-if="asidoc.estado == 'Planificado'" @click="modificar=false; abrirModal(asidoc);" type="button" class="btn btn-success">Ver planificación</button>
                </td>
              </tr>
            </tbody>
        </table>
    </div>
<!-- Button to Open the Modal -->

    <!-- The Modal -->
    <div class="modal" :class="{mostrar: modal}">
        <div class="modal-dialog modal-lg">
            <div class="modal-content modal-lg">
                <form @submit.prevent="guardar()">
                    <div class="modal-header">
                        <h4 class="modal-title">{{tituloModal}}</h4>
                        <button @click="cerrarModal();"  type="button" class="close" data-dismiss="modal">
                          &times;
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <label for="materia">Curso: {{ curso }}</label>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <label for="materia">Materia: {{ materia }}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <label for="dni">Docente: {{ nomape }}</label>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <label for="periodo">Periodo: {{ periodo }}</label>
                            </div>
                        </div>
                        <div class="row" v-show='mostrar_formulario'>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <label for="tipactividad">Tipo de Actividad:</label>
                                <select v-model="formulario.tipo_actividad" class="form-control" required>
                                    <option v-for='actividad in lista_actividades' :value="actividad">{{actividad}}</option>
                                </select>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <label for="descripcion">Descripción</label>
                                <input v-model="formulario.descripcion" type="text" class="form-control" id="descripcion" required>
                            </div>
                        </div>

                        <div class="row" v-show='mostrar_formulario'>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="tipactividad">Fecha de evaluación:</label>
                                    <input type="date" v-model="formulario.fecent_plaeva" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label style="color: white;">-</label>
                                    <button v-text="titulo_button_save" class="btn btn-success form-control"></button>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <table class="table table-hover table-condensed">
                                        <thead>
                                            <tr>
                                                <th>Fecha</th>
                                                <th>Tipo Actividad</th>
                                                <th>Descripción</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="plan in lista_planes">
                                                <td v-text=plan.fecent_plaeva></td>
                                                <td v-text=plan.detalplanevas[0].tipoact_acti></td>
                                                <td v-text=plan.detalplanevas[0].descrip_detac></td>
                                                <td>
                                                    <button type="button" class="btn btn-primary btn-xs" v-show='mostrar_formulario' @click="editar(plan.id)">Editar</button>
                                                    <button type="button" class="btn btn-danger btn-xs" v-show='mostrar_formulario' @click="eliminar(plan.id)">Eliminar</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button @click="cerrarModal();" type="button" class="btn btn-secondary" data-dismiss="modal">
                                Cerrar
                            </button>
                            <button v-show="mostrar_formulario" @click="guardarPlanificacion()" type="button" class="btn btn-success" data-dismiss="modal">
                                Guardar Planificación
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
  
  </div>
</template>

<script>
export default {
  data() {
    return {

        formulario: {

            id_plan: '',
            asignadocs_id: '',
            docente_id: '',
            periodo_id: '',
            materia_id: '',
            tipo_actividad: '',
            descripcion: '',
            fecent_plaeva: '',
        },

        actividadeva:{ },

        docentesci:{ },
        asignadoc:{ },
        asidoc: [],
        peri: [],
        cur: [],
        mate: [ ],
        mate2: [],
        id:0,
        modificar:true,
        modal:0,
        tituloModal:'',
        nomape:'',
        periodo: '',
        aula:'',
        curso:'',
        materia:'',
        aceva: [],
        buscar:'',
        periodo_id:'',
        curso_id:'',

        lista_actividades: ['Aporte actitudinal', 'Aporte individual', 'Aporte grupal'],

        lista_planes: [],

        tipact: ['APORTE INDIVIDUAL ! Evaluaciones unidades', 'APORTE INDIVIDUAL ! Evaluación final', 'APORTE GRUPAL ! APE. Trabajos grupales', 'APORTE GRUPAL ! APE. Practica Exposiciones ', 'ACTITUD ANDRAGOGICA ! APE. Trabajos grupales'],

        titulo_button_save: '',

        mostrar_formulario: false,

        docente_id: 0,
    };
  },

    mounted()
    {
        this.docente_id = docente_id;

        this.buscardata();
    },

  methods: {

    async listar_plan()
    {
        this.titulo_button_save = 'Añadir';
        this.formulario.id_plan = '';

        this.lista_planes = [];

        const res = await axios.get('http://127.0.0.1:8000/api/planeva/', {

            params:{

                'docente_id': this.formulario.docente_id,
                'periodo_id': this.formulario.periodo_id,
                'materia_id': this.formulario.materia_id,
            }
        });

        this.lista_planes = res.data.lista_planes;
    },

    async listar() {

     //Consulta Plan de Evaluación
     const res = await axios.get('http://127.0.0.1:8000/api/planeva/');
     this.actividadeva = res.data;
    
    //Consulta Periodo
     const resperi = await axios.get('http://127.0.0.1:8000/api/periodo/');
     this.peri = resperi.data.data;

     //Consulta Curso
     const rescur = await axios.get('http://127.0.0.1:8000/api/curso/');
     this.cur = rescur.data.data;

    },

    /*async eliminar(id) {
      const res = await axios.delete('http://127.0.0.1:8000/api/planeva/' + id);
      this.listar();
    },*/
     
    async guardar()
    {
        if(this.formulario.id_plan)
        {
            const res = await axios.put('http://127.0.0.1:8000/api/planeva/' + this.formulario.id_plan, { 
              
                'id': this.formulario.id_plan,
                'docente_id': this.formulario.docente_id,
                'periodo_id': this.formulario.periodo_id,
                'materia_id': this.formulario.materia_id,
                'descrip_detac': this.formulario.descripcion,   
                'tipoact_acti': this.formulario.tipo_actividad,
                'fecent_plaeva': this.formulario.fecent_plaeva,
             });

            if(res.data.estado_accion)
            {
                swal('Correcto!', 'Se actualizó la tarea actividad al Plan', 'success');

                this.formulario.id_plan = '';
                this.formulario.tipo_actividad = '';
                this.formulario.descripcion = '';
                this.formulario.fecent_plaeva = '';

                this.titulo_button_save = 'Añadir';

                this.listar_plan();
            }
            else
            {
                swal('Alerta!', 'Ya existe una tarea para la fecha asignada', 'warning');
            }
        }
        else
        {
            const res = await axios.post('http://127.0.0.1:8000/api/planeva/', { 
                
                //'id': this.update,
                'docente_id': this.formulario.docente_id,
                'periodo_id': this.formulario.periodo_id,
                'materia_id': this.formulario.materia_id,
                'descrip_detac': this.formulario.descripcion,
                'tipoact_acti': this.formulario.tipo_actividad,
                'fecent_plaeva': this.formulario.fecent_plaeva,
            });

            if(res.data.estado_accion)
            {
                swal('Correcto!', 'Se añadio la actividad al Plan', 'success');

                this.formulario.tipo_actividad = '';
                this.formulario.descripcion = '';
                this.formulario.fecent_plaeva = '';

                this.listar_plan();
            }
            else
            {
                swal('Alerta!', 'Ya existe una actividad para la fecha asignada', 'warning');
            }
        }
    },

    abrirModal(data={})
    {
        this.modal=1;

        this.formulario.asignadocs_id = data.id;
        this.formulario.docente_id    = data.docente_id;
        this.formulario.periodo_id    = data.periodo_id;
        this.formulario.materia_id    = data.materia_id;

        this.nomape=data.docente[0].nom_doc + " " + data.docente[0].ape_doc;
        this.periodo=data.periodo[0].ano_per +' : '+ data.periodo[0].peri_per;
        this.curso=data.curso[0].nom_cur;
        this.materia=data.materia[0].nom_mat;

        this.mostrar_formulario = (data.estado != 'Planificado' ? true : false);

        if(data.estado == 'Asignado')
        {
            this.tituloModal        = 'Crear Plan de Evaluación';
            this.mostrar_formulario = true;
        }
        else if(data.estado == 'Planificado')
        {
            this.tituloModal        = 'Planificación Creada';
            this.mostrar_formulario = false;
        }

        this.listar_plan();
    },

    async buscardata()
    {

        const resdoc = await axios.get('http://127.0.0.1:8000/api/asignadoc', {
            params: {
                periodo_id: this.actividadeva.periodo,
                id_curso: this.actividadeva.curso,
                docente_id: this.docente_id,
                name: this.buscar
            }
        });

        this.asignadoc = resdoc.data;   
    },

    editar(id)
    {
        let url = 'http://127.0.0.1:8000/api/planeva/'+ id;

        axios.get(url)
        .then(response => {

            this.titulo_button_save = 'Actualizar';

            let plan = response.data.plan;

            this.formulario.id_plan        = plan.id;
            this.formulario.tipo_actividad = plan.detalplanevas[0].tipoact_acti;
            this.formulario.descripcion    = plan.detalplanevas[0].descrip_detac;
            this.formulario.fecent_plaeva  = plan.fecent_plaeva;
        })
        .catch(error => {

            console.log(error);
        })
        .finally(() => LoadingHide());
    },

    eliminar(id)
    {
        if(confirm('¿Quiere eliminar la actividad?'))
        {
            let url = 'http://127.0.0.1:8000/api/planeva/'+ id;

            axios.delete(url)
            .then(response => {

                alert('Actividad eliminada');

                this.listar_plan();
            })
            .catch(error => {

                console.log(error);
            })
            .finally(() => LoadingHide());
        }
    },

    guardarPlanificacion()
    {
        if(this.lista_planes.length == 0)
        {
            swal('Atención' ,'Debe tener al menos una actividad para poder guardar la planificación', 'warning');
        }
        else
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
                    let url = 'http://127.0.0.1:8000/api/asignadoc/planificar/'+ this.formulario.asignadocs_id;

                    axios.get(url)
                    .then(response => {

                        swal('Correcto', 'El plan se guardó correctamente', 'success');

                        this.mostrar_formulario = false;

                        this.buscardata();
                    })
                    .catch(error => {

                        console.log(error);
                    })
                    .finally(() => LoadingHide());
                }
            });
        }
    },

    cerrarModal(){
      this.modal=0;
    },
  },
  created() {
    //this.listar();
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