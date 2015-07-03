package facturaElectronica

import coop.guenoa.wsafip.Wsfev1
import grails.transaction.Transactional
import wslite.json.JSONObject
import grails.util.Holders

import javax.xml.ws.Holder

@Transactional
class AfipWsService {

    def serviceMethod() {

    }

    def obtenerEmpresa(Long cuit) {
        def empresa
        def response = null

        try {
            def servicio = 'https://soa.afip.gob.ar/sr-padron/v2/persona'
            withRest(url: servicio) {
                response = get(path: "/${cuit}",
                        //accept: ContentType.JSON,
                        connectTimeout: 50000,
                        readTimeout: 100000,
                        followRedirects: true,
                        useCaches: false,
                        sslTrustAllCerts: true)
            }
        } catch (e) {
            def msj = "Error al consultar el servicio web de AFIP"
            throw new RuntimeException(msj)
        }

        if (response?.json) {
            if (response?.json?.error) {
                throw new RuntimeException(response?.json?.error?.descripcion + " (" + response?.json?.error?.detalle + ")" as String)
            }
            if (response?.json?.data) {
                empresa = new EmpresaAfip(response?.json?.data as JSONObject)
            }
        } else {
            def msj = "Error inesperado en el servidor"
            log.error(msj)
            throw new RuntimeException(msj)
        }

        return empresa
    }


    def enviarAfip(Long cuit, Float totalSinIva) {
//        try {
            // TODO code application logic here

            String userDir = System.getProperty("user.dir");
            String fileSeparator = System.getProperty("file.separator");
            String path_cert = userDir + fileSeparator;

         //   System.out.println("path_cert: " + path_cert);

            String crt_file = path_cert + "certificado.crt";
            String key_file = path_cert + "certificado.key";
            String dir_cache = path_cert + "cache";

            String cuitMater = Holders.config.facturaElectronica.cuitMaternidad
            String asmx = Holders.config.facturaElectronica.service.asmx
            String loginCms = Holders.config.facturaElectronica.loginCms

            Wsfev1 wsfev1 = new Wsfev1(loginCms, asmx, cuitMater, crt_file, key_file, dir_cache);

            wsfev1.setDEBUG(true);

            boolean servicio = true;
            String tipo_doc = "80";  //TODO: obtener el tipo de documento para enviarlo
            String nro_doc = cuit.toString();
            int tipo_cbte = 2;
            int punto_vta = Holders.config.facturaElectronica.ptoVenta;
            int cbt_desde = wsfev1.CompUltimoAutorizado(tipo_cbte, punto_vta) + 1;

            int cbt_hasta = cbt_desde;
            double imp_tot_conc = 0.00;
            double imp_neto = totalSinIva.toDouble();
            double imp_iva = totalSinIva * 21 / 100 ;
            double imp_total = imp_neto + imp_iva;
            double imp_trib = 0.00;
            double imp_op_ex = 0.00;

            Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
            Date fecha_cbte = localCalendar.getTime();

            Date fecha_venc_pago = fecha_cbte;
            Date fecha_serv_desde = fecha_cbte;
            Date fecha_serv_hasta = fecha_cbte;

            String moneda_id = "PES";
            double moneda_ctz = 1.00;

            wsfev1.crearFactura(servicio, tipo_doc, nro_doc, tipo_cbte, punto_vta, cbt_desde, cbt_hasta, imp_total, imp_tot_conc, imp_neto, imp_iva, imp_trib, imp_op_ex, fecha_cbte, fecha_venc_pago, fecha_serv_desde, fecha_serv_hasta, moneda_id, moneda_ctz);

//-------------ESTO VA SI HAY QUE AGREGAR MAS ITEMS A LA FACTURA-----------------

//            // agrego otros tributos:
//            int tributo_id = 99;
//            String desc = "Impuesto Municipal";
//            double base_imp = 100.00;
//            double alic = 1.00;
//            double importe = 1.00;
//
//            //wsfev1.AgregarTributo(tributo_id, desc, base_imp, alic, importe);
//            // agrego el subtotal por tasa de IVA:
//            int iva_id = 5; // 21%
//            base_imp = 100.00;
//            importe = 21.00;
//
//            wsfev1.AgregarIva(iva_id, base_imp, importe);

//------------------HASTA ACA ES -------------------------------------

            wsfev1.CAESolicitar();

//            println("NroComprobante: " + cbt_desde);
//            println("CAE: " + wsfev1.getCAE());
//            println("Vencimiento: " + wsfev1.getFechaVencimientoCAE().toString());

            return [nroComprobante: cbt_desde, CAE: wsfev1.getCAE(), vencimiento: wsfev1.getFechaVencimientoCAE().toString()]
//
//        } catch (Exception ex) {
//            Logger.getLogger(Wsfev1.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }


}

class EmpresaAfip {

    Long cuit
    String tipoPersona
    String estadoClave
    String razonSocial
    String direccion
    String localidad
    String provincia

    EmpresaAfip(JSONObject empresaJSON) {
        cuit = empresaJSON.idPersona as Long
        tipoPersona = empresaJSON.tipoPersona
        estadoClave = empresaJSON.estadoClave
        razonSocial = empresaJSON.nombre

        direccion = empresaJSON.domicilioFiscal.direccion
        localidad = empresaJSON.domicilioFiscal.localidad
        provincia = empresaJSON.domicilioFiscal.provincia
    }

}

