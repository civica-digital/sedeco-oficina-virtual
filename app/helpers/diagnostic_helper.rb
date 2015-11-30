module DiagnosticHelper

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

  def make_appointment(license)
    if !license
      'Te recomandamos hacer una cita en SEDECO para poder aclarar todas tus dudas'
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