# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者テストデータ
if Admin.find_by(email: 'admin@admin.com').nil?
    Admin.create!(
        email: 'admin@admin.com',
        password: "admin123")
end

# 診療科一覧
naika = ClinicalDepartment.find_or_create_by!(name: "内科")
geka = ClinicalDepartment.find_or_create_by!(name: "外科")
jibika = ClinicalDepartment.find_or_create_by!(name: "耳鼻科")
kokyuukika = ClinicalDepartment.find_or_create_by!(name: "呼吸器科")
seikeigeka = ClinicalDepartment.find_or_create_by!(name: "整形外科")
rehabilitationka = ClinicalDepartment.find_or_create_by!(name: "リハビリテーション科")
sinkeinaika =ClinicalDepartment.find_or_create_by!(name: "神経内科")
junkankinaika = ClinicalDepartment.find_or_create_by!(name: "循環器内科")
nousinkeigeka = ClinicalDepartment.find_or_create_by!(name: "脳神経外科")
sinryounaika = ClinicalDepartment.find_or_create_by!(name: "心療内科")
hihuka = ClinicalDepartment.find_or_create_by!(name: "皮膚科")
hinyoukika = ClinicalDepartment.find_or_create_by!(name: "泌尿器科")
housyasenka = ClinicalDepartment.find_or_create_by!(name: "放射線科")
syoukakika = ClinicalDepartment.find_or_create_by!(name: "消化器科")
sanhujinka = ClinicalDepartment.find_or_create_by!(name: "産婦人科")


# 病院1
tokyoiin = Hospital.find_or_create_by!(name: "東京医院") do |hospital|
  hospital.hospital_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/病院外観1.jpg"), filename:"病院外観1.jpg")
  hospital.telephone_number = "0300000000"
  hospital.postal_code = "0000000"
  hospital.address = "東京都新宿区西新宿1丁目1-1"
  hospital.am_start_time = "10:00"
  hospital.am_end_time = "14:00"
  hospital.pm_start_time = "16:00"
  hospital.pm_end_time = "19:00"
  hospital.monday_am = "◯"
  hospital.monday_pm = "◯"
  hospital.tuesday_am = "◯"
  hospital.tuesday_pm = "◯"
  hospital.wednesday_am = "◯"
  hospital.wednesday_pm = "◯"
  hospital.thursday_am = "◯"
  hospital.thursday_pm = "◯"
  hospital.friday_am = "◯"
  hospital.friday_pm = "◯"
  hospital.saturday_am = "◯"
  hospital.saturday_pm = "◯"
  hospital.sunday_am = "◯"
  hospital.sunday_pm = "◯"
  hospital.holiday_am = "◯"
  hospital.holiday_pm = "◯"
  hospital.home_page = ""
end

# 診療科中間テーブル1
ClinicalDepartmentManager.find_or_create_by!(hospital_id: tokyoiin.id, clinical_department_id: naika.id)


# オーナー１
Owner.find_or_create_by!(name: "東京一郎") do |owner|
    owner.email = "tokyo1@owner.com"
    owner.password = "owner123"
    owner.hospital_id = tokyoiinn.id
end

# 病院2
oosakaiin = Hospital.find_or_create_by!(name: "大阪医院") do |hospital|
  hospital.hospital_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/病院外観2.jpg"), filename:"病院外観4.jpg")
  hospital.telephone_number = "0300000000"
  hospital.postal_code = "0000000"
  hospital.address = "大阪府大阪市中央区1丁目1-1"
  hospital.am_start_time = "09:00"
  hospital.am_end_time = "13:00"
  hospital.pm_start_time = "15:00"
  hospital.pm_end_time = "18:00"
  hospital.monday_am = "◯"
  hospital.monday_pm = "◯"
  hospital.tuesday_am = "◯"
  hospital.tuesday_pm = "◯"
  hospital.wednesday_am = "◯"
  hospital.wednesday_pm = "◯"
  hospital.thursday_am = "◯"
  hospital.thursday_pm = "◯"
  hospital.friday_am = "◯"
  hospital.friday_pm = "◯"
  hospital.saturday_am = "◯"
  hospital.saturday_pm = "◯"
  hospital.sunday_am = "✕"
  hospital.sunday_pm = "✕"
  hospital.holiday_am = "✕"
  hospital.holiday_pm = "✕"
  hospital.home_page = ""
