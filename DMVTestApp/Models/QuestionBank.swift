import Foundation

class QuestionBank {
    static let shared = QuestionBank()

    let allQuestions: [Question]

    func questions(for category: QuestionCategory) -> [Question] {
        allQuestions.filter { $0.category == category }
    }

    func questionCount(for category: QuestionCategory) -> Int {
        questions(for: category).count
    }

    private init() {
        allQuestions = QuestionBank.buildQuestions()
    }

    private static func buildQuestions() -> [Question] {
        var questions: [Question] = []

        // MARK: - Road Signs

        questions.append(Question(
            id: "rs_001",
            category: .roadSigns,
            answers: ["Stop", "Yield", "No Entry", "Speed Limit"],
            correctAnswerIndex: 0,
            explanation: "A red octagonal sign always means STOP. You must come to a complete stop at the stop line or before entering the crosswalk.",
            localizedText: [
                "en": "What does a red octagonal (8-sided) sign mean?",
                "es": "¿Qué significa una señal octagonal (8 lados) roja?",
                "zh-Hans": "红色八角形标志是什么意思？",
                "vi": "Biển báo hình bát giác (8 cạnh) màu đỏ có nghĩa là gì?",
                "ko": "빨간색 팔각형(8면) 표지판은 무엇을 의미합니까?",
                "ar": "ماذا تعني اللافتة الحمراء المثمنة (8 أضلاع)؟",
                "fr": "Que signifie un panneau octogonal (8 côtés) rouge ?",
                "ru": "Что означает красный восьмиугольный знак?"
            ],
            localizedAnswers: [
                "en": ["Stop", "Yield", "No Entry", "Speed Limit"],
                "es": ["Pare", "Ceda el paso", "No entrar", "Límite de velocidad"],
                "zh-Hans": ["停车", "让行", "禁止进入", "速度限制"],
                "vi": ["Dừng lại", "Nhường đường", "Cấm vào", "Giới hạn tốc độ"],
                "ko": ["정지", "양보", "진입 금지", "속도 제한"],
                "ar": ["قف", "أعطِ الأولوية", "ممنوع الدخول", "حد السرعة"],
                "fr": ["Arrêt", "Cédez le passage", "Entrée interdite", "Limite de vitesse"],
                "ru": ["Стоп", "Уступите дорогу", "Въезд запрещён", "Ограничение скорости"]
            ],
            localizedExplanation: [
                "en": "A red octagonal sign always means STOP. You must come to a complete stop at the stop line or before entering the crosswalk.",
                "es": "Una señal octagonal roja siempre significa PARE. Debe detenerse completamente en la línea de parada o antes de entrar al cruce peatonal.",
                "zh-Hans": "红色八角形标志始终表示停车。您必须在停车线或人行横道前完全停车。",
                "vi": "Biển báo hình bát giác màu đỏ luôn có nghĩa là DỪNG LẠI. Bạn phải dừng hoàn toàn tại vạch dừng hoặc trước vạch sang đường.",
                "ko": "빨간색 팔각형 표지판은 항상 정지를 의미합니다. 정지선이나 횡단보도 앞에서 완전히 정지해야 합니다.",
                "ar": "اللافتة الحمراء المثمنة تعني دائماً قف. يجب أن تتوقف تماماً عند خط التوقف أو قبل دخول ممر المشاة.",
                "fr": "Un panneau octogonal rouge signifie toujours ARRÊT. Vous devez vous arrêter complètement à la ligne d'arrêt ou avant le passage piéton.",
                "ru": "Красный восьмиугольный знак всегда означает СТОП. Вы должны полностью остановиться у стоп-линии или перед пешеходным переходом."
            ]
        ))

        questions.append(Question(
            id: "rs_002",
            category: .roadSigns,
            answers: ["Yield", "Merge", "Caution", "No Passing"],
            correctAnswerIndex: 0,
            explanation: "A triangular sign pointing downward means YIELD. You must slow down and give the right-of-way to traffic on the intersecting road.",
            localizedText: [
                "en": "What does a triangular sign pointing downward mean?",
                "es": "¿Qué significa una señal triangular apuntando hacia abajo?",
                "zh-Hans": "向下指的三角形标志是什么意思？",
                "vi": "Biển báo hình tam giác chỉ xuống có nghĩa là gì?",
                "ko": "아래를 가리키는 삼각형 표지판은 무엇을 의미합니까?",
                "ar": "ماذا تعني اللافتة المثلثة المتجهة لأسفل؟",
                "fr": "Que signifie un panneau triangulaire pointant vers le bas ?",
                "ru": "Что означает треугольный знак, направленный вниз?"
            ],
            localizedAnswers: [
                "en": ["Yield", "Merge", "Caution", "No Passing"],
                "es": ["Ceda el paso", "Incorporarse", "Precaución", "No adelantar"],
                "zh-Hans": ["让行", "合流", "注意", "禁止超车"],
                "vi": ["Nhường đường", "Nhập làn", "Cẩn thận", "Cấm vượt"],
                "ko": ["양보", "합류", "주의", "추월 금지"],
                "ar": ["أعطِ الأولوية", "اندمج", "تنبيه", "ممنوع التجاوز"],
                "fr": ["Cédez le passage", "Insertion", "Attention", "Dépassement interdit"],
                "ru": ["Уступите дорогу", "Слияние", "Осторожно", "Обгон запрещён"]
            ],
            localizedExplanation: [
                "en": "A triangular sign pointing downward means YIELD. You must slow down and give the right-of-way to traffic on the intersecting road.",
                "es": "Una señal triangular apuntando hacia abajo significa CEDA EL PASO. Debe reducir la velocidad y dar paso al tráfico en la carretera que se cruza.",
                "zh-Hans": "向下指的三角形标志意味着让行。您必须减速并让交叉道路上的车辆先行。",
                "vi": "Biển báo hình tam giác chỉ xuống có nghĩa là NHƯỜNG ĐƯỜNG. Bạn phải giảm tốc độ và nhường đường cho xe trên đường giao nhau.",
                "ko": "아래를 가리키는 삼각형 표지판은 양보를 의미합니다. 속도를 줄이고 교차 도로의 교통에 통행권을 양보해야 합니다.",
                "ar": "اللافتة المثلثة المتجهة لأسفل تعني أعطِ الأولوية. يجب أن تبطئ وتعطي حق الأولوية للمرور على الطريق المتقاطع.",
                "fr": "Un panneau triangulaire pointant vers le bas signifie CÉDEZ LE PASSAGE. Vous devez ralentir et céder la priorité au trafic sur la route croisée.",
                "ru": "Треугольный знак, направленный вниз, означает УСТУПИТЕ ДОРОГУ. Вы должны снизить скорость и уступить право проезда транспорту на пересекающей дороге."
            ]
        ))

        questions.append(Question(
            id: "rs_003",
            category: .roadSigns,
            answers: ["Warning/Caution", "Stop ahead", "Construction zone", "School zone"],
            correctAnswerIndex: 0,
            explanation: "Yellow diamond-shaped signs are warning signs. They alert you to possible hazards or changes in road conditions ahead.",
            localizedText: [
                "en": "What do yellow diamond-shaped signs indicate?",
                "es": "¿Qué indican las señales amarillas en forma de diamante?",
                "zh-Hans": "黄色菱形标志表示什么？",
                "vi": "Biển báo hình thoi màu vàng biểu thị điều gì?",
                "ko": "노란색 다이아몬드 모양의 표지판은 무엇을 나타냅니까?",
                "ar": "ماذا تشير اللافتات الصفراء الماسية الشكل؟",
                "fr": "Qu'indiquent les panneaux jaunes en forme de losange ?",
                "ru": "Что означают жёлтые ромбовидные знаки?"
            ],
            localizedAnswers: [
                "en": ["Warning/Caution", "Stop ahead", "Construction zone", "School zone"],
                "es": ["Advertencia/Precaución", "Pare adelante", "Zona de construcción", "Zona escolar"],
                "zh-Hans": ["警告/注意", "前方停车", "施工区域", "学校区域"],
                "vi": ["Cảnh báo/Chú ý", "Dừng phía trước", "Khu vực xây dựng", "Khu vực trường học"],
                "ko": ["경고/주의", "전방 정지", "공사 구간", "학교 구역"],
                "ar": ["تحذير/تنبيه", "توقف أمامك", "منطقة بناء", "منطقة مدرسة"],
                "fr": ["Avertissement/Attention", "Arrêt devant", "Zone de construction", "Zone scolaire"],
                "ru": ["Предупреждение/Осторожно", "Стоп впереди", "Зона строительства", "Школьная зона"]
            ],
            localizedExplanation: [
                "en": "Yellow diamond-shaped signs are warning signs. They alert you to possible hazards or changes in road conditions ahead.",
                "es": "Las señales amarillas en forma de diamante son señales de advertencia. Le alertan sobre posibles peligros o cambios en las condiciones del camino.",
                "zh-Hans": "黄色菱形标志是警告标志。它们提醒您前方可能存在的危险或道路状况的变化。",
                "vi": "Biển báo hình thoi màu vàng là biển cảnh báo. Chúng cảnh báo bạn về các nguy hiểm hoặc thay đổi điều kiện đường phía trước.",
                "ko": "노란색 다이아몬드 모양의 표지판은 경고 표지판입니다. 전방의 가능한 위험이나 도로 상태 변화를 알려줍니다.",
                "ar": "اللافتات الصفراء الماسية الشكل هي لافتات تحذيرية. تنبهك إلى المخاطر المحتملة أو التغييرات في ظروف الطريق أمامك.",
                "fr": "Les panneaux jaunes en forme de losange sont des panneaux d'avertissement. Ils vous alertent des dangers possibles ou des changements de conditions routières.",
                "ru": "Жёлтые ромбовидные знаки — это предупреждающие знаки. Они предупреждают о возможных опасностях или изменениях дорожных условий впереди."
            ]
        ))

        questions.append(Question(
            id: "rs_004",
            category: .roadSigns,
            answers: ["Railroad crossing ahead", "Road closed", "No trucks allowed", "Detour ahead"],
            correctAnswerIndex: 0,
            explanation: "A round yellow sign with a black X and two R's means there is a railroad crossing ahead. Be prepared to stop if a train is approaching.",
            localizedText: [
                "en": "What does a round yellow sign with an X and two R's mean?",
                "es": "¿Qué significa una señal redonda amarilla con una X y dos R?",
                "zh-Hans": "带有X和两个R的圆形黄色标志是什么意思？",
                "vi": "Biển báo tròn màu vàng với chữ X và hai chữ R có nghĩa là gì?",
                "ko": "X와 두 개의 R이 있는 둥근 노란색 표지판은 무엇을 의미합니까?",
                "ar": "ماذا تعني اللافتة الدائرية الصفراء التي تحمل علامة X وحرفي R؟",
                "fr": "Que signifie un panneau rond jaune avec un X et deux R ?",
                "ru": "Что означает круглый жёлтый знак с X и двумя буквами R?"
            ],
            localizedAnswers: [
                "en": ["Railroad crossing ahead", "Road closed", "No trucks allowed", "Detour ahead"],
                "es": ["Cruce de ferrocarril adelante", "Camino cerrado", "Camiones no permitidos", "Desvío adelante"],
                "zh-Hans": ["前方铁路道口", "道路关闭", "禁止卡车通行", "前方绕行"],
                "vi": ["Đường sắt giao nhau phía trước", "Đường đóng", "Cấm xe tải", "Đường vòng phía trước"],
                "ko": ["전방 철도 건널목", "도로 폐쇄", "트럭 통행 금지", "전방 우회"],
                "ar": ["تقاطع سكة حديد أمامك", "طريق مغلق", "ممنوع الشاحنات", "تحويلة أمامك"],
                "fr": ["Passage à niveau devant", "Route fermée", "Camions interdits", "Déviation devant"],
                "ru": ["Впереди железнодорожный переезд", "Дорога закрыта", "Грузовикам въезд запрещён", "Объезд впереди"]
            ],
            localizedExplanation: [
                "en": "A round yellow sign with a black X and two R's means there is a railroad crossing ahead. Be prepared to stop if a train is approaching.",
                "es": "Una señal redonda amarilla con una X negra y dos R significa que hay un cruce de ferrocarril adelante. Esté preparado para detenerse si un tren se acerca.",
                "zh-Hans": "带有黑色X和两个R的圆形黄色标志表示前方有铁路道口。如果有火车驶来，请准备停车。",
                "vi": "Biển báo tròn màu vàng với X đen và hai chữ R nghĩa là có đường sắt giao nhau phía trước. Hãy chuẩn bị dừng lại nếu tàu đang đến.",
                "ko": "검은색 X와 두 개의 R이 있는 둥근 노란색 표지판은 전방에 철도 건널목이 있음을 의미합니다. 기차가 접근하면 정지할 준비를 하세요.",
                "ar": "اللافتة الدائرية الصفراء مع X أسود وحرفي R تعني وجود تقاطع سكة حديد أمامك. كن مستعداً للتوقف إذا كان القطار يقترب.",
                "fr": "Un panneau rond jaune avec un X noir et deux R signifie qu'il y a un passage à niveau devant. Soyez prêt à vous arrêter si un train approche.",
                "ru": "Круглый жёлтый знак с чёрным X и двумя R означает, что впереди железнодорожный переезд. Будьте готовы остановиться, если приближается поезд."
            ]
        ))

        questions.append(Question(
            id: "rs_005",
            category: .roadSigns,
            answers: ["No U-turn", "No left turn", "No right turn", "Dead end"],
            correctAnswerIndex: 0,
            explanation: "A sign showing a U-turn arrow with a red circle and line through it means U-turns are not allowed at that location.",
            localizedText: [
                "en": "What does a sign with a U-turn arrow crossed out by a red circle mean?",
                "es": "¿Qué significa una señal con una flecha de giro en U tachada por un círculo rojo?",
                "zh-Hans": "被红色圆圈划掉的掉头箭头标志是什么意思？",
                "vi": "Biển báo có mũi tên quay đầu bị gạch bỏ bởi vòng tròn đỏ có nghĩa là gì?",
                "ko": "빨간 원으로 취소된 U턴 화살표가 있는 표지판은 무엇을 의미합니까?",
                "ar": "ماذا تعني لافتة بها سهم انعطاف مشطوب بدائرة حمراء؟",
                "fr": "Que signifie un panneau avec une flèche de demi-tour barrée par un cercle rouge ?",
                "ru": "Что означает знак с перечёркнутой красным кругом стрелкой разворота?"
            ],
            localizedAnswers: [
                "en": ["No U-turn", "No left turn", "No right turn", "Dead end"],
                "es": ["Prohibido girar en U", "Prohibido girar a la izquierda", "Prohibido girar a la derecha", "Sin salida"],
                "zh-Hans": ["禁止掉头", "禁止左转", "禁止右转", "死胡同"],
                "vi": ["Cấm quay đầu", "Cấm rẽ trái", "Cấm rẽ phải", "Đường cụt"],
                "ko": ["U턴 금지", "좌회전 금지", "우회전 금지", "막다른 길"],
                "ar": ["ممنوع الانعطاف", "ممنوع الانعطاف يساراً", "ممنوع الانعطاف يميناً", "طريق مسدود"],
                "fr": ["Demi-tour interdit", "Virage à gauche interdit", "Virage à droite interdit", "Impasse"],
                "ru": ["Разворот запрещён", "Поворот налево запрещён", "Поворот направо запрещён", "Тупик"]
            ],
            localizedExplanation: [
                "en": "A sign showing a U-turn arrow with a red circle and line through it means U-turns are not allowed at that location.",
                "es": "Una señal que muestra una flecha de giro en U con un círculo rojo y una línea a través de ella significa que los giros en U no están permitidos en ese lugar.",
                "zh-Hans": "显示掉头箭头被红色圆圈和线条穿过的标志表示该地点不允许掉头。",
                "vi": "Biển báo cho thấy mũi tên quay đầu với vòng tròn đỏ và đường gạch qua nghĩa là không được phép quay đầu tại vị trí đó.",
                "ko": "빨간 원과 선이 그어진 U턴 화살표 표지판은 해당 위치에서 U턴이 금지되어 있음을 의미합니다.",
                "ar": "اللافتة التي تُظهر سهم انعطاف مع دائرة حمراء وخط عبرها تعني أن الانعطاف غير مسموح في ذلك الموقع.",
                "fr": "Un panneau montrant une flèche de demi-tour avec un cercle rouge et une ligne signifie que les demi-tours ne sont pas autorisés à cet endroit.",
                "ru": "Знак со стрелкой разворота, перечёркнутой красным кругом, означает, что развороты запрещены в этом месте."
            ]
        ))

        // MARK: - Traffic Laws

        questions.append(Question(
            id: "tl_001",
            category: .trafficLaws,
            answers: ["25 mph", "15 mph", "35 mph", "30 mph"],
            correctAnswerIndex: 0,
            explanation: "The default speed limit in residential areas is 25 mph unless otherwise posted.",
            localizedText: [
                "en": "What is the default speed limit in a residential area?",
                "es": "¿Cuál es el límite de velocidad predeterminado en un área residencial?",
                "zh-Hans": "住宅区的默认限速是多少？",
                "vi": "Giới hạn tốc độ mặc định trong khu dân cư là bao nhiêu?",
                "ko": "주거 지역의 기본 속도 제한은 얼마입니까?",
                "ar": "ما هو حد السرعة الافتراضي في المنطقة السكنية؟",
                "fr": "Quelle est la limite de vitesse par défaut dans une zone résidentielle ?",
                "ru": "Каково ограничение скорости по умолчанию в жилом районе?"
            ],
            localizedAnswers: [
                "en": ["25 mph", "15 mph", "35 mph", "30 mph"],
                "es": ["25 mph", "15 mph", "35 mph", "30 mph"],
                "zh-Hans": ["25英里/小时", "15英里/小时", "35英里/小时", "30英里/小时"],
                "vi": ["25 mph", "15 mph", "35 mph", "30 mph"],
                "ko": ["25 mph", "15 mph", "35 mph", "30 mph"],
                "ar": ["25 ميل/ساعة", "15 ميل/ساعة", "35 ميل/ساعة", "30 ميل/ساعة"],
                "fr": ["25 mph", "15 mph", "35 mph", "30 mph"],
                "ru": ["25 миль/ч", "15 миль/ч", "35 миль/ч", "30 миль/ч"]
            ],
            localizedExplanation: [
                "en": "The default speed limit in residential areas is 25 mph unless otherwise posted.",
                "es": "El límite de velocidad predeterminado en áreas residenciales es 25 mph a menos que se indique lo contrario.",
                "zh-Hans": "除非另有标示，住宅区的默认限速为25英里/小时。",
                "vi": "Giới hạn tốc độ mặc định trong khu dân cư là 25 mph trừ khi có biển báo khác.",
                "ko": "별도 표시가 없는 한 주거 지역의 기본 속도 제한은 25mph입니다.",
                "ar": "حد السرعة الافتراضي في المناطق السكنية هو 25 ميل/ساعة ما لم يُذكر خلاف ذلك.",
                "fr": "La limite de vitesse par défaut dans les zones résidentielles est de 25 mph sauf indication contraire.",
                "ru": "Ограничение скорости по умолчанию в жилых районах составляет 25 миль/ч, если не указано иное."
            ]
        ))

        questions.append(Question(
            id: "tl_002",
            category: .trafficLaws,
            answers: ["A solid yellow line on your side", "A broken yellow line on your side", "A white dashed line", "A solid white line"],
            correctAnswerIndex: 0,
            explanation: "A solid yellow line on your side of the road means you cannot pass. A broken yellow line means passing is allowed when safe.",
            localizedText: [
                "en": "Which line marking means you are NOT allowed to pass?",
                "es": "¿Qué marca de línea significa que NO se le permite adelantar?",
                "zh-Hans": "哪种线标记表示不允许超车？",
                "vi": "Vạch kẻ nào có nghĩa là bạn KHÔNG được phép vượt?",
                "ko": "어떤 차선 표시가 추월이 허용되지 않음을 의미합니까?",
                "ar": "أي علامة خط تعني أنه لا يُسمح لك بالتجاوز؟",
                "fr": "Quelle marque de ligne signifie que vous n'êtes PAS autorisé à dépasser ?",
                "ru": "Какая линейная разметка означает, что обгон запрещён?"
            ],
            localizedAnswers: [
                "en": ["A solid yellow line on your side", "A broken yellow line on your side", "A white dashed line", "A solid white line"],
                "es": ["Una línea amarilla sólida de su lado", "Una línea amarilla discontinua de su lado", "Una línea blanca discontinua", "Una línea blanca sólida"],
                "zh-Hans": ["您一侧的黄色实线", "您一侧的黄色虚线", "白色虚线", "白色实线"],
                "vi": ["Vạch vàng liền bên phía bạn", "Vạch vàng đứt đoạn bên phía bạn", "Vạch trắng đứt đoạn", "Vạch trắng liền"],
                "ko": ["내 쪽의 실선 황색 선", "내 쪽의 점선 황색 선", "흰색 점선", "흰색 실선"],
                "ar": ["خط أصفر متصل على جانبك", "خط أصفر متقطع على جانبك", "خط أبيض متقطع", "خط أبيض متصل"],
                "fr": ["Une ligne jaune continue de votre côté", "Une ligne jaune discontinue de votre côté", "Une ligne blanche en pointillés", "Une ligne blanche continue"],
                "ru": ["Сплошная жёлтая линия на вашей стороне", "Прерывистая жёлтая линия на вашей стороне", "Белая пунктирная линия", "Сплошная белая линия"]
            ],
            localizedExplanation: [
                "en": "A solid yellow line on your side of the road means you cannot pass. A broken yellow line means passing is allowed when safe.",
                "es": "Una línea amarilla sólida de su lado del camino significa que no puede adelantar. Una línea amarilla discontinua significa que se permite adelantar cuando es seguro.",
                "zh-Hans": "您一侧道路上的黄色实线表示不允许超车。黄色虚线表示在安全时允许超车。",
                "vi": "Vạch vàng liền bên phía bạn trên đường có nghĩa là bạn không được vượt. Vạch vàng đứt đoạn có nghĩa là được phép vượt khi an toàn.",
                "ko": "도로의 내 쪽에 있는 실선 황색 선은 추월이 금지됨을 의미합니다. 점선 황색 선은 안전할 때 추월이 허용됨을 의미합니다.",
                "ar": "الخط الأصفر المتصل على جانبك من الطريق يعني أنه لا يمكنك التجاوز. الخط الأصفر المتقطع يعني أن التجاوز مسموح عندما يكون آمناً.",
                "fr": "Une ligne jaune continue de votre côté de la route signifie que vous ne pouvez pas dépasser. Une ligne jaune discontinue signifie que le dépassement est autorisé quand c'est sûr.",
                "ru": "Сплошная жёлтая линия на вашей стороне дороги означает, что обгон запрещён. Прерывистая жёлтая линия означает, что обгон разрешён, когда это безопасно."
            ]
        ))

        questions.append(Question(
            id: "tl_003",
            category: .trafficLaws,
            answers: ["15 mph", "25 mph", "20 mph", "10 mph"],
            correctAnswerIndex: 0,
            explanation: "The speed limit near schools when children are present is 15 mph in most states.",
            localizedText: [
                "en": "What is the speed limit near schools when children are present?",
                "es": "¿Cuál es el límite de velocidad cerca de escuelas cuando hay niños presentes?",
                "zh-Hans": "学校附近有儿童时的限速是多少？",
                "vi": "Giới hạn tốc độ gần trường học khi có trẻ em là bao nhiêu?",
                "ko": "어린이가 있을 때 학교 근처의 속도 제한은 얼마입니까?",
                "ar": "ما هو حد السرعة بالقرب من المدارس عند وجود أطفال؟",
                "fr": "Quelle est la limite de vitesse près des écoles en présence d'enfants ?",
                "ru": "Каково ограничение скорости вблизи школ при наличии детей?"
            ],
            localizedAnswers: [
                "en": ["15 mph", "25 mph", "20 mph", "10 mph"],
                "es": ["15 mph", "25 mph", "20 mph", "10 mph"],
                "zh-Hans": ["15英里/小时", "25英里/小时", "20英里/小时", "10英里/小时"],
                "vi": ["15 mph", "25 mph", "20 mph", "10 mph"],
                "ko": ["15 mph", "25 mph", "20 mph", "10 mph"],
                "ar": ["15 ميل/ساعة", "25 ميل/ساعة", "20 ميل/ساعة", "10 ميل/ساعة"],
                "fr": ["15 mph", "25 mph", "20 mph", "10 mph"],
                "ru": ["15 миль/ч", "25 миль/ч", "20 миль/ч", "10 миль/ч"]
            ],
            localizedExplanation: [
                "en": "The speed limit near schools when children are present is 15 mph in most states.",
                "es": "El límite de velocidad cerca de escuelas cuando hay niños presentes es de 15 mph en la mayoría de los estados.",
                "zh-Hans": "在大多数州，学校附近有儿童时的限速为15英里/小时。",
                "vi": "Giới hạn tốc độ gần trường học khi có trẻ em là 15 mph ở hầu hết các tiểu bang.",
                "ko": "대부분의 주에서 어린이가 있을 때 학교 근처의 속도 제한은 15mph입니다.",
                "ar": "حد السرعة بالقرب من المدارس عند وجود أطفال هو 15 ميل/ساعة في معظم الولايات.",
                "fr": "La limite de vitesse près des écoles en présence d'enfants est de 15 mph dans la plupart des états.",
                "ru": "Ограничение скорости вблизи школ при наличии детей составляет 15 миль/ч в большинстве штатов."
            ]
        ))

        // MARK: - Safety Rules

        questions.append(Question(
            id: "sr_001",
            category: .safetyRules,
            answers: ["2 seconds", "1 second", "4 seconds", "5 seconds"],
            correctAnswerIndex: 0,
            explanation: "You should maintain at least a 2-second following distance behind the vehicle ahead. Increase this in bad weather or poor conditions.",
            localizedText: [
                "en": "What is the minimum recommended following distance behind another vehicle?",
                "es": "¿Cuál es la distancia de seguimiento mínima recomendada detrás de otro vehículo?",
                "zh-Hans": "跟随另一辆车的最小建议距离是多少？",
                "vi": "Khoảng cách theo sau tối thiểu được khuyến nghị phía sau xe khác là bao nhiêu?",
                "ko": "다른 차량 뒤의 최소 권장 추종 거리는 얼마입니까?",
                "ar": "ما هي مسافة المتابعة الدنيا الموصى بها خلف مركبة أخرى؟",
                "fr": "Quelle est la distance de suivi minimale recommandée derrière un autre véhicule ?",
                "ru": "Какова минимальная рекомендуемая дистанция следования за другим транспортным средством?"
            ],
            localizedAnswers: [
                "en": ["2 seconds", "1 second", "4 seconds", "5 seconds"],
                "es": ["2 segundos", "1 segundo", "4 segundos", "5 segundos"],
                "zh-Hans": ["2秒", "1秒", "4秒", "5秒"],
                "vi": ["2 giây", "1 giây", "4 giây", "5 giây"],
                "ko": ["2초", "1초", "4초", "5초"],
                "ar": ["ثانيتان", "ثانية واحدة", "4 ثوانٍ", "5 ثوانٍ"],
                "fr": ["2 secondes", "1 seconde", "4 secondes", "5 secondes"],
                "ru": ["2 секунды", "1 секунда", "4 секунды", "5 секунд"]
            ],
            localizedExplanation: [
                "en": "You should maintain at least a 2-second following distance behind the vehicle ahead. Increase this in bad weather or poor conditions.",
                "es": "Debe mantener al menos 2 segundos de distancia de seguimiento detrás del vehículo delante. Aumente esto en mal tiempo o malas condiciones.",
                "zh-Hans": "您应保持与前车至少2秒的跟车距离。在恶劣天气或不良条件下应增加距离。",
                "vi": "Bạn nên duy trì khoảng cách theo sau ít nhất 2 giây phía sau xe phía trước. Tăng khoảng cách này trong thời tiết xấu hoặc điều kiện kém.",
                "ko": "앞 차량과 최소 2초의 추종 거리를 유지해야 합니다. 악천후나 나쁜 조건에서는 거리를 늘리세요.",
                "ar": "يجب أن تحافظ على مسافة متابعة لا تقل عن ثانيتين خلف المركبة الأمامية. زد هذه المسافة في الطقس السيء أو الظروف السيئة.",
                "fr": "Vous devez maintenir au moins 2 secondes de distance de suivi derrière le véhicule devant. Augmentez cette distance par mauvais temps.",
                "ru": "Вы должны соблюдать дистанцию не менее 2 секунд за впереди идущим транспортным средством. Увеличивайте её в плохую погоду."
            ]
        ))

        questions.append(Question(
            id: "sr_002",
            category: .safetyRules,
            answers: ["Turn on your headlights", "Speed up to clear the area", "Use your hazard lights only", "Honk your horn repeatedly"],
            correctAnswerIndex: 0,
            explanation: "When driving in fog, rain, or snow, you must turn on your headlights to increase visibility. Use low beams in fog.",
            localizedText: [
                "en": "What should you do when driving in fog or heavy rain?",
                "es": "¿Qué debe hacer al conducir con niebla o lluvia fuerte?",
                "zh-Hans": "在雾天或大雨中驾驶时应该怎么做？",
                "vi": "Bạn nên làm gì khi lái xe trong sương mù hoặc mưa to?",
                "ko": "안개나 폭우 중 운전할 때 어떻게 해야 합니까?",
                "ar": "ماذا يجب أن تفعل عند القيادة في الضباب أو المطر الغزير؟",
                "fr": "Que devez-vous faire lorsque vous conduisez dans le brouillard ou sous forte pluie ?",
                "ru": "Что нужно делать при вождении в тумане или сильном дожде?"
            ],
            localizedAnswers: [
                "en": ["Turn on your headlights", "Speed up to clear the area", "Use your hazard lights only", "Honk your horn repeatedly"],
                "es": ["Encender las luces delanteras", "Acelerar para salir del área", "Usar solo las luces de emergencia", "Tocar la bocina repetidamente"],
                "zh-Hans": ["打开前照灯", "加速驶离该区域", "仅使用双闪灯", "反复按喇叭"],
                "vi": ["Bật đèn pha", "Tăng tốc để thoát khu vực", "Chỉ sử dụng đèn cảnh báo", "Bấm còi liên tục"],
                "ko": ["전조등 켜기", "빨리 벗어나기 위해 가속", "비상등만 사용", "경적을 반복적으로 울리기"],
                "ar": ["شغّل المصابيح الأمامية", "أسرع لمغادرة المنطقة", "استخدم أضواء الطوارئ فقط", "اضغط على البوق بشكل متكرر"],
                "fr": ["Allumez vos phares", "Accélérez pour quitter la zone", "Utilisez uniquement vos feux de détresse", "Klaxonnez de manière répétée"],
                "ru": ["Включите фары", "Ускорьтесь, чтобы покинуть зону", "Используйте только аварийные огни", "Многократно сигнальте"]
            ],
            localizedExplanation: [
                "en": "When driving in fog, rain, or snow, you must turn on your headlights to increase visibility. Use low beams in fog.",
                "es": "Al conducir con niebla, lluvia o nieve, debe encender las luces delanteras para aumentar la visibilidad. Use luces bajas con niebla.",
                "zh-Hans": "在雾天、雨天或雪天驾驶时，必须打开前照灯以增加能见度。在雾中使用近光灯。",
                "vi": "Khi lái xe trong sương mù, mưa hoặc tuyết, bạn phải bật đèn pha để tăng tầm nhìn. Sử dụng đèn chiếu gần trong sương mù.",
                "ko": "안개, 비 또는 눈 속에서 운전할 때는 가시성을 높이기 위해 전조등을 켜야 합니다. 안개 속에서는 하향등을 사용하세요.",
                "ar": "عند القيادة في الضباب أو المطر أو الثلج، يجب تشغيل المصابيح الأمامية لزيادة الرؤية. استخدم الأضواء المنخفضة في الضباب.",
                "fr": "Lorsque vous conduisez dans le brouillard, la pluie ou la neige, vous devez allumer vos phares pour augmenter la visibilité. Utilisez les feux de croisement dans le brouillard.",
                "ru": "При вождении в тумане, дожде или снегу необходимо включить фары для увеличения видимости. В тумане используйте ближний свет."
            ]
        ))

        questions.append(Question(
            id: "sr_003",
            category: .safetyRules,
            answers: ["Everyone in the vehicle", "Only front seat passengers", "Only the driver", "Only passengers under 16"],
            correctAnswerIndex: 0,
            explanation: "All occupants of a vehicle must wear seat belts. The driver can be fined for any unbelted passengers.",
            localizedText: [
                "en": "Who is required to wear a seat belt in a moving vehicle?",
                "es": "¿Quién debe usar cinturón de seguridad en un vehículo en movimiento?",
                "zh-Hans": "在行驶的车辆中谁必须系安全带？",
                "vi": "Ai phải thắt dây an toàn trong xe đang di chuyển?",
                "ko": "움직이는 차량에서 안전벨트를 착용해야 하는 사람은?",
                "ar": "من المطلوب منه ارتداء حزام الأمان في مركبة متحركة؟",
                "fr": "Qui doit porter la ceinture de sécurité dans un véhicule en mouvement ?",
                "ru": "Кто обязан пристёгиваться ремнём безопасности в движущемся транспортном средстве?"
            ],
            localizedAnswers: [
                "en": ["Everyone in the vehicle", "Only front seat passengers", "Only the driver", "Only passengers under 16"],
                "es": ["Todos en el vehículo", "Solo pasajeros del asiento delantero", "Solo el conductor", "Solo pasajeros menores de 16"],
                "zh-Hans": ["车内所有人", "仅前排乘客", "仅驾驶员", "仅16岁以下乘客"],
                "vi": ["Tất cả mọi người trong xe", "Chỉ hành khách ghế trước", "Chỉ tài xế", "Chỉ hành khách dưới 16 tuổi"],
                "ko": ["차량 내 모든 사람", "앞좌석 승객만", "운전자만", "16세 미만 승객만"],
                "ar": ["الجميع في المركبة", "ركاب المقعد الأمامي فقط", "السائق فقط", "الركاب تحت 16 فقط"],
                "fr": ["Tout le monde dans le véhicule", "Uniquement les passagers avant", "Uniquement le conducteur", "Uniquement les passagers de moins de 16 ans"],
                "ru": ["Все в транспортном средстве", "Только пассажиры на передних сиденьях", "Только водитель", "Только пассажиры младше 16 лет"]
            ],
            localizedExplanation: [
                "en": "All occupants of a vehicle must wear seat belts. The driver can be fined for any unbelted passengers.",
                "es": "Todos los ocupantes del vehículo deben usar cinturón de seguridad. El conductor puede ser multado por pasajeros sin cinturón.",
                "zh-Hans": "车辆内所有乘员都必须系安全带。驾驶员可能因未系安全带的乘客而被罚款。",
                "vi": "Tất cả người ngồi trong xe phải thắt dây an toàn. Tài xế có thể bị phạt vì hành khách không thắt dây an toàn.",
                "ko": "차량의 모든 탑승자는 안전벨트를 착용해야 합니다. 운전자는 안전벨트를 착용하지 않은 승객으로 인해 벌금을 부과받을 수 있습니다.",
                "ar": "يجب على جميع ركاب المركبة ارتداء أحزمة الأمان. يمكن تغريم السائق عن أي ركاب بدون حزام.",
                "fr": "Tous les occupants d'un véhicule doivent porter la ceinture de sécurité. Le conducteur peut être verbalisé pour tout passager non attaché.",
                "ru": "Все пассажиры транспортного средства должны пристёгиваться ремнями безопасности. Водитель может быть оштрафован за непристёгнутых пассажиров."
            ]
        ))

        // MARK: - Right of Way

        questions.append(Question(
            id: "rw_001",
            category: .rightOfWay,
            answers: ["The vehicle that arrived first", "The vehicle on the left", "The larger vehicle", "The vehicle going straight"],
            correctAnswerIndex: 0,
            explanation: "At a four-way stop, the vehicle that arrives first has the right of way. If two vehicles arrive at the same time, the one on the right goes first.",
            localizedText: [
                "en": "At a four-way stop, who has the right of way?",
                "es": "En un cruce con cuatro señales de pare, ¿quién tiene el derecho de paso?",
                "zh-Hans": "在四向停车路口，谁有优先通行权？",
                "vi": "Tại ngã tư có biển dừng, ai có quyền ưu tiên?",
                "ko": "사거리 정지 표지에서 누가 우선 통행권을 가집니까?",
                "ar": "عند تقاطع بأربع إشارات توقف، من له حق الأولوية؟",
                "fr": "À un arrêt à quatre voies, qui a la priorité ?",
                "ru": "На перекрёстке с четырьмя знаками «Стоп», кто имеет преимущественное право проезда?"
            ],
            localizedAnswers: [
                "en": ["The vehicle that arrived first", "The vehicle on the left", "The larger vehicle", "The vehicle going straight"],
                "es": ["El vehículo que llegó primero", "El vehículo a la izquierda", "El vehículo más grande", "El vehículo que va recto"],
                "zh-Hans": ["先到的车辆", "左侧的车辆", "较大的车辆", "直行的车辆"],
                "vi": ["Xe đến trước", "Xe bên trái", "Xe lớn hơn", "Xe đi thẳng"],
                "ko": ["먼저 도착한 차량", "왼쪽 차량", "더 큰 차량", "직진하는 차량"],
                "ar": ["المركبة التي وصلت أولاً", "المركبة على اليسار", "المركبة الأكبر", "المركبة المتجهة مباشرة"],
                "fr": ["Le véhicule arrivé en premier", "Le véhicule à gauche", "Le plus gros véhicule", "Le véhicule allant tout droit"],
                "ru": ["Транспорт, прибывший первым", "Транспорт слева", "Более крупное транспортное средство", "Транспорт, движущийся прямо"]
            ],
            localizedExplanation: [
                "en": "At a four-way stop, the vehicle that arrives first has the right of way. If two vehicles arrive at the same time, the one on the right goes first.",
                "es": "En un cruce con cuatro señales de pare, el vehículo que llega primero tiene el derecho de paso. Si dos vehículos llegan al mismo tiempo, el de la derecha pasa primero.",
                "zh-Hans": "在四向停车路口，先到的车辆有优先通行权。如果两辆车同时到达，右侧的车辆先行。",
                "vi": "Tại ngã tư có biển dừng, xe đến trước có quyền ưu tiên. Nếu hai xe đến cùng lúc, xe bên phải đi trước.",
                "ko": "사거리 정지 표지에서 먼저 도착한 차량이 우선 통행권을 가집니다. 두 차량이 동시에 도착하면 오른쪽 차량이 먼저 갑니다.",
                "ar": "عند تقاطع بأربع إشارات توقف، المركبة التي تصل أولاً لها حق الأولوية. إذا وصلت مركبتان في نفس الوقت، تمر التي على اليمين أولاً.",
                "fr": "À un arrêt à quatre voies, le véhicule arrivé en premier a la priorité. Si deux véhicules arrivent en même temps, celui de droite passe en premier.",
                "ru": "На перекрёстке с четырьмя знаками «Стоп» преимущество имеет транспорт, прибывший первым. Если два транспортных средства прибыли одновременно, первым проезжает тот, кто справа."
            ]
        ))

        questions.append(Question(
            id: "rw_002",
            category: .rightOfWay,
            answers: ["Pedestrians", "Vehicles", "Bicycles", "No one has automatic right of way"],
            correctAnswerIndex: 0,
            explanation: "Pedestrians always have the right of way in a crosswalk, whether marked or unmarked. Always yield to pedestrians.",
            localizedText: [
                "en": "Who has the right of way at a crosswalk?",
                "es": "¿Quién tiene el derecho de paso en un cruce peatonal?",
                "zh-Hans": "在人行横道上谁有优先通行权？",
                "vi": "Ai có quyền ưu tiên tại vạch sang đường?",
                "ko": "횡단보도에서 누가 우선 통행권을 가집니까?",
                "ar": "من له حق الأولوية عند ممر المشاة؟",
                "fr": "Qui a la priorité à un passage piéton ?",
                "ru": "Кто имеет преимущественное право на пешеходном переходе?"
            ],
            localizedAnswers: [
                "en": ["Pedestrians", "Vehicles", "Bicycles", "No one has automatic right of way"],
                "es": ["Peatones", "Vehículos", "Bicicletas", "Nadie tiene derecho de paso automático"],
                "zh-Hans": ["行人", "车辆", "自行车", "没有人有自动优先权"],
                "vi": ["Người đi bộ", "Xe cộ", "Xe đạp", "Không ai có quyền ưu tiên tự động"],
                "ko": ["보행자", "차량", "자전거", "자동 통행권이 없음"],
                "ar": ["المشاة", "المركبات", "الدراجات", "لا أحد لديه حق أولوية تلقائي"],
                "fr": ["Les piétons", "Les véhicules", "Les vélos", "Personne n'a la priorité automatique"],
                "ru": ["Пешеходы", "Транспортные средства", "Велосипедисты", "Никто не имеет автоматического преимущества"]
            ],
            localizedExplanation: [
                "en": "Pedestrians always have the right of way in a crosswalk, whether marked or unmarked. Always yield to pedestrians.",
                "es": "Los peatones siempre tienen el derecho de paso en un cruce peatonal, ya sea marcado o no. Siempre ceda el paso a los peatones.",
                "zh-Hans": "行人在人行横道上始终拥有优先通行权，无论标记与否。始终让行人先行。",
                "vi": "Người đi bộ luôn có quyền ưu tiên tại vạch sang đường, dù có đánh dấu hay không. Luôn nhường đường cho người đi bộ.",
                "ko": "보행자는 표시 여부에 관계없이 횡단보도에서 항상 우선 통행권을 가집니다. 항상 보행자에게 양보하세요.",
                "ar": "المشاة لديهم دائماً حق الأولوية في ممر المشاة، سواء كان مُعلَّماً أو غير مُعلَّم. دائماً أعطِ الأولوية للمشاة.",
                "fr": "Les piétons ont toujours la priorité sur un passage piéton, qu'il soit marqué ou non. Cédez toujours le passage aux piétons.",
                "ru": "Пешеходы всегда имеют преимущественное право на пешеходном переходе, отмеченном или неотмеченном. Всегда уступайте пешеходам."
            ]
        ))

        // MARK: - Parking

        questions.append(Question(
            id: "pk_001",
            category: .parking,
            answers: ["15 feet", "10 feet", "5 feet", "20 feet"],
            correctAnswerIndex: 0,
            explanation: "You must park at least 15 feet from a fire hydrant. This ensures fire trucks have access in an emergency.",
            localizedText: [
                "en": "How far must you park from a fire hydrant?",
                "es": "¿A qué distancia debe estacionarse de una boca de incendios?",
                "zh-Hans": "您必须在距消防栓多远处停车？",
                "vi": "Bạn phải đỗ xe cách trụ cứu hỏa bao xa?",
                "ko": "소화전에서 얼마나 떨어져 주차해야 합니까?",
                "ar": "كم يجب أن تبتعد عن صنبور الحريق عند الركن؟",
                "fr": "À quelle distance devez-vous vous garer d'une bouche d'incendie ?",
                "ru": "На каком расстоянии от пожарного гидранта нужно парковаться?"
            ],
            localizedAnswers: [
                "en": ["15 feet", "10 feet", "5 feet", "20 feet"],
                "es": ["15 pies", "10 pies", "5 pies", "20 pies"],
                "zh-Hans": ["15英尺", "10英尺", "5英尺", "20英尺"],
                "vi": ["15 feet", "10 feet", "5 feet", "20 feet"],
                "ko": ["15피트", "10피트", "5피트", "20피트"],
                "ar": ["15 قدم", "10 أقدام", "5 أقدام", "20 قدم"],
                "fr": ["15 pieds", "10 pieds", "5 pieds", "20 pieds"],
                "ru": ["15 футов", "10 футов", "5 футов", "20 футов"]
            ],
            localizedExplanation: [
                "en": "You must park at least 15 feet from a fire hydrant. This ensures fire trucks have access in an emergency.",
                "es": "Debe estacionarse al menos a 15 pies de una boca de incendios. Esto asegura que los camiones de bomberos tengan acceso en una emergencia.",
                "zh-Hans": "您必须在距消防栓至少15英尺处停车。这确保消防车在紧急情况下能够通行。",
                "vi": "Bạn phải đỗ xe cách trụ cứu hỏa ít nhất 15 feet. Điều này đảm bảo xe cứu hỏa có thể tiếp cận trong trường hợp khẩn cấp.",
                "ko": "소화전에서 최소 15피트 떨어져 주차해야 합니다. 이는 응급 상황에서 소방차가 접근할 수 있도록 합니다.",
                "ar": "يجب أن تركن على بعد 15 قدم على الأقل من صنبور الحريق. هذا يضمن وصول شاحنات الإطفاء في حالات الطوارئ.",
                "fr": "Vous devez vous garer à au moins 15 pieds d'une bouche d'incendie. Cela garantit l'accès des pompiers en cas d'urgence.",
                "ru": "Вы должны парковаться не ближе 15 футов от пожарного гидранта. Это обеспечивает доступ пожарных машин в экстренных случаях."
            ]
        ))

        questions.append(Question(
            id: "pk_002",
            category: .parking,
            answers: ["Turn wheels toward the curb", "Turn wheels away from the curb", "Leave wheels straight", "Put the car in neutral"],
            correctAnswerIndex: 0,
            explanation: "When parking downhill, turn your front wheels toward the curb. If the car rolls, it will roll into the curb and stop.",
            localizedText: [
                "en": "When parking downhill with a curb, which way should you turn your wheels?",
                "es": "Al estacionarse cuesta abajo con bordillo, ¿hacia dónde debe girar las ruedas?",
                "zh-Hans": "在有路沿石的下坡停车时，应该将车轮转向哪个方向？",
                "vi": "Khi đỗ xe xuống dốc có lề đường, bạn nên bẻ lái về hướng nào?",
                "ko": "연석이 있는 내리막에 주차할 때 바퀴를 어느 방향으로 돌려야 합니까?",
                "ar": "عند الركن على منحدر هابط مع رصيف، في أي اتجاه يجب أن تدير العجلات؟",
                "fr": "Lorsque vous vous garez en descente avec un trottoir, dans quel sens devez-vous tourner vos roues ?",
                "ru": "При парковке на спуске с бордюром, в какую сторону нужно повернуть колёса?"
            ],
            localizedAnswers: [
                "en": ["Turn wheels toward the curb", "Turn wheels away from the curb", "Leave wheels straight", "Put the car in neutral"],
                "es": ["Girar ruedas hacia el bordillo", "Girar ruedas lejos del bordillo", "Dejar ruedas rectas", "Poner el coche en neutral"],
                "zh-Hans": ["将车轮转向路沿石", "将车轮转离路沿石", "保持车轮直行", "将车挂空档"],
                "vi": ["Bẻ lái về phía lề đường", "Bẻ lái ra xa lề đường", "Để bánh xe thẳng", "Để xe ở số không"],
                "ko": ["연석 쪽으로 바퀴 돌리기", "연석 반대쪽으로 바퀴 돌리기", "바퀴를 직진으로 두기", "차를 중립에 놓기"],
                "ar": ["أدر العجلات نحو الرصيف", "أدر العجلات بعيداً عن الرصيف", "اترك العجلات مستقيمة", "ضع السيارة في وضع محايد"],
                "fr": ["Tourner les roues vers le trottoir", "Tourner les roues loin du trottoir", "Laisser les roues droites", "Mettre la voiture au point mort"],
                "ru": ["Повернуть колёса к бордюру", "Повернуть колёса от бордюра", "Оставить колёса прямо", "Поставить на нейтраль"]
            ],
            localizedExplanation: [
                "en": "When parking downhill, turn your front wheels toward the curb. If the car rolls, it will roll into the curb and stop.",
                "es": "Al estacionarse cuesta abajo, gire las ruedas delanteras hacia el bordillo. Si el coche rueda, rodará hacia el bordillo y se detendrá.",
                "zh-Hans": "下坡停车时，将前轮转向路沿石。如果车辆滑动，会滚向路沿石并停下。",
                "vi": "Khi đỗ xe xuống dốc, hãy bẻ bánh trước về phía lề đường. Nếu xe trôi, nó sẽ trôi vào lề đường và dừng lại.",
                "ko": "내리막에 주차할 때 앞바퀴를 연석 쪽으로 돌리세요. 차가 굴러가면 연석에 부딪혀 멈춥니다.",
                "ar": "عند الركن على منحدر هابط، أدر العجلات الأمامية نحو الرصيف. إذا تدحرجت السيارة، ستتدحرج نحو الرصيف وتتوقف.",
                "fr": "En stationnant en descente, tournez vos roues avant vers le trottoir. Si la voiture roule, elle roulera vers le trottoir et s'arrêtera.",
                "ru": "При парковке на спуске поверните передние колёса к бордюру. Если автомобиль покатится, он упрётся в бордюр и остановится."
            ]
        ))

        // MARK: - Alcohol & Drugs

        questions.append(Question(
            id: "al_001",
            category: .alcohol,
            answers: ["0.08%", "0.10%", "0.05%", "0.12%"],
            correctAnswerIndex: 0,
            explanation: "In all 50 states, a BAC of 0.08% or higher is considered legally intoxicated for drivers 21 and over.",
            localizedText: [
                "en": "What is the legal blood alcohol concentration (BAC) limit for drivers 21 and over?",
                "es": "¿Cuál es el límite legal de concentración de alcohol en sangre (BAC) para conductores de 21 años o más?",
                "zh-Hans": "21岁及以上驾驶员的合法血液酒精浓度(BAC)限制是多少？",
                "vi": "Giới hạn nồng độ cồn trong máu (BAC) hợp pháp cho người lái xe từ 21 tuổi trở lên là bao nhiêu?",
                "ko": "21세 이상 운전자의 법정 혈중 알코올 농도(BAC) 한도는 얼마입니까?",
                "ar": "ما هو الحد القانوني لتركيز الكحول في الدم (BAC) للسائقين الذين تبلغ أعمارهم 21 عاماً فأكثر؟",
                "fr": "Quelle est la limite légale du taux d'alcoolémie (TAE) pour les conducteurs de 21 ans et plus ?",
                "ru": "Каков допустимый уровень алкоголя в крови (BAC) для водителей от 21 года?"
            ],
            localizedAnswers: [
                "en": ["0.08%", "0.10%", "0.05%", "0.12%"],
                "es": ["0.08%", "0.10%", "0.05%", "0.12%"],
                "zh-Hans": ["0.08%", "0.10%", "0.05%", "0.12%"],
                "vi": ["0.08%", "0.10%", "0.05%", "0.12%"],
                "ko": ["0.08%", "0.10%", "0.05%", "0.12%"],
                "ar": ["0.08%", "0.10%", "0.05%", "0.12%"],
                "fr": ["0.08%", "0.10%", "0.05%", "0.12%"],
                "ru": ["0.08%", "0.10%", "0.05%", "0.12%"]
            ],
            localizedExplanation: [
                "en": "In all 50 states, a BAC of 0.08% or higher is considered legally intoxicated for drivers 21 and over.",
                "es": "En los 50 estados, un BAC de 0.08% o más se considera legalmente intoxicado para conductores de 21 años o más.",
                "zh-Hans": "在所有50个州，21岁及以上驾驶员的BAC达到0.08%或以上被视为合法醉酒。",
                "vi": "Ở tất cả 50 tiểu bang, BAC từ 0.08% trở lên được coi là say rượu hợp pháp đối với người lái xe từ 21 tuổi trở lên.",
                "ko": "모든 50개 주에서 21세 이상 운전자의 BAC 0.08% 이상은 법적으로 음주 운전으로 간주됩니다.",
                "ar": "في جميع الولايات الخمسين، يعتبر تركيز الكحول في الدم بنسبة 0.08% أو أعلى سكراً قانونياً للسائقين الذين يبلغون 21 عاماً فأكثر.",
                "fr": "Dans les 50 états, un TAE de 0,08% ou plus est considéré comme légalement ivre pour les conducteurs de 21 ans et plus.",
                "ru": "Во всех 50 штатах BAC 0,08% и выше считается состоянием опьянения для водителей от 21 года."
            ]
        ))

        questions.append(Question(
            id: "al_002",
            category: .alcohol,
            answers: ["License suspension, fines, and possible jail time", "A warning only", "A small fine only", "Community service only"],
            correctAnswerIndex: 0,
            explanation: "Penalties for a DUI conviction typically include license suspension, substantial fines, and possible jail time. Penalties increase for repeat offenses.",
            localizedText: [
                "en": "What are the penalties for driving under the influence (DUI)?",
                "es": "¿Cuáles son las penalidades por conducir bajo la influencia (DUI)?",
                "zh-Hans": "酒后驾车(DUI)的处罚是什么？",
                "vi": "Hình phạt cho việc lái xe khi say rượu (DUI) là gì?",
                "ko": "음주 운전(DUI)의 처벌은 무엇입니까?",
                "ar": "ما هي عقوبات القيادة تحت تأثير الكحول (DUI)؟",
                "fr": "Quelles sont les sanctions pour conduite en état d'ivresse (DUI) ?",
                "ru": "Каковы наказания за вождение в нетрезвом состоянии (DUI)?"
            ],
            localizedAnswers: [
                "en": ["License suspension, fines, and possible jail time", "A warning only", "A small fine only", "Community service only"],
                "es": ["Suspensión de licencia, multas y posible cárcel", "Solo una advertencia", "Solo una multa pequeña", "Solo servicio comunitario"],
                "zh-Hans": ["吊销驾照、罚款和可能的监禁", "仅警告", "仅小额罚款", "仅社区服务"],
                "vi": ["Đình chỉ giấy phép, phạt tiền và có thể ngồi tù", "Chỉ cảnh cáo", "Chỉ phạt nhẹ", "Chỉ phục vụ cộng đồng"],
                "ko": ["면허 정지, 벌금 및 징역 가능", "경고만", "소액 벌금만", "사회봉사만"],
                "ar": ["تعليق الرخصة وغرامات وسجن محتمل", "تحذير فقط", "غرامة صغيرة فقط", "خدمة مجتمعية فقط"],
                "fr": ["Suspension du permis, amendes et peine de prison possible", "Un avertissement seulement", "Une petite amende seulement", "Service communautaire seulement"],
                "ru": ["Лишение прав, штрафы и возможное тюремное заключение", "Только предупреждение", "Только небольшой штраф", "Только общественные работы"]
            ],
            localizedExplanation: [
                "en": "Penalties for a DUI conviction typically include license suspension, substantial fines, and possible jail time. Penalties increase for repeat offenses.",
                "es": "Las penalidades por una condena de DUI típicamente incluyen suspensión de licencia, multas sustanciales y posible cárcel. Las penalidades aumentan por infracciones repetidas.",
                "zh-Hans": "DUI定罪的处罚通常包括吊销驾照、高额罚款和可能的监禁。重复违法者的处罚更加严厉。",
                "vi": "Hình phạt cho việc lái xe khi say rượu thường bao gồm đình chỉ giấy phép, phạt tiền nặng và có thể ngồi tù. Hình phạt tăng cho các vi phạm lặp lại.",
                "ko": "DUI 유죄 판결에 대한 처벌은 일반적으로 면허 정지, 상당한 벌금 및 징역이 포함됩니다. 재범 시 처벌이 가중됩니다.",
                "ar": "عقوبات إدانة القيادة تحت تأثير الكحول تشمل عادة تعليق الرخصة وغرامات كبيرة وسجن محتمل. تزداد العقوبات للمخالفات المتكررة.",
                "fr": "Les sanctions pour conduite en état d'ivresse comprennent généralement la suspension du permis, des amendes substantielles et une peine de prison possible. Les sanctions augmentent en cas de récidive.",
                "ru": "Наказание за вождение в нетрезвом состоянии обычно включает лишение прав, значительные штрафы и возможное тюремное заключение. Наказания увеличиваются при повторных нарушениях."
            ]
        ))

        // MARK: - General Knowledge

        questions.append(Question(
            id: "gk_001",
            category: .general,
            answers: ["Pull over to the right and stop", "Speed up to get out of the way", "Stop immediately where you are", "Ignore it if you're close to your destination"],
            correctAnswerIndex: 0,
            explanation: "When you see or hear an emergency vehicle approaching, you must pull over to the right side of the road and stop until it passes.",
            localizedText: [
                "en": "What should you do when an emergency vehicle with flashing lights approaches from behind?",
                "es": "¿Qué debe hacer cuando un vehículo de emergencia con luces intermitentes se acerca por detrás?",
                "zh-Hans": "当闪着灯的急救车辆从后方驶来时应该怎么做？",
                "vi": "Bạn nên làm gì khi xe cấp cứu có đèn nhấp nháy tiến đến từ phía sau?",
                "ko": "비상등을 켠 응급 차량이 뒤에서 다가올 때 어떻게 해야 합니까?",
                "ar": "ماذا يجب أن تفعل عندما تقترب مركبة طوارئ بأضواء وامضة من خلفك؟",
                "fr": "Que devez-vous faire lorsqu'un véhicule d'urgence avec des feux clignotants approche par derrière ?",
                "ru": "Что нужно делать, когда сзади приближается автомобиль экстренных служб с проблесковыми маячками?"
            ],
            localizedAnswers: [
                "en": ["Pull over to the right and stop", "Speed up to get out of the way", "Stop immediately where you are", "Ignore it if you're close to your destination"],
                "es": ["Orillarse a la derecha y detenerse", "Acelerar para quitarse del camino", "Detenerse inmediatamente donde está", "Ignorarlo si está cerca de su destino"],
                "zh-Hans": ["靠右停车", "加速让路", "在原地立即停车", "如果快到目的地就忽略"],
                "vi": ["Tấp vào bên phải và dừng lại", "Tăng tốc để tránh đường", "Dừng ngay tại chỗ", "Bỏ qua nếu gần đến nơi"],
                "ko": ["오른쪽으로 갓길에 정차", "속도를 높여 비켜주기", "즉시 그 자리에서 정지", "목적지가 가까우면 무시"],
                "ar": ["انحرف يميناً وتوقف", "أسرع للابتعاد", "توقف فوراً حيث أنت", "تجاهلها إذا كنت قريباً من وجهتك"],
                "fr": ["Se ranger à droite et s'arrêter", "Accélérer pour dégager le passage", "S'arrêter immédiatement sur place", "L'ignorer si vous êtes proche de votre destination"],
                "ru": ["Съехать вправо и остановиться", "Ускориться, чтобы уступить дорогу", "Немедленно остановиться на месте", "Игнорировать, если вы близко к месту назначения"]
            ],
            localizedExplanation: [
                "en": "When you see or hear an emergency vehicle approaching, you must pull over to the right side of the road and stop until it passes.",
                "es": "Cuando vea o escuche un vehículo de emergencia acercándose, debe orillarse al lado derecho de la carretera y detenerse hasta que pase.",
                "zh-Hans": "当您看到或听到急救车辆驶来时，必须靠右停车，直到它通过。",
                "vi": "Khi bạn thấy hoặc nghe xe cấp cứu đang đến, bạn phải tấp vào bên phải đường và dừng lại cho đến khi nó đi qua.",
                "ko": "응급 차량이 접근하는 것을 보거나 들으면 도로 오른쪽으로 갓길에 정차하여 통과할 때까지 기다려야 합니다.",
                "ar": "عندما ترى أو تسمع مركبة طوارئ تقترب، يجب أن تنحرف إلى الجانب الأيمن من الطريق وتتوقف حتى تمر.",
                "fr": "Lorsque vous voyez ou entendez un véhicule d'urgence approcher, vous devez vous ranger sur le côté droit de la route et vous arrêter jusqu'à ce qu'il passe.",
                "ru": "Когда вы видите или слышите приближающийся автомобиль экстренных служб, вы должны съехать на правую сторону дороги и остановиться, пока он не проедет."
            ]
        ))

        questions.append(Question(
            id: "gk_002",
            category: .general,
            answers: ["Look left, right, then left again", "Just look right", "Just look left", "Close your eyes and go fast"],
            correctAnswerIndex: 0,
            explanation: "Before crossing an intersection, look left, right, then left again. Traffic from the left is closest to you and poses the most immediate danger.",
            localizedText: [
                "en": "Before crossing an intersection, in which order should you check for traffic?",
                "es": "Antes de cruzar una intersección, ¿en qué orden debe verificar el tráfico?",
                "zh-Hans": "穿过十字路口前，应该按什么顺序检查交通？",
                "vi": "Trước khi qua ngã tư, bạn nên kiểm tra giao thông theo thứ tự nào?",
                "ko": "교차로를 건너기 전에 어떤 순서로 교통을 확인해야 합니까?",
                "ar": "قبل عبور تقاطع، بأي ترتيب يجب أن تتحقق من المرور؟",
                "fr": "Avant de traverser une intersection, dans quel ordre devez-vous vérifier la circulation ?",
                "ru": "Перед пересечением перекрёстка в каком порядке нужно проверять движение?"
            ],
            localizedAnswers: [
                "en": ["Look left, right, then left again", "Just look right", "Just look left", "Close your eyes and go fast"],
                "es": ["Mirar izquierda, derecha, luego izquierda otra vez", "Solo mirar a la derecha", "Solo mirar a la izquierda", "Cerrar los ojos e ir rápido"],
                "zh-Hans": ["先看左、再看右、然后再看左", "只看右边", "只看左边", "闭眼快速通过"],
                "vi": ["Nhìn trái, phải, rồi trái lần nữa", "Chỉ nhìn phải", "Chỉ nhìn trái", "Nhắm mắt và đi nhanh"],
                "ko": ["왼쪽, 오른쪽, 다시 왼쪽 확인", "오른쪽만 확인", "왼쪽만 확인", "눈을 감고 빨리 가기"],
                "ar": ["انظر يساراً، يميناً، ثم يساراً مرة أخرى", "انظر يميناً فقط", "انظر يساراً فقط", "أغمض عينيك وامشِ بسرعة"],
                "fr": ["Regarder à gauche, à droite, puis à gauche à nouveau", "Regarder juste à droite", "Regarder juste à gauche", "Fermer les yeux et aller vite"],
                "ru": ["Посмотреть налево, направо, затем снова налево", "Только посмотреть направо", "Только посмотреть налево", "Закрыть глаза и быстро проехать"]
            ],
            localizedExplanation: [
                "en": "Before crossing an intersection, look left, right, then left again. Traffic from the left is closest to you and poses the most immediate danger.",
                "es": "Antes de cruzar una intersección, mire a la izquierda, derecha, luego a la izquierda otra vez. El tráfico de la izquierda está más cerca y representa el peligro más inmediato.",
                "zh-Hans": "穿过十字路口前，先看左、再看右、然后再看左。来自左侧的车辆离您最近，构成最直接的危险。",
                "vi": "Trước khi qua ngã tư, nhìn trái, phải, rồi trái lần nữa. Xe từ bên trái gần bạn nhất và gây nguy hiểm trực tiếp nhất.",
                "ko": "교차로를 건너기 전에 왼쪽, 오른쪽, 다시 왼쪽을 확인하세요. 왼쪽에서 오는 교통이 가장 가깝고 가장 즉각적인 위험을 줍니다.",
                "ar": "قبل عبور تقاطع، انظر يساراً، يميناً، ثم يساراً مرة أخرى. المرور من اليسار هو الأقرب إليك ويشكل الخطر الأكثر مباشرة.",
                "fr": "Avant de traverser une intersection, regardez à gauche, à droite, puis à gauche à nouveau. Le trafic venant de la gauche est le plus proche et présente le danger le plus immédiat.",
                "ru": "Перед пересечением перекрёстка посмотрите налево, направо, затем снова налево. Транспорт слева ближе всего к вам и представляет наибольшую непосредственную опасность."
            ]
        ))

        questions.append(Question(
            id: "gk_003",
            category: .general,
            answers: ["Slow down and be prepared to stop", "Speed up to get through quickly", "Maintain your speed", "Honk your horn"],
            correctAnswerIndex: 0,
            explanation: "A flashing yellow light means caution. Slow down and be prepared to stop if necessary. Proceed with care.",
            localizedText: [
                "en": "What should you do when you see a flashing yellow traffic light?",
                "es": "¿Qué debe hacer cuando ve una luz de tráfico amarilla intermitente?",
                "zh-Hans": "看到闪烁的黄色交通灯时应该怎么做？",
                "vi": "Bạn nên làm gì khi thấy đèn giao thông vàng nhấp nháy?",
                "ko": "깜박이는 노란 신호등을 보면 어떻게 해야 합니까?",
                "ar": "ماذا يجب أن تفعل عندما ترى إشارة مرور صفراء وامضة؟",
                "fr": "Que devez-vous faire lorsque vous voyez un feu jaune clignotant ?",
                "ru": "Что делать при мигающем жёлтом сигнале светофора?"
            ],
            localizedAnswers: [
                "en": ["Slow down and be prepared to stop", "Speed up to get through quickly", "Maintain your speed", "Honk your horn"],
                "es": ["Reducir la velocidad y prepararse para detenerse", "Acelerar para pasar rápido", "Mantener su velocidad", "Tocar la bocina"],
                "zh-Hans": ["减速并准备停车", "加速快速通过", "保持速度", "按喇叭"],
                "vi": ["Giảm tốc và chuẩn bị dừng lại", "Tăng tốc để đi qua nhanh", "Giữ tốc độ", "Bấm còi"],
                "ko": ["속도를 줄이고 정지 준비", "빨리 통과하기 위해 가속", "속도 유지", "경적 울리기"],
                "ar": ["أبطئ واستعد للتوقف", "أسرع للمرور بسرعة", "حافظ على سرعتك", "اضغط على البوق"],
                "fr": ["Ralentir et être prêt à s'arrêter", "Accélérer pour passer rapidement", "Maintenir votre vitesse", "Klaxonner"],
                "ru": ["Замедлиться и быть готовым остановиться", "Ускориться, чтобы быстрее проехать", "Поддерживать скорость", "Посигналить"]
            ],
            localizedExplanation: [
                "en": "A flashing yellow light means caution. Slow down and be prepared to stop if necessary. Proceed with care.",
                "es": "Una luz amarilla intermitente significa precaución. Reduzca la velocidad y prepárese para detenerse si es necesario. Proceda con cuidado.",
                "zh-Hans": "闪烁的黄灯意味着注意。减速并在必要时准备停车。小心前行。",
                "vi": "Đèn vàng nhấp nháy có nghĩa là cẩn thận. Giảm tốc và chuẩn bị dừng lại nếu cần. Đi cẩn thận.",
                "ko": "깜박이는 노란 불은 주의를 의미합니다. 속도를 줄이고 필요시 정지할 준비를 하세요. 주의하여 진행하세요.",
                "ar": "الضوء الأصفر الوامض يعني الحذر. أبطئ واستعد للتوقف إذا لزم الأمر. تابع بحذر.",
                "fr": "Un feu jaune clignotant signifie attention. Ralentissez et soyez prêt à vous arrêter si nécessaire. Continuez avec prudence.",
                "ru": "Мигающий жёлтый сигнал означает внимание. Замедлитесь и будьте готовы остановиться при необходимости. Продолжайте движение осторожно."
            ]
        ))

        return questions
    }
}
