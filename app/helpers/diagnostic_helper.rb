module DiagnosticHelper


###############################salidas de impacto###############################  
  def get_impacto_user(has_business, type)
    if has_business
    exit = "- Tienes un negocio en operación de "
    else
      exit = "- Negocio de "
    end
    if type == -1
      exit += "bajo impacto." 
    elsif type == -2
      exit += "impacto vecinal."
    elsif type == -3
      exit += "impacto zonal."    
    end
    return exit
  end


  def get_siapem_user(has_siapem,date_siapem)
    if has_siapem
      "- Te encuentras registrado en el SIAPEM desde #{date_siapem}."
    else
      "- Aun no te encuentras registrado en el SIAPEM."
    end
    
  end

  def get_has_open_declaration(has_open_declaration)

    if has_open_declaration
      "- Cuentas con tu declaración de apertura anterior a Marzo 2011."
    else
      "- No cuentas con tu declaración de apertura."
    end
    
  end


  def get_has_special_license(has_special_license)
    if has_special_license
      "- Cuentas con una licencia A u ordinaria."
    else
      "- No cuentas con una licencia A u ordinaria."
    end
  end



  def get_diagnostic_impact(has_business, type, has_siapem, has_open_declaration,has_special_license)

    if !has_business && !has_siapem && type == -1 && !has_open_declaration
      t('impact.exituno_a_html',path_3: asset_path("pdf/3.pdf"))
    elsif !has_business && !has_siapem && type == -1 && has_open_declaration
      t('impact.exituno_b_html',path_3: asset_path("pdf/b.pdf"))
    elsif !has_business && !has_siapem && type == -2 && has_special_license
      t('impact.exitdos_a_html',path_a: asset_path("pdf/a.pdf"))
    elsif !has_business && !has_siapem && type == -2 && !has_special_license
      t('impact.exitdos_b_html',path_11: asset_path("pdf/11.pdf"))
    elsif has_business && has_siapem && type == -1
      t('impact.exittres_html',path_1: asset_path("pdf/1.pdf"),path_2: asset_path("pdf/2.pdf"),path_6: asset_path("pdf/6.pdf"),path_7: asset_path("pdf/7.pdf"),path_9: asset_path("pdf/9.pdf"),path_10: asset_path("pdf/10.pdf"))
    elsif has_business && has_siapem && type == -2
      t('impact.exitcuatro_html',path_1: asset_path("pdf/1.pdf"),path_2: asset_path("pdf/2.pdf"),path_4: asset_path("pdf/4.pdf"),path_5: asset_path("pdf/5.pdf"),path_6: asset_path("pdf/6.pdf"),path_9: asset_path("pdf/9.pdf"))
    elsif has_business && !has_siapem && type == -1 && (has_open_declaration == nil || !has_open_declaration)
     t('impact.exitcinco_html',path_3: asset_path("pdf/3.pdf"))
    elsif has_business && !has_siapem && type == -1 && has_open_declaration
      t('impact.exitseis_html',path_b: asset_path("pdf/b.pdf"))
    elsif has_business && !has_siapem && type == -2 && (has_special_license == nil || !has_special_license)
       t('impact.exitsiete_html',path_11: asset_path("pdf/11.pdf"))
    elsif has_business && !has_siapem && type == -2 && has_special_license
      t('impact.exitocho_html',path_a: asset_path("pdf/a.pdf"))
    end
  end



