module DiagnosticHelper

  def get_diagnostic_impact(has_business, type, has_siapem)
    if !has_business && type == -1
      'Debido a que tu negocio es nuevo y es de bajo impacto te recomendamos descargar el formato EM03'
    elsif !has_business && type == -2
      'Debido a que tu negocio es nuevo y es de impacto vecinal te recomendamos descargar el formato EM11'
    elsif has_business && type == -1 && has_siapem
      'Debido a que tu negocio ya esta en operación, es de bajo impacto y ya te encuentras registrado en el SIAPEM, te recomendamos descargar los formatos EM01, EM02, EM06, EM07, EM09, EM10 y EMQ'
    elsif has_business && type == -2 && has_siapem
       'Debido a que tu negocio ya esta en operación, es de impacto vecinal y ya te encuentras registrado en el SIAPEM te recomendamos descargar los formatos EM01, EM02, EM04, EM05, EM06, EM7, EM9 y EMH'
    elsif has_business && type == -1 && !has_siapem
      'Debido a que tu negocio ya esta en operación, es de bajo impacto, pero aun no te encuentras registrado en el SIAPEM, te recomendamos descargar el formato EMB'
    elsif has_business && type == -2 && !has_siapem
      'Debido a que tu negocio ya esta en operación, es de impacto vecinal, pero aun no te encuentras registrado en el SIAPEM, te recomendamos descargar el formato EMA'
    end
  end

  def get_diagnostic_impact_license(license)
    if license
      'Debido a que tienes una licencia A u ordinaria te recomendamos descargar el formato EMA del SIAPEM'
    else
      'Debido a que NO tienes una licencia A u ordinaria te recomendamos descargar el formato EM11 del SIAPEM'
    end
  end

  def make_appointment(license)
    if !license
      'Te recomandamos hacer una cita en SEDECO para poder aclarar todas tus dudas'
    end
  end


  def validate_expiration_zoning(date_siapem, date_zoning)
    if date_siapem.to_i == date_zoning.to_i || (date_siapem.to_i - 1) == date_zoning.to_i
      'Te registraste en el SIAPEM a menos de un año de tramitar tu uso de suelo, por lo que'
    else
      get_documents_zoning
    end
  end

  def get_documents_zoning
    'Es importante que llevas a SEDECO los siguientes documentos ...... '
  end

  def get_validate_not_zoning
    'Debido a que tu negocio se encuentra en el mismo lugar en donde habitas y la superficie destinada para el negocio es menor al 20% del total de la propiedad, te aplica el Art 37 de la ley de establecimientos mercantiles....'
  end

  def get_business_recommendations
    'Recomendar que quizá requiera estacionamientos, mostrarle donde y cuando aplica, en esta liga http://www.seduvi.df.gob.mx/portal/index.php/programas-de-desarrollo'
  end

end