require 'digest/md5'
require 'msgpack'

module Bootscale
  class FileStorage
    def initialize(directory)
      @directory = directory
    end

    def load(load_path)
      path = cache_path(load_path)
      MessagePack.load(File.read(path)) if File.exist?(path)
    end

    def dump(load_path, cache)
      File.open(cache_path(load_path), 'wb+') { |f| f.write(MessagePack.dump(cache)) }
    end

    def cache_path(load_path)
      hash = Digest::MD5.hexdigest((load_path + [RUBY_VERSION, Bootscale::VERSION]).join('|'))
      File.join(@directory, "bootscale-#{hash}.msgpack")
    end
  end
end
