prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>100004
,p_default_application_id=>105
,p_default_id_offset=>0
,p_default_owner=>'ADUANA'
);
end;
/
 
prompt APPLICATION 105 - Demo Apex
--
-- Application Export:
--   Application:     105
--   Name:            Demo Apex
--   Date and Time:   20:36 Domingo Agosto 9, 2020
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 3
--   Manifest End
--   Version:         20.1.0.00.13
--   Instance ID:     400112401199654
--

begin
null;
end;
/
prompt --application/pages/delete_00003
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>3);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(11342492621428491)
,p_name=>'GoogleMaps'
,p_alias=>'GOOGLEMAPS'
,p_step_title=>'GoogleMaps'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'https://maps.googleapis.com/maps/api/js?key=AIzaSyAQQJMOqiXardnsW2C51GGt7LDy31k9zI8'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function initMap(mapRegionId){',
'    var map;',
'    var marker;',
'    ',
unistr('    //Ubiciaci\00F3n de Asunc\00F3n'),
'      var granAsu = {lat: -25.317, lng: -57.553};',
'    ',
unistr('    //Mapa centrado en Gran Asunc\00F3n'),
'    map = new google.maps.Map(',
'        document.getElementById(mapRegionId), {zoom: 9, center: granAsu}',
'    );',
'    ',
'    marker = new google.maps.Marker(',
'        {',
'            position: granAsu,',
'            map: map,',
unistr('            title: ''Asunci\00F3n'''),
'        }',
'    ',
'    );',
'    ',
'}',
'',
'$(document).ready(function(){',
'    initMap(''mapPlaceholder'');',
'    ',
'});'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20200806154949'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6802188797498521)
,p_plug_name=>'Mapa'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(11257804560428363)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'<div id="mapPlaceholder" style="width:100%;height:600px"></div>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29330660673365260)
,p_plug_name=>'Google Maps API'
,p_icon_css_classes=>'fa-map-marker'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(11238842707428350)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'Mediante la API JavaScripts de Google Maps se pueden obtener mapas y mostrarlas en APEX.'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
