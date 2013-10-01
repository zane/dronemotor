require 'fileutils'
require 'json'


source           = Dir.pwd + '/sounds/'
filenames        = Hash.new { |hash,key| hash[key] = Array.new }
output           = {}
output['sounds'] = []


class Sound
    def initialize(name, exts)
        exts.each do | ext |
            if ext.downcase == 'mp3'
                @mp3 = name + '.' + ext
            elsif ext.downcase == 'ogg'
                @ogg = name + '.' + ext
            elsif ext.downcase == 'wav'
                @wav = name + '.' + ext
            end
        end
    end
    def to_json()
        object = {'mp3' => @mp3, 'ogg' => @ogg, 'wav' => @wav}.to_json
        object = JSON.parse(object)
    end
end


Dir.foreach(source) do |filename|
    if filename != '.' and filename != '..' and (filename.downcase.match(/(mp3|wav|ogg)/))
        name = File.basename(filename, '.*')
        ext = File.extname(filename).gsub('.','')
        filenames[name] << ext
    end
end

filenames.each { |name, exts|
    sound = Sound.new(name,exts).to_json
    output['sounds'].push(sound)
}

File.open('sounds.json', 'w') do |json|
    json.write(JSON.pretty_generate(output))
end