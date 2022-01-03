<template>
    <div>
        <h1 class="text-center">Reporte de Registro de Notas</h1>

        <div class="my-4" style="background: white; padding: 2em;">
            
            <form @submit.prevent="descargar">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-4 col-12">
                        <div class="form-group">
                            <label for="">Cursos</label><br>
                            <select v-model="curso_id" class="form-control" @change="listarMaterias" required>
                                <option v-for='curso in lista_cursos' :value="curso.id">{{curso.nom_cur}}</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-4 col-12">
                        <div class="form-group">
                            <label for="">Materías</label><br>
                            <select v-model="materia_id" class="form-control" required>
                                <option v-for='materia in lista_materias' :value="materia.id">{{materia.nom_mat}}</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-4 col-12">
                        <div class="form-group">
                            <label for="">Periodos</label><br>
                            <select v-model="periodo_id" class="form-control" required>
                                <option v-for="periodo in lista_periodos" :value="periodo.id">{{periodo.peri_per}}</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-4 col-12">
                        <div class="form-group">
                            <label for="" style="color: white;">Individual</label><br>
                            <button class="btn btn-primary form-control"><i class="fa fa-file-pdf"></i>  Descargar</button>
                        </div>
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col-lg-12">
                    <iframe id="viePDF" src="" width="100%" height="680px"></iframe>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {

    data() {

        return {

            curso_id: 0,
            materia_id: 0,
            periodo_id: 0,

            lista_cursos: [],
            lista_materias: [],
            lista_materias_auxiliar: [],
            lista_periodos: [],
        };
    },

    mounted()
    {
        this.listarFiltros();
    },

    methods: {

        async listarFiltros()
        {
            const res = await axios.get('http://127.0.0.1:8000/reporte/listar/filtros');

            let lista_cursos   = res.data.lista_cursos;
            let lista_materias = res.data.lista_materias;
            let lista_periodos = res.data.lista_periodos;

            this.lista_cursos            = lista_cursos;
            this.lista_materias          = lista_materias;
            this.lista_materias_auxiliar = lista_materias;
            this.lista_periodos          = lista_periodos;
        },
         
        async descargar()
        {
            $('#viePDF').attr('src', 'http://127.0.0.1:8000/reporte/registro-notas/descargar/'+ this.curso_id +'/'+ this.materia_id +'/'+ this.periodo_id);
            //window.open('http://127.0.0.1:8000/reporte/registro-notas/descargar/'+ this.curso_id +'/'+ this.materia_id +'/'+ this.periodo_id);
        },

        listarMaterias()
        {
            let lista_materias = [];

            this.lista_materias_auxiliar.forEach( materia => {

                materia.cursos.forEach( curso => {

                    if(this.curso_id == curso.id)
                    {
                        let nueva_materia = JSON.parse('{ "id": "'+ materia.id +'" , "nom_mat": "'+ materia.nom_mat +'" }');

                        lista_materias.push(nueva_materia);
                    }
                });
            });

            this.lista_materias = lista_materias;
            console.log(lista_materias);
        }
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