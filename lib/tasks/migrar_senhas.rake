namespace :app do 
    desc"Encripta todas a senhas\
        que ainda nao foram processadas\
        no banco de dados"
    task migrar_senhas: :environment do 
        unless  User.attribute_names.include? "password"
        puts "As senha ja foram migradas, terminando."
        return
    end

    User.find_each do |user|
      puts "Migrando usuario ##{user.id}#{user.full_name}"
      unencripted_password = user.attributes["password"]

      user.password = unencripted_password
      user.password_confirmation = unencripted_password
      user.save!
    end
  end  
end