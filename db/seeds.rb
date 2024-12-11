# Пользователи
[
  {
    surname: 'Тестов',
    name: 'Александр',
    patronymic: 'Дмитриевич',
    email: 'aleksandr.testov@example.com',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  },
  {
    surname: 'Тестовая',
    name: 'Юлия',
    patronymic: 'Владимировна',
    email: 'yuliya.testovaya@example.com',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  },
  {
    surname: 'Тестовая',
    name: 'Лилия',
    patronymic: 'Михайловна',
    email: 'lilia.testovaya@example.com',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  },
  {
    surname: 'Тестовая',
    name: 'Татьяна',
    patronymic: 'Антоновна',
    email: 'tatyana.testovaya@example.com',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  },
  {
    surname: 'Тестовая',
    name: 'Ирина',
    patronymic: 'Павловна',
    email: 'irina.testovaya@example.com',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  },
  {
    surname: 'Тестовов',
    name: 'Артем',
    patronymic: 'Андреевич',
    email: 'artem.testovov@example.com',
    password: '12345678',
    password_confirmation: '12345678',
    confirmed_at: Time.now
  }
].each do |params|
  User.create!(params)
end

# Организации
organization1 = Organization.create!(title: 'Рога и Копыта')
organization2 = Organization.create!(title: 'Алые паруса')

# Периоды
period1 = Period.create!(organization: organization1, started_at: Date.parse('2024-12-01'))
period2 = Period.create!(organization: organization2, started_at: Date.parse('2024-12-01'))

# Зоны применения
[
  'Внутренний клининг',
  'Внешний клининг',
  'Техменеджмент'
].each do |title|
  Affiliation.create!(organization: organization1, title: title)
end

[
  'Хозяйственный департамент'
].each do |title|
  Affiliation.create!(organization: organization2, title: title)
end
[
  'Набор для уборки',
  'Швабры,щетки',
  'Пылесосы',
  'Поломоечные машины',
  'Инвентарь',
  'Подметальная машина',
  'Вёдра'
].each do |title|
  Affiliation.find_by_title('Хозяйственный департамент').categories.create!(title: title)
end
Affiliation.find_by_title('Хозяйственный департамент').categories.find_by_title('Набор для уборки').tools.create!(title: 'Набор для мытья окон с телескоп. ручками')

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
  Category.find_by_title('Набор для уборки').tools.create!(title: title)
end

[
  'Мульти Дастер 66см голубой',
  'ПипиДастр',
  'Швабра под МОП'
].each do |title|
  Category.find_by_title('Швабры,щетки').tools.create!(title: title)
end

[
  'Пылесос для сухой уборки Karcher',
  'Пылесос для сухой уборки (не karcher)',
  'Стеклоочиститель Karcher',
  'Моющий пылесос Karcher Puzzi',
  'Грязеводосос'
].each do |title|
  Category.find_by_title('Пылесосы').tools.create!(title: title)
end

[
  'Karcher BD 43/25',
  'Karcher B 40C Bp Clas+D43',
  'Karcher 35/12',
  'BR180',
  'Размывочная машина'
].each do |title|
  Category.find_by_title('Поломоечные машины').tools.create!(title: title)
end

[
  'Пароочиститель Karcher SC4'
].each do |title|
  Category.find_by_title('Инвентарь').tools.create!(title: title)
end

[
  'Stihl KG770',
  'Karcher S4 Twin'
].each do |title|
  Category.find_by_title('Подметальная машина').tools.create!(title: title)
end

[
  'Ведро пласт. 10л',
  'Ведро пласт. 5л.',
  'Vileda minispeed ведро б/у'
].each do |title|
  Category.find_by_title('Вёдра').tools.create!(title: title)
end

[
  'Лопата совковая с черенком',
  'Лопата штыковая с черенком',
  'Лопата для снега пластиковая "Богатырь"',
  'Движок для снега Барин (80-100см)'
].each do |title|
  Category.find_by_title('Лопаты').tools.create!(title: title)
end

[
  'Метла пластиковая',
  'Грабли веерные',
  'Грабли обычные'
].each do |title|
  Category.find_by_title('Метлы/грабли/вилы').tools.create!(title: title)
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
  Category.find_by_title('Ручной инструмент').tools.create!(title: title)
end

