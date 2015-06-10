package maternidad

import grails.converters.JSON
import grails.transaction.Transactional

@Transactional
class CalculoValoresService {

    def calcular (Integer id) {

        def flag=false



        def planConvenio = PlanConvenio.get(id)
        def practicasNomencladas = Practica.findAllByNomenclada(Boolean.TRUE)

        /*def modulos = ValorPractica.withCriteria {
            eq("planConvenio", planConvenio)
            practica { eq("modulo", Boolean.TRUE) }
        }?.practica
        def practicasModulos = PracticaModulo.findAllByModuloInList(modulos)?.practica?.id
        */
        def valores = new ArrayList()
        // valores practicas que no se pueden pisar
        //valores = ValorPractica.findAllByPlanConvenioAndPisar(planConvenio, Boolean.FALSE)?.practica?.id
        // practicas nomencladas que se pueden actualizar
        //def practicasNomencladaspisar = Practica.findAllByNomencladaAndIdNotInList(Boolean.TRUE, valores)
        // valores practicas de nomencladas no relacionadas con modulos

       // try{

            def valoresPracticas = ValorPractica.withCriteria {
                eq("planConvenio", planConvenio)
                practica {
                    eq("nomenclada", Boolean.TRUE)
                    /* if (practicasModulos) {
                         not { 'in'("id", practicasModulos) }
                     }
                     */
                }

            }

            def valorPractica

            practicasNomencladas.each {

                def valorGasto = calcularValorGasto(it, planConvenio)
                def valorHonorario = calcularValorHonorario(it, planConvenio)

                if (valoresPracticas.practica.contains(it)) {
                    def practica=it
                    valorPractica = valoresPracticas.find { it?.practica == practica }
                    valorPractica.fechaActualizado = new Date()
                    valorPractica.valorGasto =  Math.round(valorGasto * 100) / 100
                    valorPractica.valorAnestecista =  Math.round(valorHonorario.get(0) * 100) / 100
                    valorPractica.valorAyudante = Math.round(valorHonorario.get(1) * 100) / 100
                    valorPractica.valorEspecialista = Math.round(valorHonorario.get(2) * 100) / 100
                    valorPractica.save(flush: true)

                } else {
                    valorPractica = new ValorPractica()
                    valorPractica.practica = it
                    valorPractica.fechaActualizado = new Date()
                    valorPractica.planConvenio = planConvenio
                    valorPractica.plan = planConvenio.plan

                    valorPractica.valorAnestecista =  Math.round(valorHonorario.get(0) * 100) / 100
                    valorPractica.valorAyudante = Math.round(valorHonorario.get(1) * 100) / 100
                    valorPractica.valorEspecialista = Math.round(valorHonorario.get(2) * 100) / 100



                    // valorPractica.valorHonorario=valorPractica.valorAnestecista+valorPractica.valorAyudante+ valorPractica.valorEspecialista
                   try{
                       valorPractica.valorGasto =  Math.round(valorGasto * 100) / 100
                   }catch (Exception ex){
                       ex
                   }

                    valorPractica.save(flush: true)
                }

            }

            flag=true

     /*   }catch (Exception ex){

            flag=false

        }
*/
        def responseData = [
                'resultado': flag

        ]


        // redirect(controller: "convenio", action: "editPlan", params: [id: planConvenio?.id])
        //render responseData as JSON
        return responseData
    }


    def calcularValorGasto(Practica practica, PlanConvenio planconvenio) {

        def sum = 0
        //obtener valores unidad gasto de la practica
        def valoresGasto = ValorUnidadGasto.findAllByPractica(practica)
        //para cada uno encontrar el valor galeno y multiplicar
        valoresGasto.each {
            def valorGalenoGasto = ValorGalenoGasto.findByTipoGastoAndPlanConvenio(it.tipoGasto, planconvenio)
            def calculo = 0
            if (valorGalenoGasto) {
                // si existe calculo el valor gasto resultante
                calculo = valorGalenoGasto.valor * it.valor // * practica.multiplicadorGasto
            }

            sum += calculo
        }

        return sum

    }


    def calcularValorHonorario(Practica practica, PlanConvenio planConvenio) {

        def lista = []
        def valorEspecialista = 0
        def valorAnestesista = 0
        def valorAyudante = 0

        //obtener Componentes del tipohonorario
        def componentes = ComponenteTipoHonorario.findAllByTipoHonorario(practica?.tipoHonorario).componente

        // obtener valorGalenoHonorario
        def valorGalenohonorario = ValorGalenoHonorario.findByPlanConvenioAndTipoHonorario(planConvenio, practica?.tipoHonorario)

        componentes.each {

         try{
            // valor ayudante
            if (it?.id == 1) {
                def valorunidad = ValorUnidadHonorario.findByComponenteAndPractica(it, practica)

                valorAyudante = valorunidad?.valor * valorGalenohonorario?.valor  //* practica.multiplicadorHonorario

            }

            // valor anestesista
            if (it?.id == 2) {
                def valorunidad = ValorUnidadHonorario.findByComponenteAndPractica(it, practica)

                valorAnestesista = valorunidad?.valor * valorGalenohonorario?.valor //* practica.multiplicadorHonorario
            }

            // valor especialista
            if (it?.id == 3) {
                def valorunidad = ValorUnidadHonorario.findByComponenteAndPractica(it, practica)

                valorEspecialista = valorunidad?.valor * valorGalenohonorario?.valor //* practica.multiplicadorHonorario
            }
         }catch (Exception ex) {

         }

        }

        valorAyudante=(valorAyudante)?:0
        valorAnestesista=(valorAnestesista)?:0
        valorEspecialista=(valorEspecialista)?:0
        lista = [valorAyudante, valorAnestesista, valorEspecialista]

        return lista
    }


}
