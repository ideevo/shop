# See https://groups.google.com/forum/?fromgroups=#!topic/rubyonrails-security/61bkgvnSGTQ
ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::XML)
