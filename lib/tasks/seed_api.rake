namespace :api do
  task :seed => :environment do
    conn = SearchService.new
    Industry.all.each do |industry|
      response = conn.post({
          local_id: industry.id,
          name:  industry.name,
          uri: industry.uri,
          slug: industry.slug,
          object: "Industry"
      })
      industry.search_service_id = JSON.parse(response.body, symbolize_names: true)[:_id][:$oid]
      industry.save

      puts "Seeded Industry #{industry}"
    end
    
    Category.all.each do |category|
      response = conn.post({
        
          local_id: category.id,
          name:  category.name,
          uri: category.uri,
          slug: category.slug,
          object: "Category"
        
      })
      category.search_service_id = JSON.parse(response.body, symbolize_names: true)[:_id][:$oid]
      category.save

      puts "Seeded Category #{category}"
    end

    Service.all.each do |service|
      response = conn.post({
          local_id: service.id,
          name:  service.name,
          uri: service.uri,
          slug: service.slug,
          object: "Service"
      })
      service.search_service_id = JSON.parse(response.body, symbolize_names: true)[:_id][:$oid]
      service.save

      puts "Seeded Service #{service}"
    end
  end

  task :delete => :environment do
    conn = SearchService.new
    Industry.all.each do |industry|
      conn.delete({ 
        local_id: industry.id,
        object: "Industry"
      })

      puts "Deleted Industry #{industry}"
    end

    Category.all.each do |category|
      conn.delete({
        local_id: category.id,
        object: "Category"
      })

      puts "Deleted Category #{category}"
    end

    Service.all.each do |service|
      conn.delete({
        local_id: service.id,
        object: "Service"
      })

      puts "Deleted Service #{service}"
    end
  end
end