end

# 診療科中間テーブル2
ClinicalDepartmentManager.find_or_create_by!(hospital_id: oosakaiin.id, clinical_department_id: naika.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: oosakaiin.id, clinical_department_id: geka.id)

# オーナー2
Owner.find_or_create_by!(name: "大阪一郎") do |owner|
    owner.email = "oosaka1@owner.com"
    owner.password = "owner123"
    owner.hospital_id = oosakaiin.id
end

# 病院3
nagoyaiin = Hospital.find_or_create_by!(name: "名古屋医院") do |hospital|
  hospital.hospital_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/病院外観3.jpg"), filename:"病院外観4.jpg")
  hospital.telephone_number = "0300000000"
  hospital.postal_code = "0000000"
  hospital.address = "愛知県名古屋市中央区1丁目1-1"
  hospital.am_start_time = "09:00"
  hospital.am_end_time = "13:00"
  hospital.pm_start_time = "15:00"
  hospital.pm_end_time = "18:00"
  hospital.monday_am = "◯"
  hospital.monday_pm = "◯"
  hospital.tuesday_am = "◯"
  hospital.tuesday_pm = "◯"
  hospital.wednesday_am = "◯"
  hospital.wednesday_pm = "◯"
  hospital.thursday_am = "◯"
  hospital.thursday_pm = "◯"
  hospital.friday_am = "◯"
  hospital.friday_pm = "◯"
  hospital.saturday_am = "◯"
  hospital.saturday_pm = "◯"
  hospital.sunday_am = "✕"
  hospital.sunday_pm = "✕"
  hospital.holiday_am = "✕"
  hospital.holiday_pm = "✕"
  hospital.home_page = ""
end

# 診療科中間テーブル3
ClinicalDepartmentManager.find_or_create_by!(hospital_id: nagoyaiin.id, clinical_department_id: naika.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: nagoyaiin.id, clinical_department_id: geka.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: nagoyaiin.id, clinical_department_id: jibika.id)

# オーナー3
Owner.find_or_create_by!(name: "名古屋一郎") do |owner|
    owner.email = "nagoya1@owner.com"
    owner.password = "owner123"
    owner.hospital_id = nagoyaiin.id
end

# 病院4
fukuokaiin = Hospital.find_or_create_by!(name: "福岡医院") do |hospital|
  hospital.hospital_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/病院外観4.jpg"), filename:"病院外観4.jpg")
  hospital.telephone_number = "0300000000"
  hospital.postal_code = "0000000"
  hospital.address = "福岡県博多市中央区1丁目1-1"
  hospital.am_start_time = "09:00"
  hospital.am_end_time = "13:00"
  hospital.pm_start_time = "15:00"
  hospital.pm_end_time = "18:00"
  hospital.monday_am = "◯"
  hospital.monday_pm = "◯"
  hospital.tuesday_am = "◯"
  hospital.tuesday_pm = "◯"
  hospital.wednesday_am = "◯"
  hospital.wednesday_pm = "◯"
  hospital.thursday_am = "◯"
  hospital.thursday_pm = "◯"
  hospital.friday_am = "◯"
  hospital.friday_pm = "◯"
  hospital.saturday_am = "◯"
  hospital.saturday_pm = "◯"
  hospital.sunday_am = "✕"
  hospital.sunday_pm = "✕"
  hospital.holiday_am = "✕"
  hospital.holiday_pm = "✕"
  hospital.home_page = ""
end

# 診療科中間テーブル4
ClinicalDepartmentManager.find_or_create_by!(hospital_id: fukuokaiin.id, clinical_department_id: naika.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: fukuokaiin.id, clinical_department_id: geka.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: fukuokaiin.id, clinical_department_id: jibika.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: fukuokaiin.id, clinical_department_id: kokyuukika.id)

