require 'json'

extensions = ["mp3", "wav", "ogg"]
source = File.join(Dir.pwd, 'sounds')

def extension(path)
  File.extname(path).gsub('.', '')
end

groups = Dir.foreach(source).group_by do |path|
  File.basename(path, '.*')
end

hash = groups.map do |f, paths|
  Hash[extensions.map { |base| [base, paths.find { |path| extension(path) == x }] }]
end

json = JSON.pretty_generate({ 'sounds' => hash }.to_json)

File.open('sounds.json', 'w') { |file| file.write(json) }
