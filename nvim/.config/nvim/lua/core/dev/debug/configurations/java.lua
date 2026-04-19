return {
  {
    type = "java",
    request = "attach",
    name = "localhost",
    hostName = "localhost",
    port = 5005,
  },
  {
    type = "java",
    request = "attach",
    name = "environment variables",
    hostName = os.getenv "JAVA_DEBUG_HOST" or "localhost",
    port = tonumber(os.getenv "JAVA_DEBUG_PORT") or 5005,
  },
}
