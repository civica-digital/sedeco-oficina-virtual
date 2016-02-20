require_relative '../../app/helpers/diagnostic_helper'

describe 'Test all Helpers safety'  do
  include DiagnosticHelper

   it "should get_aforo" do
    get_aforo(50).should ==  "- Tienes un AFORO de: 50."
  end

   it "should get_has_autodiagnostico" do
   	get_has_autodiagnostico(true).should == "- Ya recogiste y entregaste el autodiagnóstico en materia de protección civil en tu delegación."
   	get_has_autodiagnostico(false).should ==  "- Aun no recogiste y/o entregas el autodiagnóstico en materia de protección civil en tu delegación."
   end

   it "should get_has_protection" do
   	get_has_protection(false,49).should ==  "- Revisar los requerimientos minimos de protección civil que están en el articúlo 10 de la Ley de Establecimientos Mercantiles."
   	get_has_protection(true,51).should == "- Te aplica un programa interno de protección civil."
   	get_has_protection(false,51).should ==  "- No te aplica un programa interno de protección civil."
   end	

   it "should get_license_sanitaria" do
   	get_license_sanitaria(true).should == "- Sabes que requieres una Licencia Ambiental Única."
   	get_license_sanitaria(false).should == "- No sabes si requieres una Licencia Ambiental Única."
   end

    it "should get_license_ambiental" do
   	 get_license_ambiental(true).should == "- Sabes que requieres un aviso de funcionamiento sanitario."
   	 get_license_ambiental(false).should == "- No sabes si requieres un aviso de funcionamiento sanitario."
   end

    it "should get_has_license_sanitaria" do
   	 get_has_license_sanitaria(true).should == "- Cuentas con una Licencia Ambiental Única."
   	 get_has_license_sanitaria(false).should == "- No cuentas con una Licencia Ambiental Única."
   end

    it "should get_has_license_ambiental" do
   	 get_has_license_ambiental(true).should == "- Cuentas con un aviso de funcionamiento sanitario."
   	 get_has_license_ambiental(false).should == "- No cuentas con un aviso de funcionamiento sanitario."
   end
 end