module QuestionHelper

	def get_help_impact
		[{title: t('help.question.impact.one'),text: t('help.answer.impact.one_html')},
		{title: t('help.question.impact.two'),text: t('help.answer.impact.two_html')},
		{title: t('help.question.impact.three'),text: t('help.answer.impact.three_html')},
		{title: t('help.question.impact.four'),text: t('help.answer.impact.four_html')},
		{title: t('help.question.impact.five'),text: t('help.answer.impact.five_html')},
		{title: t('help.question.impact.six'),text: t('help.answer.impact.six_html')},
		{title: t('help.question.impact.seven'),text: t('help.answer.impact.seven_html')}]
	end

	def get_help_zoning
		[{title: t('help.question.zoning.one'),text:t('help.answer.zoning.one_html')},
		{title: t('help.question.zoning.two'),text:t('help.answer.zoning.two_html')},
		{title: t('help.question.zoning.three'),text:t('help.answer.zoning.three_html')},
		{title: t('help.question.zoning.four'),text:t('help.answer.zoning.four_html')},
		{title: t('help.question.zoning.five'),text:t('help.answer.zoning.five_html')},
		{title: t('help.question.zoning.six'),text:t('help.answer.zoning.six_html')},
		{title: t('help.question.zoning.seven'),text:t('help.answer.zoning.seven_html')},
		{title: t('help.question.zoning.eight'),text:t('help.answer.zoning.eight_html')},
		{title: t('help.question.zoning.nine'),text:t('help.answer.zoning.nine_html')}]
	end

	def get_help_safety
		[{title: '¿Qué el AFORO?',text:'texto'},
		{title: '¿Qué es área de atención?',text:'texto'},
		{title: '¿A qué se refiere el establecimiento en el área de atención?',text:'texto'},
		{title: '¿A qué se refiere el mobiliario en el área de atención?',text:'texto'},
		{title: '¿A qué se refiere el giro en el área de atención?',text:'texto'},
		{title: '¿Qué es área de servicio?',text:'texto'},
		{title: '¿A qué se refiere el establecimiento en el área de servicio?',text:'texto'},
		{title: '¿A qué se refiere el mobiliario en el área de servicio?',text:'texto'},
		{title: '¿A qué se refiere el área por persona en el área de servicio?',text:'texto'},
		{title: '¿Para qué es la calculadora?',text:'texto'},
		{title: '¿Qué es el autodiagnóstico en materia de protección civil?',text:'texto'},
		{title: '¿Qué es el visto bueno de seguridad y operación?',text:'texto'},
		{title: '¿Qué es un programa interno de protección civil?',text:'texto'},
		{title: '¿Cómo se que tengo implementado un plan interno de protección civil?',text:'texto'},
		{title: '¿Qué es una Licencia Ambiental Única (LAUDF)?',text:'texto'},
		{title: '¿Qué es un aviso de funcionamiento sanitario?',text:'texto'},
		{title: '¿Qué es la constancia de no adeudo de Agua y predial?',text:'texto'}]
	end

end