###############################salidas de suelo###############################  


  def get_uso_de_suelo_ok(has_business, type_zoning)
    if has_business
      "- Un negocio en un uso de suelo #{type_zoning}."
    else
      "- Negocio en un uso de suelo #{type_zoning}."
    end
  end

    def get_uso_de_suelo_no(has_business, type_zoning)
    if has_business
      "- Tienes un negocio, pero no sabes que uso de suelo tiene."
    else
      "- Negocio, pero no sabes que uso de suelo tiene."
    end
  end


  def get_no_necesita_uso(uso_de_suelo, has_business, size_house, size_business)
    if uso_de_suelo
      if has_business
        "- Tienes un negocio en el mismo lugar donde habitas, y este no sobrepasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: #{size_house} m2, tamaño negocio: #{size_business} m2)"
      else
        "- Negocio en el mismo lugar donde habitas y este no sobrepasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: #{size_house} m2, tamaño negocio: #{size_business} m2)"
      end
    else
      if has_business
        "- Tienes un negocio en el mismo lugar donde habitas, y este sobrepasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: #{size_house} m2, tamaño negocio: #{size_business} m2)"
      else
        "- Negocio en el mismo lugar donde habitas y este sobrepasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: #{size_house} m2, tamaño negocio: #{size_business} m2)"
      end
    end
  end

  def get_business_size(size_business,has_business)
    if has_business
      "- Tienes un negocio que mide #{size_business} m2."
    else
      "- Negocio que mide #{size_business} m2."
    end
  end

  def get_ubicacion_negocio(has_business,city_zoning,town_business)
    if has_business
      exit = "- Tienes un negocio "
    else
      exit = "- Negocio "
    end
    if !city_zoning.nil?
      exit += "ubicado en la delegación #{city_zoning}"
      if !town_business.nil?
        exit += ", en la colonia #{town_business}."
      else
        exit += ", pero aun no sabes en que colonia."
      end
    else
      exit += "sin ubicación."
    end
  end

  def get_has_zoning(has_zoning, date_zoning, has_type_zoning)
    if has_zoning
      "- Cuentas con un certificado de uso de suelo, expedido en el #{date_zoning}."
    else
      "- No cuentas con un certificado de uso de suelo."
    end
  end


  def get_validate_expiration_zoning(date_siapem, date_zoning, value)
    if date_siapem.to_i == date_zoning.to_i || (date_siapem.to_i - 1) == date_zoning.to_i && value
      "- Te registraste en el SIAPEM a menos de un año de tramitar tu uso de suelo."
    else
      "- Tienes tu uso de suelo pero no te haz registrado en el SIAPEM."
    end
  end

  def get_validate_expiration_certificado(date_siapem, date_zoning,has_siapem)
    if date_siapem.to_i == date_zoning.to_i || (date_siapem.to_i - 1) == date_zoning.to_i
       t('zoning.zoning_with_certificado_ok_html')
    elsif Date.today.year.to_i == date_zoning.to_i || (Date.today.year.to_i - 1) == date_zoning.to_i
      t('zoning.zoning_with_certificado_ok_no_siapem_html')
    else
        if has_siapem
          t('zoning.zoning_with_certificado_caduco_siapem_html')
        else
          t('zoning.zoning_with_certificado_caduco_html')
        end 
    end
  end

  def get_has_type_zoning(has_type_zoning,value)
    if value
      "- Cuentas con el certificado de uso de suelo #{has_type_zoning}."
    else 
      "- No tienes información de que tipo de certificado uso de suelo tienes."
    end
  end

  def get_no_date_zoning
    "- No tienes la fecha de expedición de tu uso de suelo."
  end
  

  def validate_expiration_zoning(date_siapem, date_zoning)
    if date_siapem.to_i == date_zoning.to_i || (date_siapem.to_i - 1) == date_zoning.to_i
      t('zoning.expiration_zoning_html')
    else
      get_documents_zoning(date_siapem, date_zoning,has_open_declaration,has_zoning,has_special_license)
    end
  end


  def get_documents_zoning(date_siapem, date_zoning,has_open_declaration,has_zoning,has_special_license)
    if has_open_declaration && !has_zoning
      t('zoning.documents_with_format_b_html')
    elsif has_special_license && !has_zoning
      t('zoning.documents_with_format_a_html')
    else
      if date_siapem != nil && date_zoning != nil && date_siapem.to_i == date_zoning.to_i || (date_siapem.to_i - 1) == date_zoning.to_i
        t('zoning.no_documents_html')
      else
        t('zoning.documents_html')
      end
    end
  end

  def get_validate_not_zoning
    t('zoning.not_zoning_html')
  end

  def get_business_recommendations
    t('zoning.recommendations_html')
  end

###############################salidas de seguridad############################### 
  def get_aforo(aforo)
    "- Tienes un AFORO de: #{aforo}."
  end

  def get_has_autodiagnostico(has_autodiagnostico)
    if has_autodiagnostico
      "- Ya recogiste y entregaste el autodiagnóstico en materia de protección civil en tu delegación."
    else 
      "- Aun no recogiste y/o entregas el autodiagnóstico en materia de protección civil en tu delegación."
    end
    
  end

  def get_has_protection(has_protection,aforo)
    if aforo.to_i < 50
      "- Revisar los requerimientos minimos de protección civil que están en el articúlo 10 de la Ley de Establecimientos Mercantiles."
    else
      if has_protection
        "- Te aplica un programa interno de protección civil."
      else
        "- No te aplica un programa interno de protección civil."
      end
    end
    
  end




  def get_make_protection(make_protection)
    if make_protection
      "- Tienes autorizado e implementado un programa interno de protección civil."
    else
      "- No tienes autorizado e implementado un programa interno de protección civil."
    end
  end


  def get_license_sanitaria(license_sanitaria)
    if license_sanitaria
      "- Sabes que requieres una Licencia Ambiental Única."
    else
      "- No sabes si requieres una Licencia Ambiental Única."
    end
  end

  def get_license_ambiental(license_ambiental)
    if license_ambiental
      "- Sabes que requieres un aviso de funcionamiento sanitario."
    else
      "- No sabes si requieres un aviso de funcionamiento sanitario."
    end
  end

  def get_has_license_sanitaria(has_license_sanitaria)
    if has_license_sanitaria
      "- Cuentas con una Licencia Ambiental Única."
    else
      "- No cuentas con una Licencia Ambiental Única."
    end
  end

  def get_has_license_ambiental(has_license_ambiental)
    if has_license_ambiental
      "- Cuentas con un aviso de funcionamiento sanitario."
    else
      "- No cuentas con un aviso de funcionamiento sanitario."
    end
  end


  def get_diagnostico_seguridad(has_autodiagnostico,has_protection,make_protection,aforo)
    if aforo.to_i >= 50
      if make_protection
        t('safety.make_protection_html')
      else
        t('safety.no_make_protection_html')
      end
    else
      if has_autodiagnostico && has_protection && make_protection
        t('safety.seguridad_minima_con_proteccion_implementado_html')
      elsif has_autodiagnostico && has_protection && !make_protection
        t('safety.seguridad_minima_con_proteccion_sin_implementar_html')
      #elsif has_autodiagnostico && !has_protection
       # t('safety.seguridad_minima_sin_proteccion_html')
      else
        t('safety.seguridad_minima_sin_diagnostico_html')
      end
    end
  end

  def get_diagnostic_license_ambiental(license_ambiental)
    t('safety.ambiental_html')
  end

  def get_diagnostic_license_sanitaria(license_sanitaria)
    t('safety.sanitaria_html')
  end
  
  def has_not_debts(no_adeudos)
    if !no_adeudos
       t('safety.no_debts_html')
    end
  end

end