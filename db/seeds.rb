# Asegúrate de requerir la gema open-uri en la parte superior de tu archivo db/seeds.rb
require 'open-uri'

# Crea un usuario administrador
admin_user = User.create(
  name: 'Esteban Reyes',
  email: 'ereyes@email.com',
  password: '123456',
  role: 'admin'
)

# Descarga la imagen desde una URL y adjúntala al usuario
admin_user.profile_picture.attach(
  io: URI.open('https://dummyimage.com/300/000/fff'),
  filename: 'profile_picture.png'
)

# Verifica si el usuario se creó correctamente
if admin_user.persisted?
  puts "Usuario administrador creado exitosamente."
else
  puts admin_user.errors.full_messages
end
