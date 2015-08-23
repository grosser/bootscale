module Kernel
  def require_with_cache(path)
    require_without_cache(Bootscale[path] || path)
  end

  alias_method :require_without_cache, :require
  alias_method :require, :require_with_cache
end

class << Kernel
  def require_with_cache(path)
    require_without_cache(Bootscale[path] || path)
  end

  alias_method :require_without_cache, :require
  alias_method :require, :require_with_cache
end

class Module
  def autoload_with_cache(const, path)
    autoload_without_cache(const, Bootscale[path] || path)
  end

  alias_method :autoload_without_cache, :autoload
  alias_method :autoload, :autoload_with_cache
end
