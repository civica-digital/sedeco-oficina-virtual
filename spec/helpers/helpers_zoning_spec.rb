require_relative '../../app/helpers/diagnostic_helper'

describe 'Test all Helpers zoning'  do
  include DiagnosticHelper

   it "should get_uso_de_suelo_ok" do
    get_uso_de_suelo_ok(true, "comercial").should ==  "- Un negocio en un uso de suelo comercial."
    
    get_uso_de_suelo_ok(false, "comercial").should ==  "- Negocio en un uso de suelo comercial."

  end

  it "should get_uso_de_suelo_no" do
    get_uso_de_suelo_no(true, "").should ==  "- Tienes un negocio, pero no sabes que uso de suelo tiene."
    get_uso_de_suelo_no(false, nil).should ==  "- Negocio, pero no sabes que uso de suelo tiene."
  end

  it "should get_no_necesita_uso" do
    get_no_necesita_uso(true, true, 100, 20).should ==  "- Tienes un negocio en el mismo lugar donde habitas, y este no sobrepasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: 100 m2, tamaño negocio: 20 m2)"
  
    get_no_necesita_uso(true, false, 100, 20).should ==  "- Negocio en el mismo lugar donde habitas y este no sobrepasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: 100 m2, tamaño negocio: 20 m2)"
  
    get_no_necesita_uso(false, true, 100, 20).should == "- Tienes un negocio en el mismo lugar donde habitas, y este sobrepasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: 100 m2, tamaño negocio: 20 m2)"

    get_no_necesita_uso(false, false, 100, 20).should == "- Negocio en el mismo lugar donde habitas y este sobrepasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: 100 m2, tamaño negocio: 20 m2)"
  end

  it "should get_business_size" do
    get_business_size(100,true).should == "- Tienes un negocio que mide 100 m2."
    get_business_size(100,false).should == "- Negocio que mide 100 m2."
  end

  it "should get_ubicacion_negocio" do
    get_ubicacion_negocio(true,"GAM","Arbolillo").should == "- Tienes un negocio ubicado en la delegación GAM, en la colonia Arbolillo."
    get_ubicacion_negocio(false,"GAM","Arbolillo").should == "- Negocio ubicado en la delegación GAM, en la colonia Arbolillo."
    get_ubicacion_negocio(true,"GAM",nil).should == "- Tienes un negocio ubicado en la delegación GAM, pero aun no sabes en que colonia."
    get_ubicacion_negocio(false,"GAM",nil).should == "- Negocio ubicado en la delegación GAM, pero aun no sabes en que colonia."
    get_ubicacion_negocio(true,nil,nil).should == "- Tienes un negocio sin ubicación."
    get_ubicacion_negocio(false,nil,nil).should == "- Negocio sin ubicación."
  end

  it "should get_has_zoning" do
    get_has_zoning(true, "2016", false).should == "- Cuentas con un certificado de uso de suelo, expedido en el 2016."
    get_has_zoning(false, "2016", false).should == "- No cuentas con un certificado de uso de suelo."
  end

  it "should get_validate_expiration_zoning" do
    get_validate_expiration_zoning("2015", "2014", true).should == "- Te registraste en el SIAPEM a menos de un año de tramitar tu uso de suelo."
    get_validate_expiration_zoning("2015", "2014", false).should == "- Tienes tu uso de suelo pero no te haz registrado en el SIAPEM."
  end

  it "should get_has_type_zoning" do
    get_has_type_zoning("comercial",true).should == "- Cuentas con el certificado de uso de suelo comercial."
    get_has_type_zoning("comercial",false).should == "- No tienes información de que tipo de certificado uso de suelo tienes."
  end
end