# オーナー4
Owner.find_or_create_by!(name: "福岡一郎") do |owner|
    owner.email = "hukuoka1@owner.com"
    owner.password = "owner123"
    owner.hospital_id = fukuokaiin.id
end

# 病院5
hyogoiin = Hospital.find_or_create_by!(name: "兵庫医院") do |hospital|
  hospital.hospital_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/病院外観5.jpg"), filename:"病院外観5.jpg")
  hospital.telephone_number = "0300000000"
  hospital.postal_code = "0000000"
  hospital.address = "兵庫県神戸市中央区1丁目1-1"
  hospital.am_start_time = "09:00"
  hospital.am_end_time = "13:00"
  hospital.pm_start_time = "15:00"
  hospital.pm_end_time = "18:00"
  hospital.monday_am = "◯"
  hospital.monday_pm = "◯"
  hospital.tuesday_am = "◯"
  hospital.tuesday_pm = "◯"
  hospital.wednesday_am = "◯"
  hospital.wednesday_pm = "◯"
  hospital.thursday_am = "◯"
  hospital.thursday_pm = "◯"
  hospital.friday_am = "◯"
  hospital.friday_pm = "◯"
  hospital.saturday_am = "◯"
  hospital.saturday_pm = "◯"
  hospital.sunday_am = "✕"
  hospital.sunday_pm = "✕"
  hospital.holiday_am = "✕"
  hospital.holiday_pm = "✕"
  hospital.home_page = ""
end

# 診療科中間テーブル5
ClinicalDepartmentManager.find_or_create_by!(hospital_id: hyogoiin.id, clinical_department_id: naika.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: hyogoiin.id, clinical_department_id: seikeigeka.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: hyogoiin.id, clinical_department_id: rehabilitationka.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: hyogoiin.id, clinical_department_id: housyasenka.id)

# オーナー5
Owner.find_or_create_by!(name: "兵庫一郎") do |owner|
    owner.email = "hyogo1@owner.com"
    owner.password = "owner123"
    owner.hospital_id = hyogoiin.id
end

# 病院6
kobeiin = Hospital.find_or_create_by!(name: "神戸医院") do |hospital|
  hospital.hospital_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/病院外観6.jpg"), filename:"病院外観6.jpg")
  hospital.telephone_number = "0300000000"
  hospital.postal_code = "0000000"
  hospital.address = "兵庫県神戸市中央区2丁目1-1"
  hospital.am_start_time = "09:00"
  hospital.am_end_time = "13:00"
  hospital.pm_start_time = "15:00"
  hospital.pm_end_time = "18:00"
  hospital.monday_am = "◯"
  hospital.monday_pm = "◯"
  hospital.tuesday_am = "◯"
  hospital.tuesday_pm = "◯"
  hospital.wednesday_am = "◯"
  hospital.wednesday_pm = "◯"
  hospital.thursday_am = "◯"
  hospital.thursday_pm = "◯"
  hospital.friday_am = "◯"
  hospital.friday_pm = "◯"
  hospital.saturday_am = "◯"
  hospital.saturday_pm = "◯"
  hospital.sunday_am = "✕"
  hospital.sunday_pm = "✕"
  hospital.holiday_am = "✕"
  hospital.holiday_pm = "✕"
  hospital.home_page = ""
end

# 診療科中間テーブル6
ClinicalDepartmentManager.find_or_create_by!(hospital_id: kobeiin.id, clinical_department_id: sinkeinaika.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: kobeiin.id, clinical_department_id: junkankinaika.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: kobeiin.id, clinical_department_id: nousinkeigeka.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: kobeiin.id, clinical_department_id: sinryounaika.id)

# オーナー6
Owner.find_or_create_by!(name: "神戸一郎") do |owner|
    owner.email = "kobe1@owner.com"
    owner.password = "owner123"
    owner.hospital_id = kobeiin.id
end

