#options(device="x11")
options(device="quartz")
setHook(packageEvent("grDevices", "onLoad"), 
  function(...) grDevices::quartz.options(width = 6, height = 6))
options(repos=structure(c(CRAN="http://cran.rstudio.com/")))

#options(prompt=' ')
