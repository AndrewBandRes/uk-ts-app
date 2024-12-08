# Пользователи
[
  {
    surname: 'Тестов',
    name: 'Александр',
    patronymic: 'Дмитриевич',
    email: 'aleksandr.testov@bk.ru',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  },
  {
    surname: 'Тестовая',
    name: 'Юлия',
    patronymic: 'Владимировна',
    email: 'yuliya.testovaya@bk.ru',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  },
  {
    surname: 'Тестовая',
    name: 'Лилия',
    patronymic: 'Михайловна',
    email: 'lilia.testovaya@bk.ru',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  },
  {
    surname: 'Тестовая',
    name: 'Татьяна',
    patronymic: 'Антоновна',
    email: 'tatyana.testovaya@bk.ru',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  },
  {
    surname: 'Тестовая',
    name: 'Ирина',
    patronymic: 'Павловна',
    email: 'irina.testovaya@bk.ru',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  },
  {
    surname: 'Тестовов',
    name: 'Артем',
    patronymic: 'Андреевич',
    email: 'artem.testovov@bk.ru',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  }
].each do |params|
  User.create!(params)
end

# Роли
Permission.create!(user: User.find_by(email: 'aleksandr.testov@bk.ru'), role: 'admin')

# Периоды
Period.create!(started_at: Date.parse('2024-10-01'), closed_at: Date.parse('2024-10-31'))
Period.create!(started_at: Date.parse('2024-11-01'), closed_at: Date.parse('2024-11-30'))
Period.create!(started_at: Date.parse('2024-12-01'))

# Принадлежности
[
  'Внутренний клининг',
  'Внешний клининг',
  'Техменеджмент'
].each do |title|
  Affiliation.create!(title: title)
end

# Категории
[
  'Набор для уборки',
  'Швабры,щетки',
  'Пылесосы',
  'Поломоечные машины',
  'Инвентарь',
  'Подметальная машина',
  'Вёдра'
].each do |title|
  Affiliation.find_by_title('Внутренний клининг').categories.create!(title: title)
end

[
  'Лопаты',
  'Метлы/грабли/вилы',
  'Ручной инструмент',
  'Тачки',
  'Снегоуборщики',
  'Бензо/электроинструмент'
].each do |title|
  Affiliation.find_by_title('Внешний клининг').categories.create!(title: title)
end

[
  'Электроинструмент',
  'Сетевой удлинитель',
  'Стремянки',
  'Инструмент'
].each do |title|
  Affiliation.find_by_title('Техменеджмент').categories.create!(title: title)
end

# Наименования
[
  'УльтраСпид Про: двухвед. Старт. Набор (с ручкой) Vileda Professional',
  'УльтраСпид Про: одновед. Старт. набор (с ручкой) Vileda Professional',
  'Набор для мытья окон с телескоп. ручками',
  'Комплексная уборочная тележка (СВЕП система)'
].each do |title|
  Category.find_by_title('Набор для уборки').inventories.create!(title: title)
end

[
  'Мульти Дастер 66см голубой',
  'ПипиДастр',
  'Швабра под МОП'
].each do |title|
  Category.find_by_title('Швабры,щетки').inventories.create!(title: title)
end

[
  'Пылесос для сухой уборки Karcher',
  'Пылесос для сухой уборки (не karcher)',
  'Стеклоочиститель Karcher',
  'Моющий пылесос Karcher Puzzi',
  'Грязеводосос'
].each do |title|
  Category.find_by_title('Пылесосы').inventories.create!(title: title)
end

[
  'Karcher BD 43/25',
  'Karcher B 40C Bp Clas+D43',
  'Karcher 35/12',
  'BR180',
  'Размывочная машина'
].each do |title|
  Category.find_by_title('Поломоечные машины').inventories.create!(title: title)
end

[
  'Пароочиститель Karcher SC4'
].each do |title|
  Category.find_by_title('Инвентарь').inventories.create!(title: title)
end

[
  'Stihl KG770',
  'Karcher S4 Twin'
].each do |title|
  Category.find_by_title('Подметальная машина').inventories.create!(title: title)
end

[
  'Ведро пласт. 10л',
  'Ведро пласт. 5л.',
  'Vileda minispeed ведро б/у'
].each do |title|
  Category.find_by_title('Вёдра').inventories.create!(title: title)
end

[
  'Лопата совковая с черенком',
  'Лопата штыковая с черенком',
  'Лопата для снега пластиковая "Богатырь"',
  'Движок для снега Барин (80-100см)'
].each do |title|
  Category.find_by_title('Лопаты').inventories.create!(title: title)
end

[
  'Метла пластиковая',
  'Грабли веерные',
  'Грабли обычные'
].each do |title|
  Category.find_by_title('Метлы/грабли/вилы').inventories.create!(title: title)
end

[
  'Топор-ледоруб',
  'Лом',
  'Ледоруб',
  'Секатор плоскостной Finland',
  'Ножовка по дереву Stayer',
  'Топор',
  'Движок для снега телескопический'
].each do |title|
  Category.find_by_title('Ручной инструмент').inventories.create!(title: title)
