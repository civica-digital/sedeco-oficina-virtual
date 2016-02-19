require_relative '../../app/helpers/diagnostic_helper'

describe 'Test all Helpers'  do
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

end
