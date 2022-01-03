<template>
  <div>
    <h1 class="text-center">Gestionar Usuarios</h1>
    <!-- Button to Open the Modal -->
    <button @click="abrirModalUsuario();" type="button" class="btn btn-primary my-4" style="color: white;">
        <i class="fa fa-user-cog"></i> Agregar
    </button>

    <!-- The Modal -->
    <div class="modal" :class="{mostrar: modal_usuario}">
        <div class="modal-dialog">
            <div class="modal-content">
            <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">{{tituloModalUsuario}}</h4>
                    <button @click="cerrarModalUsuario();"  type="button" class="close" data-dismiss="modal">
                    &times;
                    </button> 
                </div>
                <form @submit.prevent="validarUsuario()">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="my-4">
                            <label for="nombre">DNI: </label>
                            <span v-if="errores_usuario.dni != ''" v-text='errores_usuario.dni'  class="text-danger"></span>
                            <input v-model="form_usuario.dni" type="text" class="form-control" placeholder="Nombre del Usuario" required>
                        </div>

                        <div class="my-4">
                            <label for="nombre">Nombre: </label>
                            <span v-if="errores_usuario.name != ''" v-text='errores_usuario.name'  class="text-danger"></span>
                            <input v-model="form_usuario.name" type="text" class="form-control" placeholder="Nombre del Usuario" required>
                        </div>

                        <div class="my-4">
                            <label for="nombre">Apellidos: </label>
                            <span v-if="errores_usuario.lastname != ''" v-text='errores_usuario.lastname'  class="text-danger"></span>
                            <input v-model="form_usuario.lastname" type="text" class="form-control" placeholder="Nombre del Usuario" required>
                        </div>

                        <div class="my-4">
                            <label for="numero">E-mail: </label>
                            <span v-if="errores_usuario.email != ''" v-text='errores_usuario.email'  class="text-danger"></span>
                            <input v-model="form_usuario.email" type="email" class="form-control" placeholder="Correo del Usuario" required>
                        </div>
                        <div class="my-4">
                            <div class="my-4">
                                <label for="numero">Rol: </label>
                                <span v-if="errores_usuario.rol != ''" v-text='errores_usuario.rol'  class="text-danger"></span>
                                <div class="row">
                                    <div class="col-lg-6" v-for="rol in lista_role">
                                        <div class="form-check"> 
                                            <label class="form-check-label" style="cursor: pointer;">
                                                <input type="checkbox" :id="'usuario'+ rol.id" :name="'rols[]'" :value="rol.id" class="form-check-input" style="cursor: pointer;">
                                                <div class="form-check-sign text-primary">{{rol.name}}</div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="my-4">
                            <label for="numero">Estado: </label>
                            <span v-if="errores_usuario.state != ''" v-text='errores_usuario.state'  class="text-danger"></span>
                            <select v-model="form_usuario.state" class="form-control" required>
                                <option v-for="estado in estados" :value="estado">{{estado}}</option>
                            </select>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button @click="cerrarModalUsuario();" type="button" class="btn btn-secondary" data-dismiss="modal">
                                Cancelar
                            </button>
                            <button class="btn btn-success" data-dismiss="modal">
                                {{titulo_button_guardar_usuario}}
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="form-group">
                <input type="search" v-model="form_buscar.data" class="form-control" placeholder="Buscar..." @keyup="buscar">
            </div>
        </div>
    </div>

        <table class="table table-striped table-hover table-condensed">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">DNI</th>
                    <th scope="col">Nombre Completo</th>
                    <th scope="col">Correo</th>
                    <th scope="col">Rol</th>
                    <th scope="col">Estado</th>
                    <th scope="col" class="text-center">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(user, index) in lista_user" :key="index">
                    <td scope="row">{{ index + 1 }}</td>
                    <td>{{ user.dni }}</td>
                    <td>{{ user.name +' '+ user.lastname }}</td>
                    <td>{{ user.email }}</td>
                    <td>
                        <li v-for="role in user.user_roles">{{role.rol.name}}</li>
                    </td>
                    <td>
                        <div v-if="user.state == 'Inactivo'" class="alert alert-danger">{{ user.state }}</div>
                        <div v-if="user.state == 'Activo'" class="alert alert-success">{{ user.state }}</div>
                    </td>
                    <td>
                        <button @click="mostrarUsuario(user.id);" class="btn btn-warning btn-sm">Editar</button>
                        <button @click="eliminar(user.id)" v-if="user.alumno.length == 0 && user.docente.length == 0" class="btn btn-danger btn-sm">Eliminar</button>
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

            user: {},

            //data registro de usuario como administrador y/o técnico
            tituloModalUsuario: '',

            form_usuario: {

                id: '',
                dni: '',
                name: '',
                lastname: '',
                email: '',
                rol: '',
                state: '',
            },

            errores_usuario: {

                dni:'',
                name: '',
                lastname: '',
                email: '',
                rol: '',
                state: '',
            },

            titulo_button_guardar_usuario: '',

            modal_estudiante_docente: 0,
            modal_usuario: 0,

            tituloModal:'',
            titulo_button_guardar: '',

            lista_role: [],
            lista_user: [],

            estados: ['Activo', 'Inactivo'],

            set_time_out_search: '',

            form_buscar: {

                data: '',
            },
        };
    },

    mounted(){

        $('#usuario').hide();
        
        this.listar();
    },

    methods: {
        async listar()
        {
            const response = await axios.get('http://127.0.0.1:8000/api/user', {
                                        params:
                                        {
                                            data: this.form_buscar.data
                                        }
                                    });

            this.lista_user = response.data.lista_user;
            this.lista_role = response.data.lista_role;
        },

        buscar()
        {
            clearTimeout(this.set_time_out_search);

            this.set_time_out_search = setTimeout(this.listar, 300);                
        },

        //Funciones Formulario Usuario Administrador/Técnico =================================================================================
        abrirModalUsuario()
        {
            $("input:checkbox").prop('checked', false);

            this.tituloModalUsuario            = 'Registro de Usuario';
            this.titulo_button_guardar_usuario = 'Guardar';

            this.modal_usuario = true;

            this.limpiarFormularioUsuario();
            this.limpiarErrores();
        },

        validarUsuario()
        {
            if(this.form_usuario.id == 0)
            {
                this.guardarUsuario();
            }
            else
            {
                this.actualizarUsuario();
            }
        },

        guardarUsuario()
        {
            this.form_usuario.rol = this.ListRoleCheck();

            let url = 'http://127.0.0.1:8000/api/user/create/usuario';

            this.limpiarErrores();

            axios.post(url, this.form_usuario)
            .then(response => {

                swal('Registro correcto!', 'El Usuario fue registrado','success');

                this.limpiarFormularioUsuario();
                this.cerrarModalUsuario();

                this.listar();
            })
            .catch(error => {

                EvaluateHttpResponse(error.response.status);

                if(error.response.status == 422)
                {
                    let errors = error.response.data.errors

                    this.ErrorMessages(errors);
                }
            });
        },

        mostrarUsuario(id)
        {
            $("input:checkbox").prop('checked', false);

            let url = 'http://127.0.0.1:8000/api/user/mostrar/'+ id;

            axios.get(url)
            .then(response => {

                let user = response.data.user;

                this.limpiarFormularioUsuario();

                this.form_usuario.id       = user.id;
                this.form_usuario.dni      = user.dni;
                this.form_usuario.name     = user.name;
                this.form_usuario.lastname = user.lastname;
                this.form_usuario.email    = user.email;
                this.form_usuario.state    = user.state;

                this.tituloModalUsuario      = 'Actualización de Usuario Administrador/Técnico';
                this.titulo_button_guardar_usuario = 'Actualizar';

                let roles = user.user_roles;

                this.lista_role.forEach( role => {

                    roles.forEach( rol =>{

                        if(role.id == rol.id_rol)
                        {
                            $('#usuario'+ rol.id_rol).prop('checked', true);
                        }
                    });
                });

                this.modal_usuario = true;
            });
        },

        actualizarUsuario()
        {
            this.form_usuario.rol = this.ListRoleCheck();

            let url = 'http://127.0.0.1:8000/api/user/update/usuario/'+ this.form_usuario.id;

            this.limpiarErrores();

            axios.post(url, this.form_usuario)
            .then(response => {

                swal('Actualización correcta!', 'El Usuario fue actualizado','success');

                this.limpiarFormularioUsuario();
                this.cerrarModalUsuario();

                this.listar();
            })
            .catch(error => {

                EvaluateHttpResponse(error.response.status);

                if(error.response.status == 422)
                {
                    let errors = error.response.data.errors

                    this.ErrorMessages(errors);
                }
            });
        },

        cerrarModalUsuario()
        {
            this.modal_usuario = false;
        },

        ListRoleCheck()
        {
            let roles = '';

            $("input[type=checkbox]:checked").each(function(){

                roles = (roles == '' ? this.value : roles +','+ this.value);
            });

            return roles;
        },

        eliminar(id)
        {
            swal({
                title: "Eliminar al Usuario",
                text: "Está seguro(a) de eliminar al Usuario",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
            .then((willDelete) => {

                if (willDelete)
                {
                    let url = 'http://127.0.0.1:8000/api/user/delete/'+ id;

                    axios.delete(url)
                    .then(response => {

                        swal('Eliminación correcta!', 'El Usuario fue eliminado','success');

                        this.listar();
                    })
                    .catch(error => {

                        console.log(error);
                    });
                }
            });
        },

        ErrorMessages(errors)
        {
            for (const index in errors)
            {
                this.errores_usuario[index]            = errors[index][0];
            }
        },

        limpiarFormularioUsuario()
        {
            this.form_usuario.id       = '';
            this.form_usuario.name     = '';
            this.form_usuario.lastname = '';
            this.form_usuario.email    = '';
            this.form_usuario.rol      = '';
            this.form_usuario.state    = '';
        },

        limpiarErrores()
        {
            this.errores_usuario.dni      = '';
            this.errores_usuario.name     = '';
            this.errores_usuario.lastname = '';
            this.errores_usuario.email    = '';
            this.errores_usuario.rol      = '';
            this.errores_usuario.state    = '';
        }
    }
};
</script>

<style>
  .mostrar{
    display: list-item;
    opacity: 1;
    background: rgba(75, 56, 143, 0.705);
  } 
</style>