end

[
  'Тачка садовая 2-х колесная ',
  'Тележка синяя 4-х колесная',
  'Тачка садовая',
  'Рассеиватель "Texas" CS 6000S'
].each do |title|
  Category.find_by_title('Тачки').inventories.create!(title: title)
end

[
  'Шнекоротер DeWORKS SC 7080',
  'Шнекоротер Tecumseh Yard Machines MTD',
  'Greenworks шнекоротор',
  'гусеничный Champion STT117E'
].each do |title|
  Category.find_by_title('Снегоуборщики').inventories.create!(title: title)
end

[
  'Газонокосилка бензиновая Champion',
  'Бензопила STIHL MS 211 (40см)',
  'Бензопила STIHL MS 210 (35см)',
  'Кусторез бензиновый STIHL HS 45',
  'Сучкорез бензиновый STIHL HT 103',
  'Воздуходувное устройство STIHL SH 86',
  'Газонокасилка HONDA GCV Craftsman',
  'Газонокасилка BOSCH Rotak 40',
  'Триммер STIHL FS 120',
  'Триммер STIHL FS 55',
  'Ранцевой распылитель PATRIOT PT-16AC',
  'Мойка высокого давления Karcher',
  'Бензиновый тример Хутер',
  'Распылитель ранцевый/бензиновый STIHL SR 430',
  'Распылитель ранцевый/бензиновый STIHL SR 450',
  'Мультимотор STIHL MM-56',
  'Почвоизмельчитель STIHL BK-MM',
  'greenworks воздуходувка'
].each do |title|
  Category.find_by_title('Бензо/электроинструмент').inventories.create!(title: title)
end

[
  'Перфоратор аккумуляторный MAKITA DHR202 SN0832900',
  'Шуруповерт аккумуляторный BOSCH GSR 180-Li 3601F8121',
  'Шуруповерт аккумуляторный BOSCH GSR 14,4-2PRO',
  'УШМ аккумуляторная BOSCH GWS-180Li 06019H90R0',
  'Шуруповерт аккумуляторный MAKITA DDF 453 SN1037004',
  'Лобзик электрический MAKITA 4329',
  'УШМ ИНТЕРСКОЛ 125/900',
  'Утюг для пайки полипропилена FOR A PRO SN00650104',
  'Акк. дрель Makita DDF453SYE ',
  'Лобзик Makita 4327',
  'аккумуляторный шуруповерт Bosch professional GSR 18v-28',
  'Акк. дрель DDF453SYE Makita   ',
  'шуруповёрт bosch professoinal GSR 18v 28'
].each do |title|
  Category.find_by_title('Электроинструмент').inventories.create!(title: title)
end

[
  'Удлинитель рамка 20м. RLPз-20 max 2200 Вт',
  'Удлинитель катушка 30м'
].each do |title|
  Category.find_by_title('Сетевой удлинитель').inventories.create!(title: title)
end

[
  'Эйфель Классик 4х4 Лестница-трасформер',
  'Стремянка стальная Hardax 2 ступени 2 шт.',
  'Стремянка аллюминиевая 5 ступеней Алюмет',
  'Стремянка аллюминиевая 4 ступени Вершина',
  'Лестница алюминиевая 2-х секционная Алюмет',
  'Стремянка аллюминиевая 3 ступени',
  'Стремянка стальная Hardax 4 ступени',
  'Стремянка Класс Плюс FIT 4 ступени',
  'Вышка-тура'
].each do |title|
  Category.find_by_title('Стремянки').inventories.create!(title: title)
end

[
  "Уровень 70 100 см. Stabila 02288",
  "Молоток Hardax 400 гр. фиб. руч. 38-2-204",
  "Отвертка PH 3x150 Hardax 33-0-704",
  "Отвертка 8х150 Hardax 33-0-704",
  "Набор имбус. TORX 9 шт. Т10-Т50 сатин Matrix*12306",
  "Набор имбус. HEX 9 шт. экстра-длин. с шаром сатин. Matrix (1,5-10) 16410",
  "Набор ключей комб. 6-22 мм 9 шт. полиров. Хром Matrix 15424",
  "Набор гол. 10 пр 1/2\" 6 гран удл. (10-22) Matrix 13590",
  "Рулетка 5м/19мм «Nylon» Kraftool нейлон.покр. 34122-05-19",
  "Ножовка Stanley 450 мм. 11 tpi STHT20355-1 (дер)",
  "Плоскогубцы ЗУБР комбин. 200 мм. 22024-1-20_z01"
].each do |title|
  Category.find_by_title('Инструмент').inventories.create!(title: title)
end

# Участки
[
  'Участок 1',
  'Участок 2',
  'Участок 3',
  'Участок 4',
  'Участок 5',
  'Участок 6',
  'Участок 7',
  'Участок 8',
  'Участок 9',
  'Участок 10'
].each do |title|
  Site.create!(title: title)
end

# Инвентаризации