# 病院7
amagasakiiin = Hospital.find_or_create_by!(name: "尼崎医院") do |hospital|
  hospital.hospital_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/病院外観7.jpg"), filename:"病院外観7.jpg")
  hospital.telephone_number = "0300000000"
  hospital.postal_code = "0000000"
  hospital.address = "兵庫県尼崎市昭和通り1丁目1-1"
  hospital.am_start_time = "09:00"
  hospital.am_end_time = "13:00"
  hospital.pm_start_time = "15:00"
  hospital.pm_end_time = "18:00"
  hospital.monday_am = "◯"
  hospital.monday_pm = "◯"
  hospital.tuesday_am = "◯"
  hospital.tuesday_pm = "◯"
  hospital.wednesday_am = "◯"
  hospital.wednesday_pm = "◯"
  hospital.thursday_am = "◯"
  hospital.thursday_pm = "◯"
  hospital.friday_am = "◯"
  hospital.friday_pm = "◯"
  hospital.saturday_am = "◯"
  hospital.saturday_pm = "◯"
  hospital.sunday_am = "✕"
  hospital.sunday_pm = "✕"
  hospital.holiday_am = "✕"
  hospital.holiday_pm = "✕"
  hospital.home_page = ""
end

# 診療科中間テーブル7
ClinicalDepartmentManager.find_or_create_by!(hospital_id: amagasakiiin.id, clinical_department_id: naika.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: amagasakiiin.id, clinical_department_id: sanhujinka.id)

# オーナー7
Owner.find_or_create_by!(name: "尼崎一郎") do |owner|
    owner.email = "amagasaki1@owner.com"
    owner.password = "owner123"
    owner.hospital_id = amagasakiiin.id
end

# 病院8
daimotuiin = Hospital.find_or_create_by!(name: "だいもつ医院") do |hospital|
  hospital.hospital_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/病院外観8.jpg"), filename:"病院外観8.jpg")
  hospital.telephone_number = "0300000000"
  hospital.postal_code = "0000000"
  hospital.address = "兵庫県尼崎市大物1丁目1-1"
  hospital.am_start_time = "09:00"
  hospital.am_end_time = "13:00"
  hospital.pm_start_time = "15:00"
  hospital.pm_end_time = "18:00"
  hospital.monday_am = "◯"
  hospital.monday_pm = "◯"
  hospital.tuesday_am = "◯"
  hospital.tuesday_pm = "◯"
  hospital.wednesday_am = "◯"
  hospital.wednesday_pm = "◯"
  hospital.thursday_am = "◯"
  hospital.thursday_pm = "◯"
  hospital.friday_am = "◯"
  hospital.friday_pm = "◯"
  hospital.saturday_am = "◯"
  hospital.saturday_pm = "◯"
  hospital.sunday_am = "✕"
  hospital.sunday_pm = "✕"
  hospital.holiday_am = "✕"
  hospital.holiday_pm = "✕"
  hospital.home_page = ""
end

# 診療科中間テーブル8
ClinicalDepartmentManager.find_or_create_by!(hospital_id: daimotuiin.id, clinical_department_id: hihuka.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: daimotuiin.id, clinical_department_id: hinyoukika.id)
ClinicalDepartmentManager.find_or_create_by!(hospital_id: daimotuiin.id, clinical_department_id: syoukakika.id)

# オーナー8
Owner.find_or_create_by!(name: "大物一郎") do |owner|
    owner.email = "daimotu1@owner.com"
    owner.password = "owner123"
    owner.hospital_id = daimotuiin.id
end


# ユーザー1
EndUser.find_or_create_by!(email: "user1@user.com") do |end_user|
    end_user.password = "user123"
    end_user.last_name = "ユーザー"
    end_user.first_name = "一郎"
    end_user.last_name_kana = "ユーザー"
    end_user.first_name_kana = "イチロウ"
    end_user.birthday = "1990-01-01"
    end_user.sex ="男性"
    end_user.telephone_number = "00000000000"
    end_user.postal_code = "0000000"
    end_user.address ="大阪府大阪市北区1丁目1-1"
end

# ユーザー2
EndUser.find_or_create_by!(email: "user2@user.com") do |end_user|
    end_user.password = "user123"
    end_user.last_name = "ユーザー"
    end_user.first_name = "二郎"
    end_user.last_name_kana = "ユーザー"
    end_user.first_name_kana = "ジロウ"
    end_user.birthday = "1990-01-01"
    end_user.sex ="男性"
    end_user.telephone_number = "00000000000"
    end_user.postal_code = "0000000"
    end_user.address ="大阪府大阪市北区2丁目1-1"
