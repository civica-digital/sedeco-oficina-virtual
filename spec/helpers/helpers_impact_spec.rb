require_relative '../../app/helpers/diagnostic_helper'

describe 'Test all Helpers impact'  do
  include DiagnosticHelper

   it "should get_impacto_user" do
    get_impacto_user(true, -1).should == "- Tienes un negocio en operación de bajo impacto."
    
    get_impacto_user(true, -2).should == "- Tienes un negocio en operación de impacto vecinal."

    get_impacto_user(true, -3).should == "- Tienes un negocio en operación de impacto zonal."


    get_impacto_user(false, -1).should == "- Negocio de bajo impacto."
    
    get_impacto_user(false, -2).should == "- Negocio de impacto vecinal."

    get_impacto_user(false, -3).should == "- Negocio de impacto zonal."

  end

  it "should get_simple_impacto_user" do
    get_simple_impacto_user(-1).should == "BAJO IMPACTO."
    get_simple_impacto_user(-2).should == "IMPACTO VECINAL."
  end

  it "should get_siapem_user" do
    
    get_siapem_user(true,"12/12/2012").should == "- Te encuentras registrado en el SIAPEM desde 12/12/2012."

    get_siapem_user(false, nil).should == "- Aun no te encuentras registrado en el SIAPEM."
  end

  it "should get_has_open_declaration" do
    get_has_open_declaration(true, false).should == "- Cuentas con tu declaración de apertura anterior a Marzo 2011, este documento ya no es vigente, debes regisrarte en el SIAPEM."
  end

  it "should get_has_special_license" do
    get_has_special_license(true).should ==  "- Cuentas con una licencia A u ordinaria."

    get_has_special_license(false).should == "- No cuentas con una licencia A u ordinaria."
  end
end
