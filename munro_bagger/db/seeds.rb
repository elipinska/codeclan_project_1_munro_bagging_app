require_relative('../models/hiker')
require_relative('../models/hike')
require_relative('../models/munro')

hiker1 = Hiker.new({'first_name'=> 'Ewa', 'last_name'=>'Lipinska', 'age'=>'27', 'munro_goal'=>'10'})
hiker1.save()

hiker2 = Hiker.new({'first_name'=> 'Kasia', 'last_name'=>'Agrafka', 'age'=>'31'})
hiker2.save()

hiker3 = Hiker.new({'first_name'=> 'James', 'last_name'=>'Yates', 'age'=>'29', 'munro_goal'=>'3'})
hiker3.save()
