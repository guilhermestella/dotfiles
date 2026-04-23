local jdtls = require "jdtls"

-- runs jdtls.dap directly
return function(_, args)
  if not args:find "%-Dtest=" then
    return jdtls.test_class()
  end

  local _, method = args:match "%-Dtest=([^#]+)#(.+)"
  if method then
    return jdtls.test_nearest_method()
  else
    return jdtls.test_class()
  end
end