[
  'Тачка садовая 2-х колесная ',
  'Тележка синяя 4-х колесная',
  'Тачка садовая',
  'Рассеиватель "Texas" CS 6000S'
].each do |title|
  Category.find_by_title('Тачки').tools.create!(title: title)
end

[
  'Шнекоротер DeWORKS SC 7080',
  'Шнекоротер Tecumseh Yard Machines MTD',
  'Greenworks шнекоротор',
  'гусеничный Champion STT117E'
].each do |title|
  Category.find_by_title('Снегоуборщики').tools.create!(title: title)
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
  Category.find_by_title('Бензо/электроинструмент').tools.create!(title: title)
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
  Category.find_by_title('Электроинструмент').tools.create!(title: title)
end

[
  'Удлинитель рамка 20м. RLPз-20 max 2200 Вт',
  'Удлинитель катушка 30м'
].each do |title|
  Category.find_by_title('Сетевой удлинитель').tools.create!(title: title)
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
  Category.find_by_title('Стремянки').tools.create!(title: title)
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
  Category.find_by_title('Инструмент').tools.create!(title: title)
end

# Участки
[
  'Внутр. участок 1',
  'Внутр. участок 2',
  'Внутр. участок 3',
  'Внутр. участок 4',
  'Внутр. участок 5',
].each do |title|
  Site.create!(affiliation: Affiliation.find_by_title('Внутренний клининг'), title: title)
end

[
  'Внеш. участок 1',
  'Внеш. участок 2',
  'Внеш. участок 3',
  'Внеш. участок 4',
  'Внеш. участок 5',
].each do |title|
  Site.create!(affiliation: Affiliation.find_by_title('Внешний клининг'), title: title)
end

[
  'Тех. участок 1',
  'Тех. участок 2',
  'Тех. участок 3',
  'Тех. участок 4',
  'Тех. участок 5',
].each do |title|
  Site.create!(affiliation: Affiliation.find_by_title('Техменеджмент'), title: title)
end

[
  'Участок 1'
].each do |title|
  Site.create!(affiliation: Affiliation.find_by_title('Хозяйственный департамент'), title: title)
end

# Роли
user = User.find_by(email: 'aleksandr.testov@example.com')

# Администратор
Permission.create!(user: user, role: 'admin')

# Менеджер внутреннего клининга 1
Permission.create!(user: user, role: 'manager', context: organization1)

affiliation = Affiliation.find_by_title('Внутренний клининг')
Permission.create!(user: user, role: 'manager', context: affiliation)

Site.where(affiliation: affiliation).where(title: ['Внутр. участок 1', 'Внутр. участок 4', 'Внутр. участок 5']).each do |site|
  Permission.create!(user: user, role: 'manager', context: site)
end

# Менеджер внутреннего клининга 2
user = User.find_by(email: 'yuliya.testovaya@example.com')
Permission.create!(user: user, role: 'manager', context: organization1)

affiliation = Affiliation.find_by_title('Внутренний клининг')
Permission.create!(user: user, role: 'manager', context: affiliation)

Site.where(affiliation: affiliation).where(title: ['Внутр. участок 2', 'Внутр. участок 3']).each do |site|
  Permission.create!(user: user, role: 'manager', context: site)
end

# Менеджер хозяйственного департамента
user = User.find_by(email: 'aleksandr.testov@example.com')
Permission.create!(user: user, role: 'manager', context: organization2)

affiliation = Affiliation.find_by_title('Хозяйственный департамент')
Permission.create!(user: user, role: 'manager', context: affiliation)

Site.where(affiliation: affiliation).where(title: ['Участок 1']).each do |site|
  Permission.create!(user: user, role: 'manager', context: site)
end

# Инвентаризация
Inventory.create!(user: user, period: period1, site: user.sites.first, tool: Tool.find_by(title: 'Молоток Hardax 400 гр. фиб. руч. 38-2-204'), opening_stock: 5, current_stock: 5)
Inventory.create!(user: user, period: period1, site: user.sites.first, tool: Tool.find_by(title: 'ПипиДастр'), opening_stock: 2, current_stock: 2)
Inventory.create!(user: user, period: period2, site: Site.find_by(title: 'Участок 1'), tool: affiliation.tools.first, opening_stock: 1, current_stock: 1)
