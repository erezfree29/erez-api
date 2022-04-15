require 'uri'
require 'net/http'

puts 'Creating an album'
uri = URI('http://localhost:3000/api/v1/albums')
params = { name: "family photos" }
res = Net::HTTP.post_form(uri, params)

if (res.is_a?(Net::HTTPSuccess))
    puts res.body 
    # finding the album id so we can create photos for it
    body = res.body.chars
    body = body.slice(6, body.length)
    id = ''
    body.each do |chr|
        if (chr != ',')
            id += chr
        else
            break    
        end    
    end
    puts 'Creating photos'
    uri = "http://localhost:3000/api/v1/albums/#{id}/photos"
    uri = URI(uri)#

    puts 'Creating first photo'
    params = { name: "Mom and Dad"}
    res = Net::HTTP.post_form(uri, params)
    if (res.is_a?(Net::HTTPSuccess))
        puts res.body
    end

    puts 'Creating second photo'
    params = { name: "Me and my cousins"}
    res = Net::HTTP.post_form(uri, params)
    if (res.is_a?(Net::HTTPSuccess))
        puts res.body
    end

    puts 'Trip with my sister'
    params = { name: "Me and my cousins"}
    res = Net::HTTP.post_form(uri, params)
    if (res.is_a?(Net::HTTPSuccess))
        puts res.body
    end

    puts 'Family trip'
    params = { name: "Me and my cousins"}
    res = Net::HTTP.post_form(uri, params)
    if (res.is_a?(Net::HTTPSuccess))
        puts res.body
    end
end    











