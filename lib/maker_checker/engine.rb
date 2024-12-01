module MakerCheckerService
  class Engine < ::Rails::Engine
    isolate_namespace MakerChecker
  end
end