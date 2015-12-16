module DiagnosticHelper


###############################salidas de impacto###############################  
  def get_impacto_user(has_business, type)
    if has_business
    exit = "- Tienes un negocio en operación de "
    else
      exit = "- Quieres abrir un negocio de "
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
      "- Cuentas con tu declaración de apertura."
    else
      "- Aun no cuentas con tu declaración de apertura."
    end
    
  end


  def get_has_special_license(has_special_license)
    if has_special_license
      "- Cuentas con una licencia A u ordinaria."
    else
      "- No cuentas con una licencia A u ordinaria."
    end
  end



  def get_diagnostic_impact(has_business, type, has_siapem)
    if !has_business && type == -1
      t('impact.exituno_html')
    elsif !has_business && type == -2
      t('impact.exitdos_html')
    elsif has_business && type == -1 && has_siapem
      t('impact.exittres_html')
    elsif has_business && type == -2 && has_siapem
      t('impact.exitcuatro_html')
    elsif has_business && type == -1 && !has_siapem
      t('impact.exitcinco_html')
    elsif has_business && type == -2 && !has_siapem
      t('impact.exitseis_html')
    end
  end

  def get_diagnostic_impact_license(license)
    if license
      t('impact.has_license_html')
    else
      t('impact.hasnt_licese_html')
    end
  end


###############################salidas de suelo###############################  


  def get_uso_de_suelo_ok(has_business, type_zoning)
    if has_business
      "- Tienes un negocio en un uso de suelo #{type_zoning}."
    else
      "- Quieres abrir un negocio en un uso de suelo #{type_zoning}."
    end
  end

    def get_uso_de_suelo_no(has_business, type_zoning)
    if has_business
      "- Tienes un negocio, pero no sabes que uso de suelo tiene."
    else
      "- Quieres abrir un negocio, pero no sabes que uso de suelo tiene."
    end
  end


  def get_no_necesita_uso(uso_de_suelo, has_business, size_house, size_business)
    if uso_de_suelo
      if has_business
        "- Tienes un negocio en el mismo lugar donde habitas, y este no sobre pasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: #{size_house} m2, tamaño negocio: #{size_business} m2)"
      else
        "- Quieres abrir un negocio en el mismo lugar donde habitas y este no sobre pasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: #{size_house} m2, tamaño negocio: #{size_business} m2)"
      end
    else
      if has_business
        "- Tienes un negocio en el mismo lugar donde habitas, y este sobre pasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: #{size_house} m2, tamaño negocio: #{size_business} m2)"
      else
        "- Quieres abrir un negocio en el mismo lugar donde habitas y este sobre pasa el 20% del tamaño total de la vivienda. (Tamaño vivienda: #{size_house} m2, tamaño negocio: #{size_business} m2)"
      end
    end
  end

  

  def validate_expiration_zoning(date_siapem, date_zoning)
    if date_siapem.to_i == date_zoning.to_i || (date_siapem.to_i - 1) == date_zoning.to_i
      t('zoning.expiration_zoning_html')
    else
      get_documents_zoning
    end
  end

  def get_documents_zoning
    t('zoning.documents_html')
  end

  def get_validate_not_zoning
    t('zoning.not_zoning_html')
  end

  def get_business_recommendations
    t('zoning.recommendations_html')
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
      elsif has_autodiagnostico && !has_protection
        t('safety.seguridad_minima_sin_proteccion_html')
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