end

# ユーザー3
EndUser.find_or_create_by!(email: "user3@user.com") do |end_user|
    end_user.password = "user123"
    end_user.last_name = "ユーザー"
    end_user.first_name = "三郎"
    end_user.last_name_kana = "ユーザー"
    end_user.first_name_kana = "サブロウ"
    end_user.birthday = "1990-01-01"
    end_user.sex ="男性"
    end_user.telephone_number = "00000000000"
    end_user.postal_code = "0000000"
    end_user.address ="大阪府大阪市北区3丁目1-1"
end

# ユーザー4
EndUser.find_or_create_by!(email: "user4@user.com") do |end_user|
    end_user.password = "user123"
    end_user.last_name = "ユーザー"
    end_user.first_name = "四郎"
    end_user.last_name_kana = "ユーザー"
    end_user.first_name_kana = "シロウ"
    end_user.birthday = "1990-01-01"
    end_user.sex ="男性"
    end_user.telephone_number = "00000000000"
    end_user.postal_code = "0000000"
    end_user.address ="大阪府大阪市北区4丁目1-1"
end

# ユーザー5
EndUser.find_or_create_by!(email: "user5@user.com") do |end_user|
    end_user.password = "user123"
    end_user.last_name = "ユーザー"
    end_user.first_name = "五郎"
    end_user.last_name_kana = "ユーザー"
    end_user.first_name_kana = "ゴロウ"
    end_user.birthday = "1990-01-01"
    end_user.sex ="男性"
    end_user.telephone_number = "00000000000"
    end_user.postal_code = "0000000"
    end_user.address ="大阪府大阪市北区5丁目1-1"
end

# ユーザー6
EndUser.find_or_create_by!(email: "user6@user.com") do |end_user|
    end_user.password = "user123"
    end_user.last_name = "ユーザー"
    end_user.first_name = "六郎"
    end_user.last_name_kana = "ユーザー"
    end_user.first_name_kana = "ロクロウ"
    end_user.birthday = "1990-01-01"
    end_user.sex ="男性"
    end_user.telephone_number = "00000000000"
    end_user.postal_code = "0000000"
    end_user.address ="大阪府大阪市北区6丁目1-1"
end

# ユーザー7
EndUser.find_or_create_by!(email: "user7@user.com") do |end_user|
    end_user.password = "user123"
    end_user.last_name = "ユーザー"
    end_user.first_name = "七郎"
    end_user.last_name_kana = "ユーザー"
    end_user.first_name_kana = "ナナロウ"
    end_user.birthday = "1990-01-01"
    end_user.sex ="男性"
    end_user.telephone_number = "00000000000"
    end_user.postal_code = "0000000"
    end_user.address ="大阪府大阪市北区7丁目1-1"
end

# ユーザー8
EndUser.find_or_create_by!(email: "user8@user.com") do |end_user|
    end_user.password = "user123"
    end_user.last_name = "ユーザー"
    end_user.first_name = "八郎"
    end_user.last_name_kana = "ユーザー"
    end_user.first_name_kana = "ハチロウ"
    end_user.birthday = "1990-01-01"
    end_user.sex ="男性"
    end_user.telephone_number = "00000000000"
    end_user.postal_code = "0000000"
    end_user.address ="大阪府大阪市北区8丁目1-1"
end

# ユーザー9
EndUser.find_or_create_by!(email: "user9@user.com") do |end_user|
    end_user.password = "user123"
    end_user.last_name = "ユーザー"
    end_user.first_name = "九郎"
    end_user.last_name_kana = "ユーザー"
    end_user.first_name_kana = "クロウ"
    end_user.birthday = "1990-01-01"
    end_user.sex ="男性"
    end_user.telephone_number = "00000000000"
    end_user.postal_code = "0000000"
    end_user.address ="大阪府大阪市北区9丁目1-1"
end