# ConditionalComment
module ConditionalCommentHelper
  
  # info at http://msdn.microsoft.com/workshop/author/dhtml/overview/ccomment_ovw.asp
  def conditional_comment(options = {})
    if (options[:version] == "legacy")
      options[:version] = 7
      options[:comparison] = 'lt'
    end
    
    inverse    = options[:inverse] || ''
    comparison = options[:comparison] ? " #{options[:comparison]}" : ''
    version    = options[:version] ? " #{options[:version]}" : ''
    
    "<!--[if#{comparison} #{inverse}IE#{version}]>#{yield}<![endif]-->"
  end
  
end