# Optional parameters in setting up the Google Chrome repository
class chromerepo::params {
  $chromerepo_baseurl       = "http://dl.google.com/linux/chrome/rpm/stable/${::architecture}"
  $chromerepo_descr         = 'Google Chrome YUM repository'
  $chromerepo_enabled       = '1'
  $chromerepo_gpgcheck      = '1'
  $chromerepo_include_src   = false
  $chromerepo_key           = '7FAC5991'
  $chromerepo_key_source    = 'http://dl-ssl.google.com/linux/linux_signing_key.pub'
  $chromerepo_location      = 'http://dl.google.com/linux/chrome/deb/'
  $chromerepo_name          = 'google-chrome'
  $chromerepo_proxy         = 'absent'
  $chromerepo_release       = 'stable'
  $chromerepo_repos         = 'main'
}