import 'package:evaproject/src/pages/agregar_egresado_infotep/agregar_egresado_infotep_binding.dart';
import 'package:evaproject/src/pages/agregar_egresado_infotep/agregar_egresado_infotep_page.dart';
import 'package:evaproject/src/pages/detalle_egresado/detalle_egresado_binding.dart';
import 'package:evaproject/src/pages/detalle_egresado/detalle_egresado_page.dart';
import 'package:evaproject/src/pages/detalle_oferta/detalle_oferta_binding.dart';
import 'package:evaproject/src/pages/detalle_oferta/detalle_oferta_page.dart';
import 'package:evaproject/src/pages/egresado/egresado_binding.dart';
import 'package:evaproject/src/pages/egresado/egresado_page.dart';
import 'package:evaproject/src/pages/empresa/empresa_binding.dart';
import 'package:evaproject/src/pages/empresa/empresa_page.dart';
import 'package:evaproject/src/pages/infotep/infotep_binding.dart';
import 'package:evaproject/src/pages/infotep/infotep_page.dart';
import 'package:evaproject/src/pages/login/login_binding.dart';
import 'package:evaproject/src/pages/login/login_page.dart';
import 'package:evaproject/src/pages/ofertas/ofertas_binding.dart';
import 'package:evaproject/src/pages/ofertas/ofertas_page.dart';
import 'package:evaproject/src/pages/publicar_oferta/publicar_oferta_binding.dart';
import 'package:evaproject/src/pages/publicar_oferta/publicar_oferta_page.dart';
import 'package:evaproject/src/pages/registrar_empresa/registrar_empresa_binding.dart';
import 'package:evaproject/src/pages/registrar_empresa/registrar_empresa_page.dart';
import 'package:evaproject/src/pages/reportes/reportes_binding.dart';
import 'package:evaproject/src/pages/reportes/reportes_page.dart';
import 'package:evaproject/src/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static List<GetPage> get pages => [
        GetPage(
          name: AppRoutes.login,
          page: () => const LoginPage(),
          binding: LoginBinding(),
          transitionDuration: const Duration(
            microseconds: 200,
          ),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.infotep,
          page: () => const InfotepPage(),
          binding: InfotepBinding(),
          transitionDuration: const Duration(
            microseconds: 200,
          ),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.egresado,
          page: () => const EgresadoPage(),
          binding: EgresadoBinding(),
          transitionDuration: const Duration(
            microseconds: 200,
          ),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.agregarEgresadoInfotep,
          page: () => const AgregarEgresadoInfotepPage(),
          binding: AgregarEgresadoInfotepBinding(),
          transitionDuration: const Duration(
            microseconds: 200,
          ),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.registrarEmpresa,
          page: () => const RegistrarEmpresaPage(),
          binding: RegistrarEmpresaBinding(),
          transitionDuration: const Duration(
            microseconds: 200,
          ),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.empresa,
          page: () => const EmpresaPage(),
          binding: EmpresaBinding(),
          transitionDuration: const Duration(
            microseconds: 200,
          ),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.publicarOferta,
          page: () => const PublicarOfertaPage(),
          binding: PublicarOfertaBinding(),
          transitionDuration: const Duration(
            microseconds: 200,
          ),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.detalleOferta,
          page: () => const DetalleOfertaPage(),
          binding: DetalleOfertaBinding(),
          transitionDuration: const Duration(
            microseconds: 200,
          ),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.ofertas,
          page: () => const OfertasPage(),
          binding: OfertasBinding(),
          transitionDuration: const Duration(
            microseconds: 200,
          ),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.reportes,
          page: () => const ReportesPage(),
          binding: ReportesBinding(),
          transitionDuration: const Duration(
            microseconds: 200,
          ),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.detalleEgresado,
          page: () => const DetalleEgresadoPage(),
          binding: DetalleEgresadoBinding(),
          transitionDuration: const Duration(
            microseconds: 200,
          ),
          transition: Transition.cupertino,
        ),
      ];
}
